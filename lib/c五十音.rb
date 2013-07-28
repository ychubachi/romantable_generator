# -*- coding: utf-8 -*-

class C五十音
  attr :表
 
  def initialize
    @表 = {
      あ行:     ['あ',   'い',   'う',   'え',   'お'  ],
      か行:     ['か',   'き',   'く',   'け',   'こ'  ],
      が行:     ['が',   'ぎ',   'ぐ',   'げ',   'ご'  ],
      さ行:     ['さ',   'し',   'す',   'せ',   'そ'  ],
      ざ行:     ['ざ',   'じ',   'ず',   'ぜ',   'ぞ'  ],
      た行:     ['た',   'ち',   'つ',   'て',   'と'  ],
      だ行:     ['だ',   'ぢ',   'づ',   'で',   'ど'  ],
      な行:     ['な',   'に',   'ぬ',   'ね',   'の'  ],
      は行:     ['は',   'ひ',   'ふ',   'へ',   'ほ'  ],
      ば行:     ['ば',   'び',   'ぶ',   'べ',   'ぼ'  ],
      ぱ行:     ['ぱ',   'ぴ',   'ぷ',   'ぺ',   'ぽ'  ],
      ま行:     ['ま',   'み',   'む',   'め',   'も'  ],
      や行:     ['や',   '　',   'ゆ',   '　',   'よ'  ],
      ら行:     ['ら',   'り',   'る',   'れ',   'ろ'  ],
      わ行:     ['わ',   'ゐ',   '　',   'ゑ',   'を'  ],
      ゃ行:     ['ゃ',   '　',   'ゅ',   '　',   'ょ'  ],
      きゃ行:   ['きゃ', 'きぃ', 'きゅ', 'きぇ', 'きょ'],
      ぎゃ行:   ['ぎゃ', 'ぎぃ', 'ぎゅ', 'ぎぇ', 'ぎょ'],
      しゃ行:   ['しゃ', 'しぃ', 'しゅ', 'しぇ', 'しょ'],
      しゃ行H:  ['しゃ', 'しぃ', 'し',   'しぇ', 'しょ'], # ヘボン式のshiは「し」
      じゃ行:   ['じゃ', 'じぃ', 'じゅ', 'じぇ', 'じょ'],
      じゃ行H:  ['じゃ', 'じ',   'じゅ', 'じぇ', 'じょ'], # ヘボン式のji は「じ」
      ちゃ行:   ['ちゃ', 'ちぃ', 'ちゅ', 'ちぇ', 'ちょ'],
      ちゃ行H:  ['ちゃ', 'ち',   'ちゅ', 'ちぇ', 'ちょ'], # ヘボン式のchiは「ち」
      ぢゃ行:   ['ぢゃ', 'ぢぃ', 'ぢゅ', 'ぢぇ', 'ぢょ'],
      てゃ行:   ['てゃ', 'てぃ', 'てゅ', 'てぇ', 'てょ'],
      でゃ行:   ['でゃ', 'でぃ', 'でゅ', 'でぇ', 'でょ'],
      にゃ行:   ['にゃ', 'にぃ', 'にゅ', 'にぇ', 'にょ'],
      ひゃ行:   ['ひゃ', 'ひぃ', 'ひゅ', 'ひぇ', 'ひょ'],
      びゃ行:   ['びゃ', 'びぃ', 'びゅ', 'びぇ', 'びょ'],
      ぴゃ行:   ['ぴゃ', 'ぴぃ', 'ぴゅ', 'ぴぇ', 'ぴょ'],
      ふゃ行:   ['ふゅ', '　',   'ふゅ', '○',   'ふょ'],
      みゃ行:   ['みゃ', 'みぃ', 'みゅ', 'みぇ', 'みょ'],
      りゃ行:   ['りゃ', 'りぃ', 'りゅ', 'れぇ', 'りょ'],
      ゔゃ行:   ['ゔゃ', 'ゔぃ', 'ゔゅ', 'ゔぇ', 'ゔょ'],
      ぁ行:     ['ぁ',   'ぃ',   'ぅ',   'ぇ',   'ぉ'  ], # la, xa
      うぁ行:   ['うぁ', 'うぃ', 'う',   'うぇ', 'うぉ'],
      ゔぁ行:   ['ゔぁ', 'ゔぃ', 'ゔ',   'ゔぇ', 'ゔぉ'], # ゔぅ？
      くぁ行:   ['くぁ', 'くぃ', 'く',   'くぇ', 'くぉ'],
      ぐぁ行:   ['ぐぁ', 'ぐぃ', 'ぐ',   'ぐぇ', 'ぐぉ'], # Mozcにない行
      つぁ行:   ['つぁ', 'つぃ', 'つぅ', 'つぇ', 'つぉ'], # Mozcに「つぅ」ない
      づぁ行:   ['づぁ', 'づぃ', 'づぅ', 'づぇ', 'づぉ'], # Mozcにない行
      とぁ行:   ['とぁ', 'とぃ', 'とぅ', 'とぇ', 'とぉ'],
      どぁ行:   ['どぁ', 'どぃ', 'どぅ', 'どぇ', 'どぉ'],
      ふぁ行:   ['ふぁ', 'ふぃ', 'ふ',   'ふぇ', 'ふぉ'], # ふぅ？
      # ぶぁ？
    }
  end
end

