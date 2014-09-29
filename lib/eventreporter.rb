#!/usr/bin/env ruby

Dir["./lib/*.rb"].each { |file| require file }

CLI.new.start
