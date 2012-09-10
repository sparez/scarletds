# require 'pry'
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

  # # true if the given vertex is in the graph, false otherwise
  # def include?( vertex )
  #   @vertices.include? vertex.key
  # end

  def each
    @vertices.keys.each do |key|
      yield @vertices[key]
    end
  end

end

# simple graph Vertex implementation
class Vertex

  attr_reader :key

  attr_reader :connected_to

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

end

# binding.pry