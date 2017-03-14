require 'squib'

data = Squib.xlsx file: 'Ships.xlsx'

Squib::Deck.new cards: data['Name'].size, layout: ['economy.yml', 'layout.yml'] do
  /data = csv file: 'Ships.csv'/
  background color: 'white'
  rect layout: 'cut'
  rect layout: 'safe'
  text str: data['Name'], layout: 'title'
  text str: data['Text'], layout: 'description'
  text str: Time.now, layout: 'credits'
  svg layout: data['dice']
  
  save_png
  save_pdf trim: 37.5
end

