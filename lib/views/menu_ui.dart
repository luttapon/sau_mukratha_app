import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuUi extends StatefulWidget {
  const MenuUi({super.key});

  @override
  State<MenuUi> createState() => _MenuUiState();
}

class _MenuUiState extends State<MenuUi> {
  List<String> menuShow = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
    'assets/images/img4.png',
    'assets/images/img5.png',
    'assets/images/img6.png',
    'assets/images/img7.png',
  ];

  List<String> branchShop = [
    'assets/images/shop1.png',
    'assets/images/shop2.png',
    'assets/images/shop3.png',
    'assets/images/shop4.png',
    'assets/images/shop5.png',
  ];

  List<String> shoplocation = [
    'https://www.google.co.th/maps/@14.8569619,102.3210407,11.67z?hl=th&entry=ttu&g_ep=EgoyMDI1MDIxMC4wIKXMDSoASAFQAw%3D%3D'
        'https://www.google.co.th/maps/@17.2842041,103.8802103,5z?hl=th&entry=ttu&g_ep=EgoyMDI1MDIxMC4wIKXMDSoASAFQAw%3D%3D'
        'https://www.google.co.th/maps/@18.3170581,99.3986862,17z?hl=th&entry=ttu&g_ep=EgoyMDI1MDIxMC4wIKXMDSoASAFQAw%3D%3D'
        'https://www.google.co.th/maps/@20.2649781,101.0088483,11z?hl=th&entry=ttu&g_ep=EgoyMDI1MDIxMC4wIKXMDSoASAFQAw%3D%3D'
        'https://www.google.co.th/maps/@17.5759827,103.6138031,9.75z?hl=th&entry=ttu&g_ep=EgoyMDI1MDIxMC4wIKXMDSoASAFQAw%3D%3D'
  ];

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(children: [
        SizedBox(height: 20),
        Image.asset(
          'assets/images/logo.png',
          width: 250,
        ),
        SizedBox(height: 20),
        Text(
          'เมนูเด็ด',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Container(
          height: 100,
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: menuShow.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    menuShow[index],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20),
        Text(
          'ร้านในเครือ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: branchShop.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 35,
                  right: 35,
                  bottom: 35,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: () {
                      _launchInBrowser(Uri.parse(shoplocation[index]));
                    },
                    child: Image.asset(
                      branchShop[index],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ]),
    ));
  }
}
