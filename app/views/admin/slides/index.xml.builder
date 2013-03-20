xml.cinema do
  xml.title "Cinema Signage"
  xml.link "http://walkerart.org/"
  xml.description "Cinema Signage Feed"
  xml.views do
    # default slide WALKER:
    xml.slide do
      xml.panel do
        xml.position 1
        xml.type 'full'
        xml.text "WALKER"
        xml.color "#000000"
        xml.background "#FFFFFF"
      end
    end

    # default slide CINEMA:
    xml.slide do
      xml.panel do
        xml.position 1
        xml.type 'full'
        xml.text "CINEMA"
        xml.color "#FFFFFF"
        xml.background "#000000"
      end
    end

    # default slide MASTER:
    xml.slide do
      xml.panel do
        xml.position 1
        xml.type 'full'
        xml.text ''
        xml.color "#000000"
        xml.background '/Users/ajwarnick/Desktop/Master_last_frame.jpg'
      end
    end

    @slides.each do |slide|
      xml.slide do
        slide.panels.each do |panel|        
          xml.panel do
            xml.position panel.position
            xml.type panel.panel_type
            if panel.text.present?
              xml.text do
                xml.cdata! panel.text
              end
            end
            xml.color panel.color
            xml.background panel.background
          end
        end
      end
    end
  end
end
