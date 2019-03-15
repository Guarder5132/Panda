class Micropost < ActiveRecord::Base
    belongs_to :user
    has_many :pinluns,  dependent: :destroy
    validates :user_id, presence: true
    validates :content, presence: true, length:{ maximum:150 }
    default_scope -> { order(" created_at DESC ") }
    
    def self.from_user_followed_by(user)
        followed_user_ids = "select followed_id from relationships where follower_id = :user_id"
        where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",user_id: user.id)
    end
    
end
