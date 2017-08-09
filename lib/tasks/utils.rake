namespace :utils do
  desc "Populando o banco..."
  task seed: :environment do
  	
  	puts 'Gerando os Usuários Aleatórios...'
	100.times do |i|
		User.create!(
			name:  Faker::Name.name,
			email: Faker::Internet.email,
			cpf:   CpfUtils.cpf_formatted,
			kind: Kind.all.sample)
	end

	puts 'Populando Endereços dos Usuários'
	User.all.each do |user|
		Address.create!(
			street: Faker::Address.street_address,
			city:   Faker::Address.city,
			state:  Faker::Address.state_abbr,
			user:   user)
	end

	puts 'Populando telefone(s) dos usuários'
	User.all.each do |user|
		Random.rand(1..5).times do |i|
			Phone.create(
				phone: Faker::PhoneNumber.phone_number,
				user:  user)
		end
	end
  
  end
end
