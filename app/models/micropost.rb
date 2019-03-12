class Micropost < ActiveRecord::Base
    belongs_to :user
    validates :user_id, presence: true
    validates :content, presence: true, length:{ maximum:150 }
    default_scope -> { order(" created_at DESC ") }
    
    def self.from_user_followed_by(user)
        where("user_id = ?", user)
    end
end
