class User
  include Mongoid::Document
  include Gravtastic
  gravtastic
  rolify

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :username, :type => String, :default => ""
  field :email, :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""
  attr_accessor :login # will be either username or email
  attr_accessible :login, :email, :username, :password, :password_confirmation, :first_name, :last_name, :mobile, :about_me, :send_emails

  validates_presence_of :email
  validates_presence_of :encrypted_password
  validates_uniqueness_of :username

  ## Recoverable
  field :reset_password_token, :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count, :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at, :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip, :type => String

  before_create :pre_create_hook
  after_create  :post_create_hook

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String

  # Regular fields
  field :first_name, type: String
  field :last_name, type: String
  field :mobile, type: String
  field :about_me, type: String
  attr_accessor :send_emails

  # function to handle user's login via email or username
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login).downcase
    if login
      where(conditions).where('$or' => [{:username => /^#{Regexp.escape(login)}$/i}, {:email => /^#{Regexp.escape(login)}$/i}]).first
    else
      where(conditions).first
    end
  end

  def is_member?
    (has_role? :founder) || (has_role? :probationer) || (has_role? :full_member) || (has_role? :prospective)
  end

  def pre_create_hook
    add_role(:prospective)
    self.send_emails = true if self.send_emails == nil
  end

  def post_create_hook
    if self.send_emails
      ::UserMailer.welcome_email(self).deliver
      ::UserMailer.notification_email(self).deliver
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
