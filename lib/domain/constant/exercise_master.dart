// ファイルパス: lib/domain/constant/exercise_master.dart

/// 部位の定義
enum MuscleGroup {
  chest('胸'),
  back('背中'),
  legs('脚'),
  shoulders('肩'),
  arms('腕'),
  abs('腹筋'),
  cardio('有酸素/全身');

  // 🚨 修正: コンストラクタをフィールドより先に書く
  const MuscleGroup(this.label);

  final String label;
}

/// 種目のタイプ定義
enum ExerciseType {
  compound('多関節 (コンパウンド)'), // 高重量・基本
  isolation('単関節 (アイソレーション)'), // 仕上げ・特定部位
  cardio('有酸素・HIIT');

  // 🚨 修正: コンストラクタをフィールドより先に書く
  const ExerciseType(this.label);

  final String label;
}

class MasterExerciseData {
  const MasterExerciseData({
    required this.id,
    required this.name,
    required this.keywords,
    required this.videoQuery,
    required this.target,
    required this.type,
  });
  final String id;
  final String name;
  final List<String> keywords;
  final String videoQuery;
  final MuscleGroup target;
  final ExerciseType type;
}

class ExerciseMaster {
  // AIプロンプト用リスト生成
  static String get promptList {
    return list.map((e) => '- ID: "${e.id}", Name: "${e.name}"').join('\n');
  }

  static MasterExerciseData? findById(String id) {
    try {
      return list.firstWhere((e) => e.id == id);
    } catch (_) {
      return null;
    }
  }

  static MasterExerciseData? findByName(String name) {
    try {
      return list.firstWhere(
        (e) => e.keywords.any((k) => name.toLowerCase().contains(k)),
      );
    } catch (_) {
      return null;
    }
  }

  // マスターデータリスト
  static const List<MasterExerciseData> list = [
    // ==========================================
    // 胸 (Chest)
    // ==========================================
    MasterExerciseData(
      id: 'bench_press',
      name: 'バーベル・ベンチプレス',
      keywords: ['ベンチプレス', 'bench press', 'chest press'],
      videoQuery: 'バーベルベンチプレス フォーム 解説',
      target: MuscleGroup.chest,
      type: ExerciseType.compound,
    ),
    MasterExerciseData(
      id: 'incline_bench_press',
      name: 'インクライン・ベンチプレス',
      keywords: ['インクライン', 'incline bench', '上部'],
      videoQuery: 'インクラインベンチプレス 角度 フォーム',
      target: MuscleGroup.chest,
      type: ExerciseType.compound,
    ),
    MasterExerciseData(
      id: 'dumbbell_press',
      name: 'ダンベル・プレス',
      keywords: ['ダンベルプレス', 'dumbbell press'],
      videoQuery: 'ダンベルプレス フォーム 解説',
      target: MuscleGroup.chest,
      type: ExerciseType.compound,
    ),
    MasterExerciseData(
      id: 'push_up',
      name: 'プッシュアップ (腕立て伏せ)',
      keywords: ['腕立て', 'プッシュアップ', 'push up'],
      videoQuery: '腕立て伏せ 正しいやり方',
      target: MuscleGroup.chest,
      type: ExerciseType.compound,
    ),
    MasterExerciseData(
      id: 'dips',
      name: 'ディップス',
      keywords: ['ディップス', 'dips'],
      videoQuery: 'ディップス 大胸筋 フォーム',
      target: MuscleGroup.chest,
      type: ExerciseType.compound,
    ),
    MasterExerciseData(
      id: 'dumbbell_fly',
      name: 'ダンベル・フライ',
      keywords: ['フライ', 'fly', 'chest fly'],
      videoQuery: 'ダンベルフライ フォーム',
      target: MuscleGroup.chest,
      type: ExerciseType.isolation,
    ),
    MasterExerciseData(
      id: 'cable_crossover',
      name: 'ケーブル・クロスオーバー',
      keywords: ['ケーブル', 'クロスオーバー', 'cable crossover'],
      videoQuery: 'ケーブルクロスオーバー フォーム',
      target: MuscleGroup.chest,
      type: ExerciseType.isolation,
    ),

    // ==========================================
    // 背中 (Back)
    // ==========================================
    MasterExerciseData(
      id: 'deadlift',
      name: 'デッドリフト',
      keywords: ['デッドリフト', 'deadlift'],
      videoQuery: 'デッドリフト フォーム 初心者',
      target: MuscleGroup.back,
      type: ExerciseType.compound,
    ),
    MasterExerciseData(
      id: 'chin_up',
      name: 'チンニング (懸垂)',
      keywords: ['懸垂', 'チンニング', 'pull up', 'chin up'],
      videoQuery: '懸垂 できない 初心者',
      target: MuscleGroup.back,
      type: ExerciseType.compound,
    ),
    MasterExerciseData(
      id: 'lat_pulldown',
      name: 'ラットプルダウン',
      keywords: ['ラットプル', 'lat pulldown'],
      videoQuery: 'ラットプルダウン 背中 効かせ方',
      target: MuscleGroup.back,
      type: ExerciseType.compound,
    ),
    MasterExerciseData(
      id: 'bent_over_row',
      name: 'ベントオーバーロウ',
      keywords: ['バーベルロウ', 'bent over row', 'rowing'],
      videoQuery: 'ベントオーバーロウ フォーム',
      target: MuscleGroup.back,
      type: ExerciseType.compound,
    ),
    MasterExerciseData(
      id: 'one_arm_row',
      name: 'ワンハンド・ローイング',
      keywords: ['ワンハンド', 'ダンベルロウ', 'one arm row'],
      videoQuery: 'ワンハンドローイング フォーム',
      target: MuscleGroup.back,
      type: ExerciseType.compound,
    ),
    MasterExerciseData(
      id: 'seated_row',
      name: 'シーテッド・ローイング',
      keywords: ['シーテッドロウ', 'seated row'],
      videoQuery: 'シーテッドローイング マシン 使い方',
      target: MuscleGroup.back,
      type: ExerciseType.compound,
    ),
    MasterExerciseData(
      id: 'back_extension',
      name: 'バックエクステンション (背筋)',
      keywords: ['バックエクステンション', '背筋', 'back extension'],
      videoQuery: 'バックエクステンション やり方',
      target: MuscleGroup.back,
      type: ExerciseType.isolation,
    ),

    // ==========================================
    // 脚 (Legs)
    // ==========================================
    MasterExerciseData(
      id: 'squat',
      name: 'バーベル・スクワット',
      keywords: ['スクワット', 'squat'],
      videoQuery: 'スクワット フォーム 解説',
      target: MuscleGroup.legs,
      type: ExerciseType.compound,
    ),
    MasterExerciseData(
      id: 'goblet_squat',
      name: 'ゴブレットスクワット (ダンベル)',
      keywords: ['ゴブレット', 'goblet squat'],
      videoQuery: 'ゴブレットスクワット やり方',
      target: MuscleGroup.legs,
      type: ExerciseType.compound,
    ),
    MasterExerciseData(
      id: 'leg_press',
      name: 'レッグプレス',
      keywords: ['レッグプレス', 'leg press'],
      videoQuery: 'レッグプレス 足の位置',
      target: MuscleGroup.legs,
      type: ExerciseType.compound,
    ),
    MasterExerciseData(
      id: 'lunge',
      name: 'ランジ (ダンベル/自重)',
      keywords: ['ランジ', 'lunge', 'walking lunge'],
      videoQuery: 'ランジ フォーム',
      target: MuscleGroup.legs,
      type: ExerciseType.compound,
    ),
    MasterExerciseData(
      id: 'romanian_deadlift',
      name: 'ルーマニアン・デッドリフト (RDL)',
      keywords: ['RDL', 'ルーマニアン', 'ハムストリングス'],
      videoQuery: 'ルーマニアンデッドリフト フォーム',
      target: MuscleGroup.legs,
      type: ExerciseType.compound,
    ),
    MasterExerciseData(
      id: 'leg_extension',
      name: 'レッグエクステンション',
      keywords: ['レッグエクステンション', 'leg extension'],
      videoQuery: 'レッグエクステンション 使い方',
      target: MuscleGroup.legs,
      type: ExerciseType.isolation,
    ),
    MasterExerciseData(
      id: 'leg_curl',
      name: 'レッグカール',
      keywords: ['レッグカール', 'leg curl'],
      videoQuery: 'レッグカール マシン 使い方',
      target: MuscleGroup.legs,
      type: ExerciseType.isolation,
    ),
    MasterExerciseData(
      id: 'calf_raise',
      name: 'カーフレイズ (ふくらはぎ)',
      keywords: ['カーフ', 'calf raise'],
      videoQuery: 'カーフレイズ やり方',
      target: MuscleGroup.legs,
      type: ExerciseType.isolation,
    ),

    // ==========================================
    // 肩 (Shoulders)
    // ==========================================
    MasterExerciseData(
      id: 'shoulder_press',
      name: 'ショルダープレス (バーベル/ダンベル)',
      keywords: ['ショルダープレス', 'ミリタリープレス', 'shoulder press'],
      videoQuery: 'ショルダープレス フォーム',
      target: MuscleGroup.shoulders,
      type: ExerciseType.compound,
    ),
    MasterExerciseData(
      id: 'side_raise',
      name: 'サイドレイズ',
      keywords: ['サイドレイズ', 'lateral raise'],
      videoQuery: 'サイドレイズ 肩に効かせる',
      target: MuscleGroup.shoulders,
      type: ExerciseType.isolation,
    ),
    MasterExerciseData(
      id: 'front_raise',
      name: 'フロントレイズ',
      keywords: ['フロントレイズ', 'front raise'],
      videoQuery: 'フロントレイズ ダンベル',
      target: MuscleGroup.shoulders,
      type: ExerciseType.isolation,
    ),
    MasterExerciseData(
      id: 'rear_delt_fly',
      name: 'リアデルトフライ',
      keywords: ['リア', 'rear delt'],
      videoQuery: 'リアデルトフライ ダンベル',
      target: MuscleGroup.shoulders,
      type: ExerciseType.isolation,
    ),

    // ==========================================
    // 腕 (Arms)
    // ==========================================
    MasterExerciseData(
      id: 'barbell_curl',
      name: 'バーベルカール',
      keywords: ['バーベルカール', 'barbell curl'],
      videoQuery: 'バーベルカール フォーム',
      target: MuscleGroup.arms,
      type: ExerciseType.isolation,
    ),
    MasterExerciseData(
      id: 'dumbbell_curl',
      name: 'ダンベルカール',
      keywords: ['ダンベルカール', 'dumbbell curl'],
      videoQuery: 'ダンベルカール 効かせ方',
      target: MuscleGroup.arms,
      type: ExerciseType.isolation,
    ),
    MasterExerciseData(
      id: 'tricep_pushdown',
      name: 'トライセプス・プッシュダウン',
      keywords: ['プッシュダウン', 'pushdown'],
      videoQuery: 'ケーブルプッシュダウン フォーム',
      target: MuscleGroup.arms,
      type: ExerciseType.isolation,
    ),
    MasterExerciseData(
      id: 'french_press',
      name: 'フレンチプレス (二の腕)',
      keywords: ['フレンチプレス', 'french press'],
      videoQuery: 'フレンチプレス ダンベル やり方',
      target: MuscleGroup.arms,
      type: ExerciseType.isolation,
    ),

    // ==========================================
    // 腹筋 (Abs)
    // ==========================================
    MasterExerciseData(
      id: 'plank',
      name: 'プランク',
      keywords: ['プランク', 'plank'],
      videoQuery: 'プランク 正しいやり方',
      target: MuscleGroup.abs,
      type: ExerciseType.isolation,
    ),
    MasterExerciseData(
      id: 'crunch',
      name: 'クランチ',
      keywords: ['クランチ', 'crunch'],
      videoQuery: 'クランチ 腹筋 フォーム',
      target: MuscleGroup.abs,
      type: ExerciseType.isolation,
    ),
    MasterExerciseData(
      id: 'leg_raise',
      name: 'レッグレイズ',
      keywords: ['レッグレイズ', 'leg raise'],
      videoQuery: 'レッグレイズ 腹筋 下腹部',
      target: MuscleGroup.abs,
      type: ExerciseType.isolation,
    ),
    MasterExerciseData(
      id: 'ab_roller',
      name: 'アブローラー (腹筋ローラー)',
      keywords: ['アブローラー', '腹筋ローラー', 'ab roller'],
      videoQuery: 'アブローラー 初心者',
      target: MuscleGroup.abs,
      type: ExerciseType.compound,
    ),

    // ==========================================
    // 有酸素 / 全身 (Cardio/Full Body)
    // ==========================================
    MasterExerciseData(
      id: 'burpee',
      name: 'バーピー',
      keywords: ['バーピー', 'burpee'],
      videoQuery: 'バーピー ジャンプ なし',
      target: MuscleGroup.cardio,
      type: ExerciseType.cardio,
    ),
    MasterExerciseData(
      id: 'hiit',
      name: 'HIIT (高強度インターバル)',
      keywords: ['HIIT', 'ヒット'],
      videoQuery: 'HIIT 初心者 5分',
      target: MuscleGroup.cardio,
      type: ExerciseType.cardio,
    ),
    MasterExerciseData(
      id: 'treadmill',
      name: 'トレッドミル (ランニング)',
      keywords: ['ランニング', 'ジョギング', 'treadmill'],
      videoQuery: 'ランニングマシン 使い方',
      target: MuscleGroup.cardio,
      type: ExerciseType.cardio,
    ),
    MasterExerciseData(
      id: 'bike',
      name: 'エアロバイク(サイクリング)',
      keywords: ['自転車', 'エアロバイク', 'サイクリング'],
      videoQuery: 'エアロバイク 使い方',
      target: MuscleGroup.cardio,
      type: ExerciseType.cardio,
    ),
  ];
}
