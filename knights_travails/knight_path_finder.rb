require_relative "../skeleton/lib/00_tree_node.rb"

class KnightPathFinder
    attr_reader :pos, :considered_positions, :root
    def self.valid_moves(position)
        x, y = position
        pos_arr = []

        pos_arr << [x-1,y-2]
        pos_arr << [x+1,y-2]
        pos_arr << [x-1,y+2]
        pos_arr << [x+1,y+2]
        pos_arr << [x+2,y-1]
        pos_arr << [x+2,y+1]
        pos_arr << [x-2,y-1]
        pos_arr << [x-2,y+1]
        pos_arr.select { |ele| (0..7).include?(ele[0]) && (0..7).include?(ele[1]) }
    end

    def initialize(pos)
        @pos = pos
        @root = PolyTreeNode.new(pos)
        @considered_positions = []
    end

    def find_path(target_pos)

    end

    def new_move_positions(position)
        valid_moves = self.class.valid_moves(position)

        valid_moves.reject! { |ele| @considered_positions.include?(ele)}
        @considered_positions += valid_moves
        return valid_moves
    end

    def build_move_tree
        queue = [@root]
        
        until queue.empty?
            current_node = queue.shift
            current_pos = current_node.value
            new_move_arr = new_move_positions(current_pos)

            new_move_arr.each do |position|
                new_node = PolyTreeNode.new(position)
                current_node.add_child(new_node)
                queue << new_node 
            end
        end 
    end
end

a = KnightPathFinder.new([5,5])
a.build_move_tree
p a

# llu [-1,-2]
# lld [1,-2]
# rru [-1,2]
# rrd [1,2]
# ddl [2,-1]
# ddr [2,1]
# uul [-2, -1]
# uur [-2, 1]


# * 0 1 2 3 4 5 6 7
# 0 . . . . . . . .
# 1 . . . . . . . .
# 2 . . . . . . . .
# 3 . . . . . . . .
# 4 . . . . . . . .
# 5 . . . . . . . .
# 6 . . . . . . . .
# 7 . . . . . . . .