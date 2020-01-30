class TryPureAlias
  def foo
    'Hello, foo method!'
  end

  alias bar foo
end

TryPureAlias.new.foo
TryPureAlias.new.bar

class TryPureAliasBySymbol
  def foo
    'Hello, foo method!'
  end

  alias bar foo
end
