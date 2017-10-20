logins = %w[Max Mihail Veronika Anton Dmitry Valera Katya Svetlana Ksenya Vitaly Yury Irina]
users = logins.map{|login| User.create(login: login)}
users.each do |user|
  25.times do |t|
    Post.create(header: "заголовок #{t}", content: "сообщение #{t}", author_ip: t, user_id: user.id )
  end
end
