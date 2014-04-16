class Tree

  def self.minimum_edges n, edges
    trees = edges.reduce([]) { |trees, edge|
                trees = merge trees, edge
                trees.reduce([]) { |acc, tree|
                                    merge(acc, tree)
                                 }
            }
    single_vertices = (1..n).reject { |i| contains?(trees, [i]) }
    trees.size + single_vertices.size - 1
  end

  private

  def self.contains? trees, tree
    trees.map { |t| not (t & tree).empty? }
         .include?(true)
  end

  def self.merge trees, tree
    merge = trees.map { |t|
                    if (t & tree).empty?
                      t
                    else
                      t | tree
                    end
                 }
    if not contains?(merge, tree)
      merge << tree
    end
    merge
  end

end
