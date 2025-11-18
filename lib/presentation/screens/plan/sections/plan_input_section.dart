// ファイルパス: lib/presentation/screens/plan/sections/plan_input_section.dart

import 'package:ai_personal_trainer/domain/model/user_input.dart';
import 'package:ai_personal_trainer/presentation/screens/plan/components/number_input_field.dart';
import 'package:ai_personal_trainer/presentation/screens/plan/components/section_header.dart';
import 'package:flutter/material.dart';

class PlanInputSection extends StatefulWidget {
  // 保存されたデータがあれば初期値として受け取る

  const PlanInputSection({
    super.key,
    required this.isLoading,
    required this.onGenerate,
    this.initialInput,
  });
  final bool isLoading;
  final Function(UserInput) onGenerate;
  final UserInput? initialInput;

  @override
  State<PlanInputSection> createState() => _PlanInputSectionState();
}

class _PlanInputSectionState extends State<PlanInputSection> {
  final _formKey = GlobalKey<FormState>();

  // 入力値の状態（デフォルト値）
  String _planName = '';
  String _goalType = '減量';
  int _height = 170;
  int _weight = 70;
  int _goalWeight = 65;
  int _age = 25;
  String _experience = '初心者';
  double _days = 3;
  String _diet = '特になし';
  String _additionalRequest = ''; // アドバイスモード用

  String _targetDuration = '2ヶ月';

  // 選択肢リスト
  final List<String> _durationOptions = [
    '1ヶ月 (短期集中)',
    '2ヶ月',
    '3ヶ月 (標準)',
    '6ヶ月 (長期的)',
    '1年 (ライフスタイル改善)',
  ];

  @override
  void initState() {
    super.initState();
    // 💾 保存されたデータがあれば、それを初期値としてセットする
    if (widget.initialInput != null) {
      final input = widget.initialInput!;
      _planName = input.planName;
      _goalType = input.goalType;
      _height = input.heightCm;
      _weight = input.weightKg;
      _goalWeight = input.goalWeight;
      _age = input.age;
      _experience = input.experienceLevel;
      _days = input.availableDays.toDouble();
      _diet = input.dietRestriction;
      _additionalRequest = input.additionalRequest;

      if (input.targetDuration.isNotEmpty &&
          _durationOptions.contains(input.targetDuration)) {
        // リストに含まれていれば、それを使う
        _targetDuration = input.targetDuration;
      } else {
        // 含まれていなければ（古いデータなど）、デフォルト値を使う
        _targetDuration = _durationOptions[2]; // '3ヶ月 (標準)'
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(title: '📝 プラン名 (任意)', icon: Icons.edit),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: _planName,
                decoration: _inputDecoration(
                  '例: 夏に向けた本気ダイエット、腰痛ケアプラン...',
                ).copyWith(hintStyle: TextStyle(color: Colors.grey.shade400)),
                onChanged: (val) => _planName = val,
              ),
              const SizedBox(height: 24),
              // --- 1. プロフィール設定 ---
              const SectionHeader(title: '👤 プロフィール設定', icon: Icons.person),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: NumberInputField(
                      label: '身長 (cm)',
                      value: _height,
                      onChanged: (val) => _height = val,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: NumberInputField(
                      label: '現在の体重 (kg)',
                      value: _weight,
                      onChanged: (val) => _weight = val,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // 2行目: 目標体重・年齢
              Row(
                children: [
                  Expanded(
                    // ★ ここに追加！ ★
                    child: NumberInputField(
                      label: '目標体重 (kg)',
                      value: _goalWeight,
                      onChanged: (val) => _goalWeight = val,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: NumberInputField(
                      label: '年齢',
                      value: _age,
                      onChanged: (val) => _age = val,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // --- 2. 目標と経験 ---
              const SectionHeader(title: '🎯 目標と期間', icon: Icons.flag),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: _goalType,
                decoration: _inputDecoration('現在の目標'),
                items:
                    ['減量', '筋肥大', '健康維持', 'アスリート']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                onChanged: (val) => setState(() => _goalType = val!),
              ),
              const SizedBox(height: 12),

              DropdownButtonFormField<String>(
                initialValue: _targetDuration,
                decoration: _inputDecoration('目標達成までの期間'),
                items:
                    _durationOptions
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                onChanged: (val) => setState(() => _targetDuration = val!),
              ),

              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                initialValue: _experience,
                decoration: _inputDecoration('トレーニング経験'),
                items:
                    ['初心者', '中級者', '上級者']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                onChanged: (val) => setState(() => _experience = val!),
              ),

              const SizedBox(height: 24),

              // --- 3. スケジュール & 食事 ---
              const SectionHeader(
                title: '📅 スケジュール & 食事',
                icon: Icons.calendar_today,
              ),
              const SizedBox(height: 8),

              // 日数スライダー
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '週のトレーニング日数:',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '${_days.round()}日',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF6A11CB),
                      ),
                    ),
                  ],
                ),
              ),
              Slider(
                value: _days,
                min: 1,
                max: 7,
                divisions: 6,
                label: '${_days.round()}日',
                activeColor: const Color(0xFF6A11CB),
                onChanged: (val) => setState(() => _days = val),
              ),

              // 食事制限
              TextFormField(
                initialValue: _diet,
                decoration: _inputDecoration('食事の好み・アレルギー'),
                onChanged: (val) => _diet = val,
              ),

              const SizedBox(height: 24),

              // --- 4. 特別なリクエスト (レベル3: アドバイスモード) ---
              const SectionHeader(
                title: '💡 特別なリクエスト (任意)',
                icon: Icons.lightbulb_outline,
              ),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: _additionalRequest,
                decoration: _inputDecoration(
                  '例: 腰痛持ちなので腰に優しいメニューで、30分以内で...',
                ).copyWith(
                  alignLabelWithHint: true,
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                ),
                maxLines: 3,
                onChanged: (val) => _additionalRequest = val,
              ),

              const SizedBox(height: 32),

              // --- 送信ボタン ---
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: widget.isLoading ? null : _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2575FC),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                  ),
                  child:
                      widget.isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                            'AIプランを生成する ✨',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final input = UserInput(
        planName: _planName,
        goalType: _goalType,
        // 簡易的な目標体重ロジック（必要に応じて調整）
        goalWeight: _goalWeight,
        heightCm: _height,
        weightKg: _weight,
        age: _age,
        targetDuration: _targetDuration,
        experienceLevel: _experience,
        availableDays: _days.round(),
        dietRestriction: _diet,
        additionalRequest: _additionalRequest, // 追加リクエスト
      );
      widget.onGenerate(input);
    }
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    );
  }
}
