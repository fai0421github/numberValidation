import 'package:checknumber/history.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'HK';
  PhoneNumber number = PhoneNumber(isoCode: 'HK');
  final _focusNode = FocusNode();
  final Map<String, bool> numberAry= new Map<String, bool>();
  String dialCode = '+852';

  @override
  void initState(){
    
    super.initState();
    numberAry.clear();
    _focusNode.addListener(() {
      print("Has focus: ${_focusNode.hasFocus}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Simple phone validation'),
        ),
        body: GestureDetector(
           behavior: HitTestBehavior.translucent,
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                formKey.currentState.validate();
                if(controller.text != null && controller.text != "" ){
                  setState(() {
                    this.numberAry.addAll({this.dialCode+controller.text:formKey.currentState.validate()});
                  });
                }
                //print(this.numberAry);
                currentFocus.unfocus();
              }
            },
            child: Form(
              key: formKey,
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InternationalPhoneNumberInput(
                      focusNode: _focusNode,
                      onInputChanged: (PhoneNumber number) {
                        print(number.phoneNumber);
                        setState(() {
                          if(this.dialCode != number.dialCode){
                              this.dialCode = number.dialCode;
                              print(this.dialCode);
                          }
                        });
                      },
                      onInputValidated: (bool value) {
                        //print(value);
                      },
                      selectorConfig: SelectorConfig(
                        selectorType: PhoneInputSelectorType.DROPDOWN,
                      ),
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: TextStyle(color: Colors.black),
                      initialValue: number,
                      textFieldController: controller,
                      formatInput: false,
                      autoFocus: false,
                      errorMessage: "Wrong phone number.",
                      keyboardType: TextInputType.number,
                      inputBorder: OutlineInputBorder(),
                      onSaved: (PhoneNumber number) {
                        print('On Saved: $number');
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print(this.numberAry);
                        formKey.currentState.save();
                          Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HistoryPage(numberAry: this.numberAry,)));
                      },
                      
                      child: Text('Save'),
                    ),
                  ],
                ),
              ),
            )));
  }

  @override
  void dispose() {
    this.numberAry.clear();
    controller?.dispose();
    super.dispose();
  }
}
