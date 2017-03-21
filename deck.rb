require 'squib'

data = Squib.xlsx file: 'Tactics.xlsx'
cost_icon_width = 50
cost_icon_height = 50

Squib::Deck.new cards: data['Name'].size, layout: ['layout.yml'] do
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
  abilsizes = data['Text'].map do |name1|
    unless name1 == nil then
	  case name1.length
	  when 0..50 then 20
	  when 51..100 then 18
	  when 101..200 then 16
	  end
	end
  end
  bonussizes = data['Bonus'].map do |name2|
    unless name2 == nil then
	  case name2.length
	  when 0..50 then 20
	  when 51..100 then 18
	  when 101..200 then 16
	  end
	end
  end
  text str: data['Name'], layout: :Title, font_size: titlesizes
  text str: data['Text'], ellipsize: false, layout: 'Ability', font_size: abilsizes

  
  text str: data['Bonus'],  ellipsize: false, layout: 'BonusAbility', font_size: bonussizes
  text str: data['Picket bonus'], ellipsize: false, layout: 'BonusPicket'
  text str: data['Vanguard bonus'], ellipsize: false, layout: 'BonusVanguard'
  text str: data['Main Fleet bonus'], ellipsize: false, layout: 'BonusMain'
  text str: data['Rearguard bonus'], ellipsize: false, layout: 'BonusRear'
  text str: Time.now, layout: 'credits'
  
  #Cost icons in top right:
  text(str: data['Cost'], layout: 'upper_right') do |embed|
    embed.svg key: '(ATK)', width: cost_icon_width, height: cost_icon_height, file: 'icons\attack.svg'
	embed.svg key: '(DEF)', width: cost_icon_width, height: cost_icon_height, file: 'icons\defend.svg'
	embed.svg key: '(SPD)', width: cost_icon_width, height: cost_icon_height, file: 'icons\speed.svg'
	embed.svg key: '(INT)', width: cost_icon_width, height: cost_icon_height, file: 'icons\intel.svg'
	embed.svg key: '(LDR)', width: cost_icon_width, height: cost_icon_height, file: 'icons\leadership.svg'
	embed.svg key: '(UTL)', width: cost_icon_width, height: cost_icon_height, file: 'icons\utility.svg'
  end
	



    
  save_png
  save_pdf trim: 37.5
end

