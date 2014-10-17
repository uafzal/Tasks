#!/usr/bin/ruby

hashpair = Hash.new

f = File.open(ARGV[0], "r")
f.each_line do |line|
  cline = line.chomp()
  pairs = cline.split(/\t/)

  if hashpair.has_key?("#{pairs[0]}")
	c = hashpair["#{pairs[0]}"]
        d = "#{pairs[1]}\t#{pairs[2]}"
        hashpair["#{pairs[0]}"] = "#{c}\t#{ d}"
 else 
	hashpair["#{pairs[0]}"] = "#{pairs[1]}\t#{pairs[2]}"
 end       

 if hashpair.has_key?("#{pairs[1]}")
        c = hashpair["#{pairs[1]}"]
        d = "#{pairs[0]}\t#{pairs[2]}"
        hashpair["#{pairs[1]}"] = "#{c}\t#{d}"
else
        hashpair["#{pairs[1]}"] = "#{pairs[0]}\t#{pairs[2]}"
 end
       
end

f2 = File.open(ARGV[1],"w+")
hashpair.each do | part1, part2 |
f2.write("#{part1}\t#{part2}\n")
end
puts hashpair.size
f.close
f2.close
