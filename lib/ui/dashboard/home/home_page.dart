import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../service/authprovider.dart';
import 'homepageprovider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<HomePageProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    p.fetchData(authProvider.responselogin.token, authProvider.responselogin.id);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Consumer<HomePageProvider>(
          builder: (context, dataProvider, child) {
            if (dataProvider.data != null) {
              // Access and display the data here
              return Column(
                children: [
                  Text('Title: ${dataProvider.data!.dtContent![0].category}'),
                  Text('Description: ${dataProvider.data!.dtContent![0].companyName}'),
                  // Display other data fields as needed
                ],
              );
            } else {
              return CircularProgressIndicator(); // or any loading indicator
            }
          },
        ),
      ),
    );
  }
}
