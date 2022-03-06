import 'package:cv_resume_project/pages/personal_info_page.dart';
import 'package:cv_resume_project/pages/projects_page.dart';
import 'package:cv_resume_project/pages/references_page.dart';
import 'package:cv_resume_project/pages/skills_page.dart';
import 'package:cv_resume_project/pages/starting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'academics_page.dart';
import 'cover_letter_page.dart';
import 'experiences_page.dart';
import 'interests_page.dart';
import 'objective_page.dart';

class resume_builder_page extends StatefulWidget {
  const resume_builder_page({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<resume_builder_page> createState() => _resume_builder_pageState();
}

class _resume_builder_pageState extends State<resume_builder_page> {

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
            child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 30.0,),
             children : [
               Column(
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
        ]
            )
        ),
        floatingActionButton: Container(
            height: 80,
            width: 80,
          child:FittedBox(
          child:FloatingActionButton(
          onPressed: (){ _goStartingPage(context);},
          tooltip: 'BackStartingPage',
          child: const Icon(Icons.home,color: Colors.indigo,size: 35,),
          elevation: 10.0,
          backgroundColor: Colors.white
        )
          )
        ),
        bottomNavigationBar: buildMyNavBar(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

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
  void _goStartingPage(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return const starting_page();}
    ));
  }


}