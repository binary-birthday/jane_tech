# frozen_string_literal: true

require './league'

puts 'Please input the filename containing your league results. hint: include the filepath'

rel_filepath = gets.chomp
filename = File.expand_path(rel_filepath)

file = File.open(filename)
data = file.readlines.map(&:chomp)

league = League.new(data)
league.process_league_results
