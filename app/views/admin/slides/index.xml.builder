xml.cinema do
  xml.title "Cinema Signage"
  xml.link "http://walkerart.org/"
  xml.description "Cinema Signage Feed"
  xml.views do
    @slides.each do |slide|
      xml.slide(type: slide.slide_type) do
        slide.panels.each do |panel|        
          xml.panel do
            xml.position panel.position
            xml.type panel.panel_type
            xml.text panel.text if panel.text.present?
            xml.background panel.background
          end
        end
      end
    end
  end
end
