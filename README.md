# Customized MinCaml

## 概要

2017年CPU実験４班のファーストコア用コンパイラ

## フォルダ構成

- 一番上にあるものがオリジナルのコードとなります。makeでビルドされます。
- testディレクトリがあります。
- min_caml_origin以下にオリジナルのmin-camlのコードなどもろもろが置かれています。

## 変更点

- 一文字関数名をなくし具体的な名前をつけました
- アーキテクチャごとにリンクする形式をやめ、専用のリポジトリとしました
- オリジナルにあわせmrをorに直し、レジスタの順番はPowerPCから少し変更しています

## emitからはかれている命令の現状

- li
- lis
- ori
- lfd
- or
- neg
- add
- addi
- sub -> 書き換える
- subi -> 書き換える
- slw
- slwi
- lwzx
- lwz
- stwx
- stw
- fmr
- fneg
- fadd
- fsub
- fmul
- fdiv
- lfdx
- lfd
- stfdx
- stfd
- cmpw
- cmpwi
- cmpu
- blr
- beq
- bne
- ble
- bgt
- bge
- mtctr
- bctr
- b
- mflr
- bctrl
- mtlr
- lmw
