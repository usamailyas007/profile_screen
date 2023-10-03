import 'dart:convert';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Model/profileModel.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Future<List<Profilemodel>> getProfileApi () async{
  //   final response = await http.get(Uri.parse('https://fluter-otp-server-api.cyclic.app/api/users/get_all_users'));
  //   var data = jsonDecode(response.body.toString());
  //   if(response.statusCode == 200 ){
  //     print(data);
  //     return Profilemodel.fromJson(data);
  //   } else {
  //     return Profilemodel.fromJson(data);
  //   }
  // }
  final List<ProfileModel> profileDataList = [];
  Future<List<ProfileModel>> getProfileApi ()async{
    final response = await http.get(Uri.parse('https://fluter-otp-server-api.cyclic.app/api/users/get_all_users'));
    var data = jsonDecode(response.body.toString());

    print(data);
    if(response.statusCode == 200){
      for(Map i in data){
        ProfileModel userData = ProfileModel(profileImageUrl: i['profileImageUrl'], username: i['username'], email: i['email']);
        profileDataList.add(userData);
      }
      return profileDataList;
    }else {
      return profileDataList;
    }
  }

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
              SizedBox(height: height * 0.02),
              FutureBuilder(
                future: getProfileApi(),
                builder: (context,AsyncSnapshot<List<ProfileModel>>  snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else{
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                    return Column(
                      children: [
                         CircleAvatar(
                          radius: 45,
                          backgroundImage: NetworkImage(snapshot.data![index].profileImageUrl.toString()),
                        ),
                        SizedBox(height: height * 0.04),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.04,right: width * 0.06,top: height * 0.01,),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Display Name',style: GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w400,color: Colors.black)),
                              Text(snapshot.data![index].username.toString(),style: GoogleFonts.poppins(fontSize:10,fontWeight:FontWeight.w400,color: Color(0xFF565656))),
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
                              Text('Email',style: GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w400,color: Color(0xFF565656))),
                              Text(snapshot.data![index].email.toString(),style: GoogleFonts.poppins(fontSize:10,fontWeight:FontWeight.w400,color: Color(0xFF565656))),
                            ],
                          ),
                        ),
                      ],
                    );
                  },);
                }
              },),

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

