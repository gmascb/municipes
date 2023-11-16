class Municipe < ApplicationRecord
#  has_one_attached :imagem

  validate :valida_cpf
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  validates :cns, presence: true, format: { with: /\A\d{15}\z/, message: 'inválido' }
  validate :validar_cns

  validates :data_nascimento, presence: true
  validate :data_nascimento_valida

  validates :nome_completo, presence: true

  has_one :endereco

  def self.filtrar(municipes, value)
    # TODO: municipes.data_nascimento = '#{value}' OR    
    # enderecos.UF = '#{value}' OR

    sql = "municipes.nome_completo = '#{value}'"
    sql +=  "OR municipes.cpf = '#{value}' "
    sql +=  "OR municipes.email = '#{value}' "
    sql +=  "OR municipes.cns = '#{value}' "
    sql +=  "OR municipes.telefone = '#{value}' "
    sql +=  "OR enderecos.cep = '#{value}' "
    sql +=  "OR enderecos.logradouro = '#{value}' "
    sql +=  "OR enderecos.complemento = '#{value}' "
    sql +=  "OR enderecos.bairro = '#{value}' "
    sql +=  "OR enderecos.cidade = '#{value}' "
    sql +=  "OR enderecos.cod_ibge = '#{value}'"

    municipes.left_outer_joins(:endereco).where(sql)
  end

  private

  def valida_cpf
    valido = CPF.valid?(cpf)
    errors.add :cpf, 'inválido' if valido.nil?
  end

  def validar_cns
    return if cns.to_s.length == 15

    errors.add :cns, 'inválido'
  end

  def data_nascimento_valida
    return unless data_nascimento.present? && data_nascimento > Date.current

    errors.add :data_nascimento, 'inválida'
  end
end
