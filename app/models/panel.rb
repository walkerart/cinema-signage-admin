class Panel < ActiveRecord::Base

  attr_accessible :background_file, :order, :slide_id, :text
  attr_accessible :retained_background_file, :remove_background_file
  default_scope order("'panels'.'order'") # wtf sqlite bug?

  belongs_to :slide
  image_accessor :background_file

  def position
    order.nil? ? 0 : order
  end

  # defaults to white if no image or color
  def background
    background_file.try( :remote_url) || slide.color
  end

  def panel_type
    case
    when background_file_uid.blank? && text.blank?
      "color"
    when background_file_uid.present?
      "image"
    when background_file_uid.blank? && text.present?
      "detail"
    end
  end

  def to_s
    id
  end
end
