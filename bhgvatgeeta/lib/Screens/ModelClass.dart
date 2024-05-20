// class JsonModel{
//
// }
//
// class Hindi{
//   final String? Adhiyay;
//
//   Hindi({required this.Adhiyay});
//
//
// }

class Hindi{
  final List<Shlok> shlok;
  final String? Adhiyay;
  
  Hindi({required this.Adhiyay,required this.shlok});
  factory Hindi.fromjson(Map map){
    return Hindi(Adhiyay: map['Adhiyay'], shlok: shlok)
  }
}

class Shlok{
  final String? Shlok_id;
  final String? shlok_namel;
  final String? summary;
  final String? Disc;
  
  Shlok({required this.Shlok_id,required this.shlok_namel,required this.summary,required this.Disc});
  
  factory Shlok.fromjson(Map map){
    return Shlok(Shlok_id: map['Shlok_id'], shlok_namel: map['shlok_name'], summary: map['summary'], Disc: map['Disc']);
  }
}
