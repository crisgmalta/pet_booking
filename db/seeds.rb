80.times do |i|
  puts "criando pet #{i}"

  pet = Pet.create!(
    name: Faker::Creature::Dog.name ,
    birth_date: Faker::Date.in_date_period,
    breed: Faker::Creature::Dog.breed,
    pet_kind: Pet::PET_KIND.sample)

  30.times { pet.medical_records.create!(symptoms: Faker::Lorem.sentence, treatment: Faker::Lorem.sentence) }
end

puts "seed finalizado"
