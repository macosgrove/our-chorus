class Role
  include Mongoid::Document
  
  has_and_belongs_to_many :users
  belongs_to :resource, :polymorphic => true
  
  field :name, :type => String
  index({ :name => 1 }, { :unique => true })


  index({
    :name => 1,
    :resource_type => 1,
    :resource_id => 1
  },
  { :unique => true})
  
  scopify

  def self.assignable_roles
    [
        Role.find_or_create_by(name: "prospective"),
        Role.find_or_create_by(name: "provisional"),
        Role.find_or_create_by(name: "course_attendee"),
        Role.find_or_create_by(name: "full_member"),
        Role.find_or_create_by(name: "past_member")
    ]
  end

  def self.non_assignable_roles
    Role.all.to_a.select {|role| !assignable_roles.include?(role)}
  end

  def label
    name.gsub("_"," ").capitalize
  end
end
