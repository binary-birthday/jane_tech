# frozen_string_literal: true

# Soccer league. Init with text file of league results. Instance method process_league_results parses the text files and prints to std out the top three teams in the league standings after each matchday
class League
  def initialize(league_results)
    @track_matchday = {}
    @team_records = {}
    @matchday_count = 0
    @match = []
    @weekly_top_three_standings = []
    @league_results = league_results
  end

  def process_league_results
    @league_results.each do |entry|
      process_match_result(entry)
    end
    print_standings
  end

  private

  def parse_match_result(entry)
    teams_and_scores = entry.sub(', ', '').split(/([0-9])/)
    @match << teams_and_scores[0].strip
    @match << teams_and_scores[1]
    @match << teams_and_scores[2].strip
    @match << teams_and_scores[3]
  end

  def new_matchday?
    team_one, _, team_two = @match
    @track_matchday[team_one] || @track_matchday[team_two]
  end

  def determine_match_points
    _, team_one_score, _, team_two_score = @match
    if team_one_score > team_two_score
      [3, 0]
    elsif team_one_score == team_two_score
      [1, 1]
    else
      [0, 3]
    end
  end

  def record_match_result(team_one_points, team_two_points)
    team_one, _, team_two = @match
    @track_matchday[team_one] = true
    @track_matchday[team_two] = true
    if @matchday_count.positive?
      @team_records[team_one] += team_one_points
      @team_records[team_two] += team_two_points
    else
      @team_records[team_one] = team_one_points
      @team_records[team_two] = team_two_points
    end
  end

  def process_match_result(entry)
    parse_match_result(entry)

    if new_matchday?
      @matchday_count += 1
      @track_matchday = {}
      print_standings
    end

    team_one_points, team_two_points = determine_match_points
    record_match_result(team_one_points, team_two_points)
    @match.clear
  end

  def determine_top_three
    weekly_standings = @team_records.sort_by { |name, points| [-points, name] }
    top_three = weekly_standings.first(3)
    top_three.each do |name, points|
      pt_pts = points > 1 ? 'pts' : 'pt'
      @weekly_top_three_standings << "#{name}, #{points} #{pt_pts}"
    end
  end

  def print_standings
    determine_top_three
    puts ''
    puts "Matchday #{@matchday_count}"
    puts @weekly_top_three_standings
    @weekly_top_three_standings.clear
  end
end
