class StaticPagesController < ApplicationController
  def our_vision
  end

  def our_values
  end

  def our_music
  end

  def our_practices
  end

  def grow_your_group
  end

  def grow_your_voice
  end

  def course_materials
    @content = Content.materials
    authorize! :view, @content, :type => :materials
  end

end
