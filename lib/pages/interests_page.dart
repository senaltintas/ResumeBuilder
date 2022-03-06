import 'package:cv_resume_project/pages/projects_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class interests_page extends ConsumerStatefulWidget{

  const interests_page ({Key? key}):super (key:key);
  @override
  _interests_page_State createState()=> _interests_page_State();


}
class _interests_page_State extends ConsumerState<interests_page> {
  final Map<String, dynamic> entering = {};
  final _formKey = GlobalKey<FormState>();

  bool isSaving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 8,
          title: const Text('Interests',
              style: TextStyle(color: Colors.white70, fontSize: 20)),
          backgroundColor: Colors.indigo[800],
          centerTitle: true,
          toolbarHeight: 60,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20), top: Radius.circular(20)),
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
                                  hintText: "for ex. photography",
                                  filled: true,
                                  fillColor: Colors.white70,
                                  label: const  Text('Hobby')),
                              onSaved: (newValue) {
                                entering['interest'] = newValue;
                              },
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
                                        _goProjects(context);
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
  void _goProjects(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return const projects_page();}
    ));
  }


}