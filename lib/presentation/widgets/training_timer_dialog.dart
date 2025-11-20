import 'dart:async';

import 'package:flutter/material.dart';

class TrainingTimerDialog extends StatefulWidget {
  const TrainingTimerDialog({super.key, required this.initialSeconds});
  final int initialSeconds;

  @override
  State<TrainingTimerDialog> createState() => _TrainingTimerDialogState();
}

class _TrainingTimerDialogState extends State<TrainingTimerDialog> {
  late int _seconds;
  late int _totalSeconds;
  Timer? _timer;
  bool _isRunning = false;
  bool _isFinished = false;

  @override
  void initState() {
    super.initState();
    _totalSeconds =
        widget.initialSeconds > 0 ? widget.initialSeconds : 60; // デフォルト60秒
    _seconds = _totalSeconds;
    _startTimer(); // ダイアログが開いたら即スタート
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _isRunning = true;
      _isFinished = false;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() => _seconds--);
      } else {
        _timer?.cancel();
        setState(() {
          _isRunning = false;
          _isFinished = true;
        });
        // 終了時のバイブレーションなどはここで呼べる
      }
    });
  }

  void _pauseTimer() {
    _timer?.cancel();
    setState(() => _isRunning = false);
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _seconds = _totalSeconds;
      _isRunning = false;
      _isFinished = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 進捗率 (1.0 -> 0.0)
    final progress = _seconds / _totalSeconds;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      contentPadding: const EdgeInsets.all(24),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            '休憩タイマー',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 24),

          // 円形タイマー表示
          SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // 背景の円
                SizedBox(
                  width: 150,
                  height: 150,
                  child: CircularProgressIndicator(
                    value: 1.0,
                    strokeWidth: 12,
                    color: Colors.grey.shade200,
                  ),
                ),
                // 進捗の円
                SizedBox(
                  width: 150,
                  height: 150,
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 12,
                    color: _isFinished ? Colors.green : const Color(0xFF6A11CB),
                    strokeCap: StrokeCap.round,
                  ),
                ),
                // 中央の秒数
                Text(
                  _isFinished ? '完了!' : '$_seconds',
                  style: TextStyle(
                    fontSize: _isFinished ? 24 : 40,
                    fontWeight: FontWeight.bold,
                    color: _isFinished ? Colors.green : Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // 操作ボタン
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // リセットボタン
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: _resetTimer,
                color: Colors.grey,
                iconSize: 32,
              ),

              // 再生/一時停止ボタン
              if (_isFinished)
                FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: () => Navigator.pop(context), // 閉じる
                  child: const Icon(Icons.check, color: Colors.white),
                )
              else
                FloatingActionButton(
                  backgroundColor: const Color(0xFF6A11CB),
                  onPressed: _isRunning ? _pauseTimer : _startTimer,
                  child: Icon(
                    _isRunning ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),

              // +10秒ボタン
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: () {
                  setState(() {
                    _seconds += 10;
                    _totalSeconds += 10; // 母数も増やすかはお好みで
                  });
                },
                color: Colors.grey,
                iconSize: 32,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
