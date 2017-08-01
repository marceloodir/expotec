# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Gerando os Tipos de usuários...'
Kind.create!([{description: "Palestrante"}, 
	         {description: "Participante"},
	         {description: "Avaliador"}])

puts 'Gerando os Usuários...'
10.times do |i|
	User.create!(
		name:  Faker::Name.name,
		email: Faker::Internet.email,
		cpf:   CpfUtils.cpf_formatted,
		kind: Kind.all.sample)
end




