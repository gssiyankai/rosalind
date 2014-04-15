class Tree

  def self.minimum_edges edges
    edges.reduce([]) { |trees, edge|
        trees = trees.map { |tree|
                        if (tree & edge).empty?
                          tree
                        else
                          tree | edge
                        end
                      }
        trees = trees.reduce([]) { |acc, tree|
                          if not acc.empty? and not (acc.last & tree).empty?
                            acc[-1] = acc.last | tree
                          else
                            acc << tree
                          end
                          acc
                       }
        if trees.empty? or
             not trees.map { |tree| (tree & edge).empty? }
                      .include?(false)
            trees << edge
        end
        trees
      }.size
  end

end
