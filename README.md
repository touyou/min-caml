# Customized MinCaml

## 概要

2017年CPU実験４班のセカンドコア用コンパイラ

## 使い方

0. `make`する
0. `./min-caml file_name_without_ml`でコンパイル
0. `-debug`オプションをつくりました。(parse,type,knormal,alpha,beta,assoc,inline,constFold,cse,elim,closure,virtual,simm,regalloc)の順にもしdebug出力してほしいものがあればそこのビットを立てた２進数を渡します。(例：`-debug 0b10100000000000`とするとParse後のコードとK正規化後のコードのみ表示されます。)
0. `-dump-hoge`でhogeのdebug出力ができるようにしました。キーワードとしては下にリストしてるものが使えます。
0. `-O`オプションをつくりました。通常の状態では最適化が走らず、このオプションをつけることで最適化されます。即値最適化に関してはオプションに関わらず実行されます。
0. `-O2`オプションはセカンドコア以降に実装された最適化が加えて実行されます。現在は共通部分式削除が実装されています。
0. `-o`オプションは出力ファイル名を指定することができます。なければソースファイルと同名のアセンブリになります。
0. `-as-library`でライブラリとして組み込みたいファイル名を指定します。デフォルトでコンパイラと同じ場所にある`libmincaml.ml`がライブラリとして使われます。（例：`./min-caml -O -as-library mylib compilecode`で`mylib.ml`をライブラリとして`compilecode.ml`がコンパイルされます。）（注意：ライブラリは上に行くほど依存度の低い関数がくるように書いてください。相互再帰とかも対応してないはず。）

### デバッグオプション一覧

- `-dump-parsed`
- `-dump-eta`
- `-dump-typed`
- `-dump-knormalized`
- `-dump-alpha`
- `-dump-beta`
- `-dump-assoc`
- `-dump-inlined`
- `-dump-const-folded`
- `-dump-cse`
- `-dump-eliminated`
- `-dump-closure`
- `-dump-virtualized`
- `-dump-simm`
- `-dump-regalloc`

## フォルダ構成

- 一番上にあるものがオリジナルのコードとなります。makeでビルドされます。
- testディレクトリがあります。
- min_caml_origin以下にオリジナルのmin-camlのコードなどもろもろが置かれています。

## 変更点
 
- 一文字関数名をなくし具体的な名前をつけました
- アーキテクチャごとにリンクする形式をやめ、専用のリポジトリとしました
- 多彩なオプションを追加しました。
