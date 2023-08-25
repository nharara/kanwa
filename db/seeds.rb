# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

emotion_titles = [
  "Let Down", "Dashed Hopes", "Crushed Dreams", "Hope Shattered", "Disappointment Strikes",
  "Hitting Rock Bottom", "Expectations Unmet", "Falling Short", "Broken Promises", "Frustration Peaks",
  "Humiliation Pain", "Shameful Moments", "Dignity Stripped", "Embarrassment Lingers", "Exposed Vulnerability",
  "Bitter Taste", "Resentment Brews", "Sour Aftertaste", "Nurturing Grudges", "Harboring Resentment",
  "Mad Fury", "Burning Anger", "Raging Fire Inside", "Unleashed Wrath", "Tempest of Emotions",
  "Aggressive Impulse", "Inflamed Aggression", "Bottled Fury", "Violent Outburst", "Fiery Outrage",
  "Frustration Peaks", "Restless Irritation", "Exasperation", "Endless Impatience", "Overwhelming Discontent",
  "Emotional Distance", "Detached Isolation", "Lonely Isolation", "Keeping Distance", "Disconnected Emotions",
  "Critical Lens", "Judgmental Stare", "Hypercritical Mindset", "Unyielding Scrutiny", "Cynical Outlook",
  "Disapproving Eyes", "Judged Unfairly", "Unwanted Critique", "Under the Microscope", "Feeling Scrutinized",
  "Disappointed Heart", "Heartache Within", "Painful Disillusionment", "Hope's Demise", "Heartstrings Frayed",
  "Awful Ache", "Overwhelming Dread", "Suffocating Darkness", "Endless Torment", "Pain Beyond Words",
  "Repelled by Reality", "Strong Aversion", "Disgust in Every Fiber", "Shunning the Unpleasant", "Pushing Away",
  "Scared Mind", "Anxious Whispers", "Insecurity's Grip", "Weak at Heart", "Feeling Threatened", "Overcoming Fear",
  "Anxious Mind", "Restless Apprehension", "Insecurity's Chains", "Frail Confidence", "Constant Worry",
  "Rejected Soul", "Unwanted Exclusion", "Isolation's Sting", "Cast Aside", "Left Behind",
  "Threatened Identity", "Looming Insecurity", "Shadows of Fear", "Identity at Risk", "Facing Threats",
  "Bored Mind", "Monotonous Days", "Tedious Routine", "Life's Dullness", "Yearning for Excitement",
  "Busy Overload", "Endless To-Do List", "Never-Ending Tasks", "Time Crunch", "Juggling Responsibilities",
  "Stressed Soul", "Overwhelmed Burden", "Pressure Mounts", "Breaking Point", "Searching for Relief",
  "Tired Bones", "Weary and Drained", "Exhaustion's Embrace", "Burning the Candle", "Craving Rest",
  "Startled Senses", "Confusion Strikes", "Mind in Turmoil", "Stunned Amazement", "Navigating the Unknown",
  "Confused State", "Perplexing Thoughts", "Lost in Chaos", "Muddled Perspective", "Seeking Clarity",
  "Amazed Mind", "Astonishing Wonder", "Surprising Revelation", "Eyes Wide Open", "Embracing Amazement",
  "Excitement Sparks", "Thrill of Anticipation", "Bubbling Enthusiasm", "Eagerly Awaiting", "Heart Races",
  "Playful Spirit", "Joyful Laughter", "Embracing Fun", "Childlike Delight", "Moments of Playfulness",
  "Content Heart", "Inner Peace", "Savoring Tranquility", "Finding Serenity", "Embracing the Present",
  "Interested Mind", "Curiosity Ignites", "Hunger for Knowledge", "Exploring New Paths", "Avid Learner",
  "Proud Moments", "Inner Accomplishment", "Walking Tall", "Achievement Unlocked", "Basking in Pride",
  "Accepted Self", "Belongingness", "Warm Inclusion", "Embraced for Who I Am", "Connected Hearts",
  "Empowerment Rises", "Strength Within", "Unleashing Potential", "Claiming Power", "Unstoppable Spirit",
  "Peaceful Heart", "Tranquil Soul", "Calm Amid Chaos", "Soothing Stillness", "Mind at Rest",
  "Trusting Bonds", "Reliable Connections", "Fostering Trust", "Building Bridges", "Confident Alliances",
  "Optimistic Outlook", "Bright Horizons", "Hope's Radiance", "Positive Potential", "Eyes on Tomorrow",
  "Lonely Moments", "Seeking Companionship", "Yearning for Connection", "Isolation's Sting", "Solitude's Grip",
  "Vulnerable Soul", "Exposed Emotions", "Raw Sensitivity", "Seeking Shelter", "Tender Vulnerability",
  "Despair's Weight", "Sinking into Darkness", "Overcoming Desolation", "Seeking Rays of Hope", "Embracing Light",
  "Guilt's Grip", "Weighed by Regret", "Remorse's Burden", "Longing for Forgiveness", "Healing from Within",
  "Depressed Mind", "Drowning in Sadness", "Clouds of Desolation", "Seeking the Light", "Navigating Darkness",
  "Hurt Resonates", "Echoes of Pain", "Healing from Within", "Embracing Fragility", "Growing Through Pain"
]

emotion_contents = [
  "Feeling completely let down today. It's as if my expectations were a delicate house of cards, and now they've all come crashing down. The disappointment is heavy.",
  "Hopes that soared high now lie shattered. The let down is a heavy weight on my chest, and moving forward feels like a struggle.",
  "Dreams I held close have been crushed. The weight of reality is suffocating, leaving behind a trail of shattered aspirations.",
  "Hope, once bright, now lays shattered on the floor. The pieces are sharp reminders of the disappointment that courses through me.",
  "Disappointment strikes like lightning, leaving me stunned and disoriented. It's hard to make sense of this sudden let down.",
  "Hitting rock bottom emotionally today. It's like falling into a pit of despair where hope feels out of reach.",
  "Expectations I held so dear have been left unmet. The gap between reality and what I hoped for feels painfully wide.",
  "Falling short of my own expectations feels like a personal defeat. The let down is a harsh reminder of my limitations.",
  "Promises that once held weight have been broken. The echoes of those assurances are now drowned out by disappointment.",
  "Frustration peaks as I grapple with unmet desires. It's like chasing a mirage that keeps slipping through my fingers.",
  "Experiencing humiliation's painful grip today. It's as if shame is painted on my skin, visible to everyone I encounter.",
  "Moments of shame replay in my mind like a broken record. The humiliation lingers, a constant reminder of my perceived shortcomings.",
  "My dignity feels stripped away, replaced by the burning blush of embarrassment. It's hard to face others with my head held high.",
  "The memory of embarrassment sticks like glue. It's as if everyone can see my vulnerabilities and judge me for them.",
  "Exposed vulnerability leaves me feeling defenseless. It's like standing naked before the judgmental gaze of others.",
  "A bitter taste engulfs me today. Resentment and disappointment have brewed into a concoction that's hard to swallow.",
  "The bitterness within me grows stronger, staining my thoughts and emotions. It's challenging to find sweetness in this bitterness.",
  "Sour aftertaste of disappointment lingers in my mind. The residue of bitterness taints every experience, making it hard to savor life.",
  "Nurturing grudges feels like carrying a heavy burden. The weight of bitterness pulls me down, making it difficult to move forward.",
  "Resentment takes root within, like a weed that threatens to choke out the positivity in my life. Letting go seems daunting.",
  "Fury courses through my veins like wildfire. Every fiber of my being is consumed by this raging anger, making it hard to see clearly.",
  "Burning anger threatens to overwhelm me. It's like a volcano about to erupt, and I struggle to control the fiery emotions.",
  "A raging fire burns inside, fueling my intense anger. It's a battle to keep this blaze from consuming everything in its path.",
  "Unleashed wrath takes hold, and it's like a storm of anger that I can't rein in. The force is powerful and unsettling.",
  "My emotions are a tempest today, swirling and crashing like a tumultuous ocean. It's hard to find a steady foothold amidst this emotional turmoil.",
  "Aggression simmers beneath the surface, like a pressure cooker about to blow its lid. The urge to release this energy is both intoxicating and alarming.",
  "My aggression feels inflamed, like a wildfire that's hard to contain. It's a constant struggle to keep this fierce energy in check.",
  "Bottled fury threatens to explode. The pressure builds, and I'm walking a tightrope between containing and unleashing this aggressive energy.",
  "A violent outburst looms on the horizon, fueled by the intensity of my emotions. It's like a storm that's been building, and I can't hold it back much longer.",
  "Fiery outrage takes over, consuming me in its blaze. The force is intense, and I'm grappling with the aftermath of this emotional explosion.",
  "Frustration peaks as I grapple with unmet desires. It's like chasing a mirage that keeps slipping through my fingers.",
  "Restless irritation gnaws at me, like an itch I can't scratch. The constant discomfort of frustration is wearing me down.",
  "Exasperation fills the air like an invisible cloud. It's hard to breathe when irritation is a constant presence in my mind.",
  "Endless impatience courses through my veins, making every second feel like an eternity. Waiting becomes a torment.",
  "Overwhelming discontent clouds my perspective today. It's like I'm trapped in a loop of dissatisfaction, unable to break free.",
  "Emotional distance separates me from the world today. It's like looking through a window at life, unable to fully engage due to this detachment.",
  "A sense of detachment envelops me, like I'm viewing life from a distance. It's a struggle to connect with my own emotions and those of others.",
  "Lonely isolation wraps around me, like a shroud that keeps me separate from the world. It's challenging to bridge the gap between myself and others.",
  "Keeping emotional distance seems like a protective measure. It's as if a barrier shields me from the intensity of emotions, both mine and others'.",
  "Viewing everything through a critical lens today. Every flaw is magnified, and it's hard to see the positives. Striving to find balance in this perspective.",
  "A disapproving stance colors my outlook. It's like I'm wearing glasses that only allow me to see the negatives in people and situations.",
  "Hypercritical thoughts swirl in my mind, dissecting every detail with unyielding scrutiny. Finding acceptance amid this critical fog is a challenge.",
  "Unyielding scrutiny bears down on me. It's like I'm under a microscope, and every action is subject to judgment and disapproval.",
  "Feeling the weight of disapproving eyes on me. It's like judgment is etched into the air. Standing tall against this scrutiny is a challenge.",
  "Being judged unfairly stings deeply. It's hard to shake off the feeling of disapproval, especially when it's unjustified.",
  "Unwanted critique echoes in my mind, like an incessant voice pointing out my flaws. The weight of disapproval is a heavy burden.",
  "Under the microscope of judgment, I feel like I'm on trial. The disapproving eyes are a constant reminder of my perceived shortcomings.",
  "My heart aches with disappointment. It's as if hope's light has dimmed, leaving me to navigate through the darkness of disillusionment.",
  "The heartache I feel is raw and unrelenting. It's like a storm that won't let up, drenching me in a torrent of sorrow.",
  "Painful disillusionment washes over me today. It's like the veil of naivety has been lifted, revealing a reality that's harsh and unforgiving.",
  "The demise of hope is a heavy weight on my heart. It's like watching something beautiful wither away, leaving behind a void of emptiness.",
  "My heartstrings are frayed from the strain of disappointment. It's hard to believe in the goodness of things when they keep falling apart.",
  "The ache within me is awful and unrelenting. It's like a persistent storm, soaking me in sorrow and making it hard to find shelter.",
  "Overwhelming dread consumes me. It's like a heavy cloud that hovers, casting a shadow over everything I do.",
  "Suffocating darkness surrounds me, and despair's grip is unyielding. It's hard to see beyond the gloom that engulfs my thoughts.",
  "Touched by torment, I'm sinking into the depths of desolation. The weight of despair is a burden that's hard to bear.",
  "Hope flickers like a distant star, and it's a struggle to hold onto its feeble light. The darkness of despair is a constant companion.",
  "Regret's grip is tight, pulling me down into the abyss of guilt. It's hard to escape the clutches of remorse for past actions.",
  "The burden of guilt weighs heavily on my heart. It's like a constant reminder of mistakes made and the desire for redemption.",
  "Remorse lingers like a shadow, a reminder of actions I wish I could undo. The weight of guilt is a heavy cross to bear.",
  "Longing for forgiveness, I'm haunted by the echoes of past mistakes. It's a journey toward healing and self-acceptance.",
  "Depression's grip tightens, and it's like a heavy fog that obscures everything in its path. Finding a way out feels daunting.",
  "Drowning in sadness, I'm struggling to stay afloat. The waves of depression crash over me, and it's hard to find solid ground.",
  "A cloud of desolation hangs over me, casting shadows on every aspect of life. Navigating through this darkness is a daily challenge.",
  "Seeking the light within the darkness of depression. It's like finding a glimmer of hope in the midst of a storm.",
  "Navigating the darkness within my mind, seeking rays of hope that can pierce through the clouds of despair. It's a challenging journey.",
  "Hurt resonates deep within my soul. It's like an echo that refuses to fade, a constant reminder of pain experienced.",
  "Echoes of pain reverberate through my being. Healing from within feels like a slow process, but I'm committed to finding solace.",
  "In the midst of hurt, I'm learning to embrace my fragility. It's a journey toward growth and resilience, even when scars remain."
]



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
    emotion = rand(0..99)
    post = Post.new(
      title: emotion_titles[emotion],
      content: emotion_contents[emotion],
      emotion: emotions.sample
    )
    post.user = user
    post.save
  end
end

puts "#{Post.count} posts created"

puts 'creating entries'

User.all.each do |user|
  120.times do
    time = Faker::Date.between(from: 60.days.ago, to: Date.today)
    entry = Entry.new(
      emotion: Emotion.all.sample,
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

puts "#{Entry.count} entries created"
