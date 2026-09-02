import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/services/navigation_service.dart';
import '../../../l10n/language_provider.dart';
import '../../../localizations.dart';
import '../models/questions_model.dart';
import '../services/quiz_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final QuizService _quizService = QuizService();
  final AudioPlayer _audioPlayer = AudioPlayer();
  List<Question> _questions = [];
  final Map<int, List<String>> _shuffledOptionsMap = {};
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _quizCompleted = false;
  String? _selectedAnswer;
  bool _showCorrectAnswer = false;
  bool _showVideo = false;
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
    _videoController = VideoPlayerController.asset('assets/vedio.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _loadQuestions() async {
    final List<Question> questions = await _quizService.loadQuestions();
    for (int i = 0; i < questions.length; i++) {
      final List<String> shuffledOptions =
          List<String>.from(questions[i].options);
      shuffledOptions.shuffle();
      _shuffledOptionsMap[i] = shuffledOptions;
    }

    setState(() {
      _questions = questions;
    });
  }

  Future<void> _playSound(String soundFile) async {
    try {
      await _audioPlayer.stop();
      await _audioPlayer.play(AssetSource(soundFile));
    } catch (e) {
      log('Error playing sound: $e');
    }
  }

  void _answerQuestion(String selectedAnswer) {
    setState(() {
      _selectedAnswer = selectedAnswer;
      _showCorrectAnswer = true;
    });

    final correctAnswer = _questions[_currentQuestionIndex].answer;

    if (correctAnswer == selectedAnswer) {
      _playSound('correct.mp3');
      setState(() {
        _score++;
      });
    } else {
      _playSound('wrong.mp3');
    }

    Future.delayed(const Duration(seconds: 2), () {
      if (_currentQuestionIndex < _questions.length - 1) {
        setState(() {
          _currentQuestionIndex++;
          _selectedAnswer = null;
          _showCorrectAnswer = false;
        });
      } else {
        setState(() {
          _showVideo = true; // Show video before results
        });
        _videoController.play();
        _videoController.addListener(() {
          if (_videoController.value.position >=
              _videoController.value.duration) {
            setState(() {
              _showVideo = false;
              _quizCompleted = true;
            });
          }
        });
      }
    });
  }

  void _resetQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
      _quizCompleted = false;
      _selectedAnswer = null;
      _showCorrectAnswer = false;
      _showVideo = false;
      _videoController.seekTo(Duration.zero);
      for (int i = 0; i < _questions.length; i++) {
        final List<String> shuffledOptions =
            List<String>.from(_questions[i].options);
        shuffledOptions.shuffle();
        _shuffledOptionsMap[i] = shuffledOptions;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final languageProvider = Provider.of<LanguageProvider>(context);

    final textDirection = languageProvider.locale.languageCode == 'ar'
        ? TextDirection.rtl
        : TextDirection.ltr;

    if (_questions.isEmpty) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_showVideo) {
      return Scaffold(
        body: Center(
          child: _videoController.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _videoController.value.aspectRatio,
                  child: VideoPlayer(_videoController),
                )
              : const CircularProgressIndicator(),
        ),
      );
    }

    if (_quizCompleted) {
      return Scaffold(
        appBar: AppBar(title: const Text('Quiz Completed')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Score: $_score/${_questions.length}',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _resetQuiz,
                child: const Text('Restart Quiz'),
              ),
            ],
          ),
        ),
      );
    }

    final Question currentQuestion = _questions[_currentQuestionIndex];
    final displayOptions =
        _shuffledOptionsMap[_currentQuestionIndex] ?? currentQuestion.options;

    return Directionality(
      textDirection: textDirection,
      child: Scaffold(
        appBar: AppBar(
          title: Text(localizations.quizApp),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                final navigationService = NavigationService();
                navigationService.pushNamed(AppRoute.settingScreen);
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Question ${_currentQuestionIndex + 1}/${_questions.length}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                currentQuestion.question,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ...displayOptions.map((option) {
                final bool isCorrectAnswer = option == currentQuestion.answer;
                final bool isSelectedAnswer = option == _selectedAnswer;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: ElevatedButton(
                    onPressed: _selectedAnswer == null
                        ? () => _answerQuestion(option)
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _showCorrectAnswer
                          ? isCorrectAnswer
                              ? Colors.green
                              : isSelectedAnswer
                                  ? Colors.red
                                  : null
                          : null,
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                    ),
                    child: Text(
                      option,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              }),
              if (_showCorrectAnswer)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'Correct Answer: ${currentQuestion.answer}',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
