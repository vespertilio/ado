Допустим /^(.*) пришла домой$/ do |who_there|
  if who_there == "Настя"
    true.should true
  end
end

Допустим /^Есть (\d+) писем$/ do |arg1|
  11.times do
    Message.create(:desc => rand(11))
  end
  Message.count.should == 11
end

И /^писем на странице (\d+)$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

И /^пагинатор$/ do
  pending # express the regexp above with the code you wish you had
end
