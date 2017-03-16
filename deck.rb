require 'squib'

data = Squib.xlsx file: 'Tactics.xlsx'

Squib::Deck.new cards: data['Name'].size, layout: ['layout.yml'] do
  /data = csv file: 'Ships.csv'/
  background color: 'white'
  hint text: "#333"
  rect layout: 'cut'
  rect layout: 'safe'
  titlesizes = data['Name'].map do |name|
    case name.length
    when 0..7 then 64
    when 8..9 then 50
    when 10..50 then 45
    end
  text str: data['Name'], layout: :Title, font_size: titlesizes
  text str: data['Text'], layout: 'Ability'
  /text str: data['Cost'], layout: 'upper_right'/
  
  text str: data['Bonus'], layout: 'BonusAbility'
  text str: data['Picket bonus'], layout: 'BonusPicket'
  text str: data['Vanguard bonus'], layout: 'BonusVanguard'
  text str: data['Main Fleet bonus'], layout: 'BonusMain'
  text str: data['Rearguard bonus'], layout: 'BonusRear'
  text str: Time.now, layout: 'credits'
  
  #Cost icons in top right:
  dice_cost = data['Cost'].map do |c|
    case c 
    when 'A' then 'icons\attack.svg'
    when 'D' then 'icons\attack.svg'
    when 'S' then 'icons\speed.svg'
    when 'U' then 'icons\utility.svg'
    when 'I' then 'icons\intel.svg'
    when 'L' then 'icons\leadership.svg'
    end
  end
  svg file: dice_cost, layout: 'cost1'
end
    
  save_png
  save_pdf trim: 37.5
end

