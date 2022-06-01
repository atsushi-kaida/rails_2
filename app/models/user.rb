class User < ApplicationRecord

  has_one :profile
  accepts_nested_attributes_for :profile
  attr_accessor :name

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :rememberable, :validatable
  has_many :rooms, dependent: :destroy
end
