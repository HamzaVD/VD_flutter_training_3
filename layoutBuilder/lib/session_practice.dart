import 'package:flutter/material.dart';

class MasterDetailPage extends StatefulWidget {
  @override
  _MasterDetailPageState createState() => _MasterDetailPageState();
}

class _MasterDetailPageState extends State<MasterDetailPage> {
  var value = 0;
  @override
  Widget build(BuildContext context) => _buildLayoutWithMediaQuery();

  Widget _buildLayout(var isLargeScreen) {
    return Row(
      children: [
        Expanded(
            child: ListWidget(15, (value) {
          this.value = value;
          if (isLargeScreen)
            setState(() {});
          else
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => DetailWidget(value)));
        })),
        isLargeScreen ? Expanded(child: DetailWidget(value)) : Container()
      ],
    );
  }

  Widget _buildLayoutWithMediaQuery() =>
      _buildLayout(MediaQuery.of(context).size.width > 600);

  Widget _buildLayoutWithLayoutBuilder() => LayoutBuilder(
      builder: (context, constraints) =>
          _buildLayout(constraints.maxWidth > 600));

  Widget _buildLayoutWithOrientationBuilder() => OrientationBuilder(
      builder: (context, orientation) =>
          _buildLayout(orientation == Orientation.landscape));
}

typedef ItemSelectedCallBack(int value);

class ListWidget extends StatelessWidget {
  final int count;
  final ItemSelectedCallBack onItemSelected;
  ListWidget(this.count, this.onItemSelected);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
              child: InkWell(
            onTap: () => onItemSelected(position),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    position.toString(),
                    style: TextStyle(fontSize: 32.0),
                  )
                ],
              ),
            ),
          )),
        );
      },
      itemCount: count,
    );
  }
}

class DetailWidget extends StatelessWidget {
  final int number;

  DetailWidget(this.number);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      child: Text(
        number.toString(),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class FittedBoxExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          width: 200,
          height: 200,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text("VentureDive"),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              shape: BoxShape.rectangle,
              color: Colors.redAccent),
        ),
      );
}

class AspectRatioExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: AspectRatio(
            aspectRatio: 16 / 9, child: Container(color: Colors.red)),
      );
}

class ExpandedExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: Container(
              width: 100,
              color: Colors.red,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: 100,
              color: Colors.blue,
            ),
          ),
          Expanded(
            child: Container(
              width: 100,
              color: Colors.green,
            ),
          )
        ],
      );
}
