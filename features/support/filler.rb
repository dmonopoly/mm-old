module Filler
  class Memory
    # So you can do fill_in "Content", :with => Filler::Memory.content
    def self.content
      "Memory content is here."
    end
  end
end