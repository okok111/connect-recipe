# コメント機能まで実装したらすること
前提：postsにcommentsがコメントするという状態の場合

- `rails g controller hoges`
- `rails g controller hogehoges`
- 各コントローラに記述していく
- routes.rbの編集
- ` rails g model Hoge content:string user:references post:references`
- ` rails g model Hogehoge content:string user:references post:references`
- 各モデルに記述していく
- 各ビューファイルを編集していく
