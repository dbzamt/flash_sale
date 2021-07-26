class Deal < ActiveRecord::Base
    # has_many :user_deals
    # has_many :users, through: :user_deals

    # validates_presence_of :title, :price, :discounted_price, :quantity, :description, :publish_date, :image

    # has_attached_file :image, styles: {large: "600x600>", medium: "300x300>"}
    # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
