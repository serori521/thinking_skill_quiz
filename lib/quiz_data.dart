class Quiz {
  final String question;
  final List<String> options;
  final String answer;
  final String explanation;

  Quiz(
      {required this.question,
      required this.options,
      required this.answer,
      required this.explanation});
}

final List<Quiz> quizzes = [
  Quiz(
    question:
        '赤い帽子をかぶった人は必ず青い靴を履いています。青い靴を履いている人は必ず緑のシャツを着ています。赤い帽子をかぶった人は何色のシャツを着ていますか？',
    options: ['赤色', '青色', '緑色', '黄色'],
    answer: '緑色',
    explanation: '赤い帽子 → 青い靴 → 緑のシャツ という論理的な順序で考えると、答えが導き出せます。',
  ),
  Quiz(
    question: '次の数列の次に来る数字は何でしょう？ 2, 4, 8, 16, ...',
    options: ['24', '32', '64', '128'],
    answer: '32',
    explanation: '各数字が前の数字の2倍になっているパターンです。',
  ),
  Quiz(
    question: '「頭が切れる」という表現がありますが、実際には頭は切れていません。これはどういう意味でしょうか？',
    options: ['頭が痛い', '頭の回転が速い', '頭が良い', '頭が混乱している'],
    answer: '頭の回転が速い',
    explanation: '「頭が切れる」は比喩表現で、思考や理解が速いことを意味します。',
  ),
  Quiz(
    question: 'あるクラスの生徒数は30人です。男子と女子の比率は2:3です。このクラスの男子は何人ですか？',
    options: ['10人', '12人', '15人', '18人'],
    answer: '12人',
    explanation: '全体を5等分すると、男子が2、女子が3の割合。30÷5=6で、6×2=12人が男子になります。',
  ),
  Quiz(
    question: '「早起きは三文の得」ということわざがありますが、これが必ずしも正しくない場合もあります。どのような場合でしょうか？',
    options: ['朝が苦手な人の場合', '夜型の人の場合', '休日の場合', '以上全て'],
    answer: '以上全て',
    explanation:
        '個人の生活リズムや状況によっては、必ずしも早起きが良いとは限りません。夜型の人や休日など、状況に応じて適切な生活リズムが異なる場合があります。',
  ),
];
