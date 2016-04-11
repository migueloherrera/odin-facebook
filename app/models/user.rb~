class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :firstname, presence: true
  validates :lastname, presence: true
   
  has_many :invited_friendships, class_name: "Friendship", foreign_key: :from_id
  has_many :invitations, through: :invited_friendships, source: :invitation
  
  has_many :received_friendships, class_name: "Friendship", foreign_key: :to_id
  has_many :inviteds, through: :received_friendships, source: :invited
  
  scope :all_except, ->(users) { where.not(id: users) }

  def self.friends(user)
    friendships = Friendship.where("(from_id=? OR to_id=?) AND accepted=?", user.id, user.id, true)
    ids = search_ids(friendships, user)
    self.find(ids)
  end
  
  def self.not_friends(user)
    friendships = Friendship.where("from_id=? OR to_id=?", user.id, user.id)
    ids = search_ids(friendships, user) << user.id
    self.all_except(ids)
  end
  
  def self.search_ids(friendships, user)
    ids = []
    friendships.each do |f|
      if f.from_id == user.id
        ids << f.to_id
      else
        ids << f.from_id
      end
    end
    ids
  end
end
