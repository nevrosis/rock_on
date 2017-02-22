class Band < ApplicationRecord

  has_many :albums

  scope :active, lambda { where(:active => true) }
  scope :inactive, lambda { where(:active => false) }
  scope :sorted, lambda { order ("name ASC") }
  scope :search, lambda { |query| where (["name LIKE ?","%#{query}%"]) }

  #validates_presence_of :name
  #validates_length_of :name, :within => 2...50
  #validates_uniqueness_of :name

  validates :name,  :presence => true,
                    :length => {:within => 2...50},
                    :uniqueness => true

end
