class SubDecorator < Draper::Decorator
  delegate_all

  
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  def form_url
    object.persisted? ? h.edit_sub_url(object): h.subs_url 
  end

  def submit_form 
    object.persisted? ? 'Update': 'Create'
  end

  def form_method 
    object.persisted? ? "PATCH" : "POST"
  end
end
