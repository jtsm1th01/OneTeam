class Employee < ActiveRecord::Base
  attr_accessor :remember_token
  
  belongs_to :location
  belongs_to :department
  belongs_to :title
  belongs_to :group
  has_many :subordinates, :class_name => "Employee",
    :foreign_key => "manager_id"
  belongs_to :manager, :class_name => "Employee",
    :foreign_key => "manager_id"
  has_many :current_skills, :dependent => :destroy
  has_many :desired_skills, :dependent => :destroy
  has_many :skills, :through => :current_skills
  has_many :goals, :through => :desired_skills, :source => :skill
  has_many :responses
  has_many :applications, through: :responses, :source => :project_request
  has_many :project_requests
  has_many :assignments
  has_many :reviews, through: :assignments
  has_many :skill_reviews, through: :reviews
  has_secure_password
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :employee_name, presence: true
  validates :employee_email, presence: true, uniqueness: true
  validate :uniqueness_of_current_skills
  validate :uniqueness_of_desired_skills
  
  accepts_nested_attributes_for :current_skills, :allow_destroy => true, reject_if: lambda {|attributes| attributes['skill_id'].blank?}
  accepts_nested_attributes_for :desired_skills, :allow_destroy => true, reject_if: lambda {|attributes| attributes['skill_id'].blank?}
  
  # Returns the hash digest of the given string.
  def Employee.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def Employee.new_token
    SecureRandom.urlsafe_base64
  end
  
  def remember
    self.remember_token = Employee.new_token
    update_attribute(:remember_digest, Employee.digest(remember_token))
  end
  
  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  # Forgets an employee.
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  def uniqueness_of_current_skills
    hash = {}
    current_skills.each do |current_skill|
      if hash[current_skill.skill_id]
        errors.add(:"current_skill", "is a duplicate.") if errors[:"current_skill.skill_id"].blank?
        current_skill.errors.add(:skill_id, "has already been taken")
      end
      hash[current_skill.skill_id] = true
    end
  end
  
  def uniqueness_of_desired_skills
    hash = {}
    desired_skills.each do |desired_skill|
      if hash[desired_skill.skill_id]
        errors.add(:"desired_skill", "is a duplicate.") if errors[:"desired_skill.skill_id"].blank?
        desired_skill.errors.add(:skill_id, "has already been taken")
      end
      hash[desired_skill.skill_id] = true
    end
  end

end
