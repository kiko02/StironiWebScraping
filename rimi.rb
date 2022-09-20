require "watir"


browser = Watir::Browser.new :chrome

pagenum=1
while pagenum<=14
browser.goto 'https://www.rimi.lv/e-veikals/lv/produkti/alkoholiskie-dzerieni/c/SH-1?page=' + pagenum.to_s + '&pageSize=100&query=%3Arelevance%3AallCategories%3ASH-1%3AassortmentStatus%3AinAssortment'
sleep(2)
#puts browser.html
i=0
htmlText=browser.html
while htmlText.index('class="product-grid__item"',i)!=nil
  i=htmlText.index('class="product-grid__item"',i)
  i+=1
  i=htmlText.index('class="card__name"',i)

  line = htmlText[htmlText.index('>',i)+1..htmlText.index('<',i)-1].gsub(",",".").gsub("%","^")
  if(line.index("^")!=nil)
  i2= line.index("^")

  while(line[i2]!=' ')
    i2-=1
  end

  line[i2]='^'
end
  print line

  i=htmlText.index('class="price-tag card__price"',i)
  next if i==nil
  i=htmlText.index('span>',i)
  next if i==nil
  print "^"
  print htmlText[htmlText.index('>',i)+1..htmlText.index('<',i)-1]
  i=htmlText.index('sup>',i)
  next if i==nil
  print "."
  puts htmlText[htmlText.index('>',i)+1..htmlText.index('<',i)-1]
  STDOUT.flush
  i+=1
end
pagenum+=1
end
