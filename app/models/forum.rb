class Forum < ApplicationRecord

validates :title, presence:true, length: {minimum: 3, maximum:20}
  validates :subject, presence:true, length: {minimum: 3, maximum:200}




# validates_presence_of :title, :author, :subject

has_many :replies, class_name: "Forum", foreign_key: "reply_id" , dependent: :destroy
belongs_to :reply, class_name: "Forum", optional: true



self.per_page = 16
end

