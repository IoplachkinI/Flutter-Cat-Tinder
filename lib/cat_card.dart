import 'package:flutter/material.dart';

class CatCard extends StatefulWidget {
  final String text;

  const CatCard({required this.text, super.key});

  @override
  State<CatCard> createState() => _CatCardState();
}

class _CatCardState extends State<CatCard> {
  late int _counter;

  @override
  void initState() {
    super.initState();
    print('_CatCardState initState');
    _counter = 0;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('_CatCardState didChangeDependencies');
  }

  @override
  void didUpdateWidget(covariant CatCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('_CatCardState didUpdateWidget: ${oldWidget.text} -> ${widget.text}');
  }

  @override
  void dispose() {
    print('_CatCardState dispose');
    super.dispose();
  }

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('_CatCardState Build');
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: SizedBox(
                  width: 300,
                  height: 600,
                  child: Text(
                      "Lol"
                  )
              )
          )
        ],
      ),
    );
  }
}
