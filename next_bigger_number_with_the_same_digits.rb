def next_bigger(n)
  split_digits = n.to_s.split("").map{ |digit| digit.to_i }
  pivot = -2
  
  if split_digits == split_digits.sort { |x, y| y - x }
    return -1
  end
  
  while split_digits[pivot] >= split_digits[pivot + 1] 
    pivot -= 1 
  end 
    
  desc_end_sect = split_digits[pivot..-1].sort {|x, y| x - y}  
  index_of_pivot = desc_end_sect.index(split_digits[pivot])
  
  i = 0
  while desc_end_sect[index_of_pivot + i] == split_digits[pivot]
    i += 1
  end
  
  (split_digits[0...pivot] + [desc_end_sect.delete_at(index_of_pivot + i)]  + desc_end_sect).join.to_i
end
