import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Modele simple pour representer une depense.
class Depense {
  const Depense({
    required this.titre,
    required this.categorie,
    required this.montant,
    required this.date,
  });

  final String titre;
  final String categorie;
  final double montant;
  final String date;
}

class PageAccueilDepenses extends StatelessWidget {
  const PageAccueilDepenses({super.key});

  // Donnees mockees pour la seance (niveau debutant).
  static const List<Depense> _depenses = <Depense>[
    Depense(
      titre: 'Courses alimentaires',
      categorie: 'Alimentation',
      montant: 45.90,
      date: '05/05/2026',
    ),
    Depense(
      titre: 'Taxi',
      categorie: 'Transport',
      montant: 12.50,
      date: '04/05/2026',
    ),
    Depense(
      titre: 'Recharge internet',
      categorie: 'Abonnement',
      montant: 20.00,
      date: '03/05/2026',
    ),
    Depense(
      titre: 'Cafe coworking',
      categorie: 'Loisirs',
      montant: 6.75,
      date: '03/05/2026',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final double totalDepenses = _depenses.fold<double>(
      0,
      (double total, Depense depense) => total + depense.montant,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mes depenses',
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: <Widget>[
          // Carte resume (total du mois en cours).
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Total depenses',
                  style: TextStyle(color: Colors.white70, fontSize: 13.sp),
                ),
                SizedBox(height: 6.h),
                Text(
                  '${totalDepenses.toStringAsFixed(2)} EUR',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 18.h),
          Text(
            'Liste des transactions',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 10.h),
          // Liste des depenses.
          ..._depenses.map((Depense depense) {
            return Card(
              elevation: 1.5,
              margin: EdgeInsets.only(bottom: 10.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.indigo.shade50,
                  child: Icon(Icons.payments_outlined, color: Colors.indigo),
                ),
                title: Text(
                  depense.titre,
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  '${depense.categorie} • ${depense.date}',
                  style: TextStyle(fontSize: 12.sp),
                ),
                trailing: Text(
                  '- ${depense.montant.toStringAsFixed(2)} EUR',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.red.shade700,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
