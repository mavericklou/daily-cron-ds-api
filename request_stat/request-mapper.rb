ARGF.each do |line|
  line = line.strip.chomp
  if line.include? "__request__ "
    line.match(/\d{3}\s*(GET|POST|PUT)\s*\/\w*\/\w*/) { |m|
      puts m[0].strip.gsub(/\s+/, " ") + "\t1"
    }
  end
end
