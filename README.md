# README

# アプリケーション名
## MOTIVATE

# アプリケーション概要
フィットネス専用の画像シェアアプリになります。
「誰かのモチベーションになる」ということがテーマです。

# 使用技術

- Rails 6.0.3.4<br>
- Ruby 2.6.5<br>
- Gem 3.0.3<br>
- MySql 5.6.50<br>
- Bootstrap<br>
- Nginx<br>
- Puma<br>
- AWS<br>
 - EC2
 - S3
 - ROUTE53
- Capistrano3<br>
- RSpec<br>
- Google API<br>
- Facebook API<br>

# 機能一覧
- ログイン機能(devise, GoogleAPI, Facebook API)
- 投稿機能(Active Storage)
- コメント機能
- いいね機能(Ajax)
- フォロー機能

# テスト
- 単体テスト
- 結合テスト

 # アプリURL
 https://masakin117.com/

# テスト用アカウント
テスト用に下記のアカウントでログインしていただけます。<br>
Email: test@exam<br>
Password: testdesu

# 利用方法
- ログインしてユーザーを作成することができます。
- Google,Facebookアカウントを使用し、ログインすることができます。
- 画像、テキストの投稿ができます。
- 投稿した画像、テキストを編集、削除することができます。
- 投稿に対してコメントすることができます。
- マイページのプロフィールを作成、編集することができます。
- 気に入った投稿に対して「いいね」を押すことができます。
- 気に入ったユーザーをフォローすることができます。

# 目指した課題解決

## ペルソナ

|性別と年齢層                                                                   |
|-----------------------------------------------------------------------------|
|鍛えた体を自慢したいという潜在意識があり、日常的に体を鍛えている20代、男性をターゲットです。|


|職業                                                               |
|------------------------------------------------------------------|
|職業のジャンル設定はせず、終業後や休日に時間のあるサラリーマンと考えています。 |

|趣味                                                                       |
|--------------------------------------------------------------------------|
|趣味は、ライフスタイルをSNSにアップすることです。                                 |
|日頃からお洒落なものや、流行には敏感です。                                       |
|特に、趣味がトレーニングです。                                                 |
|SNSの有名なフィットネスアカウントの投稿を眺めて、自分もこうなりたいと日々考えています。 |
|しかし、自分に自身がなく、SNSに鍛えた体をUPする勇気がありません。                   |
|本心は、UPして自分も憧れられる様な人になりたいと考えています。                      |
|また誰でも気軽にUPできる様な環境が欲しいと考えています。                           |

|ユーザーストーリー                                                         |
|------------------------------------------------------------------------|
|フィットネス専門のSNSを作る事によって、鍛えた体を気兼ねなくSNSにUPすることができる。 |
| いいねがある一定数に達すると特別な称号などをその投稿に対して行い、承認欲求を満たす。  |
| またフォロワーの数によって称号を与える事により、知名度の基準になる。               |

# 洗い出した要件
| 機能              | 目的                                                                 | 詳細                                                          |
|------------------|----------------------------------------------------------------------|--------------------------------------------------------------|
| トップビュー       | アプリについて知ってもらう為のビューです。                                  | アプリの概要について説明します。                                   |
| ヘッダー          | アプリ内ビューに共通するボタン類を表示する為の部分テンプレートです。             | アプリ内全画面に共通するボタン類を表示します。                       |
| フッター          | アプリ内全画面に共通して無断コピーなどの防止の為、「コピーライト」の表示をします。 | アプリ内全画面に共通して「コピーライト」の表示をします。                |
| 投稿一覧          | 投稿された画像を一覧で見るためのビューです。                                 | 投稿された画像の一覧を表示します。                                  |
| 投稿機能          |投稿するための機能です。                                                   | 画像、テキストを投稿します。                                      |
| 投稿編集機能       |  投稿した内容を編集するための機能です。                                     |画像、テキストの編集をします。                                      |
| 投稿更新機能       | 投稿した内容を更新するための機能です。                                      | 画像、テキストの更新をします。                                     |
| 投稿削除機能       | 投稿した内容を削除するための機能です。                                      |投稿した画像、テキストを削除します。                                 |
| 個人ページ         | ユーザー登録後、個人画像、自己紹介、投稿内容を表示する為のビューです。           | 個人画像、自己紹介、投稿内容を一覧で表示します。                      |
| 個人ページ編集機能  | ユーザー登録後、初期設定の個人画像、自己紹介を編集するための機能です。            | ユーザー登録後、初期設定の個人画像、自己紹介を編集します。             |
| 個人ページ更新機能  | ユーザー登録後、初期設定の個人画像、自己紹介を更新するための機能です。            | ユーザー登録後、初期設定の個人画像、自己紹介を更新します。             |
| ログイン機能       | ログインをしてサービスを使用できる様にする為の機能です。                       | 名前、Eメールでログインします。                                    |
| APIでのログイン機能 | Google、Facebookのアカウントを用いて気軽にログインできる様にする為の機能です。  | Google、Facebookのアカウントを用いてログインします。                |
| サインアップ機能    | 新規登録をしてサービスを使用できる様にする為の機能です。                       | 名前、Eメール、パスワード、パスワード確認を入力して、新規登録をします。  |
| いいね機能         | 気に入った投稿に対して、評価をするための機能です。                            |投稿内の「ダンベルマーク」を押すことでいいねを押します。                |  
| フォロー機能       | 気に入ったユーザーをフォローするための機能です。                              | ユーザーの個人ページからフォローをします。                           |
| フォロー中一覧     | フォローしているメンバーを確認するためのビューです。                           | 個人ページからフォロー中メンバーを確認します。                        |
| フォロワー一覧     | フォローされているメンバーを確認するためのビューです。                         |個人ページからフォローされているメンバーを確認します。                   |
| コメント機能       | 気に入った投稿に対して、コメントをするための機能です。                         | 投稿の詳細ページからコメントをします。                               |



# 実装した機能についてのGIF説明
## いいね機能について
いいねは「ダンベルマーク」にし、クリックすることにより、「ダンベルマーク」の色が変わると共に、「MOTIVATE」の称号も非同期通信で表示されます。

![post1](https://user-images.githubusercontent.com/76035698/106378801-df9c6d80-63ea-11eb-99f1-739d9ccc808e.gif)

## 投稿、編集、更新、削除について
ログインしている本人が投稿したもののみ、編集、更新、削除することができます。

![post](https://user-images.githubusercontent.com/76035698/106377803-f50d9980-63e2-11eb-8a46-b452e3582033.gif)

![edit](https://user-images.githubusercontent.com/76035698/106377800-eb843180-63e2-11eb-8236-e25f4b93ad13.gif)

![des](https://user-images.githubusercontent.com/76035698/106377794-e7f0aa80-63e2-11eb-8cf0-b280e9ff5551.gif)


## マイページについて
マイページには本人のプロフィール画像、自己紹介、投稿一覧が表示されます。

![mypage](https://user-images.githubusercontent.com/76035698/106378022-892c3080-63e4-11eb-8283-f585caace249.gif)

## フォロー機能
気に入った他ユーザーをフォローすることができます。

![follow](https://user-images.githubusercontent.com/76035698/106378020-87fb0380-63e4-11eb-93b1-9f1aebb1e051.gif)

## 画像プレビュー機能
投稿前の画像を確認することができます。

![preview](https://user-images.githubusercontent.com/76035698/110060230-f0a11b80-7da8-11eb-972d-56d1514825fc.gif)

# 実装予定の機能

| 機能                                         | 目的                                                                 | 詳細                                                          |
|---------------------------------------------|----------------------------------------------------------------------|--------------------------------------------------------------|
| タグ機能                                     | タグ付をし、似たタグを検索し見ることができるようにするための機能です。           | 投稿の際に、タグも投稿し、編集、更新もできます。                     |
| 検索機能                                     | ユーザーや投稿を検索するための機能です。                                    | ユーザーや投稿を検索できるようにします。                            |
| ある一定数のフォロー獲得後に「称号」を表示         | フォロー数の多い人は「フィットネススター」として認定し、承認欲求を満たす機能です。 | ある一定のフォロー数を獲得した人に、プロフィール横に「称号」を表示します。|

# AWS構成図

![AWS](https://user-images.githubusercontent.com/76035698/108619885-2e2dac80-746b-11eb-82e0-8c7d908ab0c1.png)


# ER図

![ER2](https://user-images.githubusercontent.com/76035698/106378461-5d12ae80-63e8-11eb-974f-94efc74938d8.png)

# ローカルでの動作環境

- Rails 6.0.3.4<br>
- Ruby 2.6.5<br>
- Gem 3.0.3<br>
- MySql 5.6.50<br>
- Yarn 1.22.10


ターミナルにて下記を順番に実行ください。

% git https://github.com/masa-maker/motivate-0115.git<br>
% cd motivate-0115<br>
% bundle install<br>
% yarn install<br>
% rails db:create<br>
% rails db:migrate





# テーブル設計

## users テーブル

| Column                    | Type    | Options                   |
|---------------------------|---------|---------------------------|
| name                      | string  | null: false, unique: true |
| email                     | string  | null: false, unique: true |
| encrypted_password        | string  | null: false               |

### Association

- has_many :posts
- has_many :goods
- has_many :comments
- has_many :relationships
- has_many :followings, through: :relationships, source: :follow
- has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
- has_many :followers, through: :reverse_of_relationships, source: :user
- has_one  :profile
- has_many :motivate_credentials

## relationships テーブル

| Column    | Type       | Options                                    |
|-----------|------------|--------------------------------------------|
| follow    | integer    | null: false, foreign_key: {to_table: user }|
| user      | references | null: false, foreign_key: true             |

### Association

- belongs_to :user
- belongs_to :follow, class_name: User


## profiles テーブル

| Column                    | Type        | Options                        |
|---------------------------|-------------|--------------------------------|
| info                      | text        | null: false                    |
| user                      | references  | null: false, foreign_key: true |

### Association

- belongs_to :user


##  motivate_credentialsテーブル

| Column   | Type       | Option                         |
|----------|------------|--------------------------------|
| provider | string     | null: false                    |
| uid      | string     | null: false                    |
| user_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## posts テーブル

| Column | Type       | Option                         |
|--------|------------|--------------------------------|
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association

- has_many   :comments
- has_many   :goods
- belongs_to :user

## good テーブル

| Column  | Type       | Option                         |
|---------|------------|--------------------------------|
| user    | references | null: false, foreign_key: true |
| post    | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user



## comments テーブル

| Column  | Type       | Option                         |
|---------|------------|--------------------------------|
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| post    | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user