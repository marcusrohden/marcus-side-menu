import 'package:flutter/material.dart';

import 'internal_side_card_widget.dart';

class SideMenuWidget extends StatefulWidget {
  final Widget backgroundChild;
  final List<Widget> menuItems;
  SideMenuWidget({@required this.backgroundChild, @required this.menuItems});

  @override
  _SideMenuWidgetState createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  bool isMaximised = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> _listInternalMenuItems = widget.menuItems
        .map((element) => (!isMaximised
            ? InternalSideCardWidget(isMaximised: isMaximised, child: element)
            : GestureDetector(
                onTap: () {
                  print('Tap Maximised Container');
                  showFocusCard();
                },
                child: InternalSideCardWidget(
                    isMaximised: isMaximised, child: element))))
        .toList();

    return Stack(
      children: <Widget>[
        // The containers in the background
        GestureDetector(
          child: widget.backgroundChild,
          onTap: () {
            if (isMaximised) {
              setState(() {
                isMaximised = false;
              });
            }
          },
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            child: new Container(
                color: Colors.transparent,
                child: GestureDetector(
                    onTap: () {
                      print('Tap disMaximised Container');
                      setState(() {
                        if (isMaximised) {
                          isMaximised = false;
                        } else {
                          isMaximised = true;
                        }
                      });
                    },
                    child: SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _listInternalMenuItems)))),
          ),
        )
      ],
    );
  }

  Future showFocusCard() async {
    await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                content: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Text('Oi oi oi '),
                      Text('Oi oi oi '),
                      Text('Oi oi oi '),
                      Text('Oi oi oi '),
                      Text('Oi oi oi '),
                      Text('Oi oi oi '),
                      Text('Oi oi oi '),
                      Text('Oi oi oi '),
                      Text('Oi oi oi '),
                      Text('Oi oi oi '),
                    ],
                  ),
                ),
                actions: <Widget>[
                  Container(
                    width: 200,
                    color: Colors.blue,
                  ),
                ],
              );
            },
          );
        });
  }
}
