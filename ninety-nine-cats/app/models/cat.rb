# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord

include ActionView::Helpers::DateHelper
    validates :birth_date, :color, :name, :sex, presence:true
    @@CAT_COLORS = ['Red', 'Orange', 'Blue', 'Green', 'Yellow', 'Brown', 'Black', 'Purple', 'White', 'Gray']

    validates :color, inclusion: { in: @@CAT_COLORS, message: "#{:color} is not valid color!"}
    validates :sex, inclusion: {in: ["M","F"], message: "#{:sex} is not a valid sex"}

    validate :birth_date_cannot_be_in_the_future

    def birth_date_cannot_be_in_the_future
        if self.birth_date.present? && self.birth_date > Date.today
            errors.add(:birth_date, "cannot be in the future")
        end
    end

    def age
        bday = self.birth_date
        # age = Time.now - (bday.year.years + bday.month.months + bday.day.days)
        age = Date.today.year - bday.year
        return "#{self.name} is #{age} years old."
    end
end
