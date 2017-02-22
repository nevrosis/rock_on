class PowerUser < ApplicationRecord

  # not working well on WINDOW OS
  #has_secure_password

  scope :sorted, lambda { order ("first_name ASC") }
  scope :search, lambda { |query| where (["first_name LIKE ?","%#{query}%"]) }

  validates :first_name,  :presence => true,
                          :length => {:within => 2...25}

  validates :last_name,  :presence => true,
                          :length => {:within => 2...25}

  validates :email,   :presence => true,
                      :length => {:within => 2...100},
                      :uniqueness => true

  validates :password_digest, :presence => true,
                              :length => {:within => 6...100}



end
