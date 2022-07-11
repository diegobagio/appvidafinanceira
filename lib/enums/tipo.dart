enum Tipo {
  PAGO,
  RECEBIDO
}

extension tipoDescricao on Tipo {
  String get descricao{
    switch(this) {
      case Tipo.PAGO: return "Pago";
      case Tipo.RECEBIDO: return "Recebido";
      default:
    }

    return descricao;
  }
}