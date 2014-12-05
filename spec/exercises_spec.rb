require "./exercises.rb"
require 'pry-byebug'

def capture_stdout(&block)
  original_stdout = $stdout
  $stdout = fake = StringIO.new
  begin
    yield
  ensure
    $stdout = original_stdout
  end
  fake.string
end

describe 'Exercise' do
    it "triples the length of a string" do
      result = Exercises.ex0("ha")
      expect(result).to eq("hahaha")
    end

    it "returns 'nope' if the string is 'wishes'" do
      result = Exercises.ex0("wishes")
      expect(result).to eq("nope")
    end


    xit "Returns the number of elements in the array" do
      result = Exercises.ex1([2,3,7,9,-15,7,6,9])
      expect(result).to eq(8)
    end



    xit "Returns the second element of an array" do
      result = Exercises.ex2([2,3,7,9,-15,7,6,9])
      expect(result).to eq(3)
    end



    xit "Returns the sum of the given array of numbers" do
      result = Exercises.ex3([2,3,7,9,-15,7,6,9])
      expect(result).to eq(28)
    end



    xit "Returns the max number of the given array" do
      result = Exercises.ex4([2,3,7,9,-15,7,6,9])
      expect(result).to eq(9)
    end



    xit "Iterates through an array and `puts` each element" do
      output = capture_stdout { Exercises.ex5([2,3,7,9,-15,7,6,9]) }
      expect(output).to eq("2\n3\n7\n9\n-15\n7\n6\n9\n") 

      # exect($stdout).to receive(:puts).with("xyz")
      # Exercises.ex5([2,3,7,9,-15,7,6,9])
    end



    xit "Updates the last item in the array to 'panda'" do
      result = Exercises.ex6([2,3,7,9,-15,7,6,9])
      expect(result).to eq([2,3,7,9,-15,7,6,'panda'])
    end

    xit "If the last item is already 'panda', update it to 'GODZILLA' instead" do
      result = Exercises.ex6([2,3,7,9,-15,7,6,'panda'])
      expect(result).to eq([2,3,7,9,-15,7,6,'GODZILLA'])
    end



    xit "If the string `str` exists in the array, add `str` to the end of the array" do
      result = Exercises.ex7([2,3,7,9,'str',7,6,'GODZILLA'])
      expect(result).to eq([2,3,7,9,'str',7,6,'GODZILLA', 'str'])
    end



    xit "`people` is an array of hashes. Each hash is like the following:
    { :name => 'Bob', :occupation => 'Builder' }
    Iterate through `people` and print out their name and occupation" do

      people = [
        { :name => 'Bob', :occupation => 'Lego Builder' },
        { :name => 'Amber', :occupation => 'House Builder' },
        { :name => 'John', :occupation => 'Body Builder' }
      ]

            output = capture_stdout { Exercises.ex5([2,3,7,9,-15,7,6,9]) }
      expect(output).to eq("2\n3\n7\n9\n-15\n7\n6\n9\n") 

      output = capture_stdout { Exercises.ex8(people) }
      expect(result).should incude("Bob", "Lego", "Builder", "Amber", "House", "Builder", "John", "Body", "Builder")
    end



    xit "Returns `true` if the given time is in a leap year" do
      result = Exercises.ex9(2000)
      expect(result).to eq(true)
    end

    xit "return `false` if the given time is not in a leap year" do
      result = Exercises.ex9(1900)
      expect(result).to eq(false)
    end



    xit "return \"happy hour\" if it is between 4 and 6pm" do
      result = Exercises.ex10("happy hour")
      expect(result).to eq("5:50pm")
    end

    xit "return \"normal prices\" since it's not between 4 and 6pm" do
      result = Exercises.ex10("normal prices")
      expect(result).to eq("5:50am")
    end



    xit "return the sum of two numbers if they are both integers" do
      result = Exercises.ex11([1, 3])
      expect(result).to eq("hahaha")
    end

    xit "raises an error when either numbers is not an integer" do
      expect( Exercises.ex11([1, 'c']) ).to raise_error
    end



    xit " two characters arg returns an ordered array with all characters need to fill the range" do
      result = Exercises.ex12("ha")
      expect(result).to eq("abcdefgh".reverse)
    end
end
