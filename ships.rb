require 'squib'

data = Squib.xlsx file: 'Ships.xlsx'
cost_icon_width = 50
cost_icon_height = 50
text_icon_width = 25
text_icon_height = 25

Squib::Deck.new cards: data['Name'].size, layout: ['ships_layout.yml', 'layout.yml'] do
  background color: 'white'
  hint text: "#333"
  rect layout: 'cut'
  rect layout: 'safe'
  titlesizes = data['Name'].map do |name|
    case name.length
    when 0..10 then 26
    when 11..15 then 24
    when 16..50 then 20
    end
  end
  modsizes = data['Text1'].map do |name1|
    unless name1 == nil then
	  case name1.length
	  when 0..50 then 20
	  when 51..100 then 18
	  when 101..200 then 16
	  end
	end
  end
  ranges = data['Range'].map do |rangefy|
    'Range: ' + rangefy
  end
  
  textsizes = data['Text2'].map do |name2|
    unless name2 == nil then
	  case name2.length
	  when 0..50 then 20
	  when 51..100 then 18
	  when 101..200 then 16
	  end
	end
  end
  text str: data['Name'], layout: :Title, font_size: titlesizes
  
  text str: ranges, ellipsize: false, layout: 'StatRange'
  text str: data['Type keywords'], layout: 'Type'
  
  text str: data['Text2'],  ellipsize: false, layout: 'TextAbility', font_size: textsizes
  text str: Time.now, layout: 'credits'
  text(str: data['Text1'], layout: 'ModAbility', font_size: modsizes, ellipsize: false) do |embed|
    embed.svg key: '(ATK)', width: text_icon_width, height: text_icon_height, file: 'icons\attack.svg'
	embed.svg key: '(DEF)', width: text_icon_width, height: text_icon_height, file: 'icons\defend.svg'
	embed.svg key: '(SPD)', width: text_icon_width, height: text_icon_height, file: 'icons\speed.svg'
	embed.svg key: '(INT)', width: text_icon_width, height: text_icon_height, file: 'icons\intel.svg'
	embed.svg key: '(LDR)', width: text_icon_width, height: text_icon_height, file: 'icons\leadership.svg'
	embed.svg key: '(UTL)', width: text_icon_width, height: text_icon_height, file: 'icons\utility.svg'
    embed.svg key: '(ANY)', width: text_icon_width, height: text_icon_height, file: 'icons\anydie.svg'
  end	
  #Cost icons in top right:
  text(str: data['Cost'], layout: 'upper_right') do |embed|
    embed.svg key: '(ATK)', width: cost_icon_width, height: cost_icon_height, file: 'icons\attack.svg'
	embed.svg key: '(DEF)', width: cost_icon_width, height: cost_icon_height, file: 'icons\defend.svg'
	embed.svg key: '(SPD)', width: cost_icon_width, height: cost_icon_height, file: 'icons\speed.svg'
	embed.svg key: '(INT)', width: cost_icon_width, height: cost_icon_height, file: 'icons\intel.svg'
	embed.svg key: '(LDR)', width: cost_icon_width, height: cost_icon_height, file: 'icons\leadership.svg'
	embed.svg key: '(UTL)', width: cost_icon_width, height: cost_icon_height, file: 'icons\utility.svg'
    embed.svg key: '(ANY)', width: cost_icon_width, height: cost_icon_height, file: 'icons\anydie.svg'
  end
 
  text(str: data['Provides'], layout: 'Provides', angle: Math::PI / 2) do |embed|
    embed.svg key: '(ATK)', width: cost_icon_width, height: cost_icon_height, angle: Math::PI*3/2, file: 'icons\attack.svg'
	embed.svg key: '(DEF)', width: cost_icon_width, height: cost_icon_height, angle: Math::PI*3/2, file: 'icons\defend.svg'
	embed.svg key: '(SPD)', width: cost_icon_width, height: cost_icon_height, angle: Math::PI*3/2, file: 'icons\speed.svg'
	embed.svg key: '(INT)', width: cost_icon_width, height: cost_icon_height, angle: Math::PI*3/2, file: 'icons\intel.svg'
	embed.svg key: '(LDR)', width: cost_icon_width, height: cost_icon_height, angle: Math::PI*3/2, file: 'icons\leadership.svg'
	embed.svg key: '(UTL)', width: cost_icon_width, height: cost_icon_height, angle: Math::PI*3/2, file: 'icons\utility.svg'
    embed.svg key: '(ANY)', width: cost_icon_width, height: cost_icon_height, angle: Math::PI*3/2, file: 'icons\anydie.svg'
  end
  
  text str: data['ATK'], layout: 'lower_left'
  text str: data['SPD'], layout: 'lower_right'
  text str: data['DEF'], layout: 'next_to_lower_right'



    
  save_png prefix: 'ships_'
  save_pdf trim: 37.5, prefix: 'ships_'
end

