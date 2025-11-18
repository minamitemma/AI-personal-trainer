import 'dart:async';

import 'package:flutter/material.dart';

class LoadingView extends StatefulWidget {
  const LoadingView({super.key});

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  int _index = 0;
  final List<String> _messages = [
    'AIがあなたの体質を分析中...',
    '最適なPFCバランスを計算しています...',
    'トレーニングメニューを構築中...',
    '食事プランを生成しています...',
    '仕上げの調整を行っています...',
  ];
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // 2.5秒ごとにメッセージを切り替える
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (timer) {
      setState(() {
        _index = (_index + 1) % _messages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 24),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Text(
              _messages[_index],
              key: ValueKey<int>(_index),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
