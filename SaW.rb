# frozen_string_literal: true

f = File.open('in2.txt', 'r')
i = 0
s = 0
i4 = 0
izlaist = 0
f.each_line do |line|
#  line = line.encode('UTF-8', 'Windows-1252')
  # puts line
  i4 = 1 if line.index('<p class="spirit-type') != nil

  if i4 != 0
    izlaist = 0
    if i4 == 2
      if line.index('Bezalkoholiskie dzerieni') != nil || line.index('Bezalkoholiskie dzērieni') != nil || !line.index('Saldumi').nil? || !line.index('Uzkodas').nil? || !line.index('Sula').nil? || !line.index('Sīrupi').nil? || !line.index('Ūdens').nil? || !line.index('Citi').nil? || !line.index('Dezinfekcijas līdzekļi').nil? || !line.index('Aksesuāri').nil? || !line.index('Dāvanu maisiņi').nil? || !line.index('Grilam/piknikam').nil? || line.index('Enerģijas dzērieni') != nil
        izlaist = 1
      else
        print line[24..line.size-2]
        print "^"
      end
    end
    i4 += 1
    i4 = 0 if i4 == 3
 end

  i = 1 if line.index('<p class="spirit-discription">') != nil && izlaist == 0
  next unless i != 0

  if i == 2
    print line[96..line.size-2].sub('&amp;', '&').sub('&amp;', '&')
    print "^"
  end
  if i == 3
    print line[84..line.size-3]
    print "^"
  end
  if i == 4
    print line[56..line.size-3]
    print "^"
  end
  if i == 12
    line = line.sub('&nbsp;', '').sub('&nbsp;', '').sub(',', '.')
    puts line[line.index(">")+1..line.index("€")-1]
  end
  i += 1
  if i == 15
    i = 0
    s = 0
  end
end

# puts s
