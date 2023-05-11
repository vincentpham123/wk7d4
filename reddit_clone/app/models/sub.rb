# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  title        :string           not null
#  description  :text
#  moderator_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Sub < ApplicationRecord

  validates :title, presence: true, uniqueness: true, length: {minimum: 5}
  validates :moderator, presence: true 
  belongs_to :moderator,
    class_name: :User 

  has_many :posts,
    dependent: :destroy 


end
