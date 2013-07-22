# -*- coding: utf-8 -*-
require 'generator'

describe Generator, '#変換表作成' do
  it 'ではタブ区切りの変換行を作成します' do
    g = Generator.new
    g.変換表作成('a', 'あ').should eq("a\tあ")
  end
end

describe Generator, '#変換' do
  it '左上段を検査します' do 
    g = Generator.new
    g.変換('っ', 左右: :左, 段: :上, 番号: 0).should eq("'\tっ")
    g.変換('，', 左右: :左, 段: :上, 番号: 1).should eq(",\t，")
    g.変換('．', 左右: :左, 段: :上, 番号: 2).should eq(".\t．")
    g.変換('ー', 左右: :左, 段: :上, 番号: 3).should eq("p\tー")
    g.変換('？', 左右: :左, 段: :上, 番号: 4).should eq("y\t？")
  end
  it '左中段（単母音）を検査します' do
    g = Generator.new
    g.変換('あ', 左右: :左, 段: :中, 番号: 0).should eq("a\tあ")
    g.変換('お', 左右: :左, 段: :中, 番号: 1).should eq("o\tお")
    g.変換('え', 左右: :左, 段: :中, 番号: 2).should eq("e\tえ")
    g.変換('う', 左右: :左, 段: :中, 番号: 3).should eq("u\tう")
    g.変換('い', 左右: :左, 段: :中, 番号: 4).should eq("i\tい")
    # 変換 'あいうえお', 左右: :左, 段: :中 # 番号は省略
  end
  it '二重母音（あい，おう，えい，うう，うい）を検査します' do
    pending # たいとうていつうつい
  end
end

# 母音

# 静音
# 変換 'かきくけこ', 左右: "右", 段: :上, 番号: 2
# 変換 'さしすせそ', 左右: "右", 段: :中, 番号: 4 # !> mismatched indentations at 'end' with 'def' at 51
# 変換 'たちつてと', 左右: "右", 段: :中, 番号: 2 # !> mismatched indentations at 'end' with 'class' at 2
# 変換 'なにぬねの', 左右: "右", 段: :中, 番号: 3
# 変換 'はひふへほ', 左右: "右", 段: :中, 番号: 1
# 変換 'まみむめも', 左右: "右", 段: :下, 番号: 1
# 変換 'や？ゆ？よ', 左右: "右", 段: :下, 番号: 3
# 変換 'らりるれろ', 左右: "右", 段: :上, 番号: 3
# 変換 'わゐ？ゑを', 左右: "右", 段: :下, 番号: 2

# 濁音

# 変換 'ちゃちぃちゅちぇちょ', 左右: "右", 段: :中, 番号: 2, 拗音化: 1

# 撥音（ん）
# for 番号 in 0..4
#   変換 "#{'あおえうい'[番号]}ん", 左右: "左", 段: :下, 番号: 番号
# end
# TODO "かんきんくんけんこん"
#変換 "かん", 左右: "右", 段: :上, 番号: 2, 撥音化: {左右: "左", 段: :下, 番号: 0}

# 左上段


