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
| POST   | [/users/:user_id/friends](#friends_create)           | /friendss#create     | user_id で指定したユーザの、友達を追加 |
| GET    | [/users/:user_id/user_tasks](#user_tasks_index)      | /user_tasks#index    | user_id で指定したユーザの、タスク一覧を取得 |
| POST   | [/users/:user_id/user_tasks](#user_tasks_create)     | /user_tasks#create   | user_id で指定したユーザの、タスクを作成 |
| PUT    | [/users/:user_id/user_tasks/:id](#user_tasks_update) | /user_tasks#update   | user_id で指定したユーザの、タスクを更新 |
| GET    | [/users/:user_id/rewards](#rewards_index)            | /rewards#index       | user_id で指定したユーザの、報酬一覧を取得 |
| POST   | [/users/:user_id/rewards](#rewards_create)           | /rewards#create      | user_id で指定したユーザの、報酬を作成 |
| PUT    | [/users/:user_id/rewards/:id](#rewards_update)       | /rewards#update      | user_id で指定したユーザの、報酬を更新 |



### <a name="users"></a> GET /users/:id
* URI 中の必須パラメータ
  id: 取得するユーザの id

#### response
```
{
  "user": {
     "id": 1,
      "name": "ks",           // string
      "email": "ks@ks.com",   // string
      "steps": 10000,         // integer
      "friend_ids": [         // array
            2,            // integer
            3,
            4
      ],
      "created_at": "2015-03-20T16:28:43.000+09:00",    // datetime
      "updated_at": "2015-03-20T16:28:43.000+09:00"
    }
}
```

### <a name="friends_index"></a> GET /users/:user_id/friends
* URI 中の必須パラメータ
  user_id : 指定するユーザの id

#### response
```
{
  "friends": {
    "friend_ids": [
        2,
        3,
        4
    ]
  }
}
```

### <a name="friends_update"></a> POST /users/:user_id/friends
* URI 中の必須パラメータ
  user_id : 指定するユーザの id
* 必須パラメータ
  friends_ids: 友人として追加したい id の一覧 (Integer の Array)

#### request
```
{
  "friends": {
    "friend_ids": [
        100,
        200,
        300
    ]
  }
}
```

#### response
```
{
  "friends": {
    "friend_ids": [
        2,
        3,
        4,
        100,
        200,
        300
    ]
  }
}
```

### <a name="user_tasks_index"></a> GET /users/:user_id/user_tasks
* URI 中の必須パラメータ
  user_id : 指定するユーザの id

#### response
```
{
  "user_tasks" : [
    {
      "id": 1,
      "user_id": 1,
      "title": "神になる",
      "difficulty": 5,
      "steps": 5,
      "failure_at": NULL,
      "done_at": "2015-03-20T16:28:43.000+09:00",
      "created_at": "2015-03-20T16:28:43.000+09:00",
      "updated_at": "2015-03-20T16:28:43.000+09:00"
    },
    {
    }
  ]
}
```

### <a name="user_tasks_create"></a> POST /users/:user_id/user_tasks
* URI 中の必須パラメータ
  user_id : 指定するユーザの id
* 必須パラメータ
  title: 目標の内容
  difficulty: 難易度
  steps: 歩数

#### request
```
{
  "user_task": {
    "title": "新世界の神になる",
    "difficulty": 5,
    "steps": 5,
  }
}
```

#### response
```
{
  "user_task": {
    "id": 3,
    "user_id": 5,
    "title": "新世界の神になる",
    "difficulty": 5,
    "steps": 5,
    "failure_at": NULL,
    "done_at": NULL,
    "created_at": "2015-03-20T16:28:43.000+09:00",
    "updated_at": "2015-03-20T16:28:43.000+09:00"
  }
}
```

### <a name="user_task_update"></a> PUT /users/:user_id/user_tasks/:id
* URI 中の必須パラメータ
  user_id : 指定するユーザの id
* 必須パラメータ
  status: 更新内容 ( "done" or "failure" or NULL )
  title: 目標の内容
  difficulty: 難易度
  steps: 歩数

status = NULL の場合、内容のみの編集で timestamp は更新しない。

#### request
```
{
  "status": "failure",     // string
  "user_task": {
    "title": "ダイエットする",
    "difficulty": 3,
    "steps": 3,
  }
}
```

#### response
```
{
  "user_task": {
    "id": 3,
    "user_id": 5,
    "title": "ダイエットする",
    "difficulty": 3,
    "steps": 3,
    "failure_at": "2015-03-30T06:23:09.000+09:00",
    "done_at": NULL,
    "created_at": "2015-03-20T16:28:43.000+09:00",
    "updated_at": "2015-03-20T16:28:43.000+09:00"
  }
}
```

### <a name="rewards_index"></a> GET /users/:user_id/rewards
* URI 中の必須パラメータ
  user_id : 指定するユーザの id

#### response
```
{
  "rewards" : [
    {
      "id": 1,
      "title": "たけしと一緒に宇宙に行く",
      "is_public": true,
      "required_steps": 30,
      "absolute_steps: 80,
      "released_at": "2015-03-20T16:28:43.000+09:00",
      "done_at": "2015-03-20T16:28:43.000+09:00",
      "created_at": "2015-03-20T16:28:43.000+09:00",
      "updated_at": "2015-03-20T16:28:43.000+09:00"
    },
    {
    }
  ]
}
```

### <a name="rewards_create"></a> POST /users/:user_id/rewards
* URI 中の必須パラメータ
  user_id : 指定するユーザの id
* 必須パラメータ
  title: ごほうびのタイトル
  is_public: 公開してもよいかどうか (true or false)

#### request
```
{
  "reward": {
    "title": "きんいろモザイク",
    "is_public": false
    "required_steps": 30,
  }
}
```

#### response
```
{
  "reward": {
    "id": 3,
    "title": "きんいろモザイク",
    "required_steps": 30,
    "is_public": false,
    "released_at": NULL,
    "done_at": NULL,
    "created_at": "2015-03-20T16:28:43.000+09:00",
    "updated_at": "2015-03-20T16:28:43.000+09:00"
  }
}
```

### <a name="rewards_update"></a> PUT /users/:user_id/rewards/:id
* URI 中の必須パラメータ
  user_id : 指定するユーザの id
* 必須パラメータ
  status: 更新内容 ( "release" or "done" or NULL )
  title: ごほうびのタイトル
  is_public: 公開してもよいかどうか (true or false)

status = NULL の場合、内容のみの編集で timestamp は更新しない。

#### request
```
{
  "status": "done",
  "reward": {
    "title": "アリス・カータレット",
    "is_public": true
  }
}
```

#### response
```
{
  "reward": {
    "id": 10,
    "title": "アリス・カータレット",
    "is_public": true,
    "released_at": "2015-03-20T16:28:43.000+09:00",
    "done_at": "2015-03-20T16:28:43.000+09:00",
    "created_at": "2015-03-20T16:28:43.000+09:00",
    "updated_at": "2015-03-20T16:28:43.000+09:00"
  }
}
```



