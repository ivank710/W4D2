# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'date'

class Cat < ApplicationRecord
  COLORS = %w(green black gray orange white)

  validates :sex, inclusion: { in: %w(M F) }
  validates :color, inclusion: { in: COLORS }
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :name, :description, uniqueness: true

  def age
    b_date = self.birth_date
    2019 - b_date.year
  end

  #Cat.new(color: 'orange', name: 'Test', sex: 'M', description: 'I am a TEST cat!')
end
