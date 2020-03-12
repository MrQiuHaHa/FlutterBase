import 'package:flutter/material.dart';
import '../model/post.dart';



class PostDataSource extends DataTableSource {
  final List<Post> _posts = posts;
  int _selectedCount = 0;

  @override
  // TODO: implement rowCount
  int get rowCount => _posts.length;

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => _selectedCount;

  @override
  DataRow getRow(int index) {

    final Post post = _posts[index];
    // TODO: implement getRow
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(post.title)),
        DataCell(Text(post.author)),
        DataCell(Image.network(post.imageUrl)),
      ]
    );
  }

  void _sort(getField(post),bool ascending) {
    _posts.sort((a, b) {
      if (!ascending) {
        final c = a;
        a = b;
        b = c;
      }
      final aValue = getField(a);
      final bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }
}

class PanginateDataTableDemo extends StatefulWidget {
  @override
  _PanginateDataTableDemoState createState() => _PanginateDataTableDemoState();
}

class _PanginateDataTableDemoState extends State<PanginateDataTableDemo> {

  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  final PostDataSource _postDataSource = PostDataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTableDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            PaginatedDataTable(
              header: Text('Posts'),
              rowsPerPage: 5,
              source: _postDataSource,
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              // onSelectAll: (bool value) {

              // },
              columns: [
                DataColumn(
                  label: Container(
                    child: Text('Title'),
                    width: 60,
                  ),
                  onSort: (int columnIndex, bool ascending) {
                    _postDataSource._sort((post) => post.title.length,ascending);
                    setState(() {
                      _sortColumnIndex = columnIndex;
                      _sortAscending = ascending;
                    });
                  }
                ),
                DataColumn(
                  label: Text('Author')
                ),
                DataColumn(
                  label: Text('Image')
                )
              ], 
              
            ),
          ],
        ),
      ),
    );
  }
}