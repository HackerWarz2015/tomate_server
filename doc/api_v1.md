# ToMatE API 仕様

## 共通事項
* すべての API のルート URI は `http://example.com/api/v1` です

## 認証関連事項

### ユーザ登録
```
curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"user":{"name":"hoge","email":"hoge@gmail.com","password":"hogehoge","password_confirmation":"hogehoge"}}' "http://localhost:3000/api/users.json"
```

### ログイン(authentication_token 取得)
```
curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"user":{"email":"hoge@gmail.com","password":"hogehoge"}}'  "http://localhost:3000/api/users/sign_in.json"
```

### リソースアクセス
```
curl -v -H "Accept: application/json" -H "Content-type: application/json" "http://localhost:3000/api/v1/users.json?email=hoge@gmail.com&token=jLJyLg_o3crPPhfUoCrA4kzdrHxP31Fc"
```

### アクセストークンの更新
```
curl -v -H "Accept: application/json" -H "Content-type: application/json" -X PUT -d '' "http://localhost:3000/api/authentication_token?email=hoge@gmail.com&token=8PaRdk8vmVTzwxXesXtAvgAj_2WGSs5N"
```

### アクセストークンの削除
```
curl -v -H "Accept: application/json" -H "Content-type: application/json" -X DELETE "http://localhost:3000/api/authentication_token.json?email=hoge@gmail.com&token=MfeyNx9YpSvnEVxkyDe5SfDuuPoi5TyE"
```


## API v1 一覧

l Method | URI (/api/v1/...)                            | 対応する action (/api/v1...) | 概要 |
|:-------|:---------------------------------------------|:-----------------------------|:-----|
| GET    | [/users/:id](#users)                                 | /users#show          | id で指定したユーザ情報を取得 |
| GET    | [/users/:user_id/friends](#friends_index)            | /friendss#index      | user_id で指定したユーザの、友達一覧を取得 |
| POST   | [/users/:user_id/friends](#friends_index)            | /friendss#create     | user_id で指定したユーザの、友達を追加 |
| GET    | [/users/:user_id/user_tasks](#user_tasks_index)      | /user_tasks#index      | user_id で指定したユーザの、タスク一覧を取得 |
| POST   | [/users/:user_id/user_tasks](#user_tasks_create)     | /user_tasks#create     | user_id で指定したユーザの、タスクを作成 |
| PUT    | [/users/:user_id/user_tasks/:id](#user_tasks_update) | /user_tasks#update     | user_id で指定したユーザの、タスクを更新 |
| GET    | [/users/:user_id/rewards](#rewards_index)            | /rewards#index      | user_id で指定したユーザの、報酬一覧を取得 |
| POST   | [/users/:user_id/rewards](#rewards_create)           | /rewards#create     | user_id で指定したユーザの、報酬を作成 |
| PUT    | [/users/:user_id/rewards/:id](#rewards_update)       | /rewards#update     | user_id で指定したユーザの、報酬を更新 |



