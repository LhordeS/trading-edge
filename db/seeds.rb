puts "Clearing existing seed data..."

MarketEvent.destroy_all
TradingDay.destroy_all
SetupDefinition.destroy_all

puts "Creating setup definitions..."

# SetupDefinition.find_or_create_by!(name: "opening Range Breakout") do |s|
#   s.version = 1.0
#   s.active = true
# end

# SetupDefinition.find_or_create_by!(name: "VWAP Reclaim") do |s|
#   s.version = 1.0
#   s.active = true
# end

# SetupDefinition.find_or_create_by!(name: "Trend Pullback") do |s|
#   s.version = 1.0
#   s.active = true
# end

setup_definitions = [
  {
    name: "Opening Range Breakout",
    version: 1.0,
    active: true
  },
  {
    name: "VWAP Reclaim",
    version: 1.0,
    active: true
  },
  {
    name: "Trend Pullback",
    version: 1.0,
    active: true
  }
]

setup_definitions.each do |attrs|
  SetupDefinition.find_or_create_by!(name: attrs[:name]) do |setup|
    setup.version = attrs[:version]
    setup.active = attrs[:active]
  end
end

puts "Setup definitions successfully created"
