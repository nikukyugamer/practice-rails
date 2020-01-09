FactoryBot.define do
  factory :member do
    firstname { ['敬二', 'どん判'].sample }
    lastname { '稲船' }
    age { 45 }
    sex { %i[unknown male female other].sample }
    born_at_pref { Faker::Nation.capital_city }
    is_japanese { [true, false].sample }
  end
end
