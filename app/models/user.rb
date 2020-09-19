class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :videos
  has_one :jwt_token_list

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
