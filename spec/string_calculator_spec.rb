require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe StringCalculator, "#add" do
  it "returns 0 for empty string"

  context "single number" do
    it "returns 0 for 0"
    
    it "returns 5 for 5"

    it "returns 27 for 27"
  end

  context "2 numbers" do
    it "returns 5 for 2,3"

    it "returns 22 for 15,7"
  end

  context "3 numbers" do
    it "returns 6 for 1,2,3"

    it "returns 1025 for 500,400,125"
  end

  context "many numbers" do
    it "returns #{20*100} for 100 20's"
  end

  it "supports newline as delimiter"

  it "supports mixed delimiters"

  it "supports alternate delimiter"

  context "negative numbers" do
    it "raises an exception if it finds one"

    it "includes the numbers in the error"
  end
end
