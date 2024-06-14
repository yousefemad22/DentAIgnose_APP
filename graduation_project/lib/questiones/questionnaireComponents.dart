final List<Map<String, dynamic>> questions = [
  {
    'question': 'How did the pain start?',
    'answers': ['Suddenly', 'Gradual', 'Insidious'],
  },
  {
    'question': 'What type of pain do you have?',
    'answers': [
      'Throbbing / Pulsating',
      'Electric / Sharp Shooting',
      'Interfere with work / sleep'
    ],
  },
  {
    'question': 'Choose which category might increase your pain?',
    'answers': ['Chewing', 'Hot drinks', 'Cold drinks', 'Sweets'],
  },
  {
    'question': 'For how long does the pain last when you get exposed ?',
    'answers': ['Minutes', 'Seconds'],
  },
  {
    'question': 'Are there any associate phenomena like?',
    'answers': ['Headache', 'Swelling', 'Numbness'],
  },
  {
    'question': 'Could you specify the exact area that is affected?',
    'answers': ['Upper left', 'Upper right', 'Lower left', 'Lower right'],
  },
  {
    'question': 'How many sides does the pain affect?',
    'answers': ['Uni-lateral (one side)', 'Bi-lateral (two sides)'],
  },
  {
    'question': 'In what way does the pain spread?',
    'answers': [
      'Progressive',
      'Regressive',
      'Recurrent',
      'Intermittent',
      'Remission and Exacerbation'
    ],
  },
];

var choicesMap = {
  "Insidious": "patient's pain started insidiously",
  "Gradual": "patient's pain started gradually",
  "Suddenly": "patient's pain started suddenly",
  "Throbbing / Pulsating": "and he's having a throbbing pain type,",
  "Electric / Sharp Shooting":
      "and he's having a electric pain type, so he might need a new restoration refill,",
  "Interfere with work / sleep":
      "and he's having a interferWithWork pain type,",
  "Chewing":
      "it also gets worse when chewing so there may be a high spot-on restoration",
  "Cold drinks": "it also gets worse while having cold drinks",
  "Hot drinks": "it also gets worse while having hot drinks",
  "Sweets": "it also gets worse while eating sweets",
  "Seconds": "the pain lasts for seconds",
  "Minutes": "the pain lasts for minutes",
  "Headache": "pain is accompanied by headache",
  "Numbness":
      "pain is accompanied by numbness, so there might be a probability of an existing tumor",
  "Swelling": "pain is accompanied by swelling",
  "Upper left": "his chief complaint happens to be at the upper-Left",
  "Upper right": "his chief complaint happens to be at the upper-Right",
  "Lower left": "his chief complaint happens to be at the lower-Left",
  "Lower right": "his chief complaint happens to be at the lower-Right",
  "Uni-lateral (one side)": "and it has a unilateral distribution.",
  "Bi-lateral (two sides)": "and it has a bilateral distribution.",
  "Progressive": "and it spreads progressively",
  "Regressive": "and it spreads regressively",
  "Recurrent": "and it spreads recurrently",
  "Intermittent": "and it spreads intermittently",
  "Remission and Exacerbation": "and it spreads in a remission way"
};