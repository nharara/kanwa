# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Emotion.destroy_all

puts 'creating emotions and sub emotions'

emotions = ["angry", "disgusted", "fearful", "bad", "surprised", "happy", "sad"]

sub_emotions_list = [
  ["let down", "humiliated", "bitter", "mad", "aggressive", "frustrated", "distant", "critical"],
  ["disapproving", "disappointed", "awful", "repelled"],
  ["scared", "anxious", "insecure", "weak", "rejected", "threatened"],
  ["bored", "busy", "stressed", "tired"],
  ["startled", "confused", "amazed", "excited"],
  ["playful", "content", "interested", "proud", "accepted", "powerful", "peaceful", "trusting", "optimistic"],
  ["lonely", "vulnerable", "despair", "guilty", "depressed", "hurt"]
]

emotions.each_with_index do |emotion, index|
  instance = Emotion.create!(name: emotion)
  sub_emotions_list[index].each do |sub_emotion|
    sub_instance = Emotion.new(name: sub_emotion)
    sub_instance.parent_emotion = instance
    sub_instance.save
  end
end

puts 'created emotions and sub emotions'

User.destroy_all

puts 'creating user'

User.create!(
  full_name: 'test user',
  nickname: 'nick',
  email: 'false@mail.com',
  password: 'encrypted'
)

puts 'test user created'
