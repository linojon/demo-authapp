Given /^the following infos:$/ do |infos|
  Info.create!(infos.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) info$/ do |pos|
  visit infos_url
  within("table > tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following infos:$/ do |expected_infos_table|
  expected_infos_table.diff!(table_at('table').to_a)
end
