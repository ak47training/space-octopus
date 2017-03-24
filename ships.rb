require 'squib'

ships_data = Squib.xlsx file: 'Ships.xlsx'
tactics_data = Squib.xlsx file: 'Tactics.xlsx'
cost_icon_width = 50
cost_icon_height = 50
text_icon_width = 25
text_icon_height = 25
attack_color = 'burnt_orange'
defend_color = 'cerulean_blue'
speed_color = '#DDBB66'
intel_color = '#C0C0C0'
leadership_color = '#441111'
utility_color = '#336622'
anydie_color = 'blue'
ewar_color = 'purple'
icon_in_text_dy = 4


Squib::Deck.new cards: ships_data['Name'].size, layout: ['ships_layout.yml'] do
  background color: 'white'
  /hint text: "#333"/
  line stroke_width: 1.5, layout: 'TypeLine'
  line stroke_width: 1.5, layout: 'TitleLine'
  line stroke_width: 1.5, layout: 'ArtLine'
  line stroke_width: 1.5, layout: 'ModLine'
  rect layout: 'cut'
  rect layout: 'safe'
  titlesizes = ships_data['Name'].map do |name|
    case name.length
    when 0..10 then 26
    when 11..15 then 24
    when 16..50 then 20
    end
  end
  modsizes = ships_data['Text1'].map do |name1|
    unless name1 == nil then
	  case name1.length
	  when 0..50 then 20
	  when 51..100 then 18
	  when 101..200 then 16
	  end
	end
  end
  ranges = ships_data['Range'].map do |rangefy|
    'Range: ' + rangefy
  end
  
  textsizes = ships_data['Text2'].map do |name2|
    unless name2 == nil then
	  case name2.length
	  when 0..50 then 20
	  when 51..100 then 18
	  when 101..200 then 16
	  end
	end
  end
  text str: ships_data['Name'], layout: :Title, font_size: titlesizes
  
  text str: ranges, ellipsize: false, layout: 'StatRange'
  text str: ships_data['Type keywords'], layout: 'Type'
  
  text(str: ships_data['Text2'],  markup: true, ellipsize: false, layout: 'TextAbility', font_size: textsizes) do |embed|
    embed.svg key: '(ATK)', dy: icon_in_text_dy, width: text_icon_width, height: text_icon_height, mask: attack_color, file: 'icons\attack.svg'
	embed.svg key: '(DEF)', dy: icon_in_text_dy, width: text_icon_width, height: text_icon_height, mask: defend_color, file: 'icons\defend.svg'
	embed.svg key: '(SPD)', dy: icon_in_text_dy, width: text_icon_width, height: text_icon_height, mask: speed_color, file: 'icons\speed.svg'
	embed.svg key: '(INT)', dy: icon_in_text_dy, width: text_icon_width, height: text_icon_height, mask: intel_color, file: 'icons\intel.svg'
	embed.svg key: '(LDR)', dy: icon_in_text_dy, width: text_icon_width, height: text_icon_height, mask: leadership_color, file: 'icons\leadership.svg'
	embed.svg key: '(UTL)', dy: icon_in_text_dy, width: text_icon_width, height: text_icon_height, mask: utility_color, file: 'icons\utility.svg'
	embed.svg key: '(EWR)', dy: icon_in_text_dy, width: text_icon_width, height: text_icon_height, mask: ewar_color, file: 'icons\ewar.svg'
    embed.svg key: '(ANY)', dy: icon_in_text_dy, width: text_icon_width, height: text_icon_height, file: 'icons\anydie.svg'
  end
  text str: Time.now, layout: 'credits'
  text(str: ships_data['Text1'], layout: 'ModAbility', font_size: modsizes, ellipsize: false) do |embed|
    embed.svg key: '(ATK)', dy: icon_in_text_dy, width: text_icon_width, height: text_icon_height, mask: attack_color, file: 'icons\attack.svg'
	embed.svg key: '(DEF)', dy: icon_in_text_dy, width: text_icon_width, height: text_icon_height, mask: defend_color, file: 'icons\defend.svg'
	embed.svg key: '(SPD)', dy: icon_in_text_dy, width: text_icon_width, height: text_icon_height, mask: speed_color, file: 'icons\speed.svg'
	embed.svg key: '(INT)', dy: icon_in_text_dy, width: text_icon_width, height: text_icon_height, mask: intel_color, file: 'icons\intel.svg'
	embed.svg key: '(LDR)', dy: icon_in_text_dy, width: text_icon_width, height: text_icon_height, mask: leadership_color, file: 'icons\leadership.svg'
	embed.svg key: '(UTL)', dy: icon_in_text_dy, width: text_icon_width, height: text_icon_height, mask: utility_color, file: 'icons\utility.svg'
    embed.svg key: '(EWR)', dy: icon_in_text_dy, width: text_icon_width, height: text_icon_height, mask: ewar_color, file: 'icons\ewar.svg'
	embed.svg key: '(ANY)', dy: icon_in_text_dy, width: text_icon_width, height: text_icon_height, file: 'icons\anydie.svg'
  end	
  #Cost icons in top right:
  text(str: ships_data['Cost'], layout: 'upper_right') do |embed|
    embed.svg key: '(ATK)', width: cost_icon_width, height: cost_icon_height, mask: attack_color, file: 'icons\attack.svg'
	embed.svg key: '(DEF)', width: cost_icon_width, height: cost_icon_height, mask: defend_color, file: 'icons\defend.svg'
	embed.svg key: '(SPD)', width: cost_icon_width, height: cost_icon_height, mask: speed_color, file: 'icons\speed.svg'
	embed.svg key: '(INT)', width: cost_icon_width, height: cost_icon_height, mask: intel_color, file: 'icons\intel.svg'
	embed.svg key: '(LDR)', width: cost_icon_width, height: cost_icon_height, mask: leadership_color, file: 'icons\leadership.svg'
	embed.svg key: '(UTL)', width: cost_icon_width, height: cost_icon_height, mask: utility_color, file: 'icons\utility.svg'
    embed.svg key: '(EWR)', width: cost_icon_width, height: cost_icon_height, mask: ewar_color, file: 'icons\ewar.svg'
	embed.svg key: '(ANY)', width: cost_icon_width, height: cost_icon_height, file: 'icons\anydie.svg'
  end
 
  text(str: ships_data['Provides'], layout: 'Provides', angle: Math::PI / 2) do |embed|
    embed.svg key: '(ATK)', width: cost_icon_width, height: cost_icon_height, angle: Math::PI*3/2, mask: attack_color, file: 'icons\attack.svg'
	embed.svg key: '(DEF)', width: cost_icon_width, height: cost_icon_height, angle: Math::PI*3/2, mask: defend_color, file: 'icons\defend.svg'
	embed.svg key: '(SPD)', width: cost_icon_width, height: cost_icon_height, angle: Math::PI*3/2, mask: speed_color, file: 'icons\speed.svg'
	embed.svg key: '(INT)', width: cost_icon_width, height: cost_icon_height, angle: Math::PI*3/2, mask: intel_color, file: 'icons\intel.svg'
	embed.svg key: '(LDR)', width: cost_icon_width, height: cost_icon_height, angle: Math::PI*3/2, mask: leadership_color, file: 'icons\leadership.svg'
	embed.svg key: '(UTL)', width: cost_icon_width, height: cost_icon_height, angle: Math::PI*3/2, mask: utility_color, file: 'icons\utility.svg'
    embed.svg key: '(EWR)', width: cost_icon_width, height: cost_icon_height, angle: Math::PI*3/2, mask: ewar_color, file: 'icons\ewar.svg'
	embed.svg key: '(ANY)', width: cost_icon_width, height: cost_icon_height, angle: Math::PI*3/2, file: 'icons\anydie.svg'
  end

  
  svg file: 'icons\attack.svg', layout: 'lower_left', mask: attack_color
  svg file: 'icons\defend.svg', layout: 'lower_right', mask: defend_color
  svg file: 'icons\speed.svg', layout: 'next_to_lower_right', mask: speed_color
  text str: ships_data['ATK'], layout: 'lower_left', color: 'white', stroke_width: 2, stroke_color: 'black', font: 'Verdana'
  text str: ships_data['DEF'], layout: 'lower_right', color: 'white', stroke_width: 2, stroke_color: 'black', font: 'Verdana'
  text str: ships_data['SPD'], layout: 'next_to_lower_right', color: 'white', stroke_width: 2, stroke_color: 'black', font: 'Verdana'
  


    
  save_png prefix: 'ships_'
  save_pdf trim: 37.5, prefix: 'ships_'
end



Squib::Deck.new cards: tactics_data['Name'].size, layout: ['layout.yml', 'ships_layout.yml'] do
  background color: 'white'
  /hint text: "#333"/
  rect layout: 'cut'
  rect layout: 'safe'
  line stroke_width: 1.5, layout: 'BonusLine'
  line stroke_width: 1.5, layout: 'BonusPicketLine'
  line stroke_width: 1.5, layout: 'BonusVanguardLine'
  line stroke_width: 1.5, layout: 'BonusMainLine'
  line stroke_width: 1.5, layout: 'TitleLine'
  line stroke_width: 1.5, layout: 'ArtLine'
  titlesizes = tactics_data['Name'].map do |name|
    case name.length
    when 0..10 then 26
    when 11..15 then 24
    when 16..50 then 20
    end
  end
  abilsizes = tactics_data['Text'].map do |name1|
    unless name1 == nil then
	  case name1.length
	  when 0..50 then 20
	  when 51..100 then 18
	  when 101..200 then 16
	  end
	end
  end
  bonussizes = tactics_data['Bonus'].map do |name2|
    unless name2 == nil then
	  case name2.length
	  when 0..50 then 20
	  when 51..100 then 18
	  when 101..200 then 16
	  end
	end
  end
  text str: tactics_data['Name'], layout: :Title, font_size: titlesizes
  text str: tactics_data['Text'], ellipsize: false, layout: 'Ability', font_size: abilsizes

  
  text str: tactics_data['Bonus'],  ellipsize: false, layout: 'BonusAbility', font_size: bonussizes
  text str: tactics_data['Picket bonus'], ellipsize: false, layout: 'BonusPicket'
  text str: tactics_data['Vanguard bonus'], ellipsize: false, layout: 'BonusVanguard'
  text str: tactics_data['Main Fleet bonus'], ellipsize: false, layout: 'BonusMain'
  text str: tactics_data['Rearguard bonus'], ellipsize: false, layout: 'BonusRear'
  text str: Time.now, layout: 'credits'
  
  #Cost icons in top right:
  text(str: tactics_data['Cost'], layout: 'upper_right') do |embed|
    embed.svg key: '(ATK)', width: cost_icon_width, height: cost_icon_height, mask: attack_color, file: 'icons\attack.svg'
	embed.svg key: '(DEF)', width: cost_icon_width, height: cost_icon_height, mask: defend_color, file: 'icons\defend.svg'
	embed.svg key: '(SPD)', width: cost_icon_width, height: cost_icon_height, mask: speed_color, file: 'icons\speed.svg'
	embed.svg key: '(INT)', width: cost_icon_width, height: cost_icon_height, mask: intel_color, file: 'icons\intel.svg'
	embed.svg key: '(LDR)', width: cost_icon_width, height: cost_icon_height, mask: leadership_color, file: 'icons\leadership.svg'
	embed.svg key: '(UTL)', width: cost_icon_width, height: cost_icon_height, mask: utility_color, file: 'icons\utility.svg'
	embed.svg key: '(EWR)', width: cost_icon_width, height: cost_icon_height, mask: ewar_color, file: 'icons\ewar.svg'
  end
	



    
  save_png
  save_pdf trim: 37.5
end