# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
#
nate = User.create(name: 'Nate Berkopec', username: 'nate', email: 'nate@apple.com',
                   password: '12345', password_confirmation: '12345',
                   avatar_url: 'https://www.railsspeed.com/assets/img/nate-bd1f0d561d35c6258be7b4834a66d5173a15db826127610fac62a1c8b3c0d129.jpg')
matz = User.create(name: 'Yukihiro Matsumoto', username: 'matz', email: 'matz@apple.com',
                   password: '12345', password_confirmation: '12345',
                   avatar_url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Yukihiro_Matsumoto.JPG/268px-Yukihiro_Matsumoto.JPG',
                   color: 'darkred')
ivan = User.create(name: 'Ivan Nemytchenko', username: 'ivan', email: 'ivan@apple.com',
                   password: '12345', password_confirmation: '12345',
                   avatar_url: 'https://avatars3.githubusercontent.com/u/9665?s=400&u=c11df32680c0acf4ff3729e4cbc589df486a652b&v=4',
                   color: '#0E6655')
max = User.create(name: 'maxim', username: 'maxim', email: 'maxim@apple.com',
                  password: '12345', password_confirmation: '12345',
                  color: 'green')
vadim = User.create(name: 'Vadim Venediktov', username: 'vadim', email: 'vadim@apple.com',
                    password: '12345', password_confirmation: '12345',
                    avatar_url: 'https://secure.gravatar.com/avatar/71269686e0f757ddb4f73614f43ae445?s=100',
                    color: 'blue')

Question.create(user_id: matz.id, text: 'Is Ruby died?', answer: 'No', author_id: max.id)
Question.create(user_id: ivan.id, text: 'What do you do with Makefile?', author_id: nate.id)
Question.create(user_id: vadim.id, text: 'Who is a good programmer?', author_id: max.id)
