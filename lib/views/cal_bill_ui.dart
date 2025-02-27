import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:sau_mukratha_app/views/show_bill_ui.dart';

class CalBillUi extends StatefulWidget {
  const CalBillUi({super.key});

  @override
  State<CalBillUi> createState() => _CalBillUiState();
}

class _CalBillUiState extends State<CalBillUi> {
  bool adulCheck = false;
  bool childCheck = false;

  TextEditingController adulCl = TextEditingController(text: '0');
  TextEditingController childCl = TextEditingController(text: '0');
  TextEditingController coke = TextEditingController(text: '0');
  TextEditingController water = TextEditingController(text: '0');

  int waterCheck = 1;

  //สร้างตัวแปรเก็บรูปที่ถ่าย
  File? imgFile;

  //สร้างเมธอดเปิดกล้องเพื่อถ่ายรูป
  Future<void> openCamera() async {
    //เปิดกล้องเพื่อถ่ายรูป
    final picker = await ImagePicker().pickImage(
      source: ImageSource.camera, //ImageSource.gallery
      imageQuality: 75,
    );

    //ตรวจสอบว่าได้ถ่ายไหม
    if (picker == null) return;

    //กรณีถ่ายมา ก็ไปกำหนดให้กับ imgFile สร้างไว้
    setState(() {
      imgFile = File(picker.path);
    });
  }

  List<String> memberType = [
    'ไม่เป็นสมาชิก',
    'สมาชิกทั่วไป 15%',
    'สมาชิก VIP 20%',
  ];
  double discount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green,
      body: Padding(
        padding: EdgeInsets.only(left: 50, right: 50),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  openCamera();
                },
                child: imgFile == null
                    ? Image.asset(
                        'assets/images/camera.jpg',
                        height: 120.0,
                      )
                    : Image.file(
                        imgFile!,
                        height: 120,
                      ),
              ),
              SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'จำนวนคน',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    onChanged: (valueParam) {
                      setState(() {
                        adulCheck = valueParam!;
                        if (valueParam! == false) {
                          adulCl.text = '0';
                        }
                      });
                    },
                    value: adulCheck,
                  ),
                  Text(
                    'ผู้ฬหญ่ 299 บาท/คน จำนวน    ',
                  ),
                  Flexible(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      enabled: adulCheck,
                      controller: adulCl,
                    ),
                  ),
                  Text('คน'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    onChanged: (valueParam) {
                      setState(() {
                        childCheck = valueParam!;
                        if (valueParam! == false) {
                          childCl.text = '0';
                        }
                      });
                    },
                    value: childCheck,
                  ),
                  Text(
                    'เด็ก 69 บาท/คน จำนวน   ',
                  ),
                  Flexible(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      enabled: childCheck,
                      controller: childCl,
                    ),
                  ),
                  Text('คน'),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'บุฟเฟ่ต์น้ำดื่ม',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Row(
                children: [
                  Radio(
                    onChanged: (valueParam) {
                      setState(() {
                        waterCheck = valueParam!;
                        if (valueParam! == 1) {
                          coke.text = '0';
                          water.text = '0';
                        }
                      });
                    },
                    value: 1,
                    groupValue: waterCheck,
                  ),
                  Text('รับ 25 บาท/หัว')
                ],
              ),
              Row(
                children: [
                  Radio(
                    onChanged: (valueParam) {
                      setState(() {
                        waterCheck = valueParam!;
                      });
                    },
                    value: 2,
                    groupValue: waterCheck,
                  ),
                  Text('ไม่รับ'),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'โค้กเพิ่ม 20 บาท/ขวด จำนวน   ',
                  ),
                  Flexible(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      enabled: waterCheck == 1 ? false : true,
                      controller: coke,
                    ),
                  ),
                  Text('ขวด'),
                ],
              ),
              Row(
                children: [
                  Text(
                    'น้ำเปล่าเพิ่ม 15 บาท/ขวด จำนวน   ',
                  ),
                  Flexible(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      enabled: waterCheck == 1 ? false : true,
                      controller: water,
                    ),
                  ),
                  Text('ขวด'),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ประเภทสมาชิก',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              //dropdown ประเภทสมาชิก
              DropdownButton(
                value: discount,
                isExpanded: true,
                items: memberType
                    .map(
                      (e) => DropdownMenuItem(
                        child: Text(
                          e,
                          style: TextStyle(fontSize: 16),
                        ),
                        value: memberType.indexOf(e).toDouble(),
                      ),
                    )
                    .toList(),
                onChanged: (valueParam) {
                  switch (valueParam) {
                    case 0:
                      discount = 0;
                      break;
                    case 1:
                      discount = 0.05;
                      break;
                    case 2:
                      discount = 0.2;
                      break;
                  }
                },
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        //validate ui
                        if (imgFile == null) {
                        } else if (adulCheck == true &&
                            (adulCl.text == '0' || adulCl.text.length == 0)) {
                        } else if (childCheck == true &&
                            (childCl.text == '0' || childCl.text.length == 0)) {
                        } else {
                          int adult = int.parse(adulCl.text);
                          int child = int.parse(childCl.text);
                          int cokes = int.parse(coke.text);
                          int pure = int.parse(water.text);
                          double paywaterbuffet =
                              waterCheck == 1 ? 25.0 * (adult + child) : 0;
                          double paytotal = (299.0 * adult) +
                              (69 * child) +
                              (20.0 * cokes) +
                              (15 * pure) +
                              paywaterbuffet;
                          paytotal = paytotal - (paytotal * discount);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShowBillUi(
                                        paytotal: paytotal,
                                        imaFile: imgFile,
                                      )));
                        }
                      },
                      icon: Icon(Icons.calculate),
                      label: Text('คำนวนเงิน'),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(double.infinity, 50),
                        backgroundColor: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.cancel),
                      label: Text('ยกเลิก'),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(double.infinity, 50),
                        backgroundColor: Colors.greenAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
