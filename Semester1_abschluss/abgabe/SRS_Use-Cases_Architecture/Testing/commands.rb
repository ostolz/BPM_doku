#
#	additions_manual_steps.rb
#

Then /^I compare the current screen with the reference image "([^\"]*)" manually$/ do |name|
    # TODO: once test artifacts directory is configurable, the image location
    # will need to be either a fully qualified path somewhere (webserver?) or
    # be relative to the output HTML file
    raise Exception, "Reference image not found: #{name}" if !File.exists?(name)
    embed(name, 'image/png', name)
end

Then /^I manually (.*)$/ do |action|
    # Do nothing
end


#
#	check_box_steps.rb
#

Then /^I toggle checkbox number (\d+)$/ do |checkboxNumber|
  performAction('toggle_numbered_checkbox', checkboxNumber) 
end


#
#	enter_text_steps.rb
#

Then /^I enter "([^\"]*)" as "([^\"]*)"$/ do |text, target|
  performAction('enter_text_into_named_field', text, target)
end

Then /^I enter "([^\"]*)" into input field number (\d+)$/ do |text, number|
  performAction('enter_text_into_numbered_field',text, number)
end

Then /^I enter "([^\"]*)" into "([^\"]*)"$/ do |text, name|
  performAction('enter_text_into_named_field',text, name)
end

Then /^I clear "([^\"]*)"$/ do |name|
  performAction('clear_named_field',name)
end

Then /^I clear input field number (\d+)$/ do |number|
  performAction('clear_numbered_field',number)
end

Then /^I clear input field with id "([^\"]*)"$/ do |view_id|
  performAction('clear_id_field', view_id)
end

Then /^I enter text "([^\"]*)" into field with id "([^\"]*)"$/ do |text, view_id|
  performAction('enter_text_into_id_field', text, view_id)
end


#
#	location_steps.rb
#

Then /^I am in "([^\"]*)"$/ do |location|
  set_gps_coordinates_from_location(location)
end

Then /^I am at "([^\"]*)"$/ do |location|
  set_gps_coordinates_from_location(location)
end

Then /^I go to "([^\"]*)"$/ do |location|
  set_gps_coordinates_from_location(location)
end

Then /^I am at ([-+]?[0-9]*\.?[0-9]+), ([-+]?[0-9]*\.?[0-9]+)$/ do |latitude, longitude|
  set_gps_coordinates(latitude, longitude)
end

Then /^I go to ([-+]?[0-9]*\.?[0-9]+), ([-+]?[0-9]*\.?[0-9]+)$/ do |latitude, longitude|
  set_gps_coordinates(latitude, longitude)
end


#
#	press_button_steps.rb
#

Given /^I press the "([^\"]*)" button$/ do |buttonText|
  performAction('press_button_with_text', buttonText)
end

Then /^I press button number (\d+)$/ do |buttonNumber|
  performAction('press_button_number', buttonNumber) 
end

Then /^I press image button number (\d+)$/ do |buttonNumber|
  performAction('press_image_button_number', buttonNumber) 
end

Then /^I press view with id "([^\"]*)"$/ do |view_id|
  performAction('click_on_view_by_id',view_id)
end

Then /^I press "([^\"]*)"$/ do |identifier|
  performAction('press',identifier)
end

Then /^I click on screen (\d+)% from the left and (\d+)% from the top$/ do |x, y|
  performAction('click_on_screen',x, y)
end

Then /^I touch the "([^\"]*)" text$/ do |text|
  performAction('click_on_text',text)
end

Then /^I press list item number (\d+)$/ do |line_index|
  performAction('press_list_item', line_index, 0)
end

Then /^I long press list item number (\d+)$/ do |line_index|
  performAction('long_press_list_item', line_index, 0)
end


#
#	screenshot_steps.rb
#

Then /^take picture$/ do
  screenshot_embed
end

Then /^I take a picture$/ do
  screenshot_embed
end

Then /^I take a screenshot$/ do
  screenshot_embed
end


#
#	time_picker_steps.rb
#

Given /^I set the time to "(\d\d:\d\d)" on TimePicker with index "([^\"]*)"$/ do |time, index|
  performAction('set_time_with_index', time, index)
end

Given /^I set the "([^\"]*)" time to "(\d\d:\d\d)"$/ do |content_description, time|
  performAction('set_time_with_description', content_description, time)
end


#
#	app_steps.rb
#

# -*- coding: utf-8 -*-
Given /^My app is running$/ do
#  rotate_phone(0)
end

Given /^my app is running$/ do
#  rotate_phone(0)
end


#
#	context_menu_steps.rb
#


Then /^I long press "([^\"]*)" and select item number "([^\"]*)"$/ do |text_to_press, index|
  performAction('press_long_on_text_and_select_with_index', text_to_press, index)
end

Then /^I long press "([^\"]*)" and select "([^\"]*)"$/ do |text_to_press, context_text|
  performAction('press_long_on_text_and_select_with_text', text_to_press, context_text)
end

Then /^I long press "([^\"]*)"$/ do |text_to_press|
  performAction('press_long_on_text', text_to_press)
end


#
#	l10b_steps.rb
#

Then /^I press text of translated l10key (\d+)$/ do |l10key|
  performAction('press_l10n_element', l10key) 
end

Then /^I press button of translated l10key (\d+)$/ do |l10key|
  performAction('press_l10n_element', l10key,'button') 
end

Then /^I press menu item of translated l10key (\d+)$/ do |l10key|
  performAction('press_l10n_element', l10key,'menu_item') 
end

Then /^I press toggle button of translated l10key (\d+)$/ do |l10key|
  performAction('press_l10n_element', l10key,'toggle_button') 
end

Then /^I wait for the translated "([^\"]*)" l10nkey to appear$/ do |l10nkey|
  performAction('wait_for_l10n_element', l10nkey)
end


#
#	map_steps.rb
#

When /^I centre the map at (-?\d+\.\d+), (-?\d+\.\d+)$/ do | lat, lon |
  performAction('set_map_center', lat, lon)
end

When /^I pan the map to (-?\d+\.\d+), (-?\d+\.\d+)$/ do | lat, lon |
  performAction('pan_map_to', lat, lon)
  performAction('wait', 1)
end

When /^(?:I )?set the map zoom level to (\d+)$/ do | zoom |
  performAction('set_map_zoom', zoom)
  sleep(0.2)
end

When /^(?:I )?zoom (in|out) on the map$/ do | zoom |
  performAction('set_map_zoom', zoom)
  sleep(0.2)
end

Then /^the map zoom level should be (\d+)$/ do | zoom |
  result = performAction('get_map_zoom')
  raise StandardError.new( "The map's zoom level should be #{zoom} but is #{result['message']}"  ) unless zoom.eql?( result['message'] )
end

When /^I tap the map marker "([^\"]*)"$/ do | marker_title |
  performAction('tap_map_marker_by_title', marker_title, 60000)
end

When /^I double tap the map marker "([^\"]*)"$/ do | marker_title |
  performAction('tap_map_marker_by_title', marker_title, 60000)
  sleep(0.4)
  performAction('tap_map_marker_by_title', marker_title, 100)
end

When /^I tap away from the markers$/ do
  performAction('tap_map_away_from_markers')
end

Then /^I should see the following markers:$/ do | marker_table |
  verify_map_markers( marker_table )
end

Then /^the map should be centred at (-?\d+\.\d+), (-?\d+\.\d+)$/ do | lat, lon |
  result = performAction('get_map_center')
  bonus_info = result['bonusInformation']
  actual_lat = bonus_info[0].to_f
  actual_lon = bonus_info[1].to_f
  lat = lat.to_f
  lon = lon.to_f
  tol = 0.00001
  if( (lat - actual_lat).abs > tol || (lon - actual_lon).abs > tol ) 
    raise StandardError.new( "The map should have been centred on: #{lat},#{lon} but was actually centred on #{bonus_info.inspect}" )
  end
end

Then /^the map marker "([^\"]*)" should be highlighted$/ do | marker_title |
  result = performAction('get_map_marker', marker_title)
  result = result['message']
  result = JSON.parse( result )
  raise StandardError.new( "The marker '#{marker_title}' was found, but is not highlighted" ) unless result['focused']
end


#
#	progress_steps.rb
#

Then /^I wait for progress$/ do
  performAction('wait_for_no_progress_bars') 
end

Then /^I wait$/ do
  performAction('wait', 2)
end

Then /^I wait for dialog to close$/ do
  performAction('wait_for_dialog_to_close')
end


Then /^I wait for (\d+) seconds$/ do |seconds|
  performAction('wait', seconds)
end

Then /^I wait for 1 second$/ do
  performAction('wait', 1)
end

Then /^I wait for a second$/ do
  performAction('wait', 1)
end


Then /^I wait for "([^\"]*)" to appear$/ do |text|
  performAction('wait_for_text', text)
end

Then /^I wait up to (\d+) seconds for "([^\"]*)" to appear$/ do |timeout, text|
  performAction('wait_for_text', text, timeout)
end

Then /^I wait to see "([^\"]*)"$/ do |text|
  performAction('wait_for_text', text)
end

Then /^I wait up to (\d+) seconds to see "([^\"]*)"$/ do |timeout, text|
  performAction('wait_for_text', text, timeout)
end

Then /^I wait for the "([^\"]*)" button to appear$/ do |text|
  performAction('wait_for_button', text)
end

Then /^I wait for the view with id "([^\"]*)" to appear$/ do |text|
  performAction('wait_for_view_by_id', text)
end

Then /^I wait for the "([^\"]*)" view to appear$/ do |text|
  performAction('wait_for_view', text)
end


Then /^I wait for the "([^\"]*)" screen to appear$/ do |text|
    performAction('wait_for_screen', text)
end

Then /^I wait upto (\d+) seconds for the "([^\"]*)" screen to appear$/ do |timeout, text|
    performAction('wait_for_screen', text, timeout)
end

Then /^I wait up to (\d+) seconds for the "([^\"]*)" screen to appear$/ do |timeout, text|
    performAction('wait_for_screen', text, timeout)
end

# @param - the "tag" associated with the tab, or the text within the tab label
Then /^I wait for the "([^\"]*)" tab to appear$/ do | tab |
  performAction('wait_for_tab', tab)
end


#
#	search_steps.rb
#

Then /^I enter "([^\"]*)" into search field$/ do |text|
  performAction('enter_query_into_numbered_field', text, 1)
end

Then /^I enter "([^\"]*)" into search field number (\d+)$/ do |text, number|
  performAction('enter_query_into_numbered_field', text, number)
end


#
#	assert_steps.rb
#

Then /^I see the text "([^\"]*)"$/ do |text|
  performAction('assert_text',text, true) 
end

Then /^I see "([^\"]*)"$/ do |text|
  performAction('assert_text', text, true) 
end

Then /^I should see "([^\"]*)"$/ do |text|
  performAction('assert_text', text, true) 
end

Then /^I should see text containing "([^\"]*)"$/ do |text|
  performAction('assert_text', text, true) 
end



Then /^I should not see "([^\"]*)"$/ do |text|
  performAction('assert_text', text, false) #second param indicated that the text should _not_ be found
end


Then /^I don't see the text "([^\"]*)"$/ do |text|  
  performAction('assert_text', text, false) #second param indicated that the text should _not_ be found
end

Then /^I don't see "([^\"]*)"$/ do |text|  
  performAction('assert_text', text, false) #second param indicated that the text should _not_ be found
end

# This step is more of an example or macro to be used within your own custom steps
# Generally, assert_view_property takes 3 args, but for if 'property'='compoundDrawables', the next arg should be 'left'/'right'/'top'/'bottom', followed by the expected drawable ID.
# @param view_id - the name of the view, eg: R.my_view_id
# @param property - eg: 'visibility' (visible/invisible/gone), 'drawable' (expected drawable ID) 
Then /^the view with id "([^\"]*)" should have property "([^\"]*)" = "([^\"]*)"$/ do | view_id, property, value |
  # get_view_property is also available: performAction( 'get_view_property', 'my_view', 'visibility') 
  performAction( 'assert_view_property', view_id, property, value )
end

Then /^the "([^\"]*)" activity should be open$/ do | expected_activity |
  actual_activity = performAction('get_activity_name')['message']
  raise "The current activity is #{actual_activity}" unless( actual_activity == expected_activity || actual_activity == expected_activity + 'Activity' )
end


#
#	date_picker.rb
#


Given /^I set the date to "(\d\d-\d\d-\d\d\d\d)" on DatePicker with index "([^\"]*)"$/ do |date, index|
  performAction('set_date_with_index', date, index)
end

Given /^I set the "([^\"]*)" date to "(\d\d-\d\d-\d\d\d\d)"$/ do |content_description, date|
  performAction('set_date_with_description', content_description, date)
end


#
#	list_steps.rb
#

# By default "get_list_item_text" returns an array of arrays of text for each entry in the first ListView
# The "get_list_item_text" action also supports: 
# (all items of 2nd list) <code>performAction( 'get_list_item_text', '2' )</code>
# (1st item of 2nd list) <code>performAction( 'get_list_item_text', '2' , '1' )</code>
Then /^I should see following list:$/ do | expected_table |
  result = performAction('get_list_item_text')
  response_table = result['bonusInformation']
  response_table.each_with_index do | row_data, index |
    row_data = JSON.parse( row_data )
    response_table[index] = row_data
  end
  
  expected_table.diff!(response_table)
end

# Note: This step is currently intended as more of an example rather than a rock-solid, well-tested step.
#       (The server implementation works well for me, but my test steps that use it are application-specific)
# Similarly to the "get_list_item_text" action, the "get_list_item_properties" action defaults to
# all rows of the first ListView, but can be instructed to target a specific row (or all rows) of a specific ListView.
# Example TextView row: {"id":"title", "text":"My Title", "color":0, "background":0, "compoundDrawables":["left"]}
# Example ViewGroup row: {"children":[{"id":"title", "text":"My Title"}, {"id":"subtitle", "text":"Second line"}]}
# Example TableLayout row: {"cells":[{"column":0, "id":"colA", "text": "This is a Test"}]}
Then /^The "([^\"]*)" for row (\d+) should be "([^\"]*)"$/ do | view_id, row, value |
  response = performAction( 'get_list_item_properties', '1' , row )['bonusInformation']
  response = JSON.parse( response[0] ) 
  
  if( response['children'] )
    found_id = false
    response['children'].each do | view |
	  if( view['id'] == view_id )
	    raise "Text is #{view['text']}, expected #{value}" unless( view['text'] == value )
		found_id = true
	  end
	end
	raise "Could not find view with ID: #{view_id}" unless( found_id )
  else
    raise "ID is #{response['id']}, expected #{view_id}" unless( response['id'] == view_id )
	raise "Text is #{response['text']}, expected #{view_id}" unless( response['text'] == value )
  end
end


#
#	navigation_steps.rb
#

Then /^I go back$/ do
  performAction('go_back')
end

Then /^I press the menu key$/ do
  performAction('press_menu')
end

Then /^I press the enter button$/ do
  performAction('send_key_enter')
end


Then /^I swipe left$/ do
  performAction('swipe', 'left')
end

Then /^I swipe right$/ do
  performAction('swipe', 'right')
end

Then /^I select "([^\"]*)" from the menu$/ do |item|  
  performAction('select_from_menu', item)
end

Then /^I select tab number (\d+)$/ do | tab |
  performAction('select_tab', tab)
end

# @param - the "tag" associated with the tab, or the text within the tab label
Then /^I select the "([^\"]*)" tab$/ do | tab |
  performAction('select_tab', tab)
end

Then /^I scroll down$/ do
  performAction('scroll_down')
end

Then /^I scroll up$/ do
  performAction('scroll_up')
end

Then /^I drag from (\d+):(\d+) to (\d+):(\d+) moving with (\d+) steps$/ do |fromX, fromY, toX, toY, steps|
  performAction('drag',fromX,toX,fromY,toY,steps)
end
   

#
#	rotation_steps.rb
#

Then /^I rotate the device to landscape$/ do
  rotate_phone(90)
end

Then /^I rotate the device to portrait$/ do
  rotate_phone(0)
end


#
#	spinner_steps.rb
#

Then /^I select "([^\"]*)" from "([^\"]*)"$/ do |item_text, spinner_content_description|
  performAction('select_item_from_named_spinner', spinner_content_description, item_text)
end