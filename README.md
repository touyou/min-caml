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
### シミュレータにある

- 0 add
- 2 addi
- 8 or
- 15 neg
- 17 slw
- 21 b
- 36 lwz
- 37 lwzx
- 40 stw
- 42 stwx
- 46 lfd
- 47 lfdx
- 50 stfd
- 51 stfdx
- 54 fmr
- 55 fneg
- 57 fadd
- 58 fsub
- 59 fmul
- 60 fdiv

### ISAにある

- lfd
- ori

### ISAの糖衣構文部分にある

- [ ] cmpw(cmp)
- [ ] li(addi)
- [ ] subi(addi) -> 書き換える
- [ ] lis(addis)
- [ ] bne(bc)
- [ ] cmpwi(cmpi)
- [ ] mtlr(mtspr)
- [ ] mtctr(mtspr)
- [ ] mflr(mfspr)

### ISAにすらない

- [ ] bctr
- [ ] bctrl
- [ ] blr
- [ ] beq
- [ ] ble
- [ ] bgt
- [ ] bge
- [ ] cmpu
- [ ] lmw
- [ ] sub -> 書き換える
- [ ] slwi

