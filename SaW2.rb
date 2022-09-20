require 'rubygems'
require 'mechanize'

mec = Mechanize.new
pagenum = 1
# 'rums','konjaks','degvins','uzlejums','grappa','viskijs','brendijs','likieris','armanjaks','absints','single-malt','dzins','tekila','kalvadoss','mini','sarkanvins','dzirkstosais-vins','bag-in-box-baltvins','stiprinats-vins','baltvins',
#namelist = %w[rums konjaks degvins uzlejums grappa viskijs brendijs likieris armanjaks absints
#              single-malt dzins tekila kalvadoss mini sarkanvins dzirkstosais-vins bag-in-box-baltvins stiprinats-vins baltvins sampanietis bag-in-box-sartvins sartvins
# bag-in-box-sarkanvins vermuts karstvini-karstie-dzerieni alus kokteili sidrs]
namelist = %w[rums konjaks degvins uzlejums grappa viskijs brendijs likieris armanjaks absints
              single-malt dzins tekila kalvadoss mini sarkanvins dzirkstosais-vins bag-in-box-baltvins stiprinats-vins baltvins sampanietis bag-in-box-sartvins sartvins
 bag-in-box-sarkanvins vermuts karstvini-karstie-dzerieni alus kokteili sidrs]
namelist.each do |name|
  (1..43).each do |pagenum|
    page = mec.get('https://www.spiritsandwine.lv/lv/' + name + '/?page=' + pagenum.to_s + '&order=price-asc')
    # puts page.body
    i = 0
    while page.body.index('<div class="product-container d-flex flex-column', i) != nil
      i = page.body.index('<div class="product-container d-flex flex-column', i)
      i += 1
      i = page.body.index('<h2 class="product-title">', i)
      i = page.body.index('>', i)
      i2 = page.body.index('<', i)
      print page.body[i + 1..i2 - 1]
      print '^'
      i = page.body.index('<div class="product-details">', i)
      i = page.body.index('>', i)
      i2 = page.body.index('<', i)
      text = page.body[i..i2 - 38].delete(" <>\r\n").split(',')
      (0..2).each do |i2|
        if i2 == 1
          print text[i2].delete '% '
        elsif i2 == 2
          print text[i2].delete 'L '
        else
          print text[i2]
        end
        print '^'
      end
      i = page.body.index('<div', i)
      i = page.body.index('>', i)
      i2 = page.body.index('<', i)
      puts page.body[i..i2].delete ' <>'
      STDOUT.flush
    end
  end
end
# from=page.uri.to_s[page.uri.to_s.index("/wiki/")+6..page.uri.to_s.size-1]
# puts browser.title
# page = mec.get('https://en.wikipedia.org/wiki/Special:Random')
# to=page.uri.to_s[page.uri.to_s.index("/wiki/")+6..page.uri.to_s.size-1]
# puts browser.title
# from = 'Anglicanism'
# to = 'James_Srawley'
# print "from "
# puts from
# print "to "
# puts to
# STDOUT.flush
#
# while stop2==0
#   tag = mas[numtag]
#   if(tag!=nil)
#     i=0
#     i2=0
#     stop=0
#     url = 'https://en.wikipedia.org/w/index.php?title=Special:WhatLinksHere/'+tag+'&namespace=0&limit=5000&hideredirs=1&hidetrans=1'
#     begin
#       page =  mec.get(url)
#       rescue Mechanize::ResponseCodeError => e
#         puts e.response_code
#         stop=1
#       end
# page = mec.get()
#
#
# while page.body.index
STDOUT.flush
sleep(1)
