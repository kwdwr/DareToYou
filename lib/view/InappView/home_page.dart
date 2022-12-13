import 'package:daretoyouapp/view/InappView/search_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../core/service/i_auth_service.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<IAuthService>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.cyan,
              Color(0xFFB64355),
            ],
          )),
          child: SafeArea(
            top: true,
            bottom: true,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                        Icon(
                          Icons.flutter_dash,
                          size: 85,
                          color: Colors.grey.shade300,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Dare To You',
                          style: GoogleFonts.bebasNeue(
                              fontSize: 55, color: Colors.grey.shade300),
                        ),
                    const SizedBox(height: 10),
                    Text(
                      'Hoşgeldin',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.grey[300]),
                    ),
                    Text(' ${authService.getemail()}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.grey[300],
                        )),
                    const SizedBox(height: 50),
                    InkWell(
                      splashColor: const Color(0xff0d3c54),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage(),));
                      },

                          child: Container(
                            height: 75,
                            width: 300,
                            alignment: Alignment.center,
                            decoration: BoxDecoration( gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.pink,
                                Color(0xff1e73a9),
                              ],
                            ),borderRadius: BorderRadius.circular(12)),
                            child: const Center(child: Text('AKADAŞLARINLA',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                        ),
                        ),
                    ),
                        const SizedBox(height: 30),
                    InkWell(
                      splashColor: const Color(0xff2694e1),
                      onTap: (){},

                      child: Container(
                        height: 75,
                        width: 300,
                        alignment: Alignment.center,
                        decoration: BoxDecoration( gradient: const LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Color(0xff9a0791),
                            Color(0xff0d3c54),
                          ],
                        ),borderRadius: BorderRadius.circular(12)),
                        child: const Center(child: Text('ONLİNE',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                        ),
                      ),
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
