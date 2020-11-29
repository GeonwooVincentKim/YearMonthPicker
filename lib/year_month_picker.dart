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
    final year = DateTime.now().year;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            '시작년도를 입력하세요',
            textAlign: TextAlign.center,
          ),
          content: Container(
            height: MediaQuery.of(context).size.height / 4.0,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[200],
            child: YearPicker(
              selectedDate: DateTime(year - 10),
              firstDate: DateTime(year - 10),
              lastDate: DateTime(year + 10),
              onChanged: (value) {
                yController.text = value.toString().substring(0, 4);
                Navigator.of(context).pop();
              },
            ),
          ),
        );
      },
    );
  }

  monthPicker(){
    final year = DateTime.now().year;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            '시작월을 입력하세요',
            textAlign: TextAlign.center,
          ),
          content: Container(
            height: MediaQuery.of(context).size.height / 3.0,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[200],
            child: MonthPicker(
              selectedDate: DateTime(year),
              firstDate: DateTime(year),
              lastDate: DateTime(year, 12),
              onChanged: (value) {
                mController.text = value.toString().split('-')[1];
                Navigator.of(context).pop();
              },
              selectableDayPredicate: (dateTime) {
                if (dateTime.month % 2 == 0 && dateTime.day == 25) {
                  return true;
                }
                return false;
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildYearPicker(){
    return Column(
      children: [
        GestureDetector(
          onTap: yearPicker,
          child: TextFormField(
            controller: yController,
            onSaved: (val){
              
            }
          )
        )
      ]
    );
  }

  Widget _buildMonthPicker(){
    return Column(
      children: [
        GestureDetector(
          onTap: yearPicker,
          child: TextFormField(
            controller: mController,
            
          )
        )
      ]
    );
  }

  Widget _buildYMPBody(){
    return Container(
      padding: EdgeInsets.all(20.0),
      // color: Colors.black12,
      child: Form(
        key: _formKey,
        child: Row(
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