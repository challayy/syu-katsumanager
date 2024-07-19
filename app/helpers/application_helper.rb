module ApplicationHelper
    def events_for_day(day, events)
        events.select { |event| event.schedule.to_date == day }
    end
end