require File.expand_path(File.dirname(__FILE__) + '/spec_helper')


Spec::Matchers.define :add_to do |expected|
  match do |string|
    (@result = string.extend(StringCalculator).add) == expected
  end

  failure_message_for_should do |string|
    "Expected #{string} to add up to #{expected}, but go #{@result}"
  end
end

describe StringCalculator, "#add" do
  it "returns 0 for empty string" do
    "".should add_to(0)
  end

  context "single number" do
    it "returns 0 for 0" do
      "0".should add_to(0)
    end

    it "returns 5 for 5" do
      "5".should add_to(5)
    end

    it "returns 27 for 27" do
      "27".should add_to(27)
    end
  end

  context "2 numbers" do
    it "returns 5 for 2,3" do
      "2,3".should add_to(5)
    end

    it "returns 22 for 15,7" do
      "15,7".should add_to(22)
    end
  end

  context "3 numbers" do
    it "returns 6 for 1,2,3" do
      "1,2,3".should add_to(6)
    end

    it "returns 1025 for 500,400,125" do
      "500,400,125".should add_to(1025)
    end
  end

  context "many numbers" do
    it "returns #{20*100} for 100 20's" do
      (["20"]*100).join(",").should add_to(20*100)
    end
  end

  it "supports newline as delimiter" do
    "1\n2".should add_to(3)
  end

  it "supports mixed delimiters" do
    "1\n2,10".should add_to(13)
  end

  it "supports alternate delimiter" do
    "//;1;2;3".should add_to(6)
  end

  context "negative numbers" do
    it "raises an exception if it finds one" do
      lambda { "-1".extend(StringCalculator).add }.should raise_error
    end

    it "includes the numbers in the error" do
      lambda {"-1,2,-25".extend(StringCalculator).add }.should raise_error("Negatives not allowed: -1, -25")
    end
  end
end
