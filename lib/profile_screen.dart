import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: width * 0.04,top: height * 0.06,bottom: height * 0.007),
              child: Row(
                children: [
                  const Icon(Icons.arrow_back_ios,size: 20,),
                  SizedBox(width: width * 0.05),
                  Text('Settings',style: GoogleFonts.poppins(fontSize:22,fontWeight:FontWeight.w700,color: Colors.black,)),
                ]
              ),
            ),
            Container(
              height: height * 0.03,
              color: const Color(0x66C4C4C4),
              child: Padding(
                padding: EdgeInsets.only(left: width * 0.04),
                child: Row(
                  children: [
                    Center(child: Text('My Account',style: GoogleFonts.poppins(fontSize:10,fontWeight:FontWeight.w700,color: Color(0xFF2743FD)))),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.035),
            const CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage('assets/images/img.png'),
            ),
            SizedBox(height: height * 0.04),
            Padding(
              padding: EdgeInsets.only(left: width * 0.04,right: width * 0.06,top: height * 0.01,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Display Name',style: GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w400,color: Colors.black)),
                  Text('Jenny',style: GoogleFonts.poppins(fontSize:10,fontWeight:FontWeight.w400,color: Color(0xFF565656))),
                ],
              ),
            ),
            const Divider(
              color: Color(0xFFC4C4C4),
            ),
            Padding(
            padding: EdgeInsets.only(left: width * 0.04,right: width * 0.06,top: height * 0.01,),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Mobile Number',style: GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w400,color: Color(0xFF565656))),
              Text('123456789',style: GoogleFonts.poppins(fontSize:10,fontWeight:FontWeight.w400,color: Color(0xFF565656))),
            ],
          ),
        ),
            const Divider(
              color: Color(0xFFC4C4C4),
            ),
            CustomRow(
              text: 'Privacy Settings',
              ontap: (){},
            ),
            const Divider(
              color: Color(0xFFC4C4C4),
            ),
            CustomRow(
              text: 'Security Settings',
              ontap: (){},
            ),
            const Divider(
              color: Color(0xFFC4C4C4),
            ),
            CustomRow(
              text: 'Two-Factor-Authentication',
              ontap: (){},
            ),
            const Divider(
              color: Color(0xFFC4C4C4),
            ),
            CustomRow(
              text: 'Connected Social Media',
              ontap: (){},
            ),
            const Divider(
              color: Color(0xFFC4C4C4),
            ),
            CustomRow(
              text: 'Notification Preferences',
              ontap: (){},
            ),
            const Divider(
              color: Color(0xFFC4C4C4),
            ),
            CustomRow(
              text: 'App Theme and Personlization',
              ontap: (){},
            ),
            const Divider(
              color: Color(0xFFC4C4C4),
            ),
            CustomRow(
              text: 'Languages',
              ontap: (){},
            ),
            const Divider(
              color: Color(0xFFC4C4C4),
            ),
          ]
        ),
      )
    );
  }
}

class CustomRow extends StatelessWidget {
  String? text;
  VoidCallback ontap;
  CustomRow({Key? key, this.text,required this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(left: width * 0.04,right: width * 0.06,top: height * 0.01,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: ontap,
              child: Text(text!,style: GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w400,color: Color(0xFF565656)))),
        ],
      ),
    );
  }
}
