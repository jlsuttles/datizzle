require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Datizzle" do
  let(:dt) { DateTime.now }

###
### DATES
###

  it "should show the preferred representation for the date alone, no time" do
    dt.format("%date%").should == dt.strftime("%x")
  end

  it "should show the full weekday name ( 'Sunday' )" do
    dt.format("%weekday%").should == dt.strftime("%A")
  end

  it "should show the abbreviated weekday name ( 'Sun' )" do
    dt.format("%weekday.abbr%").should == dt.strftime("%a")
  end
  
  it "should show the numbered weekday where Sunday is the first weekday ( 0..6 )" do
    dt.format("%weekday.number%").should == dt.strftime("%w")
  end

  it "should show the full month name ( 'January' )" do
    dt.format("%month%").should == dt.strftime("%B")
  end

  it "should show the abbreviated month name ( 'Jan' )" do
    dt.format("%month.abbr%").should == dt.strftime("%b")
  end
  
  it "should show the numbered month ( 01..12 )" do
    dt.format("%month.number%").should == dt.strftime("%m")
  end

  it "should show the month day with leading zero ( 01..31 )" do
    dt.format("%month.day%").should == dt.strftime("%d")
  end

  it "should show the month day without leading zero ( 1..31 )" do
    dt.format("%month.day.abbr%").should == dt.strftime("%e")
  end

  it "should show the year with century" do
    dt.format("%year%").should == dt.strftime("%Y")
  end

  it "should show the year without century ( 00..99 )" do
    dt.format("%year.abbr%").should == dt.strftime("%y")
  end

  it "should show the day number of the year ( 001..366 )" do
    dt.format("%year.day%").should == dt.strftime("%j")
  end

  it "should show the week number of the year with the first Sunday as the first day of the week ( 00..53 )" do
    dt.format("%year.week%").should == dt.strftime("%U")
  end

  it "should show the week number of the year with the first Sunday as the first day of the week ( 00..53 )" do
    dt.format("%year.week.sunday%").should == dt.strftime("%U")
  end

  it "should show the week number of the year with the first Monday as the first day of the week ( 00..53 )" do
    dt.format("%year.week.monday%").should == dt.strftime("%W")
  end

###
### TIMES
###

  it "should show the preferred representation for the time alone, no date" do
    dt.format("%time%").should == dt.strftime("%X")
  end

  it "should show the hour of the day on a 12 hour clock ( 01..12 )" do
    dt.format("%hour%").should == dt.strftime("%I")
  end
 
  it "should show the hour of the day on a 12 hour clock ( 01..12 )" do
    dt.format("%hour.12%").should == dt.strftime("%I")
  end

  it "should show the hour of the day on a 21 hour clock ( 00..23 )" do
    dt.format("%hour.24%").should == dt.strftime("%H")
  end
  
  it "should show the minute of the hour ( 00..59 )" do
    dt.format("%minute%").should == dt.strftime("%M")
  end

  it "should show the second of the minute ( 00..60 )" do
    dt.format("%second%").should == dt.strftime("%S")
  end

  it "should show the uppercase meridian indicator ( 'AM' or 'PM' )" do
    dt.format("%AMPM%").should == dt.strftime("%P")
  end

  it "should show the lowercase meridian indicator ( 'am' or 'pm' )" do
    dt.format("%ampm%").should == dt.strftime("%p")
  end

  it "should show the the time zone name" do
    dt.format("%timezone%").should == dt.strftime("%Z")
  end

###
### MISC
###
  
  it "should show the preferred local date and time representation" do
    dt.format("%datetime%").should == dt.strftime("%c")
  end

  it "should show the literal '%' character" do
    dt.format("%percent%").should == dt.strftime("%%")
  end

###
### COMMON FORMATS
###
  
  it "should look like 'Friday, January 1, 2010 12:00 am'" do
    dt.format("%weekday%, %month% %month.day.abbr%, %year% %hour%:%minute% %ampm%").should == dt.strftime("%A, %B %e, %Y %I:%M %p")
  end

  it "should look like 'Friday, January 1, 2010'" do
    dt.format("%weekday%, %month% %month.day.abbr%, %year%").should == dt.strftime("%A, %B %e, %Y")
  end

  it "should look like 'Fri, Jan 1, 2010'" do
    dt.format("%weekday.abbr%, %month.abbr% %month.day.abbr%, %year%").should == dt.strftime("%a, %b %e, %Y")
  end

  it "should look like '01/01/2010'" do
    dt.format("%month.number%/%month.day%/%year%").should == dt.strftime("%m/%d/%Y")
  end

  it "should look like '2010 Jan 1'" do 
    dt.format("%year% %month.abbr% %month.day%").should == dt.strftime("%Y %b %e")
  end
  
  it "should look like '2010-01-01'" do
    dt.format("%year%-%month.number%-%month.day%").should == dt.strftime("%Y-%m-%d")
  end

  it "should look like '00:00:00 AM'" do
    dt.format("%hour.24%:%minute%:%second% %AMPM%").should == dt.strftime("%H:%M:%S %P")
  end

  it "should look like '12:00 am'" do
    dt.format("%hour.12%:%minute% %ampm%").should == dt.strftime("%I:%M %p")
  end

end
