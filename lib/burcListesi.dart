import 'package:flutter/material.dart';

import 'burcItem.dart';
import 'model/burc.dart';

import 'data/strings.dart';

class BurcListesi extends StatelessWidget {
  late List<Burc> tumBurclar;

  //* Constructor
  BurcListesi() {
    tumBurclar = veriKaynaginiHazirla();
    print(tumBurclar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Burclar Listesi"),
      ),
      body: Center(
          child: ListView.builder(
              itemCount: tumBurclar.length,
              itemBuilder: (context, index) {
                return BurcItem(
                  listelenenBurc: tumBurclar[index],
                );
              })),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> gecici = [];

    for (int i = 0; i < 12; i++) {
      var burcAdi = Strings.BURC_ADLARI[i];
      var burcTarihi = Strings.BURC_TARIHLERI[i];
      var burcDetay = Strings.BURC_GENEL_OZELLIKLERI[i];

      var burcKucukResim =
          '${Strings.BURC_ADLARI[i].toLowerCase()}${i + 1}.png';

      var burcBuyukResim =
          '${Strings.BURC_ADLARI[i].toLowerCase()}_buyuk${i + 1}.png';

      Burc eklenecekBurc = Burc(
          burcAdi, burcTarihi, burcDetay, burcKucukResim, burcBuyukResim);
      gecici.add(eklenecekBurc);
    }

    return gecici;
  }
}
