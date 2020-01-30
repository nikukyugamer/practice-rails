class TryPureAlias
  def foo
    'Hello, foo method!'
  end

  alias bar foo
end

p TryPureAlias.new.foo
p TryPureAlias.new.bar

class TryPureAliasBySymbol
  def foo
    'Hello, foo method!'
  end

  alias bar foo
end
