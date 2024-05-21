import 'package:flutter/material.dart';

class RightsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Haklarım'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Haklarım',
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Burada, cinsel sağlık, üreme sağlığı ve toplumsal cinsiyet temelli şiddet konularında bilmeniz gereken temel haklar hakkında bilgi bulabilirsiniz. Daha fazla bilgi için her bölümü genişletebilirsiniz.',
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            _buildRightsSection(
                context,
                'Cinsel Sağlık Hakları',
                'assets/sexual_health.png',
                'Cinsel sağlık hakları, bireylerin cinsel hayatlarında sağlıklı ve güvenli bir yaşam sürdürmelerini sağlamayı amaçlar.',
                'Cinsel sağlık hakları; bilgilendirilme, eğitim, sağlık hizmetlerine erişim ve ayrımcılıktan korunma haklarını içerir.'
            ),
            SizedBox(height: 20),
            _buildRightsSection(
                context,
                'Üreme Sağlığı Hakları',
                'assets/reproductive_health.png',
                'Üreme sağlığı hakları, bireylerin güvenli ve sağlıklı bir üreme yaşamına sahip olmalarını garanti altına alır.',
                'Üreme sağlığı hakları; doğum kontrol yöntemlerine erişim, güvenli gebelik ve doğum hizmetleri ve doğurganlıkla ilgili bilgilenme haklarını içerir.'
            ),
            SizedBox(height: 20),
            _buildRightsSection(
                context,
                'Toplumsal Cinsiyete Dayalı Şiddet',
                'assets/gender_based_violence.png',
                'Toplumsal cinsiyete dayalı şiddet, bireylerin cinsiyet kimlikleri nedeniyle maruz kaldıkları her türlü şiddeti ifade eder.',
                'Bu haklar, şiddetten korunma, şiddete maruz kalanların destek hizmetlerine erişimi ve adalete erişim haklarını içerir.'
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRightsSection(BuildContext context, String title, String imagePath, String description, String details) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  imagePath,
                  height: 50,
                  width: 50,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ) ?? TextStyle(
                      fontSize: 20.0,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                _showDetailsDialog(context, title, details);
              },
              child: Text('Daha fazla bilgi'),
            ),
          ],
        ),
      ),
    );
  }

  void _showDetailsDialog(BuildContext context, String title, String details) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(details),
          actions: <Widget>[
            TextButton(
              child: Text('Kapat'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
