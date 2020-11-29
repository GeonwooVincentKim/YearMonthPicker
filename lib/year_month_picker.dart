import 'package:flutter/material.dart';


class YearMonthPicker extends StatefulWidget {
  @override
  _YearMonthPickerState createState() => _YearMonthPickerState();
}

class _YearMonthPickerState extends State<YearMonthPicker> {
  final _formKey = GlobalKey<FormState>();
  String year, month;
  TextEditingController yController = TextEditingController();
  TextEditingController mController = TextEditingController();

  Widget _buildYMPAppBar(){
    return AppBar(
      title: Text("YearMonthPicker"),
      centerTitle: true,
      actions: [
        IconButton(icon: Icon(Icons.check), color: Colors.red, 
        onPressed: () => print("HI")),        
      ],
    );
  }

  yearPicker() {
    
  }

  Widget _buildYearPicker(){
    return GestureDetector(
      onTap: yearPicker,
      child: TextFormField(
        controller: yController,
        
      )
    );
  }

  Widget _buildMonthPicker(){
    return Container();
  }

  Widget _buildYMPBody(){
    return Container(
      padding: EdgeInsets.all(20.0),
      // color: Colors.black12,
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            _buildYearPicker(),
            SizedBox(height: 20),
            _buildMonthPicker(),
          ]
        )
      )
      
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildYMPAppBar(),
      body: _buildYMPBody(),
      // backgroundColor: Colors.white70,
      backgroundColor: Colors.white,
    );
  }
}