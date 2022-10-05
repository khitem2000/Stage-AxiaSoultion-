// ignore_for_file: empty_constructor_bodies

import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'model/Project.dart';
class MyTest extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    // return FormFieldState();
    return MyTestState();

  }
}

class MyTestState extends State<MyTest> {

  String projet="";
  String type="";
  String colo="";
  String val="";
  // DatePicker datePicker;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  get formData => null;


  Widget _buildName() {

    return TextFormField(

      decoration: const InputDecoration(labelText: 'D_Code'),
      // maxLength: 10,
      validator: ( value) {
        if (value == null || value.isEmpty){
          return 'Projet is Required';
        }

        return null;
      },
      onChanged: (String value) {
        formData["D_Code"] = value;
      },
      onSaved: ( value) {
        formData["D_Code"] = value;
      },
    );
  }
  Widget _buildcolo() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'EMP_Code'),
      maxLength: 10,
      validator: ( value) {
        if (value == null || value.isEmpty){
          return 'Coloaborateur is Required';
        }

        return null;
      },
      onChanged: (String value) {
        formData["EMP_Code"] = value;
      },
      onSaved: ( value) {
        formData["EMP_Code"] = value;
      },
    );
  }
  Widget _buildEmail() {
    return TextFormField(
      style: const TextStyle(color: Colors.black),

      decoration: const InputDecoration(labelText: 'D_Intitule'),
      validator: (value) {
        if(value == null || value.isEmpty) {
          return 'type is Required';
        }


      },
      onChanged: (String value) {
        formData["D_Intitule"] = value;
      },
      onSaved: ( value) {
        formData["D_Intitule"] = value;
      },
    );
  }
  Widget _builddate() => DateTimePicker(
    type: DateTimePickerType.dateTimeSeparate,
    dateMask: 'd MMM, yyyy',
    initialValue: DateTime.now().toString(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
    icon: Icon(Icons.event),
    dateLabelText: 'Date',
    timeLabelText: "Hour",
    selectableDayPredicate: (date) {
      // Disable weekend days to select from the calendar
      if (date.weekday == 6 || date.weekday == 7) {
        return false;
      }

      return true;
    },
    onChanged: (val) => print(val),
    validator: (val) {
      print(val);
      return null;
    },
    onSaved: (val) => print(val),
  );

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Liste")),
      body: SingleChildScrollView(
        child: Container(
          //padding: const EdgeInsets.only(left: 25, top: 150),
         // height: 152,
          //width: 330,
          //decoration: const BoxDecoration(
          //  image: DecorationImage(
           //     image: AssetImage('assets/aa.png')),

         // ),

          margin: const EdgeInsets.all(9.1),

          child:Form(

            key: _formKey,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                _buildName(),
                _buildEmail(),
                _buildcolo(),
                _builddate(),
                const SizedBox(height: 20),

                ElevatedButton(
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      return;
                    }

                    _formKey.currentState?.save();

                    print(projet);
                    print(type);
                   // print(D_Intitule);
                    print(val);



                    //Send to API
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );

  }
}

