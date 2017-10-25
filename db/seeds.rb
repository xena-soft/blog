logins = %w[Max Mihail Veronika Anton Dmitry Valera Katya Svetlana Ksenya Vitaly Yury Irina]
users = logins.map{|login| User.create(login: login)}
ips = []
50.times{|t| ips << '192.168.5.' + t.to_s }

users.each do |user|
  ips.each do |ip|
    500.times do |t|
      post = Post.create(header: "заголовок #{t}", content: "сообщение #{t}", author_ip: ip, user_id: user.id )
      next unless t % 3 == 0
      Rating.create(rating: rand(1..5), post_id: post.id)
    end
  end
end
