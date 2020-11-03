class TryDebugByTap
  def my_debug_by_tap
    arr = [1, 4, 60, 2, 55, 21]

    # rubocop:disable Rails/Output
    arr.sort.tap { |sorted_array| pp sorted_array }
    # rubocop:enabled Rails/Output
  end
end

# TryDebugByTap.new.my_debug_by_tap;
#
# [1] pry(main)> TryDebugByTap.new.my_debug_by_tap;
# [1, 2, 4, 21, 55, 60]
