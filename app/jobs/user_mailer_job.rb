class UserMailerJob < ApplicationJob
  queue_as :mailers

  def perform(municipe)
    MunicipesMailer.novo_municipe(municipe).deliver_now
  end

end