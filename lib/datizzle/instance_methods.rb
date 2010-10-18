module Datizzle
  module InstanceMethods
    
    TOKENS =  { 'datetime'        => '%c',
                'date'            => '%x',
                'time'            => '%X',
                'weekday'         => '%A',
                'weekday.abbr'    => '%a',
                'weekday.number'  => '%w',
                'month'           => '%B',
                'month.abbr'      => '%b',
                'month.number'    => '%m',
                'month.day'       => '%d',
                'month.day.abbr'  => '%e',
                'year'            => '%Y',
                'year.abbr'       => '%y',
                'year.day'        => '%j',
                'year.week'       => '%U',
                'year.week.sunday'=> '%U',
                'year.week.monday'=> '%W',
                'hour'            => '%I',
                'hour.12'         => '%I',
                'hour.24'         => '%H',
                'minute'          => '%M',
                'second'          => '%S',
                'AMPM'            => '%P',
                'ampm'            => '%p',
                'timezone'        => '%Z',
                'percent'         => '%%'
              }

    def format string
      strftime( replace_tokens string )
    end

    def replace_tokens string
      string.gsub(/%([^%]*)%/) { |match| TOKENS[$1] }
    end

  end
end
