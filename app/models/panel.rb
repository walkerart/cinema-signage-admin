class Panel < ActiveRecord::Base

  attr_accessible :background_file, :order, :slide_id, :text, :background_file_uid
  attr_accessible :retained_background_file, :remove_background_file
  default_scope order("'panels'.'order'") # wtf sqlite bug?

  belongs_to :slide

  validates :text, with: :validate_number_of_lines

  def validate_number_of_lines
    unless [0,1,2,5].include? number_of_lines
      errors.add :text, "Must have 0,1,2,5 lines of text"
    end
  end

  image_accessor :background_file do
    copy_to :background_thumb do |a|
      a.thumb('x130')
    end
  end
  image_accessor :background_thumb

  def position
    order.nil? ? 0 : order
  end

  def background
    case panel_type
    when 'detail'
      black
    else
      background_file.try( :remote_url) || slide.background_color
    end
  end

  def color
    case panel_type
      when 'title'
      black
    else
      slide.background_color
    end
  end

  def panel_type
    @panel_type ||= case
    when background_file_uid.blank? && text.blank?
      "color"
    when background_file_uid.present?
      "image"
    when number_of_lines == 1
      'title'
    when number_of_lines == 2
      'title'
    when number_of_lines == 5
      'detail'
    end
  end

  def to_s
    id
  end

private

  def black
    '#000000'
  end

  def number_of_lines
    text.lines.count
  end
end
