import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyPageState();
}

class MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 25.0), title: Text('1')),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 25.0), title: Text('2')),
          BottomNavigationBarItem(
              icon: Icon(Icons.mail, size: 25.0), title: Text('3')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, size: 25.0), title: Text('4')),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return new CupertinoTabView(
          builder: (BuildContext context) {
            return NextView(
              index: index,
            );
          },
        );
      },
    );
  }
}

class NextView extends StatelessWidget {
  final int index;
  final int pageNumber;

  const NextView({
    Key key,
    @required this.index,
    this.pageNumber = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${index + 1}-$pageNumber"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("push"),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return NextView(
                    index: index,
                    pageNumber: pageNumber + 1,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
