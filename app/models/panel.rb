class Panel < ActiveRecord::Base
  attr_accessible( :background_color,
                   :background_image,
                   :slide_id,
                   :fake_file,
                   :order, :panel_type, :detail_text, :retained_background_image)

  attr_accessor :fake_file

  SlideTypes = ['Blank','Title','Detail']


  belongs_to :slide
  image_accessor :background_image
end
