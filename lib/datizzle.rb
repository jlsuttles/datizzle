require 'date'
require 'lib/datizzle/instance_methods'

module Datizzle
end

DateTime.send(:include, Datizzle::InstanceMethods)
Date.send(:include, Datizzle::InstanceMethods)
Time.send(:include, Datizzle::InstanceMethods)
