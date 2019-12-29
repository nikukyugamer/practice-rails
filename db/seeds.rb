if Rails.env.development?
  article = Article.new(
    {
      title: '近代文学における抑揚と静止の均衡について',
      sub_title: '近松門左衛門の作品を参考に',
      genre: '人文科学',
      published_at: '2019-12-24 12:34:56 JST'
    }
  )

  author_kenji = article.authors.new(
    {
      first_name: 'Kenji',
      last_name: 'Tanaka',
      job: 'Student',
      country: 'Japan'
    }
  )

  author_hanako = article.authors.new(
    {
      first_name: 'Hanako',
      last_name: 'Yamamoto',
      job: 'Professor',
      country: 'Japan'
    }
  )

  article.save if article.valid?
  author_kenji.save if article.valid?
  author_hanako.save if article.valid?
end
