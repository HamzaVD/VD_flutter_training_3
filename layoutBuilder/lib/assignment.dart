import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AssignmentPage extends StatefulWidget {
  _AssignmentPageState createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {
  Widget _buildLayoutWithMediaQuery() =>
      _buildLayout(MediaQuery.of(context).size.width > 600);

  Widget _buildLayoutWithLayoutBuilder() => LayoutBuilder(
      builder: (context, constraints) =>
          _buildLayout(constraints.maxWidth > 600));

  Widget _buildLayoutWithOrientationBuilder() => OrientationBuilder(
      builder: (context, orientation) =>
          _buildLayout(orientation == Orientation.landscape));

  Widget _buildLayout(bool isLargeScreen) {
    return Scaffold(
      appBar: AppBar(),
      drawer: isLargeScreen ? null : myDrawer(),
      body: Row(
        children: [
          isLargeScreen ? myDrawer() : Container(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).devicePixelRatio * 40,
                      child: Icon(
                        Icons.person,
                        size: MediaQuery.of(context).devicePixelRatio * 40,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "VentureDive",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        shape: BoxShape.rectangle,
                        color: Colors.blue),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget myDrawer() {
    return Drawer(
      child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Card(
                child: ListTile(title: Text("List Item $index")),
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) => _buildLayoutWithMediaQuery();
}
