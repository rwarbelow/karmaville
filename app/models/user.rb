class User < ActiveRecord::Base
  has_many :karma_points

  attr_accessible :first_name, :last_name, :email, :username, :total_karma

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates :username,
            :presence => true,
            :length => {:minimum => 2, :maximum => 32},
            :format => {:with => /^\w+$/},
            :uniqueness => {:case_sensitive => false}

  validates :email,
            :presence => true,
            :format => {:with => /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i},
            :uniqueness => {:case_sensitive => false}

  def self.by_karma
    User.order('total_karma DESC')
  end

  def sum_karma
    self.karma_points.sum(:value)
  end

  def update_karma
    self.update_attribute(:total_karma, self.sum_karma)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.page(num)
    if num > 0
      User.limit(50).offset((num*50)-50)
    else
      User.limit(50)
    end
  end
end
