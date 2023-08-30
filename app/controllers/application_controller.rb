class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pagy::Backend
  def stats(entries)
    ids = entries.map(&:id).sort
    g1 = entries.group_by {|entry| entry.emotion}

    g2 = g1.transform_values {|entries| entries.group_by {|entry| entry.situation.split(":").first}}
    @g3 = g2.transform_values {|situations| situations.transform_values {|entries| entries.count}}
    # raise
    # raise
    if @g3 != {}
      count_hash = Hash.new(0)
      @g3.values.each do |hash|
        hash.each do |situation, count|
          count_hash[situation] += count
        end
      end
      # @highest_value_situation = @g3.values.first.sort_by {|key, value| value}.first.first
      @highest_value_situation = count_hash.sort_by {|key, value| key}.sort_by {|key, value| -value}.first.first
      @action = entries.where("situation ilike ?", "#{@highest_value_situation}%").group_by {|entry| entry.action}.transform_values {|value| value.count}
      @action["Yes"] ||= 0
      @action["No"] ||= 0
      @total = @action.values.sum
      @yes_action = @action["Yes"]
      @yes_percentage = ((@yes_action.fdiv(@total))*100).round
    end
  end
end

# dashboard
# => Entry::ActiveRecord_AssociationRelation
# [3156, 3158, 3172, 3177, 3183, 3193, 3197, 3202, 3209, 3216, 3228, 3232, 3242, 3248, 3261]
# g1.keys.map(&:name)
# ["accepted", "content", "interested", "optimistic", "peaceful", "playful", "powerful", "proud"]
# g2.keys.map(&:name)
# ["accepted", "content", "interested", "optimistic", "peaceful", "playful", "powerful", "proud"]
# entries
# => Entry::ActiveRecord_Relation
# [3156, 3158, 3172, 3177, 3183, 3193, 3197, 3202, 3209, 3216, 3228, 3232, 3242, 3248, 3261]
# g1.keys.map(&:name)
# ["accepted", "content", "interested", "optimistic", "peaceful", "playful", "powerful", "proud"]
# ["accepted", "content", "interested", "optimistic", "peaceful", "playful", "powerful", "proud"]
