import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class WorkshopEventsPage extends StatefulWidget {
  @override
  _WorkshopEventsPageState createState() => _WorkshopEventsPageState();
}

class _WorkshopEventsPageState extends State<WorkshopEventsPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final Map<DateTime, List<String>> _events = {
    DateTime.utc(2024, 5, 20): ['Etkinlik: Sağlıklı Yaşam'],
    DateTime.utc(2024, 5, 22): ['Etkinlik: Konferans'],
    DateTime.utc(2024, 6, 5): ['Kontrol: Sağlık Kontrolü'],
  };

  List<String> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  void _addEvent(String title, DateTime date) {
    setState(() {
      if (_events[date] != null) {
        _events[date]!.add(title);
      } else {
        _events[date] = [title];
      }
    });
  }

  void _showAddEventDialog() {
    final _formKey = GlobalKey<FormState>();
    String _eventTitle = '';
    DateTime _eventDate = _focusedDay;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Etkinlik Oluştur'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Etkinlik Başlığı'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen bir etkinlik başlığı girin';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _eventTitle = value!;
                  },
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(Icons.calendar_today),
                  title: Text('Tarih: ${_eventDate.toLocal()}'.split(' ')[0]),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: _eventDate,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (pickedDate != null && pickedDate != _eventDate) {
                      setState(() {
                        _eventDate = pickedDate;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('İptal'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  _addEvent(_eventTitle, _eventDate);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Ekle'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atölye & Etkinlikler'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/activities.png',
              height: 100,
            ),
            SizedBox(height: 20),
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              eventLoader: _getEventsForDay,
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                markerDecoration: BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: _selectedDay == null || _getEventsForDay(_selectedDay!).isEmpty
                  ? Center(child: Text('Etkinlik yok'))
                  : ListView.builder(
                itemCount: _getEventsForDay(_selectedDay!).length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.event, color: Colors.blue),
                      title: Text(_getEventsForDay(_selectedDay!)[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddEventDialog,
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
