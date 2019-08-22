require 'bundler/setup'
require 'date'
Bundler.require

class RecurringDuration
  def initialize(ical)
    @schedule = IceCube::Schedule.new do |s|
      s.add_recurrence_rule IceCube::Rule.from_ical(ical)
    end
  end

  def format
    @schedule.occurrences(Time.now + 60 * 60 * 24 * 7).each_slice(2).map { |start_date, end_date|
      {
        start_date: start_date,
        end_date: end_date,
      }
    }
  end
end

bh = RecurringDuration.new('FREQ=DAILY;INTERVAL=1;WKST=MO;BYHOUR=10,18;BYMINUTE=0;BYSECOND=0')
bh.format.each { |h| p h }
