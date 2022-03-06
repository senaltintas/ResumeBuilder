import 'package:cv_resume_project/pages/resume_builder_page.dart';
import 'package:cv_resume_project/pages/resumes_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class starting_page extends StatefulWidget {
  //ACILIS SAYFASI
  const starting_page({Key? key}) : super(key: key);
  @override
  _starting_pageState createState() => _starting_pageState();
}

class _starting_pageState extends State<starting_page> {


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
                                child: const Text('My Resumes'),
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
                                  _goResumesPage(context);
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
  void _goResumesPage(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return const resumes_page();}
    ));
  }
}