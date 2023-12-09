class User < ApplicationRecord
  authenticates_with_sorcery!
  belongs_to :shop
  
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :password, length: { minimum: 4 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  before_destroy :manager_must_exist_at_least_one_person_per_shop

  enum role: { employee: 0, leader: 1 , manager: 2 }

  # フォームができたら削除（新規登録時にshopも作る）
  def create_shop_with_user
    shop = Shop.create!(
      name: "#{self.name}さんの店舗",
      email: email
    )
    self.shop_id = shop.id
  end

  private

  def manager_must_exist_at_least_one_person_per_shop
    binding.pry
    if role == 'manager' && shop.users.manager.count <= 1
      errors.add(:base, "店舗には最低1人以上のマネージャーが必要です。")
      throw :abort
    end
  end
end
