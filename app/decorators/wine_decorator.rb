class WineDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def wine_image 
    if object.color == "Red"
      h.image_tag('red_wine.png', class: "displayed")
    elsif object.color == "Rose"
      h.image_tag('rose_wine.png', class: "displayed")
    else 
      h.image_tag('white_wine.png', class: "displayed")
    end 
  end 

  def wine_link
    h.link_to object.name, h.wine_path(object)
  end 


end
