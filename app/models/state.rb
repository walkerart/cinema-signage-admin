class State < ActiveRecord::Base

  has_many :slides, dependent: :destroy

  accepts_nested_attributes_for( :slides, 
                                 allow_destroy: true,
                                 limit: 3)
  attr_accessible :order, :state_type, :slides_attributes

  after_initialize :set_order

  def set_order
    self.order = State.count + 1
  end

  def to_s
    "State #{order}"
  end
end
