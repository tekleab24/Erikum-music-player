import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Erikumm',
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w100),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0,
          centerTitle: true,
          leading: Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color(0xfff7f8f8),
                  borderRadius: BorderRadius.circular(10)),
              child: SvgPicture.asset(
                'assets/iocons/search.svg',
                height: 20,
                width: 20,
              ))),
      body: Container(
        color: Theme.of(context).colorScheme.background,
      ),
    );
  }
}
