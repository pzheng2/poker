class Array

  def my_uniq
    unique_elements = []
    each do |elem|
      unique_elements << elem unless unique_elements.include?(elem)
    end

    unique_elements
  end

  def two_sum
    zero_sum_pairs = []
    each_with_index do |elem, index|
      (index + 1...length).each do |other_index|
        zero_sum_pairs << [index, other_index] if elem + self[other_index] == 0
      end
    end

    zero_sum_pairs
  end

  def my_transpose

    raise TypeError unless self.all? { |element| element.is_a?(Array) }
    row_length = self.first.length

    transposed_matrix = Array.new {[]}
    each_with_index do |row, row_index|

      raise IndexError unless row.length == row_length
      row.each_with_index do |val, col_index|
        transposed_matrix[col_index] ||= []

        transposed_matrix[col_index] << val
      end
    end

    transposed_matrix
  end

end
