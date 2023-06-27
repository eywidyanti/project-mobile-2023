class Item {
  late int _id;
  late String kode;
  late String name;
  late String foto;
  late int ld;
  late int pl;
  late int pb;
  late int bp;
  late String tgl;
  late int price;
  late String ket;

  int get id => _id;
  set id(int id) {
    _id = id;
  }

  Item({
    required this.kode,
    required this.name,
    required this.foto,
    required this.ld,
    required this.pl,
    required this.pb,
    required this.bp,
    required this.tgl,
    required this.price,
    required this.ket,
  });

  Item.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    kode = map['kode'];
    name = map['name'];
    foto = map['foto'];
    ld = map['ld'];
    pl = map['pl'];
    pb = map['pb'];
    bp = map['bp'];
    tgl = map['tgl'];
    price = map['price'];
    ket = map['ket'];
  }

  Map<String, dynamic> toMap() {
    return {
      'kode': kode,
      'name': name,
      'foto': foto,
      'ld': ld,
      'pl': pl,
      'pb': pb,
      'bp': bp,
      'tgl': tgl,
      'price': price,
      'ket': ket
    };
  }
}
