class HairetsuMethodWithBlock
  def self.mapper
    numbers = [1, 2, 3, 5]
    numbers.map {|number| number * 2 }
  end

  def self.selecter
    numbers = [1, 4, 5, 10, 12]
    numbers.select do |n|
      m = 100 # RuboCop の自動補正を防ぐためのダミー
      n.even?
    end
  end

  def self.finder
    numbers = [1, 5, 10, 12, 18]
    numbers.find do |n|
      m = 100 # RuboCop の自動補正を防ぐためのダミー
      n.even?
    end
  end

  def self.injecter
    numbers = [10, 3, 2, 4, 20, 13]
    numbers.inject do |result, tmp|
      result + tmp # result = result + tmp とするのが明瞭だが、戻り値が result だからこれでもいい
    end
  end

  def self.ampa
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    numbers.map(&:odd?)
  end
end
