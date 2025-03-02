Table users {
  id uuid [primary key]
  email text
  password text
  created_at timestamp
}

Table subscriptions {
  id uuid [primary key]
  user_id uuid [not null]
  followed_user_id uuid [not null]
  created_at timestamp
}

Ref: subscriptions.user_id > users.id
Ref: subscriptions.followed_user_id > users.id