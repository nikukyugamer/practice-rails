class TryAmpaProc
  def upcase_example
    languages = [
      'japanese',
      'english',
      'german',
      'french',
    ]

    languages.map(&:upcase)
  end
end
