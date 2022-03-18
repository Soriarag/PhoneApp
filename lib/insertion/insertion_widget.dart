import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class InsertionWidget extends StatefulWidget {
  const InsertionWidget({Key key}) : super(key: key);

  @override
  _InsertionWidgetState createState() => _InsertionWidgetState();
}

class _InsertionWidgetState extends State<InsertionWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF061627),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 24,
          ),
        ),
        title: Text(
          'Insertion sort',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Lexend Deca',
                color: FlutterFlowTheme.of(context).customColor1,
                fontSize: 40,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Color(0xFF010C17),
      body: Container(
        width: 1300,
        height: 650,
        decoration: BoxDecoration(
          color: Color(0xFF000D11),
        ),
      ),
    );
  }
}
