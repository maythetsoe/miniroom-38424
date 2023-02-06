# README

# アプリケーション名  

_**MiniRoom**_

# アプリケーション概要

ミニマリストの写真や情報などを投稿することができます。  
不要な商品を必要とする人々に差し上げるアプリです。  
結論から言うと一石二鳥です。自分がなりたいミニマリストにも近づけつつ、商品を必要とする人に差し上げれることで大切に使っていただけるのがお互いにいいことだと思います。

# URL
https://miniroom-38424.onrender.com  

# テスト用アカウント

・Basic認証パスワード : admin  
・Basic認証ID : 2222  
・「差し上げます」者用  
  メールアドレス: test@tt.com  
  パスワード: q123123  
・「頂きます」者用  
  メールアドレス: test@p.com  
  パスワード: q123123

# 使用方法

## 写真投稿

1.トップページ（一覧ページ）のヘッダーからユーザー新規登録を行います。
[![Image from Gyazo](https://i.gyazo.com/4c6bcbc7dc9215f30a814c063f5154fc.png)](https://gyazo.com/4c6bcbc7dc9215f30a814c063f5154fc)

2.Mini Roomから自分の憧れのミニマルリストの写真など(自分の部屋の写真)を投稿できる、写真内容（タイトル・画像・コンセプト）を入力し投稿します。
3.いいね機能も導入予定です。

## 他者に物を差し上げる
1.トップページのヘッダーからDonationをクリックするを物を寄付するが出来る、内容は（商品の状態の写真、説明、発送情報など、着払いのみ（目安の料金）などなど）を投稿し寄付できます。

2.寄付商品をクリックすると「いただきます」ボタンを進むと自分の情報を入れることで物を手に入れるができます。

3.ユーザーさん、Welcome To Minimal Lifeをクリックするとそのユーザーが投稿した写真などをまとめて一覧を見れます。

4.いいね機能も導入する予定です。

5.コメント機能も作成する予定です。

## 物を譲った方にお返しする（任意）
1.日本人の文化は何かをもらった時を何かをお返しする文化があるため、譲っていただいた商品の中にもし自分がすごく気に入った物があればギフト券などを個人にPrivate Chatでコードを送ることができます。

# アプリケーションを作成した背景

3年前沖縄に引っ越しする前に東京にいた時の沢山の商品をFacebookに差し上げますと宣言する時以外に必要とする方々が多く現れました。その経験を踏まえて、地球環境を守る為にも物を捨てないで使い回せた方がいいと思います。

日本で物を捨てるのに手間やお金がかかること、最近ミニマリストを目標しはじめ、眠っていた物がたくさんあり、それらをメルカリで販売する選択肢もありますが安く売るより必要とする人々に差し上げた方が気持ちがいいと思ったからです。  

また、シンプルな部屋を見ると自分のモチベーションにも繋がり、不要なものをその場で手放せるのでこのアプリケーションを開発することにしました。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/13ALrbDsXBnYmrMgrvqt-Ez_B9FS7YMavWjlPZvDCvmk/edit#gid=982722306

# 実装済みの機能　　
1. SNS新規登録
2. Mini　Room機能⇨ホームページに一覧表示されます。
3. Donation Room機能⇨Donation Roomに一覧表示されます。
写真添付まだ


# 実装予定の機能

今後は「いただきます」機能、コメント機能、プライベートコメント機能、いいね機能など実装予定です。

# データベース設計(ER図)

[![Image from Gyazo](https://i.gyazo.com/6d2737e92119b4533ded3b4f517e842b.png)](https://gyazo.com/6d2737e92119b4533ded3b4f517e842b)

# 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/c57659a07c4398cca57bd293ffa43a96.png)](https://gyazo.com/c57659a07c4398cca57bd293ffa43a96)

# 開発環境

・フロントエンド
・バックエンド
・インフラ
・テスト
・テキストエディタ
・タスク管理

# 工夫したポイント

1.着払いのみ為、商品と見合う払う価値あるかをすぐ判断できるように目安の料金を確認できます。  
2.SNS（facebook, Google）でログインできます。  
3.誰でもか使える簡単でシンプリなアプリです。  
4.地球環境の為に自分が細やかな部分でも貢献出来ればと思い一石二鳥のこのアプリを作る事にしました。  


# テーブル設計

## usersテーブル

| Column                           | Type   | Options                       |
| -------------------------------  | ------ | ----------------------------- |
| nickname                         | string | null: false                   |
| first_name                       | string | null: false                   |
| last_name                        | string | null: false                   |
| email                            | string | null: false, unique: true     |
| encrypted_password               | string | null: false                   |

### Association

- has_many :minirooms
- has_many :donations
- has_many :comments
- has_many :receives

## mini roomテーブル　（prototype）
## imageはActive Storage導入

| Column                           | Type       | Options                        |
| -------------------------------  | ---------- | -------------------------------|
| title                            | string     | null: false                    |
| concept                          | text       | null: false                    |
| user                             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments


## donationテーブル(出品)
## imageはActive Storage導入

| Column                           | Type       | Options                        |
| -------------------------------  | ---------- | -------------------------------|
| user                             | references | null: false, foreign_key: true |
| name                             | string     | null: false                    |
| description                      | text       | null: false                    |
| category_id                      | integer    | null: false                    |
| condition_id                     | integer    | null: false                    |
| delivery_id                      | integer    | null: false                    |
| region_id                        | integer    | null: false                    |
| ship_id                          | integer    | null: false                    |
| size                             | integer    | null: false                    |
<!-- | mini_room                        | references | null: false, foreign_key: true | -->


### Association

- belongs_to :user
- has_one :receive
- has_many :comments


## receiveテーブル(order)

| Column                           | Type       | Options                        |
| -------------------------------  | ---------- | -------------------------------|
| user                             | references | null: false, foreign_key: true |
| donation                         | references | null: false, foreign_key: true |
| post_code                        | string     | null: false                    |
| region_id                        | integer    | null: false                    |
| city                             | string     | null: false                    |
| address                          | string     | null: false                    |
| phone_num                        | string     | null: false                    |

### Association

- belongs_to :user
- belongs_to :donation
- has_many :comments 


## commentsテーブル

| Column                           | Type       | Options                        |
| -------------------------------  | ---------- | -------------------------------|
| content                          | text       | null: false                    |
| donation                         | references | null: false, foreign_key: true |
| user                             | references | null: false, foreign_key: true |
| receive                          | references | null: false, foreign_key: true |

### Association

- belong_to :user
- belong_to :miniroom
- belong_to :donation
- belong_to :receive
