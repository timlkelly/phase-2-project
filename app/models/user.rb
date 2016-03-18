class User < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email
  validate :validate_password

  has_many :saved_locations
  has_many :locations, through: :saved_locations


  def password
    @password ||= BCrypt::Password.new(hashword)
  end

  def password=(new_password)
    @plaintext_password = new_password
    @password = BCrypt::Password.create(new_password)
    self.hashword = @password
  end

  def authenticate(string_password)
    self.password == string_password
  end

  def validate_password
    if @plaintext_password == nil
      self.errors.add(:password, "must exist")
    elsif @plaintext_password.length < 8
      self.errors.add(:password, "must be at least 8 characters long")
    end

    # When/why plaintext == nil?
    # Does length test cover both situations

    # if @plaintext_password.length < 8
    #   self.errors.add(:password, "must be at least 8 characters long")
    # end



  end

end
