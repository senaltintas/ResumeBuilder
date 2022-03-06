
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'cover_letter_page.dart';

class experiences_page extends ConsumerStatefulWidget{

  const experiences_page ({Key? key}):super (key:key);
  @override
  _experiences_page_State createState()=> _experiences_page_State();


}
class _experiences_page_State extends ConsumerState<experiences_page> {
  final Map<String, dynamic> entering = {};
  final _formKey = GlobalKey<FormState>();

  TextEditingController dateinput = TextEditingController();

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  bool isSaving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 8,
          title: const Text('Experiences',
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
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
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
                                label: const Text('Job Title'),
                              ),
                              onSaved: (newValue) {
                                entering['title'] = newValue;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(18),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white70,
                                  label: const Text('Company')),
                              onSaved: (newValue) {
                                entering['company'] = newValue;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(18),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white70,
                                  label: Text('City')),
                              onSaved: (newValue) {
                                entering['city'] = newValue;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),

                            TextFormField(
                              controller: dateinput,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(18),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  suffixIcon: const Icon(Icons.calendar_today),
                                  filled: true,
                                  fillColor: Colors.white70,
                                  label: Text('Start date')),
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2101));

                                if (pickedDate != null) {
                                  print(
                                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                  String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                                  print(
                                      formattedDate); //formatted date output using intl package =>  2021-03-16
                                  //you can implement different kind of Date Format here according to your requirement

                                  setState(() {
                                    dateinput.text =
                                        formattedDate; //set output date to TextField value.
                                  });
                                } else {
                                  print("Date is not selected");
                                }
                              },
                              onSaved: (newValue) {
                                entering['startDate'] = newValue;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: dateinput,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(18),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  suffixIcon: const Icon(Icons.calendar_today),
                                  filled: true,
                                  fillColor: Colors.white70,
                                  label: const Text('End date')),
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2101));

                                if (pickedDate != null) {
                                  print(
                                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                  String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                                  print(
                                      formattedDate); //formatted date output using intl package =>  2021-03-16
                                  //you can implement different kind of Date Format here according to your requirement

                                  setState(() {
                                    dateinput.text =
                                        formattedDate; //set output date to TextField value.
                                  });
                                } else {
                                  print("Date is not selected");
                                }
                              },
                              onSaved: (newValue) {
                                entering['endDate'] = newValue;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(18),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white70,
                                  label: const Text('Explanation')),
                              onSaved: (newValue) {
                                entering['explanation'] = newValue;
                              },
                            ),
                            const SizedBox(
                              height: 25,
                            ),

                                const SizedBox(width: 110,),
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
                                        _goCoverLetter(context);
                                      },
                                    )
                                ),
                          ]))
                ])));
  }
  void _goCoverLetter(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return const cover_letter_page();}
    ));
  }
}