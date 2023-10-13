import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SelectionListScreen(),
    );
  }
}

class SelectionListScreen extends StatefulWidget {
  @override
  _SelectionListScreenState createState() => _SelectionListScreenState();
}

class _SelectionListScreenState extends State<SelectionListScreen> {
  List<ItemModel> items = List.generate(5, (index) => ItemModel(index, false));
  int selectedCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selection Screen'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item ${items[index].id+1}'),
            tileColor: items[index].selected ? Colors.blue : null,
            onLongPress:  () {
              setState(() {
                items[index].selected = !items[index].selected;
                if (items[index].selected) {
                  selectedCount++;
                } else {
                  selectedCount--;
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showSelectionDialog();
        },
        child: Icon(Icons.check),
      ),
    );
  }

  void _showSelectionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Selected Items'),
          content: Text('Number of Selected Items: $selectedCount'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class ItemModel {
  final int id;
  bool selected;
  ItemModel(this.id, this.selected);
}
