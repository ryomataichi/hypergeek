class Relationship < ApplicationRecord
    belongs_to :following, class_name: "User"
    validates :following_id, presence: true

end
