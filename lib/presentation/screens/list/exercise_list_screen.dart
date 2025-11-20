// ファイルパス: lib/presentation/screens/list/exercise_list_screen.dart

import 'package:ai_personal_trainer/domain/constant/exercise_master.dart';
import 'package:ai_personal_trainer/presentation/widgets/video_launcher_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExerciseListScreen extends StatefulWidget {
  const ExerciseListScreen({super.key});

  @override
  State<ExerciseListScreen> createState() => _ExerciseListScreenState();
}

class _ExerciseListScreenState extends State<ExerciseListScreen> {
  final TextEditingController _searchController = TextEditingController();

  // フィルター状態
  MuscleGroup? _selectedMuscle; // nullなら全選択
  ExerciseType? _selectedType; // nullなら全選択
  String _searchQuery = '';

  // フィルタリングロジック
  List<MasterExerciseData> get _filteredList {
    return ExerciseMaster.list.where((ex) {
      // 1. テキスト検索
      final query = _searchQuery.toLowerCase();
      final nameMatch = ex.name.toLowerCase().contains(query);
      final keyMatch = ex.keywords.any((k) => k.toLowerCase().contains(query));
      if (!nameMatch && !keyMatch) return false;

      // 2. 部位フィルター
      if (_selectedMuscle != null && ex.target != _selectedMuscle) return false;

      // 3. タイプフィルター
      if (_selectedType != null && ex.type != _selectedType) return false;

      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final list = _filteredList;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text('トレーニング種目一覧'),
        actions: [
          // フィルターリセットボタン
          if (_selectedMuscle != null || _selectedType != null)
            IconButton(
              icon: const Icon(Icons.filter_alt_off),
              onPressed: () {
                setState(() {
                  _selectedMuscle = null;
                  _selectedType = null;
                });
              },
            ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                // 🔍 検索バー
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: '種目名で検索',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon:
                          _searchQuery.isNotEmpty
                              ? IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  _searchController.clear();
                                  setState(() => _searchQuery = '');
                                },
                              )
                              : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                    ),
                    onChanged: (val) => setState(() => _searchQuery = val),
                  ),
                ),

                // 🏷️ フィルターチップ (部位)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  child: Row(
                    children: [
                      const Text(
                        '部位:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 8),
                      ...MuscleGroup.values.map((muscle) {
                        final isSelected = _selectedMuscle == muscle;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: FilterChip(
                            label: Text(muscle.label),
                            selected: isSelected,
                            onSelected: (selected) {
                              setState(() {
                                _selectedMuscle = selected ? muscle : null;
                              });
                            },
                            backgroundColor: Colors.grey.shade100,
                            selectedColor: const Color(
                              0xFF6A11CB,
                            ).withValues(alpha: 0.2),
                            labelStyle: TextStyle(
                              color:
                                  isSelected
                                      ? const Color(0xFF6A11CB)
                                      : Colors.black87,
                              fontWeight:
                                  isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),

                // 🏷️ フィルターチップ (タイプ)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                    bottom: 12,
                  ),
                  child: Row(
                    children: [
                      const Text(
                        '種別:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 8),
                      ...ExerciseType.values.map((type) {
                        final isSelected = _selectedType == type;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            // ここはChoiceChipっぽく使う
                            label: Text(type.label),
                            selected: isSelected,
                            onSelected: (selected) {
                              setState(() {
                                _selectedType = selected ? type : null;
                              });
                            },
                            backgroundColor: Colors.grey.shade100,
                            selectedColor: Colors.orange.shade100,
                            labelStyle: TextStyle(
                              color:
                                  isSelected
                                      ? Colors.orange.shade900
                                      : Colors.black87,
                              fontWeight:
                                  isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          // 📋 リスト表示
          Expanded(
            child:
                list.isEmpty
                    ? const Center(
                      child: Text(
                        '該当する種目がありません',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                    : ListView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        final ex = list[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            leading: CircleAvatar(
                              backgroundColor: _getMuscleColor(
                                ex.target,
                              ).withValues(alpha: 0.1),
                              child: Icon(
                                Icons.fitness_center,
                                color: _getMuscleColor(ex.target),
                              ),
                            ),
                            title: Text(
                              ex.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Row(
                              children: [
                                // タグを表示
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    ex.target.label,
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        ex.type == ExerciseType.compound
                                            ? Colors.blue.shade50
                                            : Colors.green.shade50,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    ex.type == ExerciseType.compound
                                        ? 'コンパウンド'
                                        : 'アイソレーション',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color:
                                          ex.type == ExerciseType.compound
                                              ? Colors.blue
                                              : Colors.green,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.play_circle_fill,
                                    color: Colors.redAccent,
                                  ),
                                  onPressed:
                                      () =>
                                          VideoLauncherHelper.launchVideoSearch(
                                            context,
                                            ex.name,
                                          ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.copy,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    Clipboard.setData(
                                      ClipboardData(text: ex.name),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('「${ex.name}」をコピーしました'),
                                        duration: const Duration(seconds: 1),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }

  // 部位ごとの色分け
  Color _getMuscleColor(MuscleGroup muscle) {
    switch (muscle) {
      case MuscleGroup.chest:
        return Colors.blue;
      case MuscleGroup.back:
        return Colors.brown;
      case MuscleGroup.legs:
        return Colors.purple;
      case MuscleGroup.shoulders:
        return Colors.orange;
      case MuscleGroup.arms:
        return Colors.teal;
      case MuscleGroup.abs:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
