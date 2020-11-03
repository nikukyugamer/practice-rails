class TryLambda
  def my_proc
    # Use `proc` instead of `Proc.new`. (convention:Style/Proc)
    # rubocop:disable Style/Proc
    Proc.new { |a, b| a + b + 100 }
    # rubocop:enable Style/Proc
  end

  def method_by_using_my_proc(&any_proc)
    any_proc.call(100, 200)
  end

  def method_by_using_my_proc_without_ampersand(any_proc)
    any_proc.call(100, 200)
  end

  def my_lambda
    ->(a, b) { a + b + 100 }
  end

  def diff_method_by_using_my_proc_without_ampersand(any_proc)
    any_proc.call(100, 200, 300)
  end
end

# [8] pry(main)> TryLambda.new.my_proc.call(10, 20)
# => 130

# [1] pry(main)> obj = TryLambda.new
# => #<TryLambda:0x00007fdaac0a0530>
# [2] pry(main)> obj.method_by_using_my_proc(&obj.my_proc)
# => 400

# [1] pry(main)> obj = TryLambda.new
# => #<TryLambda:0x00007fdaac0a0530>
# [2] pry(main)> obj.method_by_using_my_proc_without_ampersand(obj.my_proc)
# => 400

# [1] pry(main)> obj = TryLambda.new
# => #<TryLambda:0x00007fdaac0a0530>
# [2] pry(main)> obj.method_by_using_my_proc_without_ampersand(obj.my_lambda)
# => 400

# Proc と lambda の違い（後者は引数の数に厳格である）
# Proc の場合
# [12] pry(main)> obj.diff_method_by_using_my_proc_without_ampersand(obj.my_proc)
# => 400
# lambda の場合
# [11] pry(main)> obj.diff_method_by_using_my_proc_without_ampersand(obj.my_lambda)
# ArgumentError: wrong number of arguments (given 3, expected 2)
# from /Users/takiya/.ghq/github.com/nikukyugamer/challenging-rails/app/lib/try_lambda.rb:18:in `block in my_lambda'
