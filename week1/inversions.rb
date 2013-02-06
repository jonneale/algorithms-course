def merge_and_count_split_inversions(b,c,n)
  i = 0
  j = 0
  d = []
  inversions = 0
  (0..(n-1)).each do |k|
    if !c[j] || b[i] && b[i] < c[j] 
      d[k] = b[i]
      i=i+1
    elsif !b[i]
      d[k] = c[j]
      j=j+1
    else 
      d[k] = c[j]
      j=j+1
      inversions=inversions+b.count-i
    end
  end
  [d,inversions]
end

def sort_and_count(a)
  n = a.count
  return [a,0] if n <= 1
  sliced_array = a.each_slice(a.count/2).to_a
  b,x = sort_and_count(sliced_array.first)
  c,y = sort_and_count(a - sliced_array.first)
  d,z = merge_and_count_split_inversions(b,c,n)
  return [d, x+y+z]
end

numbers = []

File.open("IntegerArray.txt", "r") do |infile|
    while (line = infile.gets)
        numbers << line.to_i
    end
end


puts "Final Result: #{sort_and_count(numbers).inspect}"