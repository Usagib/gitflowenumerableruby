#spec/enumerable_spec.rb
require './lib/enumerable'

RSpec.describe Enumerable do
  test = [2,3,4,5,6,7]
  testeven = [2,4,6,8,10]
  testodd = [1,3,5,7,9]
  hash = {"one" => 1, "two" => 2, "three" => 3}
  testclass = Class.new

  describe "#my_each" do
    context "with no block passed" do
      it "returns enumerator" do
        expect(test.my_each).to be_an Enumerator
      end
    end

    context "with block passed" do
      it "puts the elements in array" do
        expect(test.my_each{ |i| puts i }).to eql([2, 3, 4, 5, 6, 7])
      end
    end
  end

  describe "#my_each_with_index" do
    context "with no block passed" do
      it "returns enumerator" do
        expect(hash.my_each_with_index).to be_an Enumerator
      end
    end

    context "with block passed" do
      it "counts elements with index" do
        hash1 = Hash.new
        expect(%w(one two three).my_each_with_index{|item,index| hash[item] = index}).to eql(3)
      end
    end
  end

  describe "#my_select" do
    context "with no block passed" do
      it "returns an enumerator" do
        expect(test.my_select).to be_an Enumerator
      end
    end

    context "with block passed" do
      it "returns array" do
        expect(test.my_select{ |num| num }).to be_an Array
      end

      it "returns array with even numbers" do
        expect(test.my_select{|num| num.even?}).to eql([2,4,6])
      end

      it "fails test by returning odd numbers" do
        expect(test.my_select{|num| num.odd?}).not_to eql([1,3,5,7])
      end
    end
  end

  describe "#my_all?" do
    context "with no block passed" do
      it "returns true" do
        expect(test.my_all?).to eql(true)
      end
    end

    context "with block passed" do
      it "Returns true for all cases be even" do
        expect(testeven.my_all?{|num| num.even?}).to eql(true)
      end

      it "Return false for all cases not even" do
        expect(testodd.my_all?{|num| num.even?}).to_not eql(true)
      end

      it "Return false for any cases not even" do
        expect(test.my_all?{|num| num.even?}).to_not eql(true)
      end
    end

    context "with Regular expression passed" do
      it "returns false when /t/ not found" do
        expect(%w[ant bear cat].my_all?(/t/)).to eql(false)
      end
    end

    context "with Class passed" do
      it "returns false when all elements are not Numeric" do
        expect(testeven.my_all?(Numeric)).to_not eql(true)
      end
    end

  end

  describe "#my_any?" do
    context "With no block passed" do
      it "return true" do
        expect(test.my_any?).to eql(true)
      end
    end

    context "with block passed" do
      it "return true if any of the items is even" do
        expect(test.my_any?{|num| num.even?}).to eql(true)
      end

      it "return false if none of the items is even" do
        expect(testodd.my_any?{|num| num.even?}).to eql(false)
      end

      it "return true if at least one item is odd" do
        expect(test.my_any?{|num| num.odd?}).to_not eql(false)
      end
    end

    context "with Regular expression passed" do
      it "returns true when at least one /d/ is found" do
        expect(%w[ant bear cat].my_any?(/d/)).to_not eql(true)
      end
    end

    context "with Class passed" do
      it "returns true when one element is Integer" do
        expect(testeven.my_any?(Integer)).to eql(true)
      end
    end

  end

  describe "#my_none" do
    context "With no block passed" do
      it "return true" do
        expect(test.my_any?).to eql(true)
      end
    end

    context "with block passed" do
      it "return true if any of the items is even" do
        expect(test.my_any?{|num| num.even?}).to eql(true)
      end

      it "return false if none of the items is even" do
        expect(testodd.my_any?{|num| num.even?}).to eql(false)
      end

      it "return true if at least one item is odd" do
        expect(test.my_any?{|num| num.odd?}).to_not eql(false)
      end
    end

    context "with Regular expression passed" do
      it "returns true when at no /d/ is found" do
        expect(%w[ant bear cat].my_none?(/d/)).to eql(true)
      end
    end

    context "with Class passed" do
      it "returns true when none element is String" do
        expect(testeven.my_none?(String)).to eql(true)
      end
    end
  end

  describe "#my_count" do
    context "with no block passed" do
      it "returns the number of elements inside array" do
        expect(test.my_count).to eql(6)
      end
    end

    context "with block passed" do
      it "return number of even elements" do
        expect(test.my_count{|num| num.even?}).to eql(3)
      end

      it "return number of odd elements" do
        expect(testodd.my_count{|num| num.odd?}).to eql(5)
      end

      it "return number of elements lesser than 5" do
        expect(test.my_count{|num| num < 5}).to eql(3)
      end

      it "return the number of element 2" do
        expect(testeven.my_count(2)).to eql(1)
      end

    end
  end

  describe "#my_map" do
    context "With no block passed" do
      it "returns an Enumerator" do
        expect(test.my_map).to be_an Enumerator
      end
    end

    context "With block passed" do
      it "returns an array multiplied by 2" do
        expect(test.my_map{|num| num*2}).to eql([4, 6, 8, 10, 12, 14])
      end

      it "returns a converted array to string" do
        expect(test.my_map{|num| num.to_s}).to eql(["2", "3", "4", "5", "6", "7"])
      end
    end

  end

  describe "#my_inject" do
    context "With block passed" do
      it "returns the sum of the array" do
        expect(test.my_inject{|num,n| num + n}).to eql(27)
      end

      it "returns the sum of the array converted to string" do
        expect(test.my_inject{|num,n| num + n}.to_s).to be_a String
      end
    end
  end

end
