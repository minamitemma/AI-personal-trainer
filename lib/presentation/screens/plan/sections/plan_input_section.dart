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
  int _gymDays = 2;
  int _homeDays = 1;
  String _diet = '特になし';
  String _additionalRequest = ''; // アドバイスモード用

  String _targetDuration = '2ヶ月';

  int _benchWeight = 0;
  int _benchReps = 0;

  int _squatWeight = 0;
  int _squatReps = 0;

  int _deadliftWeight = 0;
  int _deadliftReps = 0;

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
      _gymDays = input.gymDays;
      _homeDays = input.homeDays;
      _diet = input.dietRestriction;
      _additionalRequest = input.additionalRequest;
      _benchWeight = input.benchPressWeight;
      _squatWeight = input.squatWeight;
      _deadliftWeight = input.squatWeight;
      _benchReps = input.benchPressReps;
      _squatReps = input.squatReps;
      _deadliftReps = input.deadliftReps;

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

              Theme(
                data: Theme.of(
                  context,
                ).copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  title: const SectionHeader(
                    title: '💪 筋力データ (任意)',
                    icon: Icons.fitness_center,
                  ),
                  tilePadding: EdgeInsets.zero,
                  children: [
                    const Text(
                      '普段行っているセットの重量と回数を入力してください。AIが推定MAX重量を計算してプランを作ります。',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 12),

                    // 🚨 ここでヘルパーを使う
                    _buildStrengthInputRow(
                      'ベンチプレス',
                      _benchWeight,
                      (v) => _benchWeight = v,
                      _benchReps,
                      (v) => _benchReps = v,
                    ),
                    _buildStrengthInputRow(
                      'スクワット',
                      _squatWeight,
                      (v) => _squatWeight = v,
                      _squatReps,
                      (v) => _squatReps = v,
                    ),
                    _buildStrengthInputRow(
                      'デッドリフト',
                      _deadliftWeight,
                      (v) => _deadliftWeight = v,
                      _deadliftReps,
                      (v) => _deadliftReps = v,
                    ),
                  ],
                ),
              ),
              // --- 2. 目標と経験 ---
              const SectionHeader(title: '🎯 目標と期間', icon: Icons.flag),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _goalType,
                decoration: _inputDecoration('現在の目標'),
                items:
                    ['減量', '筋肥大', '健康維持', 'アスリート']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                onChanged: (val) => setState(() => _goalType = val!),
              ),
              const SizedBox(height: 12),

              DropdownButtonFormField<String>(
                value: _targetDuration,
                decoration: _inputDecoration('目標達成までの期間'),
                items:
                    _durationOptions
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                onChanged: (val) => setState(() => _targetDuration = val!),
              ),

              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _experience,
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

              // --- 3. スケジュール & 食事 ---
              const SectionHeader(
                title: '📅 場所と頻度',
                icon: Icons.calendar_today,
              ),
              const SizedBox(height: 16),

              // 🚨 追加: ジムと自宅のカウンター 🚨
              Row(
                children: [
                  Expanded(
                    child: _buildCounter(
                      'ジム (回/週)',
                      _gymDays,
                      (val) => setState(() => _gymDays = val),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildCounter(
                      '自宅 (回/週)',
                      _homeDays,
                      (val) => setState(() => _homeDays = val),
                    ),
                  ),
                ],
              ),

              // 合計日数の表示と警告
              const SizedBox(height: 8),
              Builder(
                builder: (context) {
                  final total = _gymDays + _homeDays;
                  return Column(
                    children: [
                      Text(
                        '合計: 週 $total 回のトレーニング',
                        style: TextStyle(
                          color: total > 7 ? Colors.red : Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (total > 7)
                        const Text(
                          '※無理のない範囲（週7回以下）に設定してください',
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      if (total == 0)
                        const Text(
                          '※最低週1回は設定してください',
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 16),

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

  // 🚨 追加: カウンターを作るヘルパーメソッド
  Widget _buildCounter(String label, int value, Function(int) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // マイナスボタン
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: value > 0 ? () => onChanged(value - 1) : null,
                color: Colors.grey,
              ),
              // 数値
              Text(
                '$value',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // プラスボタン
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: value < 7 ? () => onChanged(value + 1) : null,
                color: const Color(0xFF6A11CB),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 🚨 追加: 「重量 x 回数」の入力行を作るウィジェット
  Widget _buildStrengthInputRow(
    String title,
    int weight,
    Function(int) onWeightChanged,
    int reps,
    Function(int) onRepsChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: NumberInputField(
                label: '重量 (kg)',
                value: weight,
                onChanged: onWeightChanged,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '×',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
            Expanded(
              flex: 2,
              child: NumberInputField(
                label: '回数',
                value: reps,
                onChanged: onRepsChanged,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  // 🚨 修正: _submit メソッド
  void _submit() {
    if (_formKey.currentState!.validate()) {
      // 合計0回のチェック
      if (_gymDays + _homeDays == 0) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('トレーニング日数を設定してください')));
        return;
      }

      final input = UserInput(
        planName: _planName,
        goalType: _goalType,
        targetDuration: _targetDuration,
        goalWeight: _goalWeight,
        heightCm: _height,
        weightKg: _weight,
        age: _age,
        experienceLevel: _experience,
        // 🚨 修正: ここが変わった
        gymDays: _gymDays,
        homeDays: _homeDays,
        dietRestriction: _diet,
        additionalRequest: _additionalRequest,
        benchPressWeight: _benchWeight,
        benchPressReps: _benchReps,
        squatWeight: _squatWeight,
        squatReps: _squatReps,
        deadliftWeight: _deadliftWeight,
        deadliftReps: _deadliftReps,
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
