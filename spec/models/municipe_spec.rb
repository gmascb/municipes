require 'rails_helper'

RSpec.describe Municipe, type: :model do
  
  describe 'validacoes' do
    it { should validate_presence_of(:email) }

    it { should validate_presence_of(:cns) }
    it { should_not allow_value('invalidcns').for(:cns) }

    it { should validate_presence_of(:data_nascimento) }
    it 'valida a data_nascimento nao é futura' do
      municipe = build(:municipe, data_nascimento: Date.current + 1.day)
      municipe.valid?
      expect(municipe.errors[:data_nascimento]).to include('inválida')
    end

    it { should validate_presence_of(:nome_completo) }

    it 'valida CPF' do
      municipe = build(:municipe, cpf: 'invalidcpf')
      municipe.valid?
      expect(municipe.errors[:cpf]).to include('inválido')
    end

    it 'valida CNS' do
      municipe = build(:municipe, cns: 'invalidcns')
      municipe.valid?
      expect(municipe.errors[:cns]).to include('inválido')
    end
  end

  describe 'private metodos' do
    describe '#valida_cpf' do
      it 'valida CPF' do
        municipe = build(:municipe, cpf: 'invalidcpf')
        municipe.send(:valida_cpf)
        expect(municipe.errors[:cpf]).to include('inválido')
      end
    end

    describe '#validar_cns' do
      it 'valida CNS' do
        municipe = build(:municipe, cns: '123456')
        municipe.send(:validar_cns)
        expect(municipe.errors[:cns]).to include('inválido')
      end
    end

    describe '#data_nascimento_valida' do
      it 'valida that data_nascimento nao é data futura' do
        municipe = build(:municipe, data_nascimento: Date.current + 1.day)
        municipe.send(:data_nascimento_valida)
        expect(municipe.errors[:data_nascimento]).to include('inválida')
      end
    end
  end
end
