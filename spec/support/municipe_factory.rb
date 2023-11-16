FactoryBot.define do
  factory :municipe do
    nome_completo { Faker::Name.name }
    cpf { CPF.generate  }
    cns { '012345678901234' }
    email { Faker::Internet.unique.email }
    data_nascimento { Date.today }
    telefone { Faker::PhoneNumber.phone_number }
    status { true }
  end
end
