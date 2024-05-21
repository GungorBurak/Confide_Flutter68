import 'package:flutter/material.dart';
import 'diary_page.dart';
import 'support_page.dart';
import 'learning_center_page.dart';
//import 'diary_page.dart';
import 'emergency_support_page.dart';
import 'workshop_events_page.dart';
import 'rights_page.dart';

void main() {
  runApp(ConfideApp());
}

class ConfideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(),
      routes: {
        '/summary': (context) => SummaryPage(),
        '/dashboard': (context) => DashboardPage(),
        '/support': (context) => SupportPage(),
        '/learning_center': (context) => LearningCenterPage(),
        '/diary': (context) => DiaryPage(),
        '/emergency_support': (context) => EmergencySupportPage(),
        '/workshop_events': (context) => WorkshopEventsPage(),
        '/rights': (context) => RightsPage(),
      },
      theme: ThemeData(
        primaryColor: Color(0xFF6721E4),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color(0xFF6721E4),
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: 18.0,
            color: Colors.black87,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
          ),
          bodyText2: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
          ),
          headline1: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6721E4),
            fontFamily: 'Montserrat',
          ),
          button: TextStyle(
            fontSize: 18.0,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Image.asset(
                'assets/confide_logo.png',
                height: 100,
              ),
            ),
            Center(
              child: Image.asset(
                'assets/welcome-01.png',
                height: MediaQuery.of(context).size.height * 0.5,
              ),
            ),
            Column(
              children: <Widget>[
                Text(
                  'Hoşgeldin!',
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'Bilgi ve Destek İçin Güvenli Alanınız',
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                textStyle: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/summary');
              },
              child: Text('Başlayalım'),
            ),
          ],
        ),
      ),
    );
  }
}

class SummaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Image.asset(
                'assets/confide_logo.png',
                height: 100,
              ),
            ),
            Column(
              children: <Widget>[
                Text(
                  'Confide Nedir?',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6721E4),
                    fontFamily: 'Montserrat',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Confide, Cinsel Sağlık ve Üreme Sağlığı ve Toplumsal Cinsiyete Dayalı Şiddet konularında size destek ve bilgiler sağlıyor. Yapay Zeka ile kimseye anlatamayacağınız sorunları paylaşabileceğiniz bir alan sunuyoruz. Öğrenin, düşüncelerinizi kaydedin ve acil iletişim bilgilerine ulaşın. Hepsi tek bir yerde.',
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Image.asset(
              'assets/unity-01.png',
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding:
                    EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                    textStyle: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Geri'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding:
                    EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                    textStyle: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/dashboard');
                  },
                  child: Text('İleri'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Image.asset(
                'assets/confide_logo.png',
                height: 80,
              ),
            ),
            SizedBox(height: 3),
            Image.asset(
              'assets/hello.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 3),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 200 / 120,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 20.0,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/support');
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Image.asset(
                        'assets/destekcim.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/learning_center');
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Image.asset(
                        'assets/ogrenme.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/diary');
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Image.asset(
                        'assets/gunluk.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/emergency_support');
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Image.asset(
                        'assets/acil.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/workshop_events');
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Image.asset(
                        'assets/etkinlik.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/rights');
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Image.asset(
                        'assets/haklar.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
