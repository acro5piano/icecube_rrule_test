require 'bundler/setup'
Bundler.require

ical = 'FREQ=DAILY;COUNT=10;WKST=MO'
schedule = IceCube::Schedule.from_ical(ical)

p schedule.all_occurrences
