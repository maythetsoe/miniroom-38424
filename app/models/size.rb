class Size < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '小型サイズ - ネコポス ▲全国一律210円' },
    { id: 3, name: '小〜中型サイズ - 宅急便コンパクト ▲全国一律450円' },
    { id: 4, name: '60サイズ (2kgまで) 750円' },
    { id: 5, name: '80サイズ (5kgまで) 850円' },
    { id: 6, name: '100サイズ (10kgまで) 1,050円' },
    { id: 7, name: '120サイズ (15kgまで) 1,200円' },
    { id: 8, name: '140サイズ (20kgまで) 1,450円' },
    { id: 9, name: '160サイズ (25kgまで) 1,700円' },
    { id: 11, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :donations

end