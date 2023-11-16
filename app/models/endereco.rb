class Endereco < ApplicationRecord
  belongs_to :municipe

  validates :cep, presence: true
  validates :logradouro, presence: true
  validates :complemento, presence: true
  validates :bairro, presence: true
  validates :cidade, presence: true
  validates :UF, presence: true
 
end
