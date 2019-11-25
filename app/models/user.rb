class User < ApplicationRecord
  # include HogeFuga[:foobar]
  include HogeFuga::Attachment(:foobar)
end
