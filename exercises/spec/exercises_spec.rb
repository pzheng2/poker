require 'exercises'


describe Array do
  let(:array_with_dups) {[1, 2, 2]}
  describe "#my_uniq" do

    it "returns an empty array if called on an empty array" do
      empty_array = []
      expect(empty_array.my_uniq).to eq([])
    end

    it "does not mutate original array" do
      new_array = array_with_dups.dup
      array_with_dups.my_uniq
      expect(array_with_dups).to eq(new_array)
    end

    it "removes repeated elements" do
      expect(array_with_dups.my_uniq).to eq([1, 2])
    end

    it "preserves order of elements" do
      unsorted_array = [1, 2, 2, 3, 3]
      expect(unsorted_array.my_uniq).to eq([1, 2, 3])
    end

  end

  describe "#two_sum" do

    it "returns an empty array if no pairs of elements sum to zero" do
      no_zero_sum_array = [1, 2, 3, 4]
      expect(no_zero_sum_array.two_sum).to eq([])
    end

    it "returns position of a zero sum pair" do
      zero_sum_array = [1, -1]
      expect(zero_sum_array.two_sum).to eq([[0, 1]])
    end

    it "returns pairs in dictionary-wise order" do
      two_sum_array = [-1, 0, 2, -2, 1]
      expect(two_sum_array.two_sum).to eq([[0, 4], [2, 3]])
    end

    it "finds multiple pairs that share an element" do
      two_sum_array = [-1, 0, 2, -2, 1, 1]
      expect(two_sum_array.two_sum).to eq([[0, 4], [0, 5], [2, 3]])
    end
  end

  describe "#my_transpose" do

    it "returns an array of an empty array if called on an empty matrix" do
      empty_matrix = [[]]
      expect(empty_matrix.my_transpose).to eq([])
    end

    it "transposes a square matrix" do
      square_matrix = [[1, 2], [3, 4]]
      expect(square_matrix.my_transpose).to eq([[1, 3], [2, 4]])
    end

    it "transposes a rectangular matrix" do
      rectangular_matrix = [[1, 2], [3, 4], [5, 6]]
      expect(rectangular_matrix.my_transpose).to eq([[1, 3, 5], [2, 4, 6]])

    end

    it "raises IndexError if called on matrix with elements of varying size" do
      varying_size_matrix = [[1, 2], [3, 4], [5]]
      expect do
        varying_size_matrix.my_transpose
      end.to raise_error(IndexError)
    end

    it "raises TypeError if any matrix rows are not arrays" do
      heterogeneous_array = [nil, [1, 2], [3, 4]]
      expect do
        heterogeneous_array.my_transpose
      end.to raise_error(TypeError)
    end


  end
end

describe "#stock_picker" do

  it "returns an empty array if passed an empty array" do
    empty_array = []
    expect(stock_picker(empty_array)).to eq([])
  end

  it "returns an empty array if no trades are profitable" do
    no_trades = [2, 1]
    expect(stock_picker(no_trades)).to eq([])
  end

  it "returns the correct trade in a simple case" do
    simple_trade = [1, 2, 3]
    expect(stock_picker(simple_trade)).to eq([0, 2])
  end

end
