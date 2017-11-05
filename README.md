# Customized MinCaml

## 概要

2017年CPU実験４班のファーストコア用コンパイラ

## 使い方

0. `make`する
0. `./min-caml file_name_without_ml`でコンパイル
0. `-debug`オプションをつくりました。(parse,type,knormal,alpha,beta,assoc,inline,constFold,cse,elim,closure,virtual,simm,regalloc)の順にもしデバッグ出力してほしいものがあればそこのビットを立てた２進数を渡します。(例：`-debug 0b10100000000000`とするとParse後のコードとK正規化後のコードのみ表示されます。)
0. `-O`オプションをつくりました。通常の状態では最適化が走らず、このオプションをつけることで最適化されます。即値最適化に関してはオプションに関わらず実行されます。

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
- 9 ori
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

### ISAの糖衣構文部分にある

- [x] cmpw cr3, rx, ry(cmp 3, 0, rx, ry)
- li rx, val(addi rx, 0, val)
- [x] subi(addi)
- [x] lis rx, val(addis rx, 0, val)
- [x] bne target(bc 4, 2, target)
- [x] cmpwi cr3, rx, val(cmpi 3, 0, rx, val)
- [x] mtlr rx(mtspr 1, rx)
- [x] mtctr rx(mtspr 9, rx)
- [x] mflr rx(mfspr rx, 8)

### ISAにすらない

- [ ] bctr(bcctr 20, cr0)
- [ ] bctrl(bcctrl 20, cr0?)
- [x] blr
- [x] beq
- [x] ble
- [x] bgt
- [x] bge
- lmw rt, d(ra) ... load multiple word
- [ ] sub rx, ry, rz = subf rx, rz, ry = rx := not(rz) + ry + 1
- [ ] slwi ra,rs,n =  rlwinm ra,rs,n,0,31-n

