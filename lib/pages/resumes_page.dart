import 'package:cv_resume_project/pages/starting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class resumes_page extends ConsumerStatefulWidget {
  const resumes_page({Key? key}) : super(key: key);

  @override
  _resumes_page_State createState() => _resumes_page_State();
}

class _resumes_page_State extends ConsumerState<resumes_page> {

  bool isSaving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 8,
          title: const Text('Resumes',
              style: TextStyle(color: Colors.white70, fontSize: 20)),
          backgroundColor: Colors.indigo[800],
          centerTitle: true,
          toolbarHeight: 60,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20), top: Radius.circular(20)),
          ),
        ),
        body: const Center(),
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
         bottomNavigationBar: Container(
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
         ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
  void _goStartingPage(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return const starting_page();}
    ));
  }
}
