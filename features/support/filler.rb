module Filler
  class Memory
    # So you can do fill_in "Content", :with => Filler::Memory.content
    def self.content
      "Memory content is here. :)"
    end
    
    def self.too_much_content # 141 characters
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas et vestibulum orci. Nunc varius, enim dapibus semper iaculis, risus nullam."
    end
  end
end