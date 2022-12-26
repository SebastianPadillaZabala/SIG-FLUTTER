import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showLoadingMessage(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
            title: const Text('Espere por favor'),
            content: Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                children: const [
                  Text('Calculando ruta'),
                  SizedBox(
                    height: 5,
                  ),
                  CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ));

  return;
}
