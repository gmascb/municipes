class MunicipesMailer < ApplicationMailer

  def novo_municipe(municipe)
    @municipe = municipe
    mail(to: @municipe.email, subject: I18n.t('welcome'))
  end

end
