user = User.create(login: 'max')

5.times do |t|
  Post.create(header: "заголовок #{t}", content: "сообщение #{t}", author_ip: "197.100.59.#{t}", user_id: user.id )
end
