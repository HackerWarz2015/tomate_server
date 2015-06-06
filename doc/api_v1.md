# ToMatE API 仕様

## 共通事項
* すべての API のルート URI は `http://example.com/api/v1` です


## API v1 一覧

| Method | URI (/api/v1/...)                            | 対応する action (/api/v1...) | 概要 |
|:-------|:---------------------------------------------|:-----------------------------|:-----|
| GET    | [/users/:id](#users)                                 | /users#show          | id で指定したユーザ情報を取得 |
| GET    | [/users/:user_id/user_tasks](#user_tasks_index)      | /user_tasks#index      | user_id で指定したユーザの、タスク一覧を取得 |
| POST   | [/users/:user_id/user_tasks](#user_tasks_create)     | /user_tasks#create     | user_id で指定したユーザの、タスクを作成 |
| PUT    | [/users/:user_id/user_tasks/:id](#user_tasks_update) | /user_tasks#update     | user_id で指定したユーザの、タスクを更新 |
| GET    | [/users/:user_id/rewards](#rewards_index)            | /rewards#index      | user_id で指定したユーザの、報酬一覧を取得 |
| POST   | [/users/:user_id/rewards](#rewards_create)           | /rewards#create     | user_id で指定したユーザの、報酬を作成 |
| PUT    | [/users/:user_id/rewards/:id](#rewards_update)       | /rewards#update     | user_id で指定したユーザの、報酬を更新 |

