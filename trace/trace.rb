ARGF.each do |line|
  if line.include?"__trace__ "
    puts line.gsub(/.*__trace__ /, '')
  end
end
