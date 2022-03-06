import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'interests_page.dart';

class skills_page extends ConsumerStatefulWidget{

  const skills_page ({Key? key}):super (key:key);
  @override
  _skills_page_State createState()=> _skills_page_State();


}
class _skills_page_State extends ConsumerState<skills_page> {
  final Map<String, dynamic> entering = {};
  final _formKey = GlobalKey<FormState>();

  bool isSaving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          elevation: 8,
          title: const Text('Skills',style: const TextStyle(color:Colors.white70, fontSize: 20)),
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
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 18.0),
                children: [
                  Form(
                      key: _formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 25, horizontal: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),

                                  hintStyle: TextStyle(color: Colors.grey[800]),
                                  hintText: "for ex. java",
                                  filled: true,
                                  fillColor: Colors.white70,
                                  label: const  Text('Skill')),
                              onSaved: (newValue) {
                                entering['skills'] = newValue;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            DropdownButtonFormField(
                                items: const[
                                  DropdownMenuItem(
                                    child: Text('Beginner'),
                                    value: "b",

                                  ),
                                  DropdownMenuItem(
                                    child: Text('Intermediate'),
                                    value: "i",

                                  ),
                                  DropdownMenuItem(
                                    child: Text('Advanced'),
                                    value: "a",

                                  ),
                                ],
                                value: entering['level'],
                                onChanged: (value){
                                  setState(() {
                                    entering['level']=value;
                                  });
                                },
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(18),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white70,
                                  label: const Text('Level')
                              ),
                            ),
                            const SizedBox(height: 25,),

                                SizedBox(
                                    height: 50,
                                    width: 150,
                                    child: ElevatedButton(
                                      child: const Text('Next'),
                                      style: ButtonStyle(
                                          foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                          backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.indigo),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(18.0),
                                                  side: const BorderSide(
                                                      color: Colors.indigo)))),
                                      onPressed: () {
                                        _goInterests(context);
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
  void _goInterests(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return const interests_page();}
    ));
  }
}