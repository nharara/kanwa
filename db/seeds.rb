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

puts 'creating users'

count = 0

10.times do
  User.create!(
    full_name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
    nickname: "nick#{count}",
    email: "false#{count}@mail.com",
    password: 'encrypted'
  )
  count += 1
end

puts "#{User.count}users created"

puts "creating posts"

emotions = Emotion.where.not(emotion_id: nil)

User.all.each do |user|
  10.times do
    post = Post.new(
      title: Faker::Lorem.sentence,
      content: Faker::Lorem.paragraph * 3,
      emotion: emotions.sample
    )
    post.user = user
    post.save
  end
end

puts "#{Post.count} posts created"


User.all.each do |user|
  60.times do
    time = Faker::Date.between(from: 30.days.ago, to: Date.today)
    entry = Entry.new(
      emotion:  Emotion.all.sample,
      created_at: time,
      updated_at: time,
      action: ['Yes', 'No'].sample,
      consequence: ['Yes', 'No'].sample,
      situation: ['family', 'work', 'friends', 'relationship'].sample
    )
    entry.user = user
    entry.save
  end
end
