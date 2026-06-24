SetupDefinition.find_or_create_by!(name: "opening Range Breakout") do |s|
  s.version = 1.0
  s.active = true
end

SetupDefinition.find_or_create_by!(name: "VWAP Reclaim") do |s|
  s.version = 1.0
  s.active = true
end

SetupDefinition.find_or_create_by!(name: "Trend Pullback") do |s|
  s.version = 1.0
  s.active = true
end
