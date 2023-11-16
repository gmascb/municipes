class MunicipesMailer < ApplicationMailer

  def novo_municipe(municipe)
    @municipe = municipe
    # @url = endereco_new_municipe_url(@municipe.id)
    mail(to: @municipe.email, subject: I18n.t('welcome'))
  end

end
