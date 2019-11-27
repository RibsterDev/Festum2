class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_groups

  has_many :event_users

  has_many :events, through: :event_users
  has_many :groups, through: :user_groups
  has_many :votes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
  validates :password, presence: true

  after_create :send_welcome_email

  def proposed_event?(group)
    !event_users.where(group_id: group.id).any?
  end

  def proposed_vote?(group)
    false
  end

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end
end


  # def propose_event?
  #   current_user.id == event_users.present?
  # end

  # def propose_vote?
  #   current_user == votes.count(users.count)
  # end
