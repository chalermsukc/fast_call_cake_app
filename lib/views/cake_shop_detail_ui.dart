// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:fast_call_cake_app/models/cake_shop.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:maps_launcher/maps_launcher.dart';

class CakeShopDetailUI extends StatefulWidget {
  CakeShop? cakeShop;

  CakeShopDetailUI({super.key, this.cakeShop});

  @override
  State<CakeShopDetailUI> createState() => _CakeShopDetailUIState();
}

class _CakeShopDetailUIState extends State<CakeShopDetailUI> {
  Future<void> _launchInBrowser(String url) async {
    if (!await launchUrlString(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 206, 235),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 233, 2, 137),
        title: Text(
          'CAKE SHOP CALL FAST (DETAIL)',
          style: GoogleFonts.kanit(),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.width * 0.02,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: Text(
                  widget.cakeShop!.name!.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                    textStyle: TextStyle(
                      color: Color.fromARGB(255, 233, 2, 137),
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.width * 0.02,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(108, 255, 255, 255)),
                child: Text(
                  widget.cakeShop!.description!,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                    textStyle: TextStyle(
                      color: Color.fromARGB(255, 95, 95, 95),
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              GestureDetector(
                onTap: () async {
                      await showDialog(
                        context: context,
                        builder: (_) => ImageDialog(
                          image: widget.cakeShop!.image2!,
                        ),
                      );
                    },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image:
                          AssetImage('assets/images/${widget.cakeShop!.image1!}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await showDialog(
                        context: context,
                        builder: (_) => ImageDialog(
                          image: widget.cakeShop!.image2!,
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/${widget.cakeShop!.image2!}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await showDialog(
                        context: context,
                        builder: (_) => ImageDialog(
                          image: widget.cakeShop!.image3!,
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/${widget.cakeShop!.image3!}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                ),
                child: Column(
                  children: [
                    //show phone number, facebook, website
                    ListTile(
                      onTap: () {
                        _makePhoneCall(widget.cakeShop!.phone!);
                      },
                      leading: Icon(
                        Icons.phone,
                        color: Color.fromARGB(255, 3, 204, 127),
                      ),
                      title: Text(
                        widget.cakeShop!.phone!,
                        style: GoogleFonts.kanit(
                          textStyle: TextStyle(
                            color: Colors.grey[700],
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                          ),
                        ),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      onTap: () {
                        _launchInBrowser(widget.cakeShop!.facebook!);
                      },
                      leading: Icon(
                        Icons.facebook,
                        color: Color.fromARGB(255, 50, 97, 224),
                      ),
                      title: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          widget.cakeShop!.facebook!,
                          style: GoogleFonts.kanit(
                            textStyle: TextStyle(
                              color: Colors.grey[700],
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      onTap: () {
                        _launchInBrowser(widget.cakeShop!.website!);
                      },
                      leading: Icon(
                        Icons.web,
                        color: Color.fromARGB(255, 110, 2, 233),
                      ),
                      title: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          widget.cakeShop!.website!,
                          style: GoogleFonts.kanit(
                            textStyle: TextStyle(
                              color: Colors.grey[700],
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      onTap: () {
                        MapsLauncher.launchCoordinates(
                            double.parse(widget.cakeShop!.latitude!),
                            double.parse(widget.cakeShop!.longitude!),
                            widget.cakeShop!.name!);
                      },
                      leading: Icon(
                        Icons.location_on,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                      title: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          widget.cakeShop!.address!,
                          style: GoogleFonts.kanit(
                            textStyle: TextStyle(
                              color: Colors.grey[700],
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageDialog extends StatelessWidget {
  String? image;
  ImageDialog({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          padding: EdgeInsets.all(15),
          //height: 320,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  'assets/images/${image!}',
                  width: MediaQuery.of(context).size.width * 0.7,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 233, 2, 137),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('ปิด',
                    style: GoogleFonts.kanit(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
