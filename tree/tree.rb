class Tree

	def self.minimum_edges n, edges
		edges.reduce([]) { |trees, edge|
			if not contains?(trees, edge[0]) and not contains?(trees, edge[1])
				trees << edge
			else
				trees = trees.map { |sub_tree|
						if (sub_tree & edge).empty?
							sub_tree
						else
							sub_tree | edge 
						end
					    }
			end
			trees
		}.size
	end

	private

	def self.contains? trees, vertex
		trees.map { |tree| tree.include? vertex }
		     .include?(true)			
	end

end
