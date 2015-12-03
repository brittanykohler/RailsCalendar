# source: https://richonrails.com/articles/building-a-basic-calendar-in-ruby-on-rails

module CalendarHelper
  def calendar(date = Date.today, &block)
    Calendar.new(self, date, block).table
  end
end
