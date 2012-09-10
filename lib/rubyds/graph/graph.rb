
require 'rubyds/basic/queue'

# simple Graph implementation
class Graph

  include Enumerable

  # create a new empty graph
  def initialize
    @vertices = {} # empty hash
  end

  # add a vertex to the graph
  def add_vertex( key )
    vertex = Vertex.new( key )
    @vertices[key] = vertex
    vertex
  end

  # return a vertex of the graph given its key
  # if the vertex is not found return nil
  def get_vertex( vertex_key )
    @vertices[vertex_key]
  end  

  # add a directed edge to the graph given its start and end node
  # optionally, a weight can be associated with the edge
  def add_edge( from_key, to_key, weight = 0 )
    add_vertex(from_key) unless @vertices.include? from_key
    add_vertex(to_key) unless @vertices.include? to_key
    @vertices[from_key].add_neighbor( @vertices[to_key], weight )
  end

  # return a list of keys of all vertices in the graph
  def get_vertices
    @vertices.keys
  end

  def each
    @vertices.keys.each do |key|
      yield @vertices[key]
    end
  end

  # perform a BFS traversal of this graph given a starting vertex
  def bfs( start, &block )
    start.distance = 0
    start.predecessor = nil
    start.gray!
    vq = Queue.new()
    vq.enqueue(start)
    while vq.size > 0
      current = vq.dequeue()
      current.get_connections.each  do |nbr|
        if nbr.white?
          nbr.gray!
          nbr.distance = current.distance + 1
          nbr.predecessor = current
          vq.enqueue(nbr)
        end
      end
      current.black!
      yield current if block_given?
    end
    # clean up vertices attributes set during bfs
    @vertices.keys.each do |key|
      @vertices[key].distance = nil
      @vertices[key].predecessor = nil
      @vertices[key].color = nil
    end
  end  

end

# simple graph Vertex implementation
class Vertex

  attr_reader :key

  # bfs additions
  attr_accessor   :distance, :predecessor, :color

  # create a new vertex with the given key
  def initialize( key )
    @key = key
    @connected_to = {} # empty hash
  end

  # add an edge from this vertex to the given neighbor vertex
  # optionally indicating the weight of the edge
  # this vertex ---(weight)---> neighbor vertex
  def add_neighbor( nbr, weight = 0)
    @connected_to[ nbr ] = weight
  end

  # return all vertices which this vertex is connected to
  # this vertex ---(one to many)---> neighbor vertices
  def get_connections
    @connected_to.keys
  end

  # return the weight of the edge from this vertex to the given neighbor one
  def get_weight( nbr )
    @connected_to[ nbr ]
  end

  def to_s
    connections = @connected_to.keys.map { |nbr| nbr.key.to_s }.join(",")
    return key.to_s + " connected to: " + connections
  end

  # bfs additions

  def white!
    self.color = :white
  end

  def white?
    @color == nil || @color == :white
  end

  def gray!
    self.color = :gray
  end

  def gray?
    @color == :gray
  end

  def black!
    self.color = :black
  end

  def black
    @color == :black
  end

end
