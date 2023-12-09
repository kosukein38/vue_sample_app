class User < ApplicationRecord
  authenticates_with_sorcery!
  # before_create :create_relation_shop_example
  belongs_to :shop
  
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :password, length: { minimum: 4 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  private

  # フォームができたら削除（新規登録時にshopも作る）
  # def create_relation_shop_example
  #   shop = Shop.create!(
  #     name: "#{self.name}ショップ",
  #     email: email
  #   )
  #   self.shop_id = shop.id
  # end
end
