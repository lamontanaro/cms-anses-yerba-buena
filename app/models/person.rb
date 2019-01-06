class Person < ApplicationRecord
  has_many :turns
  has_many :dockets

  def full_name
    self.first_name + ' ' + self.last_name
  end
end
