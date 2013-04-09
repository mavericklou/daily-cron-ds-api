prev_key = nil
key_count = 0
ARGF.each do |line|
  line = line.chomp.strip
  (key, value) = line.split(/\t/)
  if prev_key && key != prev_key && key_count > 0
    puts prev_key + "\t" + key_count.to_s
    prev_key = key
    key_count = 0
  elsif !prev_key
    prev_key = key
  end

  key_count += value.to_i
end

if prev_key && key_count > 0
  puts prev_key + "\t" + key_count.to_s
end
