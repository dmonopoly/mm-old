# Factories
require File.expand_path("../../features/support/filler", __FILE__) # requires the filler file in features/support

Factory.define :memory do |t|
  t.content Filler::Memory.content
end

Factory.define :time_frame do |t|
  # t.type
  # t.representation
end