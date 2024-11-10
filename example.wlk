class Stream {
  const invitados = []
  
  method cantidadViewers()    // metoto abstracto (cada stream calcular su cantidad de viewers de diferente manera)

  method nivelDeHype() = invitados.sum({invitado => invitado.popularidad()}).min(100) // como maximo 100 
  method laEstaPegando() = self.nivelDeHype() > 60 

  method ganancias() = self.cantidadViewers() * self.nivelDeHype() 

}

class EpisodioCanal inherits Stream {
  var costoProduccion
  
  override method ganancias() = super() - costoProduccion
}

class EpisodioSQV inherits EpisodioCanal {
  const cantCanciones

  override method cantidadViewers() = 10000 * cantCanciones 
}

class EpisodioHAA inherits EpisodioCanal {
  var dia   // un dia de la realidad

  method puedeHacerAnalisisSesudos() = dia.estaInteresante() // rebord puede hacer analisis sesudos cuando la realidad esta interesante
  override method cantidadViewers() = if (self.puedeHacerAnalisisSesudos()) 20000 else 10000
  override method nivelDeHype() = 100

}

class DiaEnLaRealidad { // un dia de la realiadad
  var property cantidadSucesos = 10   // cada dia tiene su propia cantiadad de sucesos que estan ocurriendo
  
  method estaInteresante() = cantidadSucesos > 10
}

class SesionStreamerIndependiente inherits Stream {
  var cantSuscriptoresAlMomento

  method frenesiSuscriptores() { cantSuscriptoresAlMomento *= 2}
  
  override method cantidadViewers() = (cantSuscriptoresAlMomento * 1.randomUpTo(3)).truncate(0)

  override method ganancias() = super() * 0.9   // se quedan con toda la ganancia menos el 10%, que es para la plataforma 
}

class SesionStreamCoscu inherits SesionStreamerIndependiente {
  var momentoDelDia

  override method cantidadViewers() = super() + momentoDelDia.genteConectada()
}

// -- MOMENTOS DEL DIA ---------------------

object maniana {
  method genteConectada() = 1000
}

object tarde {
  method genteConectada() = 5000
}

object noche {
  method genteConectada() = 10000
}

// -----------------------------------------


class Invitado {
  const mascotas = []
  var cantSeguidoresIg

  method jugarConMascotas() { cantSeguidoresIg *= mascotas.size() }
  method popularidad() { cantSeguidoresIg /= 2 }  
}

