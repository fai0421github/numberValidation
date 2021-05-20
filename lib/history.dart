import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final Map<String, bool> numberAry;

  HistoryPage({Key key, this.numberAry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text("History"),
          centerTitle: true,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
        body: ListView.builder(
            itemCount: numberAry.length,
            itemBuilder: (BuildContext context, int index) {
              String key = numberAry.keys.elementAt(index);
              bool status = numberAry[key];
              return Container(
                height: 50,
                margin: EdgeInsets.all(2),
                color: status ? Colors.green : Colors.red,
                child: Center(
                    child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          key,
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                        status?Icon( Icons.check):Icon(Icons.close)
                      ],
                    )
                  ],
                )),
              );
            }));
  }
}
