class ReviewDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def thumbs 
    if object.stars < 3 
      h.content_tag(:i, 'thumb_down', class: 'tiny material-icons')
    else 
      h.content_tag(:i, 'thumb_up', class: 'tiny material-icons')
    end 
  end 

  def star_icons
    object.stars.round(half: :down).round
  end 

  def create_time 
    object.created_at.strftime("%m/%d/%Y %I:%M %p")
  end 

end
