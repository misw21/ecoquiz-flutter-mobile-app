import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SoundService {
  static final SoundService _instance = SoundService._internal();
  factory SoundService() => _instance;

  SoundService._internal();

  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _soundEnabled = true;

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    _soundEnabled = prefs.getBool('sound_enabled') ?? true;
  }

  Future<void> setSoundEnabled(bool enabled) async {
    _soundEnabled = enabled;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('sound_enabled', enabled);
  }

  bool get isSoundEnabled => _soundEnabled;

  Future<void> playCorrectSound() async {
    if (!_soundEnabled) return;

    try {
      await _audioPlayer.stop();
      await _audioPlayer.play(AssetSource('assets/correct.mp3'));
    } catch (e) {
      print('Error playing correct sound: $e');
    }
  }

  Future<void> playWrongSound() async {
    if (!_soundEnabled) return;

    try {
      await _audioPlayer.stop();
      await _audioPlayer.play(AssetSource('assets/wrong.mp3'));
    } catch (e) {
      print('Error playing wrong sound: $e');
    }
  }

  Future<void> playButtonSound() async {
    if (!_soundEnabled) return;

    try {
      await _audioPlayer.stop();
      await _audioPlayer.play(AssetSource('sounds/button_click.mp3'));
    } catch (e) {
      print('Error playing button sound: $e');
    }
  }

  void dispose() {
    _audioPlayer.dispose();
  }
}
