class Card < ApplicationRecord
  belongs_to :user

  validates :number, presence: true, uniqueness: true, length: { is: 16 }, numericality: true


  def first_four_numbers
    number[0, 4]  # Get 4 characters starting at position 0
  end

  def last_four_numbers
    number[12, 4]  # Get 4 characters starting at position 13
  end

end
