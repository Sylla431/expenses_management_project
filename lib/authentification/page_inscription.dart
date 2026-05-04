import 'package:expenses_management_project/authentification/page_de_connexion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Ecran d'inscription (version debutant).
// StatefulWidget est utile ici pour gerer l'etat local
// comme l'affichage du mot de passe.
class PageInscription extends StatefulWidget {
  const PageInscription({super.key});

  @override
  State<PageInscription> createState() => _PageInscriptionState();
}

class _PageInscriptionState extends State<PageInscription> {
  // Controllers = lecture et gestion des valeurs des champs du formulaire.
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Etat du champ mot de passe (masque/visible).
  bool _obscurePassword = true;

  @override
  void dispose() {
    // Nettoyage des controllers quand la page est detruite.
    _nomController.dispose();
    _prenomController.dispose();
    _telephoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Note: ScreenUtilInit est place dans `main.dart` (racine de l'app).
    // Ici, on utilise seulement les extensions .w / .h / .sp / .r.
    return Scaffold(
      // Structure principale de la page.
      appBar: AppBar(
        title: Text(
          'Inscription',
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Container(
        // Fond degrade leger.
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Color(0xFFF3F7FF), Color(0xFFFFFFFF)],
          ),
        ),
        child: ListView(
          // ListView pour rester scrollable sur petits ecrans.
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          children: <Widget>[
            // Icone d'entete.
            Center(
              child: CircleAvatar(
                radius: 38.r,
                backgroundColor: Colors.indigo.shade50,
                child: Icon(
                  Icons.app_registration_rounded,
                  size: 34.sp,
                  color: Colors.indigo,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            // Titre principal.
            Center(
              child: Text(
                'Creer un compte',
                style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 6.h),
            // Sous-titre explicatif.
            Center(
              child: Text(
                'Rejoignez votre espace de gestion des depenses',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700),
              ),
            ),
            SizedBox(height: 24.h),
            // Carte contenant tous les champs d'inscription.
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 16.r,
                    offset: Offset(0, 6.h),
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  // Nom + Prenom dans une meme ligne.
                  Row(
                    children: <Widget>[
                      Expanded(
                        // Expanded force chaque champ a prendre une largeur adaptee.
                        child: TextFormField(
                          controller: _nomController,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: 'Nom',
                            prefixIcon: const Icon(Icons.person_outline),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: TextFormField(
                          controller: _prenomController,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: 'Prenom',
                            prefixIcon: const Icon(Icons.person_2_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  // Champ telephone.
                  TextFormField(
                    controller: _telephoneController,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Telephone',
                      hintText: 'Ex: 0600000000',
                      prefixIcon: const Icon(Icons.phone_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  // Champ mot de passe avec bouton oeil.
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Mot de passe',
                      hintText: 'Au moins 6 caracteres',
                      prefixIcon: const Icon(Icons.lock_outline_rounded),
                      suffixIcon: IconButton(
                        onPressed: () {
                          // Toggle: affiche/masque le mot de passe.
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  // Bouton principal d'inscription.
                  SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                      ),
                      child: Text(
                        "S'inscrire",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 18.h),
            // Separateur visuel.
            Row(
              children: <Widget>[
                const Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    'Ou continuer avec',
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
                  ),
                ),
                const Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: 14.h),
            // Boutons de connexion sociale (UI de demonstration).
            Row(
              children: <Widget>[
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.facebook, size: 18.sp),
                    label: Text('Facebook', style: TextStyle(fontSize: 13.sp)),
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(double.infinity, 46.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.g_mobiledata_rounded, size: 22.sp),
                    label: Text('Google', style: TextStyle(fontSize: 13.sp)),
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(double.infinity, 46.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 18.h),
            // Lien pour retourner vers la page de connexion.
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Vous avez deja un compte ? ',
                  style: TextStyle(fontSize: 13.sp),
                ),
                GestureDetector(
                  onTap: () {
                    // pushReplacement evite d'empiler plusieurs ecrans auth.
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const PageDeConnexion(),
                      ),
                    );
                  },
                  child: Text(
                    'Connectez-vous',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.indigo,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
