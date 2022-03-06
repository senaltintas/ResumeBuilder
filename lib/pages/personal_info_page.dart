
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:cv_resume_project/model/personal_info.dart';

import 'objective_page.dart';

class personal_info_page extends ConsumerStatefulWidget{

  const personal_info_page ({Key? key}):super (key:key);
  @override
  _personal_info_page_State createState()=> _personal_info_page_State();


}
class _personal_info_page_State extends ConsumerState<personal_info_page> {
  final Map<String, dynamic> entering = {};
  final _formKey = GlobalKey<FormState>();
  TextEditingController dateinput = TextEditingController();

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  bool isSaving = false;
  final controller = TextEditingController();
  personal_info pi = personal_info("", "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          elevation: 8,
          title: const Text('Personal Info',style: TextStyle(color:Colors.white70, fontSize: 20)),
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
                            controller: controller,
                              decoration: InputDecoration(
                               contentPadding: const EdgeInsets.all(18),
                               border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10),


                               ),
                               filled: true,
                               fillColor: Colors.white70,

                                  label: Text('Name'),
                              ),

                           onSaved: (newValue){
                             pi.name= controller.text;
                           entering['name'] =newValue;
                           },

                          ),

                        const SizedBox(height: 15,),
                        TextFormField(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(18),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor: Colors.white70,
                              label: const Text('Surname')
                          ),
                          onSaved: (newValue){
                            entering['surname'] =newValue;
                          },
                        ),
                        const SizedBox(height: 15,),
                        TextFormField(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(18),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor: Colors.white70,
                              label: const Text('Eposta')
                          ),
                          onSaved: (newValue){
                            entering['eposta'] =newValue;
                          },
                        ),
                        const SizedBox(height: 15,),

                        TextFormField(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(18),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor: Colors.white70,
                              label: const Text('Phone Number')
                          ),
                          onSaved: (newValue){
                            entering['phoneNumber'] =newValue;
                          },
                        ),
                        const SizedBox(height: 15,),
                        TextFormField(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(18),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor: Colors.white70,
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              hintText: "for ex. Istanbul",
                              label: const Text('City')
                          ),
                          onSaved: (newValue){
                            entering['city'] =newValue;
                          },
                        ),
                        const SizedBox(height: 15,),
                        TextFormField(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(18),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor: Colors.white70,
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              hintText: "for ex. Kadıköy",
                              label: const Text('District')
                          ),
                          onSaved: (newValue){
                            entering['district'] =newValue;
                          },
                        ),
                        const SizedBox(height: 15,),
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
                              label: Text('Birth date')
                          ),
                          readOnly: true,
                          onTap: () async{
                            DateTime? pickedDate = await showDatePicker(
                                context: context, initialDate: DateTime.now(),
                                firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2101)
                            );

                            if(pickedDate != null ){
                              print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(formattedDate); //formatted date output using intl package =>  2021-03-16
                              //you can implement different kind of Date Format here according to your requirement

                              setState(() {
                                dateinput.text = formattedDate; //set output date to TextField value.
                              });
                            }else{
                              print("Date is not selected");
                            }
                          },
                          onSaved: (newValue){
                            entering['birthDate'] =newValue;
                          },
                        ),
                        const SizedBox(height: 15,),
                        TextFormField(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(18),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor: Colors.white70,
                              label: const Text('Linkedin')
                          ),
                          onSaved: (newValue){
                            entering['linkedin'] =newValue;
                          },
                        ),
                        const SizedBox(height: 15,),
                        TextFormField(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(18),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor: Colors.white70,
                              label: const Text('Github')
                          ),
                          onSaved: (newValue){
                            entering['github'] =newValue;
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
                                    _goObjective(context);
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
  void _goObjective(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return const objective_page();}
    ));
  }

}