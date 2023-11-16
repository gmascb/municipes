json.extract! endereco, :id, :municipe_id, :cep, :logradouro, :complemento, :bairro, :cidade, :UF, :cod_ibge, :created_at, :updated_at
json.url endereco_url(endereco, format: :json)
