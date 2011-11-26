module ApplicationHelper
  
  # Creates a link to add fields for a complex form
  # Example: <%= link_to_add_fields "add time frame", f, :time_frames, "person/time_frames/partials/" %>
  #
  # Parameters:
  # name - the name of the link that users typically see
  # f - the form builder object (this is used inside a typical form)
  # association - if the original form is for books and a book has many pages, this would be :pages
  # location - the path to the partial that you want rendered upon calling this. Must end with backslash.
  #   Convention: this partial's name must be like "_page_fields", not "_page_form"
  def link_to_add_fields(name, f, association, location)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(location + association.to_s.singularize + "_fields", :f => builder)
    end
    # link_to_function(name, h("add_fields(this, '#{association}', '#{escape_javascript(fields)}')"))
    link_to_function(name, "add_fields(this, '#{association}', '#{escape_javascript(fields)}')")
  end
  
  
end
