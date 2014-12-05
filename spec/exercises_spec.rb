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


    it "Returns the number of elements in the array" do
      result = Exercises.ex1([2,3,7,9,-15,7,6,9])
      expect(result).to eq(8)
    end



    it "Returns the second element of an array" do
      result = Exercises.ex2([2,3,7,9,-15,7,6,9])
      expect(result).to eq(3)
    end



    it "Returns the sum of the given array of numbers" do
      result = Exercises.ex3([2,3,7,9,-15,7,6,9])
      expect(result).to eq(28)
    end



    it "Returns the max number of the given array" do
      result = Exercises.ex4([2,3,7,9,-15,7,6,9])
      expect(result).to eq(9)
    end



    it "Iterates through an array and `puts` each element" do
      output = capture_stdout { Exercises.ex5([2,3,7,9,-15,7,6,9]) }
      expect(output).to include('2', '3', '7', '9', '-15', '7', '6', '9') 

      # exect($stdout).to receive(:puts).with("xyz")
      # Exercises.ex5([2,3,7,9,-15,7,6,9])
    end



    it "Updates the last item in the array to 'panda'" do
      result = Exercises.ex6([2,3,7,9,-15,7,6,9])
      expect(result).to eq([2,3,7,9,-15,7,6,'panda'])
    end

    it "If the last item is already 'panda', update it to 'GODZILLA' instead" do
      result = Exercises.ex6([2,3,7,9,-15,7,6,'panda'])
      expect(result).to eq([2,3,7,9,-15,7,6,'GODZILLA'])
    end



    it "If the string `str` exists in the array, add `str` to the end of the array" do
      result = Exercises.ex7([2,3,7,9,'hello',7,6,'GODZILLA'], "hello")
      expect(result).to eq([2,3,7,9,'hello',7,6,'GODZILLA','hello'])
    end



    it "`people` is an array of hashes. Each hash is like the following:
    { :name => 'Bob', :occupation => 'Builder' }
    Iterate through `people` and print out their name and occupation" do

      people = [
        { :name => 'Bob', :occupation => 'Lego Builder' },
        { :name => 'Amber', :occupation => 'House Builder' },
        { :name => 'John', :occupation => 'Body Builder' }
      ]

      output = capture_stdout { Exercises.ex5([2,3,7,9,-15,7,6,9]) }
      expect(output).to include("2", "3", "7", "9", "-15", "7", "6", "9") 

      output = capture_stdout { Exercises.ex8(people) }
      expect(output).to include("Bob", "Lego", "Builder", "Amber", "House", "Builder", "John", "Body", "Builder")
    end



    it "Returns `true` if the given time is in a leap year" do
      result = Exercises.ex9(2000)
      expect(result).to eq(true)
    end

    it "return `false` if the given time is not in a leap year" do
      result = Exercises.ex9(1900)
      expect(result).to eq(false)
    end



    it "return \"happy hour\" if it is between 4 and 6pm" do
      my_time = Time.new(2002, 10, 31, 16, 2, 2, "+02:00")
      allow(Time).to receive(:now).and_return(my_time)
      result = Exercises.ex10
      expect(result).to eq('happy hour')
    end

    it "return \"normal prices\" since it's not between 4 and 6pm" do
      my_time = Time.new(2002, 10, 31, 2, 2, 2, "+02:00")
      allow(Time).to receive(:now).and_return(my_time)
      result = Exercises.ex10
      expect(result).to eq("normal prices")
    end



    it "return the sum of two numbers if they are both integers" do
      result = Exercises.ex11(1, 3)
      expect(result).to eq(4)
    end

    it "raises an error when either numbers is not an integer" do
      expect{ Exercises.ex11(1, 'c') }.to raise_error
    end



    it " two characters arg returns an ordered array with all characters need to fill the range" do
      result = Exercises.ex12('a', 'h')
      expect(result).to eq(["a", "b", "c", "d", "e", "f", "g", "h"])
    end
end
