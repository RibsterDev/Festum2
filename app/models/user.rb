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
    event_users.where(group_id: group.id).any?
  end

  def voted?(group)
    Vote.joins(:event_user).where(votes: { user_id: id }, event_users: { group_id: group.id }).exists?
  end

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now unless ENV['NOT_SEND_EMAIL_WELCOME'] == 'true'
  end
end
