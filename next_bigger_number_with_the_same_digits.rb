def next_bigger(n)
  split_digits = n.to_s.split("").map{ |digit| digit.to_i }
  sorted_digits = split_digits.sort { |x, y| y - x }
  
  if split_digits == sorted_digits
    return -1
  end
  
  original_split_digits = split_digits.dup
  tracker_left = -2
    
  while split_digits[tracker_left] >= split_digits[tracker_left + 1] 
    tracker_left -= 1 
  end 
  
  desc_end_sect = split_digits[tracker_left..-1].sort {|x, y| x - y}.dup
  index_of_pivot = desc_end_sect.index(split_digits[tracker_left])
  
  i = 0
  next_num_to_pivot = desc_end_sect[index_of_pivot + i]
  loop do
    i += 1
    next_num_to_pivot = desc_end_sect[index_of_pivot + i]
    break if split_digits[tracker_left] != next_num_to_pivot
  end
  
  desc_end_sect.delete_at(index_of_pivot + i)
  
  split_digits = (split_digits[0...tracker_left] + [next_num_to_pivot] + desc_end_sect)
  split_digits != original_split_digits ? split_digits.join.to_i : -1
end
