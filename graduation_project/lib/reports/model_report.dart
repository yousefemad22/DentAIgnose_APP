class ReportModel {
  final String name;
  final String gender;
  final String number;
  final String age;



  ReportModel ({
    required this.name,
    required this.gender,
    required this.number,
    required this.age,
  });
}
List<ReportModel>data=[

  ReportModel(
        name: 'Moahemd Ahmed', gender: 'Male', number: '0100856222', age: '25')
  ];

class Questions {
  final String question;
  final String answer;

  Questions({
    required this.question,
    required this.answer,
  });
}

List<Questions> info=[
  Questions(question: 'When have you been in pain?', answer: '15/3'),
  Questions(question: 'How did the pain start?', answer: '1Suddenly'),
  Questions(question: 'What type of pain do you have?', answer: 'Throbbing/Publsating'),

];
