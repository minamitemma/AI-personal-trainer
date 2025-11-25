# AI Personal Trainer 

![Flutter] ![Dart](https://img.shields.io/badge/Dart-3.0%2B-0175C2?logo=dart) ![Riverpod](https://img.shields.io/badge/State_Management-Riverpod-blue) ![Gemini](https://img.shields.io/badge/AI-Gemini_1.5_Flash-8E75B2)

**AI Personal Trainer** は、大規模言語モデル（LLM）の推論能力と、従来のアプリケーションロジックを融合させた、次世代のフィットネス管理アプリケーションです。

ユーザーの身体情報、生活スタイル（ジム/自宅の頻度）、曖昧な要望（「腰が痛い」など）を理解し、**完全パーソナライズされたトレーニングメニューと食事プラン**を即座に生成します。さらに、日々の実績（PDCA）を学習し、翌週のプランを自動で最適化します。


##  Key Features

###  1. LLM x Logic のハイブリッド生成
AI任せにするのではなく、計算可能な部分はアプリ側で厳密に処理することで、ハルシネーション（AIの嘘）を防ぎます。
* **1RM (最大挙上重量) 自動計算:** Epleyの公式を用い、普段の重量と回数から適切な負荷設定（%1RM）をAIに指示。
* **栄養目標の算出:** 基礎代謝(BMR)と活動代謝(TDEE)をロジックで計算し、そのPFCバランスを満たす献立作成のみをAIに委譲。

###  2. PDCAサイクルの実装
作りっぱなしではなく、継続的な改善をサポートします。
* **Do:** トレーニングの完了状況、食事の量（適量/過多/不足）を記録。
* **Check & Action:** 実績データを次回のプロンプトにコンテキストとして注入し、「先週は食べ過ぎたのでカロリー調整」といった動的なプラン修正を行います。

###  3. マルチモーダル食事解析 (Gemini Vision)
* 料理の写真を撮るだけで、メニュー名、カロリー、PFCバランスをAIが画像解析して推定します。

###  4. 充実のユーティリティ
* **マスタデータ管理:** 種目名の表記揺れを防ぎ、データの正規化を実現。
* **動画検索連携:** 種目名から最適なYouTube検索結果をワンタップで表示。
* **インターバルタイマー:** アプリ内で完結するトレーニングタイマー。
* **データの可視化:** 体重推移のグラフ化とアクティビティカレンダー。

---

##  Architecture

本プロジェクトは、保守性と拡張性を重視し、**Clean Architecture** を採用しています。

### 技術スタック
* **Framework:** Flutter (Dart)
* **AI Model:** Google Gemini 1.5 Flash
* **State Management:** Riverpod (`flutter_riverpod`)
* **Data Class:** Freezed (`freezed_annotation`, `json_serializable`)
* **Networking:** Dio
* **Charts:** fl_chart
* **Calendar:** table_calendar
* **Persistence:** shared_preferences

---

##  Setup & Installation

このプロジェクトを実行するには、Gemini APIキーが必要です。

### 1. 前提条件
* Flutter SDK がインストールされていること。
* Google AI Studio で APIキーを取得済みであること。

### 2. 環境変数の設定
プロジェクトルートに `.env` ファイルを作成し、APIキーを設定してください。

```env
GEMINI_API_KEY=AIzaSy... (あなたのAPIキー)
GEMINI_BASE_URL=[https://generativelanguage.googleapis.com/](https://generativelanguage.googleapis.com/)
GEMINI_MODEL_NAME=gemini-1.5-flash-latest

# パッケージのインストール
flutter pub get

# Freezed/Riverpodのコード生成 (必須)
flutter pub run build_runner build --delete-conflicting-outputs

flutter run
