import 'package:flutter/material.dart';
import 'package:flutter_application_1/burcDetay.dart';

import 'model/burc.dart';

class BurcItem extends StatelessWidget {
  final Burc listelenenBurc;

  const BurcItem({Key? key, required this.listelenenBurc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 4,
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    BurcDetay(secilenBurc: listelenenBurc),
              ),
            );
          },
          leading: Image.asset(
            "images/" + listelenenBurc.burcKucukResim,
            width: 64,
            height: 64,
          ),
          title: Text(
            listelenenBurc.burcAdi,
            style: myTextStyle.headline5,
          ),
          subtitle: Text(
            listelenenBurc.burcTarihi,
            style: myTextStyle.subtitle1,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.pink,
          ),
        ),
      ),
    );
  }
}
