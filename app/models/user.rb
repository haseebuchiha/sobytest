class User < ApplicationRecord
    has_many :projects , dependent: :destroy
    has_many :messages
    has_many :game_users
    has_many :games, through: :game_users
    has_and_belongs_to_many :friends, class_name: "User", :join_table => "users_friends",foreign_key: "user_id",association_foreign_key: "friend_id", inverse_of: 'Users'
    validates :username, presence: true, length: {minimum: 3, maximum: 25}, uniqueness: {case_sensitive: false}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null

end