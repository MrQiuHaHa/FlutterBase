import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {

  List<String> _tags = [
    'Apple',
    'Banana',
    'Lemon'
  ];

  String _selectTag = 'None';

  List<String> _selectList = [];

  String _choice = 'Lemon';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: <Widget>[
                Chip(
                  label: Text('Life'),
                ),
                Chip(
                  label: Text('Sunset'),
                  backgroundColor: Colors.orange,
                ),
                Chip(
                  label: Text('JunRong'),
                  backgroundColor: Colors.yellow,
                  avatar: CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    child: Text('邱'),
                  ),
                ),
                Chip(
                  label: Text('TaoZi'),
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage('https://resources.ninghao.org/images/wanghao.jpg'),
                  ),
                ),
                Chip(
                  label: Text('JunRong'),
                  backgroundColor: Colors.blue,
                  avatar: CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    child: Text('邱'),
                  ),
                ),
                Chip(
                  label: Text('City'),
                  onDeleted: (){

                  },
                  // deleteIcon: Icon(Icons.delete),
                  // deleteIconColor: Colors.redAccent,
                  // deleteButtonTooltipMessage: 'Remove this tag',
                ),
                Divider(
                  color: Colors.grey[400],
                  height: 16,
                  // indent: 30,
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag){
                    return Chip(
                      label: Text(tag),
                      onDeleted: () {
                        setState(() {
                          _tags.remove(tag);
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.grey[400],
                  height: 16,
                  // indent: 30,
                ),
                Container(
                  width: double.infinity,
                  child: Text('ActionChip: $_selectTag'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag){
                    return ActionChip(
                      label: Text(tag),
                      onPressed: () {
                        setState(() {
                          _selectTag = tag;
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.grey[400],
                  height: 16,
                  // indent: 30,
                ),
                Container(
                  width: double.infinity,
                  child: Text('FilterChip: ${_selectList.toString()}'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag){
                    return FilterChip(
                      label: Text(tag),
                      selected: _selectList.contains(tag),
                      onSelected: (value) {
                        setState(() {
                          if (_selectList.contains(tag)) {
                            _selectList.remove(tag);
                          } else {
                            _selectList.add(tag);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.grey[400],
                  height: 16,
                  // indent: 30,
                ),
                Container(
                  width: double.infinity,
                  child: Text('ChoiceChip: $_choice'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag){
                    return ChoiceChip(
                      label: Text(tag),
                      selectedColor: Colors.black,
                      selected: _choice == tag,
                      onSelected: (value) {
                        setState(() {
                          _choice = tag;
                        });
                      },
                    );
                  }).toList(),
                ),

              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: (){
          setState(() {
            _tags = [
              'Apple',
              'Banana',
              'Lemon'
            ];
            _selectList = [];
            _choice = 'Lemon';
          });
        }
      ),
    );
  }
}