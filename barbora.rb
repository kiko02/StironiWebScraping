require 'rubygems'
require 'mechanize'

mec = Mechanize.new

namelist = %w[alus-sidri-un-kokteili citi-dzerieni vini stiprie-alkoholiskie-dzerieni]
pagesPer = [6, 1, 19, 11]
int = 0
while int<namelist.size
  pagenum =1
  while pagenum<=pagesPer[int]
    page = mec.get('https://www.barbora.lv/dzerieni/'+namelist[int]+"?page="+pagenum.to_s)
    i=0
    while page.body.index("data-b-for-cart=", i)!=nil
      i=page.body.index("data-b-for-cart=", i)
      i=page.body.index("&quot;title&quot;", i)
      i+=24
      name = page.body[i..page.body.index("&quot;", i)-1]
      i=page.body.index("&quot;", i)-1
      while page.body[i]!='%'
        i-=1
      end
      proc=""
      i-=1
      while page.body[i]=~ /[0-9,]/
        proc=page.body[i]+proc
        i-=1
      end
      i=page.body.index("&quot;category_name_full_path&quot;", i)
      i+=52
      cat1 = page.body[i..page.body.index("/", i)-2]
      cat2 = page.body[page.body.index("/", i)+1..page.body.index("&quot;", i)-1]
      i=page.body.index("&quot;price&quot;:", i)
      i+=18
      price = page.body[i..page.body.index("&quot;", i)-2]
      i=page.body.index("&quot;comparative_unit_price&quot;:", i)
      i+=35
      pricel = page.body[i..page.body.index("&quot;", i)-2]
      amount = price.to_f/pricel.to_f
      amount = amount.round(3)
      print cat2+"^"+name+"^"+proc+"^"+amount.to_s+"^"+price
      puts ""
      STDOUT.flush
      i+=1
    end
    pagenum+=1

  end
  int+=1
end
#puts page.body
