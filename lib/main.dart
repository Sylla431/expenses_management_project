import 'package:expenses_management_project/authentification/page_de_connexion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const ExpensesTrainingApp());
}

class ExpensesTrainingApp extends StatelessWidget {
  const ExpensesTrainingApp({super.key});

  @override
  Widget build(BuildContext context) {
    // flutter_screenutil: on initialise UNE SEULE FOIS au niveau racine.
    // Ensuite, dans les ecrans, on utilise .w / .h / .sp / .r pour adapter.
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => MaterialApp(
        title: 'Expense Tracker - Debutant',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
        ),
        home: const PageDeConnexion(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

