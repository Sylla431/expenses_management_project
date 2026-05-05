import 'package:expenses_management_project/authentification/page_inscription.dart';
import 'package:expenses_management_project/accueil/page_accueil_depenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Ecran de connexion (version debutant).
// StatefulWidget est utilise car certains elements changent a l'ecran
// (checkbox "se souvenir de moi" et afficher/masquer mot de passe).
class PageDeConnexion extends StatefulWidget {
  const PageDeConnexion({super.key});

  @override
  State<PageDeConnexion> createState() => _PageDeConnexionState();
}

class _PageDeConnexionState extends State<PageDeConnexion> {
  // Controllers = recuperer/gerer le texte saisi dans les champs.
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Etats locaux de l'ecran.
  bool _rememberMe = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    // Toujours liberer les controllers pour eviter les fuites memoire.
    _telephoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Note: ScreenUtilInit est place dans `main.dart` (racine de l'app).
    // Ici, on utilise seulement les extensions .w / .h / .sp / .r.
    return Scaffold(
      // Structure de base d'un ecran Material.
      appBar: AppBar(
        title: Text(
          'Connexion',
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Container(
        // Petit fond degrade pour un rendu plus moderne.
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Color(0xFFF3F7FF), Color(0xFFFFFFFF)],
          ),
        ),
        child: ListView(
          // ListView permet d'eviter les debordements sur petits ecrans.
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          children: <Widget>[
            // Icône d'entete.
            Center(
              child: CircleAvatar(
                radius: 38.r,
                backgroundColor: Colors.indigo.shade50,
                child: Icon(
                  Icons.account_balance_wallet_rounded,
                  size: 36.sp,
                  color: Colors.indigo,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            // Titre principal.
            Center(
              child: Text(
                'Bienvenue',
                style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 6.h),
            // Sous-titre.
            Center(
              child: Text(
                'Connectez-vous a votre compte',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700),
              ),
            ),
            SizedBox(height: 24.h),
            // "Carte" qui contient le formulaire.
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
                  // Champ telephone.
                  TextFormField(
                    controller: _telephoneController,
                    keyboardType: TextInputType.phone,
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
                      hintText: '********',
                      prefixIcon: const Icon(Icons.lock_outline_rounded),
                      suffixIcon: IconButton(
                        onPressed: () {
                          // Change l'etat pour afficher/masquer le texte.
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
                  SizedBox(height: 8.h),
                  // Ligne options: se souvenir de moi + mot de passe oublie.
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (bool? value) {
                          // Mise a jour de la checkbox.
                          setState(() {
                            _rememberMe = value ?? false;
                          });
                        },
                      ),
                      Expanded(
                        child: Text(
                          'Se souvenir de moi',
                          style: TextStyle(fontSize: 13.sp),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Mot de passe oublie ?',
                          style: TextStyle(fontSize: 13.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  // Bouton principal de connexion.
                  SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: () {
                        // Pour la seance: on ouvre directement la page d'accueil.
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const PageAccueilDepenses(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                      ),
                      child: Text(
                        'Connexion',
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
            // Separateur visuel avant les boutons sociaux.
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
            // Connexion sociale (maquette UI pour le moment).
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
            // Lien vers la page d'inscription.
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Vous n'avez pas de compte ? ",
                  style: TextStyle(fontSize: 13.sp),
                ),
                GestureDetector(
                  onTap: () {
                    // Remplace l'ecran actuel pour ne pas empiler les pages.
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const PageInscription(),
                      ),
                    );
                  },
                  child: Text(
                    'Inscrivez-vous',
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
