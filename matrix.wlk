object nave {
    const property pasajeros = [neo, morfeo, trinity]
    
    method subir(unPasajero){
        pasajeros.add(unPasajero)
    }
    method bajar(unPasajero) {
      pasajeros.remove(unPasajero)
    }
    method nroPasajeros() = pasajeros.size()
    method elPasajeroConMasVitalidad() = pasajeros.max({p=>p.vitalidad()})
    method estaEquilibrada() = self.elPasajeroConMasVitalidad().vitalidad() <= self.elPasajeroDeMenorVitalidad().vitalidad()*2
    method elPasajeroDeMenorVitalidad() = pasajeros.min({p=>p.vitalidad()})
    method estaElElegidoABordo() = pasajeros.any({p=>p.esElElegido()})
    method chocar() {
      pasajeros.forEach({p=>p.saltar()})
      pasajeros.clear()
    }
    method acelerar() {
      self.losNoElegidos().forEach({p => p.saltar() self.bajar(p)})
    }
    method losNoElegidos(){
        return pasajeros.filter({p=> not p.esElElegido()})
    }
}
object neo {
    var energia = 100
  method esElElegido() = true
  method vitalidad() = energia/10
  method saltar() {
    energia = energia - energia/2
  }
}
object morfeo {
    var descansado = true
    var vitalidad = 8
  method esElElegido() = false
  method vitalidad() = vitalidad
  method saltar() {
    if(descansado){
        descansado = false
    }
    else{
        descansado = true
    }
   vitalidad = vitalidad-1
  }
}
object trinity {
  method esElElegido() = false
  method vitalidad() = 0
  method saltar() {}
}