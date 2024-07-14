import 'package:flutter/material.dart';
import 'quiz_data.dart';
import 'dart:math';

void main() => runApp(BrainChallengeApp());

class BrainChallengeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '日常脳トレチャレンジ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildLevelAndStreak(),
                      SizedBox(height: 16),
                      _buildTodayChallenge(context),
                      SizedBox(height: 16),
                      _buildStats(),
                      SizedBox(height: 16),
                      _buildQuickActions(),
                      SizedBox(height: 16),
                      _buildTodayTopic(),
                    ],
                  ),
                ),
              ),
            ),
            _buildBottomNavigation(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF8E72DD), Color(0xFF7A5CC9)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'こんにちは、碧さん！',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '今日も頑張りましょう！',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFFFE8F50),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.psychology, color: Colors.white, size: 24),
          ),
        ],
      ),
    );
  }

  Widget _buildLevelAndStreak() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('現在のレベル', style: TextStyle(color: Colors.grey)),
            Text('レベル 5',
                style: TextStyle(
                    color: Color(0xFF3677DC),
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('連続学習日数', style: TextStyle(color: Colors.grey)),
            Row(
              children: [
                Text('7日',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Icon(Icons.local_fire_department, color: Colors.orange),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTodayChallenge(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFEBF3FF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('今日のチャレンジ', style: TextStyle(color: Colors.grey)),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('論理的思考クイズ', style: TextStyle(fontWeight: FontWeight.bold)),
              ElevatedButton(
                child: Text('挑戦する'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4787ED),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStats() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFFE8F5E9),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Text('週間ランキング', style: TextStyle(color: Colors.grey)),
                Text('#3 位',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xFF4CAF50))),
              ],
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFFF3E5F5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Text('獲得ポイント', style: TextStyle(color: Colors.grey)),
                Text('2,750 PT',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xFF9C27B0))),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActions() {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _buildQuickActionItem(Icons.emoji_events, 'ランキング'),
        _buildQuickActionItem(Icons.people, '友達と対戦'),
        _buildQuickActionItem(Icons.help_outline, '疑問を投稿'),
        _buildQuickActionItem(Icons.bar_chart, 'プログレス'),
        _buildQuickActionItem(Icons.flag, '目標設定'),
        _buildQuickActionItem(Icons.settings, '設定'),
      ],
    );
  }

  Widget _buildQuickActionItem(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Color(0xFFF5F5F5),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.black54),
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildTodayTopic() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFFFF9C4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('今日のトピック', style: TextStyle(color: Colors.grey)),
          SizedBox(height: 8),
          Text('「なぜ空は青いの？」についての議論が活発です！'),
          SizedBox(height: 8),
          ElevatedButton(
            child: Text('参加する'),
            onPressed: () {
              // トピック参加のロジックをここに
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFBC02D),
              minimumSize: Size(double.infinity, 36),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'プログレス'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'プロフィール'),
      ],
      currentIndex: 0,
      selectedItemColor: Color(0xFF3677DC),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late Quiz currentQuiz;
  String? selectedAnswer;
  List<int> usedQuizIndices = [];
  Random random = Random();

  @override
  void initState() {
    super.initState();
    _selectNewQuiz();
  }

  void _selectNewQuiz() {
    if (usedQuizIndices.length == quizzes.length) {
      // すべての問題を使い切った場合、リセット
      usedQuizIndices.clear();
    }

    int index;
    do {
      index = random.nextInt(quizzes.length);
    } while (usedQuizIndices.contains(index));

    setState(() {
      currentQuiz = quizzes[index];
      selectedAnswer = null;
      usedQuizIndices.add(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('クイズ'),
        backgroundColor: Color(0xFF7A5CC9),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildQuizProgress(),
                SizedBox(height: 20),
                _buildQuizQuestion(),
                SizedBox(height: 20),
                ...currentQuiz.options
                    .map((option) => _buildAnswerOption(option))
                    .toList(),
                SizedBox(height: 20),
                _buildSubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuizProgress() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('問題 ${usedQuizIndices.length}/${quizzes.length}',
            style: TextStyle(fontSize: 16, color: Colors.grey[600])),
        Text('残り時間: 1:30',
            style: TextStyle(fontSize: 16, color: Colors.orange)),
      ],
    );
  }

  Widget _buildQuizQuestion() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFEBF3FF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('論理的思考問題',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3677DC))),
          SizedBox(height: 10),
          Text(currentQuiz.question, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildAnswerOption(String option) {
    bool isSelected = selectedAnswer == option;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ElevatedButton(
        child: Text(option),
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Color(0xFF4787ED) : Colors.grey[200],
          foregroundColor: isSelected ? Colors.white : Colors.black87,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          setState(() {
            selectedAnswer = option;
          });
        },
      ),
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        child: Text('回答を送信', style: TextStyle(fontSize: 18)),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF4787ED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: selectedAnswer == null
          ? null
          : () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    quiz: currentQuiz,
                    userAnswer: selectedAnswer!,
                    onNextQuiz: _selectNewQuiz,
                  ),
                ),
              );
            },
    );
  }
}

class ResultPage extends StatelessWidget {
  final Quiz quiz;
  final String userAnswer;
  final VoidCallback onNextQuiz;

  ResultPage(
      {required this.quiz, required this.userAnswer, required this.onNextQuiz});

  @override
  Widget build(BuildContext context) {
    bool isCorrect = quiz.answer.toLowerCase() == userAnswer.toLowerCase();

    return Scaffold(
      appBar: AppBar(
        title: Text('結果'),
        backgroundColor: isCorrect ? Color(0xFF4CAF50) : Color(0xFFE57373),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildResultCard(context, isCorrect),
                SizedBox(height: 20),
                _buildExplanationCard(context),
                SizedBox(height: 20),
                _buildNextQuizButton(context),
                SizedBox(height: 10),
                _buildHomeButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResultCard(BuildContext context, bool isCorrect) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isCorrect ? Color(0xFFE8F5E9) : Color(0xFFFFEBEE),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(
            isCorrect ? Icons.check_circle : Icons.cancel,
            size: 80,
            color: isCorrect ? Color(0xFF4CAF50) : Color(0xFFE57373),
          ),
          SizedBox(height: 20),
          Text(
            isCorrect ? '正解です！' : '不正解です。',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isCorrect ? Color(0xFF4CAF50) : Color(0xFFE57373)),
          ),
          SizedBox(height: 20),
          Text('問題: ${quiz.question}'),
          Text('あなたの回答: $userAnswer'),
          Text('正解: ${quiz.answer}'),
        ],
      ),
    );
  }

  Widget _buildExplanationCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('解説',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1976D2))),
          SizedBox(height: 10),
          Text(quiz.explanation),
        ],
      ),
    );
  }

  Widget _buildHomeButton(BuildContext context) {
    return ElevatedButton(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        child: Text('ホームに戻る', style: TextStyle(fontSize: 18)),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF4787ED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {
        Navigator.of(context).popUntil((route) => route.isFirst);
      },
    );
  }

  Widget _buildNextQuizButton(BuildContext context) {
    return ElevatedButton(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        child: Text('次の問題へ', style: TextStyle(fontSize: 18)),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF4787ED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {
        onNextQuiz();
        Navigator.pop(context);
      },
    );
  }
}
