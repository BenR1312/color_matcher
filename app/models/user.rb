class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_initialize :set_default_role, if: :new_record?
  enum role: [:user, :teacher, :admin]

  validates :email, presence: true

  def set_default_role
    self.role ||= :user
  end
end
