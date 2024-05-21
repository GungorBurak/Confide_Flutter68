import 'package:flutter/material.dart';

class LearningCenterPage extends StatefulWidget {
  @override
  _LearningCenterPageState createState() => _LearningCenterPageState();
}

class _LearningCenterPageState extends State<LearningCenterPage> {
  // Eğitimler ve izleme oranları için örnek veri
  final List<Map<String, dynamic>> _courses = [
    {'title': 'Temel İlkyardım Eğitimi', 'progress': 0.75, 'image': 'assets/temelilkyardim.png'},
    {'title': 'Sağlıklı Yaşam Eğitimi', 'progress': 0.50, 'image': 'assets/saglikliyasam.png'},
    {'title': 'Sağlığımızı Koruyoruz Eğitimi', 'progress': 0.90, 'image': 'assets/saglık.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Öğrenme Merkezim'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/learning_center_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Eğitimler',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: _courses.length,
                  itemBuilder: (context, index) {
                    final course = _courses[index];
                    return Card(
                      color: Colors.blue.shade500,
                      child: ListTile(
                        title: Row(
                          children: [
                            Expanded(
                              child: Text(
                                course['title'],
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {

                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(40, 10),
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                foregroundColor: Colors.blueAccent,
                                backgroundColor: Colors.white,
                              ),
                              child: Text(
                                'İzle',
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                            ),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: LinearProgressIndicator(
                                    value: course['progress'],
                                    backgroundColor: Colors.lightBlueAccent,
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '${(course['progress'] * 100).toInt()}% İzlendi',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                        leading: SizedBox(
                          width: 100,
                          height: 250,
                          child: Image.asset(
                            course['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
