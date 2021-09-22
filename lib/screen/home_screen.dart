import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_huapcar/screen/home_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, vm, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Home Demo Home Page"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16),
                child: TextFormField(
                  maxLines: 1,
                  onChanged: (value) => vm.searchText = value,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.blue),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                    fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
                    filled: true,
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.blue.withOpacity(0.5)),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 18,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ...vm.textData
                          .map(
                            (e) => Text(e),
                          )
                          .toList(),
                    ],
                  ),
                ),
              ),
              if (vm.textData.length == 0)
                Expanded(
                  child: Container(
                    child: Text(
                      "No Data",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await vm.loadTextData();
            },
            tooltip: 'Load',
            child: Icon(vm.checkIcon == false ? Icons.file_download : Icons.refresh),
          ),
        );
      },
    );
  }
}
