
import 'package:cv_resume_project/pages/starting_page.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




void main() {
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const starting_page(),
    );
  }
}
/*
class SplashScreen extends StatefulWidget {
  //ACILIS SAYFASI
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  void _goHomePage(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
          return const resume_builder_page(title: 'Resume Builder');
        }
    //=> const MyHomePage(title: 'Ana Sayfa')
    ));
  }


  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.indigo, Colors.indigoAccent])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: ListView(
                padding: const EdgeInsets.symmetric(vertical: 270.0, horizontal: 14.0),
                children: [
                  Column(
                  children: [
                    const Text(
                      "CVmaker",
                       style: TextStyle(
                         fontSize: 50,
                         fontWeight: FontWeight.bold,
                         color: Colors.white,
                       ) ,
                    ),
                    const SizedBox(height: 60,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 130,
                    child:ElevatedButton(
                      child: const Text('List'),
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.indigo)
                              )
                          )
                      ),
                      onPressed: () {
                        _goHomePage(context);
                      },
                    ),
                          ),
                          const SizedBox(width: 20),
                         SizedBox(
                           width: 130,
                         child: ElevatedButton(
                            child: const Text('New'),

                            style: ButtonStyle(

                                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: const BorderSide(color: Colors.indigo)
                                    )
                                )
                            ),

                            onPressed: () {
                              _goHomePage(context);
                            },
                          )
                         )
            ]
            ),
                  ],
                )
        ]
            )
        )
    );
  }
}



*/



/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int pageIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        elevation: 8,
        title: Text(widget.title,style: const TextStyle(color:Colors.white70, fontSize: 24)),
        backgroundColor:Colors.indigo[800] ,
        centerTitle: true,
        toolbarHeight: 80,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
            top: Radius.circular(20)
          ),
        ),
      ),

      body: SafeArea(
         child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             //mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             GridView.count(
               shrinkWrap: true,
               padding: const EdgeInsets.all(20),
               crossAxisCount: 3,
               crossAxisSpacing: 20,
               mainAxisSpacing: 20,

               children: <Widget>[
                 homePageRowCell(FontAwesomeIcons.user, "Personal Info", 'PersonalInfo', context),
                 homePageRowCell(FontAwesomeIcons.bullseye, "Objective", 'Objective', context),
                 homePageRowCell(FontAwesomeIcons.graduationCap, "Academics",'Academics', context),
                 homePageRowCell(FontAwesomeIcons.star, "Skills",'Skills' ,context),
                 homePageRowCell(FontAwesomeIcons.puzzlePiece, "Interests",'Interests', context),
                 homePageRowCell(FontAwesomeIcons.file, "Projects",'Projects', context),
                 homePageRowCell(FontAwesomeIcons.briefcase, "Experiences",'Experiences', context),
                 homePageRowCell(FontAwesomeIcons.envelope, "Cover Letter",'CoverLetter', context),
                 homePageRowCell(FontAwesomeIcons.addressBook, "References",'References', context),

               ],
             )
           ]
         )
      ),
        bottomNavigationBar: buildMyNavBar(context)
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  Widget homePageRowCell(var sIcon, String title,String page,BuildContext context) =>


      Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[900]
          ),
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () {
               _goPage(context,page);
            },
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Icon(sIcon, color: Colors.white, size: 25),
                     ),

                     Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.normal)),

                  ],
                ),
              ],
            ),
          )
      );

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.indigo[800],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),

        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
              _goExperiences(context);
            },
            icon: pageIndex == 0
                ? const Icon(
              Icons.home_filled,
              color: Colors.white,
              size: 30,
            )
                : const Icon(
              Icons.home_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
              _goPersonalInfo(context);
            },
            icon: pageIndex == 1
                ? const Icon(
              Icons.work_rounded,
              color: Colors.white,
              size: 30,
            )
                : const Icon(
              Icons.work_outline_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
              _goInterests(context);
            },
            icon: pageIndex == 2
                ? const Icon(
              Icons.widgets_rounded,
              color: Colors.white,
              size: 30,
            )
                : const Icon(
              Icons.widgets_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
              _goAcademics(context);
            },
            icon: pageIndex == 3
                ? const Icon(
              Icons.person,
              color: Colors.white,
              size: 30,
            )
                : const Icon(
              Icons.person_outline,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
  
  void _goPersonalInfo(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return const personal_info_page();}
    ));
  }
  void _goObjective(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return const objective_page();}
    ));
  }
  void _goAcademics(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return const academics_page();}
    ));
  }
  void _goSkills(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return skills_page();}
    ));
  }
  void _goInterests(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return const interests_page();}
    ));
  }
  void _goProjects(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return const projects_page();}
    ));
  }
  void _goExperiences(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return const experiences_page();}
    ));
  }
  void _goCoverLetter(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return const cover_letter_page();}
    ));
  }
  void _goReferences(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return const references_page();}
    ));
  }
  void _goPage(BuildContext context,String page){
    if(page=='PersonalInfo'){
        _goPersonalInfo(context);
    }
    else if(page=='Objective'){
      _goObjective(context);
    }
    else if(page=='Academics'){
      _goAcademics(context);
    }
    else if(page=='Skills'){
      _goSkills(context);
    }
    else if(page=='Interests'){
      _goInterests(context);
    }
    else if(page=='Projects'){
      _goProjects(context);
    }
    else if(page=='Experiences'){
      _goExperiences(context);
    }
    else if(page=='CoverLetter'){
      _goCoverLetter(context);
    }
    else if(page=='References'){
      _goReferences(context);
    }
  }


} */

