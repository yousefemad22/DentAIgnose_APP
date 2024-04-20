
//Model
class Message {
  final String name;
  final String dateSend;
  final String time;

  Message({
    required this.name,
    required this.dateSend,
    required this.time,
  });
}

//ViewModel
class MessageViewModel {
  final Map<String, List<Message>>data = {
    'Today': [
      Message(name: 'Moahemd Ahmed', dateSend: '4/4/2024', time: '8:25 PM'),
      Message(name: 'Ahmed Ali', dateSend: '2/4/2024', time: '8:00 AM'),


    ],
    'Yesterday': [
      Message(name: 'Ahmed Ali', dateSend: '2/4/2024', time: '8:00 AM'),
      Message(name: 'Hassan Ali', dateSend: '2/4/2024', time: '7:25 PM'),

    ],
    '22/1/2023': [
      Message(name: 'Moahemd Ahmed', dateSend: '4/4/2024', time: '8:25 PM'),
      Message(name: 'Ahmed Ali', dateSend: '2/4/2024', time: '8:00 AM'),


    ],

  };
}

