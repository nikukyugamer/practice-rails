module TryModuleFunction
  module_function

  def hello(word)
    "Hello, #{word}!"
  end
end

# [1] pry(main)> TryModuleFunction.hello('Ruby World')
# => "Hello, Ruby World!"
