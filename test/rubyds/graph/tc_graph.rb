require "test/unit"

require "rubyds/graph/graph"

class TestGraph < Test::Unit::TestCase

  def test_build_graph
    g = Graph.new
    
    # add vertices 0 to 5
    (0...6).each do |key|
      assert g.add_vertex key
    end

    # add edges
    g.add_edge(0,1,5)
    g.add_edge(0,5,2)
    g.add_edge(1,2,4)
    g.add_edge(2,3,9)
    g.add_edge(3,4,7)
    g.add_edge(3,5,3)
    g.add_edge(4,0,1)
    g.add_edge(5,4,8)
    g.add_edge(5,2,1)

    assert  vertex0 = g.get_vertex(0)
    assert  vertex1 = g.get_vertex(1)
    assert  vertex2 = g.get_vertex(2)
    assert  vertex3 = g.get_vertex(3)
    assert  vertex4 = g.get_vertex(4)
    assert  vertex5 = g.get_vertex(5)

    assert        vertex0.get_connections.include?( vertex1 )
    assert_equal  5, vertex0.get_weight(vertex1)
    assert        vertex0.get_connections.include?( vertex5 )
    assert_equal  2, vertex0.get_weight(vertex5)
    assert        vertex1.get_connections.include?( vertex2 )
    assert_equal  4, vertex1.get_weight(vertex2)
    assert        vertex2.get_connections.include?( vertex3 )
    assert_equal  9, vertex2.get_weight(vertex3)
    assert        vertex3.get_connections.include?( vertex4 )
    assert_equal  7, vertex3.get_weight(vertex4)
    assert        vertex3.get_connections.include?( vertex5 )
    assert_equal  3, vertex3.get_weight(vertex5)
    assert        vertex4.get_connections.include?( vertex0 )
    assert_equal  1, vertex4.get_weight(vertex0)
    assert        vertex5.get_connections.include?( vertex4 )
    assert_equal  8, vertex5.get_weight(vertex4)
    assert        vertex5.get_connections.include?( vertex2 )
    assert_equal  1, vertex5.get_weight(vertex2)
  end

  def test_bfs
    g = Graph.new
    
    # add vertices 0 to 5
    (0...6).each do |key|
      assert g.add_vertex key
    end

    # add edges
    g.add_edge(0,1,5)
    g.add_edge(0,5,2)
    g.add_edge(1,2,4)
    g.add_edge(2,3,9)
    g.add_edge(3,4,7)
    g.add_edge(3,5,3)
    g.add_edge(4,0,1)
    g.add_edge(5,4,8)
    g.add_edge(5,2,1)

    assert  vertex0 = g.get_vertex(0)
    assert  vertex1 = g.get_vertex(1)
    assert  vertex2 = g.get_vertex(2)
    assert  vertex3 = g.get_vertex(3)
    assert  vertex4 = g.get_vertex(4)
    assert  vertex5 = g.get_vertex(5)

    # bfs starting from 0 has expected sequence: 0, 1, 5, 2, 4, 3
    sequence = []
    g.bfs(vertex0) { |v| sequence.push v.key }
    assert_equal [0,1,5,2,4,3], sequence
  end

  def test_dfs
    g = Graph.new
    
    # add vertices 0 to 5
    (0...6).each do |key|
      assert g.add_vertex key
    end

    # add edges
    g.add_edge(0,1,5)
    g.add_edge(0,5,2)
    g.add_edge(1,2,4)
    g.add_edge(2,3,9)
    g.add_edge(3,4,7)
    g.add_edge(3,5,3)
    g.add_edge(4,0,1)
    g.add_edge(5,4,8)
    g.add_edge(5,2,1)

    assert  vertex0 = g.get_vertex(0)
    assert  vertex1 = g.get_vertex(1)
    assert  vertex2 = g.get_vertex(2)
    assert  vertex3 = g.get_vertex(3)
    assert  vertex4 = g.get_vertex(4)
    assert  vertex5 = g.get_vertex(5)

    # dfs has expected sequence: ...
    sequence = []
    g.init_dfs
    g.dfs(vertex0) { |v| sequence.push v.key }
    g.cleanup_dfs
    assert_equal [4,5,3,2,1,0], sequence    
  end

end