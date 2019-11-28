if Rails.env.development?
  Punditer.create(
    [
      {
        name: 'taro',
        place: 'yokohama',
        price: 10000
      },
      {
        name: 'hanako',
        place: 'chiba',
        price: 50000
      },
    ]
  )
end
