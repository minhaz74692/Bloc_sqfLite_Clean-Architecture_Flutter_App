// import 'package:bloc_sqlite_app/db_helper.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final dbHelper = DatabaseHelper.instance;

//   void createItem() async {
//     final id = await dbHelper.createItem({
//       'name': 'Sample Item',
//       'description': 'This is a sample item',
//     });
//     print('Inserted item with id: $id');
//   }

//   void readAllItems() async {
//     final items = await dbHelper.readAllItems();
//     items.forEach((item) {
//       print(item);
//     });
//   }

//   void updateItem(int id) async {
//     final rowsAffected = await dbHelper.updateItem(id, {
//       'name': 'Updated Item',
//       'description': 'This item has been updated',
//     });
//     print('Updated $rowsAffected item(s)');
//   }

//   void deleteItem(int id) async {
//     final rowsDeleted = await dbHelper.deleteItem(id);
//     print('Deleted $rowsDeleted item(s)');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('SQLite CRUD Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: createItem,
//               child: Text('Create Item'),
//             ),
//             ElevatedButton(
//               onPressed: readAllItems,
//               child: Text('Read All Items'),
//             ),
//             ElevatedButton(
//               onPressed: () => updateItem(1),
//               child: Text('Update Item'),
//             ),
//             ElevatedButton(
//               onPressed: () => deleteItem(1),
//               child: Text('Delete Item'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Upper Code is for Flutter sqLite

// Below Code is for Clean Architechture
import 'package:flutter/material.dart';
import 'features/counter/presentation/pages/counter_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/counter/presentation/bloc/counter_bloc.dart';
import 'features/counter/data/repositories/counter_repository_impl.dart';
import 'features/counter/domain/usecases/increment_counter.dart';
import 'features/counter/domain/usecases/decrement_counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(
        incrementCounter: IncrementCounter(CounterRepositoryImpl()),
        decrementCounter: DecrementCounter(CounterRepositoryImpl()),
      ),
      child: MaterialApp(
        title: 'Clean Architecture Counter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CounterPage(),
      ),
    );
  }
}
