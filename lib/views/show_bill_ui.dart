import 'dart:io';

import 'package:flutter/material.dart';

class ShowBillUi extends StatefulWidget {
  double? paytotal;
  File? imaFile;

  ShowBillUi({
    super.key,
    this.paytotal,
    this.imaFile,
  });

  @override
  State<ShowBillUi> createState() => _ShowBillUiState();
}

class _ShowBillUiState extends State<ShowBillUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.red,
      title: Text(
        'Show Bill',
        style: TextStyle(color: Colors.white),
      ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
            'Total: ${widget.paytotal} บาท',
            style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20,),
            Image.file(
              widget.imaFile!,
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}
