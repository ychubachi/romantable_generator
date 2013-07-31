# -*- coding: utf-8 -*-

require './generator'

Generator.execute <<-EOS
  #{DATA.read}
EOS
__END__

################################################################
# DSL
#

子音 = {
  か行: {左右: :右, 段: :上, 番号: 2}, # c
  さ行: {左右: :右, 段: :中, 番号: 4}, # s
  た行: {左右: :右, 段: :中, 番号: 2}, # t
  な行: {左右: :右, 段: :中, 番号: 3}, # n
  は行: {左右: :右, 段: :中, 番号: 1}, # h
  ま行: {左右: :右, 段: :下, 番号: 1}, # m
  や行: {左右: :右, 段: :下, 番号: 3}, # v
  ら行: {左右: :右, 段: :上, 番号: 3}, # r
  わ行: {左右: :右, 段: :下, 番号: 2}, # w
  が行: {左右: :右, 段: :上, 番号: 1}, # g
  ざ行: {左右: :右, 段: :下, 番号: 4}, # z
  だ行: {左右: :右, 段: :中, 番号: 0}, # d
  ば行: {左右: :右, 段: :下, 番号: 0}, # b
  ぱ行: {左右: :右, 段: :上, 番号: 0}, # f
  ぁ行: {左右: :右, 段: :上, 番号: 4}, # l
}

左中 = {左右: :左, 段: :中}
左下 = {左右: :左, 段: :下} # 撥音拡張
左上 = {左右: :左, 段: :上} # 二重母音拡張
二重母音登録 ['あい', 'うい', 'うう', 'えい', 'おう']

=begin
================================================================
★★★：A.基本的な打ち方・撥音拡張

1) 拗音，ぱ行，や行以外はほぼ通常のローマ字と同じです．
2) 清音，濁音，半濁音は「ぱ行」「や行」「か行」を除いて普通のローマ字と同じです．「か行」の子音キーは[C]，「や行」の子音キーは[V]，「ぱ行」の子音キーは[F]となります．また，例：か【CA】，や【VA】，ぷ【FU】
3) 促音「っ」は，左手上段小指の[']キーです．通常のローマ字のように子音を2度打ちするのではありません．(Dvorak配列の実装によっては左手上段小指のキーが[*]となるものもあります．)
4) 撥音「ん」はほとんどの場合，撥音拡張（[;][Q][J][K][X]キー）で入力できます．撥音拡張は母音の下のキーになります．単独の「ん」を入力するには [N][N] と打ちます．
5) 拗音は次節以降のようにJLOD独自の打ち方となります．通常のように[子音キー]＋[Y]＋[母音キー]では打てません．拗音文字(ゃゅょぁぃぅぇぉゎヵヶっ)を単独で入力するには [L] を前置します．
6) 外来語に出てくる長音符「ー」は[P]キーまたは[-]キーを使います．Dvorak配列では[-]キーは[S]キーの１つ右です．
7)  句読点は[,][.]キーを使います．

例
天使【TJSI】or【TENNSI】
カード【CA-DO】
暗記【;CI】
過去【CACO】，聞く【CICU】
夜【VORU】，ヤカン【VAC;】
ピンク【FXCU】，ペチコート【FETICOPTO】
================================================================
=end

=begin
## A-1, A-2
変換 :あ行,母音: 左中 # 普通
[:か行, :さ行,:た行, :な行, :は行, :ま行, :や行, :ら行, :わ行,
 :が行, :ざ行,:だ行, :ば行, :ば行, :ぱ行].each do |行|
  変換 行, 子音: 子音[行], 母音: 左中
end

# A-3
変換('っ', 位置: [{左右: :左, 段: :上, 番号: 0}])

# A-4
変換 :あ行, 撥音化: {}, 母音: 左下 # 撥音（ん）
# 撥音（ん）
[:か行, :さ行,:た行, :な行, :は行, :ま行, :や行, :ら行, :わ行,
 :が行, :ざ行,:だ行, :ば行, :ば行, :ぱ行].each do |行|
  変換 行, 子音: 子音[行], 撥音化: {}, 母音: 左下
end
変換('ん', 位置: [{左右: :右, 段: :中, 番号: 3}, {左右: :右, 段: :中, 番号: 3}])

# A-5
L = {左右: :右, 段: :上, 番号: 4}
変換 :ゃ行, 子音: L, 拗音化: 子音[:や行], 母音: 左中 # ゃゅょ
変換 :ぁ行, 拗音化: L, 母音: 左中 # ぁぃぅぇ
あ = {左右: :左, 段: :中, 番号: 0}
う = {左右: :左, 段: :中, 番号: 3}
変換 'ゎ', 子音: L, 拗音化: 子音[:わ行], 母音: あ # lwa
変換 'ヵ', 子音: L, 拗音化: 子音[:か行], 母音: あ # lca -> 辞書になし
変換 'ヶ', 子音: L, 拗音化: 子音[:か行], 母音: あ # lce -> 辞書になし
変換 'っ', 子音: L, 拗音化: 子音[:た行], 母音: う # lce -> 辞書になし
#  ltuヵ

# A-6
変換('ー', 位置: [{左右: :左, 段: :上, 番号: 3}])

# A-7
変換('，', 位置: [{左右: :左, 段: :上, 番号: 1}])
変換('．', 位置: [{左右: :左, 段: :上, 番号: 2}])
=end

=begin
================================================================
★★★：B.2重母音拡張

1) 二重母音拡張は母音の上のキー．母音キーと組み合わせた場合のみ（2ストローク目以降）使用できます．
2) 2ストロークめあるいは3ストロークめの[母音キー]を打つ代わりに，[撥音拡張キー]あるいは[2重母音拡張キー]を打つことで，それぞれ「母音+ん」，あるいは「2重母音」を入力することができます．

例
端麗【T;R.】
恋愛【RJAI】※【RJ'】とは打てない
================================================================
=end

# # B-1, B-2

# [:か行, :さ行,:た行, :な行, :は行, :ま行, :や行, :ら行, :わ行,
#  :が行, :ざ行,:だ行, :ば行, :ば行, :ぱ行].each do |行|
#   変換 二重母音(行), 子音: 子音[行], 母音: 左中
# end

=begin
================================================================
★★★：C.拗音の打ち方(い行＋ゃぃゅぇょ)

1) 拗音は[子音キー]＋[拗音化キーA]＋[母音キー]の3ストロークで入力します．
2) 通常のローマ字綴りでは拗音化キーは[Y]キーでした．JLODでは，拗音化キーAは子音キーと同じ段(同じ並び)の右手人差し指か薬指のどちらか打ちやすい指，になります．[Y]キーは使えません．

  第1ストロークが中指，薬指，小指の場合は，拗音化キーAは右手人差し指となります．
  第1ストロークが人差し指の場合は，拗音化キーAは右手薬指を使います．

例
情緒【ZM,THO】，百歩【HNA'FO】
平壌【FRQV;】
================================================================
=end

# 拗音L = {左右: :右, 番号: 1}
# 拗音R = {左右: :右, 番号: 3}

# [[:きゃ行, :か行], [:ぎゃ行, :が行], [:しゃ行, :さ行], [:じゃ行, :ざ行],
#  [:ちゃ行, :た行], [:ぢゃ行, :だ行], [:てゃ行, nil],   [:でゃ行, nil],
#  [:にゃ行, :な行], [:ひゃ行, :は行], [:ぴゃ行, :ぱ行], [:ふゃ行, nil],
#  [:りゃ行, :ら行], [:ゔゃ行, nil],   [:ぴゃ行, :ぱ行], [:ふゃ行, nil],
#  [:ゃ行,   :や行],
# ].each do |行, 鍵|
#   if 鍵
#     拗音鍵 = 子音[鍵][:番号] < 2 ? 拗音R : 拗音L
#     変換 行,           子音: 子音[鍵], 拗音化: 拗音鍵,             母音: 左中
#     変換 行,           子音: 子音[鍵], 拗音化: 拗音鍵, 撥音化: {}, 母音: 左下 # きゃん
#     変換 二重母音(行), 子音: 子音[鍵], 拗音化: 拗音鍵,             母音: 左上 # きゃいきゅいきゅうきぇいきょう
#   end
# end

=begin
★★★：D.拗音の打ち方(う行＋ぁぃぅぇぉ)

1) 拗音は[子音キー]＋[拗音化キーB]＋[母音キー]の3ストロークで入力します．

2) 通常のローマ字綴りのように[F][V]キーなどでは入力できません．で

    第1ストロークが中指，薬指，小指の場合は，拗音化キーBは右手薬指となります．
    第1ストロークが人差し指の場合は，拗音化キーBは右手人差し指を使います．

例
ファイト【HH'TO】，ウォン【WVQ】
=end

拗音B_L = {左右: :右, 番号: 1}
拗音B_R = {左右: :右, 番号: 3}
[[:ふぁ行, :は行], [:うぁ行, :わ行], [:ゔゃ行, :や行]].each do |行, 鍵|
  拗音鍵 = 子音[鍵][:番号] < 2 ? 拗音B_L : 拗音B_R # 拗音と違う
  変換 行,           子音: 子音[鍵], 拗音化: 拗音鍵,             母音: 左中
  変換 行,           子音: 子音[鍵], 拗音化: 拗音鍵, 撥音化: {}, 母音: 左下 # きゃん
  変換 二重母音(行), 子音: 子音[鍵], 拗音化: 拗音鍵,             母音: 左上 # きゃいきゅいきゅうきぇいきょう
end

## ----------------------------------------------------------------
## 清音，濁音，半濁音
## ----------------------------------------------------------------

# # 促音を母音上に割り当てるてもある
# # TODO: ltu
# 促音L = {左右: :右, 番号: 0}
# 促音R = {左右: :右, 番号: 2} # NOTE: 追加

# # か〜ぱ行, ぁ行
# [:か行, :さ行,:た行, :な行, :は行, :ま行, :や行, :ら行, :わ行,
#  :が行, :ざ行,:だ行, :ば行, :ば行, :ぱ行, :ぁ行].each do |行|
#   # 促音（っ）
#   促音鍵 = 子音[行][:番号] < 2 ? 促音R : 促音L
#   変換 行, 子音: 子音[行], 促音化: 促音鍵, 母音: 左中
# end

## ================================================================
# ローマ字はいくつかのストロークの並び．
# 拗音化，撥音化などの変化を与える．
# Rubyの連想配列は順序を保持する．

# NOTE促音+母音下があいてる
# NOTE: あ行の二重母音がない： 変換 :あ行,母音: 左中 # 普通

# どの変化キーを使うか？
# 母音の段は？
# 'っ'は，\'ではなく，'ltu'でよい

# tta -> たっ
# きゃっきぃっきゅっきぇっきょっ（辞書にはあり．母音上使用）

# TODO: lwaのときなどの子音が破綻している
# 新DSL -> 登録 :ゃ行, {変化: L, 子音: :や行, 母音: 左中}

# 重複が検査できるので，様々な配列を試行錯誤しやすい
# 定義されなかった行も出力する

# 五十音表の不規則性はC五十音がカバーする
# 五十音表は「行，列」で -> キーボードの位置と紛らわしいため

# wvq → 辞書になし
