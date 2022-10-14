# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

if Account.find_by(name: "Mapleshore Golf Club").nil?
  account = Account.create(name: "Mapleshore Golf Club", subdomain: "mapleshore")

  website = account.websites.create(
    name: "Mapleshore Golf Club",
    subdomain: "mapleshore",
    theme: "desert",
    banner_enabled: true,
    banner_expires_at: DateTime.now + 1.day,
    banner_text: "This is a banner"
  )

  website.headers.create(
    title: "Mapleshore Golf Club",
    welcome: "Welcome to",
    sub_title: "The best golf course in the world"
  )

  10.times.each do |i|
    content = Faker::Lorem.paragraphs(number: 5).join("</p><p>")
    content = "<p>#{content}</p>"
    created_at = ((rand * 10) + 1).days.ago

    website.posts.create(
      title: Faker::Lorem.words(number: 5).join(" "),
      status: "published",
      content: content,
      created_at: created_at,
      updated_at: created_at
    )
  end
end
