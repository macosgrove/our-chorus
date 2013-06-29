class Content

  attr_accessor :type

  def self.vision
    c = Content.new
    c.type = :vision
    c
  end
  def self.values
    c = Content.new
    c.type = :values
    c
  end
  def self.members
    c = Content.new
    c.type = :members
    c
  end
  def self.music
    c = Content.new
    c.type = :music
    c
  end
  def self.practices
    c = Content.new
    c.type = :practices
    c
  end
  def self.principles
    c = Content.new
    c.type = :principles
    c
  end
  def self.grow
    c = Content.new
    c.type = :grow
    c
  end

  def self.materials
    c = Content.new
    c.type = :materials
    c
  end

end