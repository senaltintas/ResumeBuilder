import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'experiences_page.dart';

class projects_page extends ConsumerStatefulWidget{

  const projects_page ({Key? key}):super (key:key);
  @override
  _projects_page_State createState()=> _projects_page_State();


}
class _projects_page_State extends ConsumerState<projects_page> {
  final Map<String, dynamic> entering = {};
  final _formKey = GlobalKey<FormState>();

  bool isSaving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          elevation: 8,
          title: const Text('Projects',style: TextStyle(color:Colors.white70, fontSize: 20)),
          backgroundColor:Colors.indigo[800] ,
          centerTitle: true,
          toolbarHeight: 60,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
                top: Radius.circular(20)
            ),
          ),
        ),
        body: SafeArea(
            child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 18.0),
                children : [

                  Form(
                      key: _formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.stretch,

                          children: [

                            TextFormField(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(18),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true,
                                fillColor: Colors.white70,
                                label: const Text('Project Name'),
                              ),
                              onSaved: (newValue){
                                entering['projectName'] =newValue;
                              },
                            ),

                            const SizedBox(height: 16,),
                            Container(
                              child: TextFormField(
                                style: const TextStyle(
                                  height: 2,
                                ),
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(18),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white70,
                                    label: const Text('Explanation')
                                ),
                                onSaved: (newValue){
                                  entering['explanation'] =newValue;
                                },
                              ),
                            ),
                            const SizedBox(height: 16,),
                            TextFormField(
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(18),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white70,
                                  label: const Text('Link')
                              ),
                              onSaved: (newValue){
                                entering['link'] =newValue;
                              },
                            ),

                            const SizedBox(height: 25,),

                                SizedBox(
                                    height: 50,
                                    width: 150,
                                    child: ElevatedButton(
                                      child: const Text('Next'),
                                      style: ButtonStyle(
                                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                          backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo),
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(18.0),
                                                  side: const BorderSide(color: Colors.indigo)
                                              )
                                          )
                                      ),
                                      onPressed: () {
                                        _goExperiences(context);
                                      },
                                    )
                                ),
                              ],
                            ),

                  )
                ]
            )
        )
    );
  }
  void _goExperiences(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return const experiences_page();}
    ));
  }

}