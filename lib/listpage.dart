import 'package:flutter/material.dart';
import 'package:homework/api/apiclient.dart';
import 'package:homework/reporsitories/store_reprository.dart';

import 'model/model.dart';

class MyListPage extends StatelessWidget {
  MyListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Text('Option 1'),
              ),
              Tab(
                icon: Text('Option 2'),
              ),
              Tab(
                icon: Text('Option 3'),
              ),
            ],
          ),
          centerTitle: true,
          title: const Text('SEARCH FILTER',
              style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 45, 241, 133),
        ),
        body: TabBarView(
          children: [
            ProductList(),
            ProductList(),
            ProductList(),
          ],
        ),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  ProductList({super.key});

  final List<int> number = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    final reporsitory = StoreReprository(ApiClient());

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: FutureBuilder(
          future: reporsitory.getProduct(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Erorr: ${snapshot.hasError}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Text('Data is Empty'),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) => MyModelList(
                        img: snapshot.data![index].image,
                        title: snapshot.data![index].title,
                        description: snapshot.data![index].description,
                      ));
            }
          }),
    );
  }
}
