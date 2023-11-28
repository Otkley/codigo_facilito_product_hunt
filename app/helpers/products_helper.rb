module ProductsHelper
  # Este se creo junto con el ProductsController y aqui colocaremos los metodos que queramos utilizar en nuestas vistas.

  def date_format(date)
    meses = %w[Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre]
    # obtenemos el mes con %-m y restamos 1 para el match con el arreglo
    mes = meses[date.strftime('%-m').to_i - 1]
    dia = date.strftime('%d')
    year = date.strftime('%Y')

    "#{dia} del #{mes} del #{year}"
  end

  def simple_description(description)
    # truncate: devolver # de caracteres especificos
    description.truncate(100)
  end
end
