import 'package:amazonapp/features/auth/widgets/account_button.dart';
import 'package:flutter/material.dart';

class Mainbutton extends StatelessWidget {
  const Mainbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AccountButton(text: 'orders', onTap: (() {})),
            AccountButton(text: 'sell', onTap: (() {})),
            AccountButton(text: 'witsh list', onTap: (() {})),
            AccountButton(text: 'log out', onTap: (() {})),
          ],
        )
      ],
    );
  }
}
