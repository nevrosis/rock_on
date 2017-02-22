class Album < ApplicationRecord

  belongs_to :band

  scope :active, lambda { where(:active => true) }
  scope :inactive, lambda { where(:active => false) }
  scope :sorted, lambda { order ("title ASC")}
  scope :search, lambda { |query| where (["title LIKE ?","%#{query}%"]) }

  #validates_presence_of :title
  validates :title,  :presence => true,
                    :length => {:within => 2...50},
                    :uniqueness => false

end
