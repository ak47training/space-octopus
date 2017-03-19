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
    when 0..7 then 32
    when 8..9 then 24
    when 10..50 then 18
    end
  end
  text str: data['Name'], layout: :Title, font_size: titlesizes
  text str: data['Text'], layout: 'Ability'

  
  text str: data['Bonus'], layout: 'BonusAbility'
  text str: data['Picket bonus'], layout: 'BonusPicket'
  text str: data['Vanguard bonus'], layout: 'BonusVanguard'
  text str: data['Main Fleet bonus'], layout: 'BonusMain'
  text str: data['Rearguard bonus'], layout: 'BonusRear'
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

