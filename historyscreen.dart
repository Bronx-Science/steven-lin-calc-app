import 'package:flutter/material.dart';
import 'historymanager.dart';
import 'historyrecord.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculation History'),
      ),
      body: FutureBuilder<List<HistoryRecord>>(
        future: loadHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('No history found');
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final record = snapshot.data![index];
              return ListTile(
                title: Text('Original: ${record.originalAmount} for ${record.originalServing} servings'),
                subtitle: Text('New: ${record.newAmount} for ${record.desiredServing} servings'),
              );
            },
          );
        },
      ),
    );
  }
}
