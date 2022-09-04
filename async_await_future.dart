Future<String> identify(String type) {
  return Future.delayed(Duration(seconds: 3), () {
    if (type == 'Minuman') {
      return "$type segera dibuat! \n";
    } else {
      throw "$type menunggu giliran";
    }
  });
}

Future<String> pesanSelesai() async {
  var service = await membuatMinuman();
  return "Minuman telah selesai dibuat \n$service";
}

Future<String> membuatMinuman() {
  return Future.delayed(Duration(seconds: 5), () {
    return 'Makanan segara dibuat \n';
  });
}

void main(List<String> args) async {
  print("===========================================");
  print("Welcome to Cilimus Restaurant, Tuan/Nyonya!");
  print("===========================================");

  print('\nSaya memesan spagetti');
  identify('Makanan').then((String dataPasien) {
    print(dataPasien);
  }).catchError((error) {
    print(error);
  });

  print('Saya memesan es teh \n');
  try {
    String dataPasien = await identify('Minuman');
    print(dataPasien);
  } catch (error) {
    print(error);
  }

  try {
    var dataPasien = await pesanSelesai();
    print(dataPasien);
  } catch (error) {
    print(error);
  } finally {
    print('Seluruh pesanan siap disajikan');
  }
}
