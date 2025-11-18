enum DietStatus {
  unknown, // 未記録
  good, // 適量 (Good)
  over, // 多すぎ (Over)
  under; // 少なすぎ (Under)

  String get label {
    switch (this) {
      case DietStatus.good:
        return '適量';
      case DietStatus.over:
        return '多め';
      case DietStatus.under:
        return '少なめ';
      case DietStatus.unknown:
        return '-';
    }
  }

  String get aiLabel => name;
}
