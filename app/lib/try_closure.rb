class TryClosure
  def this_is_not_closure
    proc do
      n = 0

      n += 1
    end
  end

  def this_is_closure
    n = 0

    proc do
      n += 1
    end
  end
end

# closure = TryClosure.new.this_is_not_closure
# closure.call #=> 1
# closure.call #=> 1
# closure.call #=> 1
#
# closure = TryClosure.new.this_is_closure
# closure.call #=> 1
# closure.call #=> 2
# closure.call #=> 3
