matrix = Hash.new(0)
xkeys = Array.new
ykeys = Array.new

tags = File.open("tags.txt").read.upcase.split
tags.each { |item| 
  split = item.split(":")
  top = split[0] 
  bottom = split[1] 
  xkeys << top
  ykeys << bottom
  if (matrix[[top,bottom]])
    matrix[[top,bottom]] += 1
  end
}

xkeys = xkeys.uniq.sort
ykeys = ykeys.uniq.sort

#table heading with xkeys (riders)
puts "<table border='1'><tr class='firstrow'>"
puts "<th></th>"
xkeys.each { |xkey| 
  puts "<th><div class='rotate'><a href='http://thingsridingonthings.tumblr.com/tagged/#{xkey}'>#{xkey}</a></div></th>"
}
puts "</tr>"

#table rows, starting with ykeys (ridees)
ykeys.each { |ykey| 
  puts "<tr>"
  puts "<th><a href='http://thingsridingonthings.tumblr.com/tagged/#{ykey}'>#{ykey}</a></th>"
  xkeys.each { |xkey| 
    print "  <td>" 
    found = matrix[[xkey,ykey]]
    if (found && found > 0) 
      #puts "<a href='http://thingsridingonthings.tumblr.com/tagged/#{xkey}%3A#{ykey}'>#{found.to_s}=</a>"
      puts "<a href='http://thingsridingonthings.tumblr.com/tagged/#{xkey}%3A#{ykey}' title='#{xkey.downcase} riding on a #{ykey.downcase} x #{found}'><span style='font-size:#{((1 + found.to_f) / 3).to_s}em'>&bull;</span></a>"
    end 
    puts "</td>" 
  }
  puts "</tr>"
}
puts "</table>"
