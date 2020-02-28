class Member < ApplicationRecord
  enum sex: {
    unknown: 0,
    male: 1,
    female: 2,
    other: 3
  }, _prefix: true
end
