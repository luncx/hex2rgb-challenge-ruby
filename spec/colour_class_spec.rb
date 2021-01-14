# Start by requiring the colour class we want to test
# require 'rspec/autorun'
require 'colour'
# require 'bowling'

SAMPLE_HAPPY_COLOURS = {
        "#000000": {"r": 0,   "g": 0,   "b": 0},
        "#0FA5FF": {"r": 15,  "g": 165, "b": 255},
        "#172957": {"r": 23,  "g": 41,  "b": 87},
        "#800000": {"r": 128, "g": 0,   "b": 0},
        "#F42069": {"r": 244, "g": 32,  "b": 105},
        "#f8c6fd": {"r": 248, "g": 198, "b": 253},
        "#ffFFff": {"r": 255, "g": 255, "b": 255},
    }

RSpec.describe "hex_to_rgb" do
  it "maps valid hex codes to rgb map" do
    SAMPLE_HAPPY_COLOURS.each do |k, v|
      expect(hex_to_rgb(k)).to eq v
    end
  end

  it "has valid map keys" do
    result = hex_to_rgb("#0a0b0c")
    expect(result).to have_key(:r)
    expect(result).to have_key(:g)
    expect(result).to have_key(:b)
  end
end


RSpec.describe Colour do
  it "Can be instantiated with 6 digit code" do
    SAMPLE_HAPPY_COLOURS.each_key do |k|
      colour = Colour.new(hex_code: k.to_s)
      expect(colour.class).to eq(Colour)
    end
  end

  it "Can be instantiated with rgb map" do
    SAMPLE_HAPPY_COLOURS.each_value do |v|
      colour = Colour.new(rgb_map: v)
      expect(colour.class).to eq(Colour)
    end
  end

  it "Can instantiate with hex_code, and output hex_code" do
    SAMPLE_HAPPY_COLOURS.each do |k, v|
      colour = Colour.new(hex_code: k)
      expect(colour.to_hex_code.downcase).to eq k.to_s.downcase
    end
  end

  it "Can instantiate with rgb_map, and output hex_code" do
    SAMPLE_HAPPY_COLOURS.each do |k, v|
      colour = Colour.new(rgb_map: v)
      expect(colour.to_hex_code.downcase).to eq k.to_s.downcase
    end
  end

  it "Can instantiate with hex_code, and output rgb_map" do
    SAMPLE_HAPPY_COLOURS.each do |k, v|
      colour = Colour.new(hex_code: k)
      expect(colour.to_rgb_map).to eq v
    end
  end

  it "Can instantiate with rgb_map, and output rgb_map" do
    SAMPLE_HAPPY_COLOURS.each do |k, v|
      colour = Colour.new(rgb_map: v)
      expect(colour.to_rgb_map).to eq v
    end
  end
end
