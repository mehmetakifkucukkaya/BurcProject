
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'model/burc.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({Key? key, required this.secilenBurc}) : super(key: key);

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appbarRengi = Colors.transparent;
  late PaletteGenerator _generator;

  @override
  void initState() {
    appbarRenginiBul();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: appbarRengi,
          expandedHeight: 250,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
              title: Text(
                  widget.secilenBurc.burcAdi + " Burcu ve Özellikleri"),
              centerTitle: true,
              background: Image.asset(
                "images/" + widget.secilenBurc.burcBuyukResim,
                fit: BoxFit.cover,
              )),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Text(widget.secilenBurc.burcDetayi,
                  style: Theme.of(context).textTheme.titleMedium),
            ),
          ),
        )
      ],
    ));
  }

  void appbarRenginiBul() async {
    _generator = await PaletteGenerator.fromImageProvider(
      AssetImage("images/" + widget.secilenBurc.burcBuyukResim),
    );
    setState(() {});
    appbarRengi = _generator.dominantColor!.color;
  }
}
