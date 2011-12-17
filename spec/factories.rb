# Factories
require File.expand_path("../../features/support/filler", __FILE__) # requires the filler file in features/support

Factory.define :memory do |t|
  t.content Filler::Memory.content
end

Factory.define :time_frame do |t|
  # t.representation
end

Factory.define :time_key do |t|
  t.category { 1 } # 1 or 2
  t.date Date.today
end