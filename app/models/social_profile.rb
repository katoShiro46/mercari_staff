class SocialProfile < ApplicationRecord
  belongs_to :user,optional: true
end
