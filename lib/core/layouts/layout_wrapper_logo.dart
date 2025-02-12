import 'package:flutter/material.dart';

class LayoutWrapperLogo extends StatelessWidget {
  const LayoutWrapperLogo(
      {super.key, required this.child, required this.title});

  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            //* TITULO DE LA TARJETA
            // Text(title,
            //     style: Theme.of(context).textTheme.titleMedium,
            //     textAlign: TextAlign.center),

            //* SEPARADOR
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 50, vertical: 0),
            //   child: Divider(color: Colors.grey),
            // ),

            Expanded(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
