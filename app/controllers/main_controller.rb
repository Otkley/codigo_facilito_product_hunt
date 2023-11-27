class MainController < ApplicationController
  # Indicamos que este controller utilizara otro layout
  # layout 'custome'

  # Si queremos que algun metodo en especifico use otro layout
  # render layout: 'custome'

  def welcome
    @name = 'Cody!'
    render layout: 'custome'
  end
end