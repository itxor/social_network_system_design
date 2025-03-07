Table locations {
  id uuid [primary key]
  name text [not null]
  lat double [not null]
  lon double [not null]
  created_at timestamp
}

Table posts {
  id uuid [primary key]
  description text [null]
  user_id uuid [not null]
  location_id uuid [null]
  created_at timestamp
  updated_at timestamp
}

Table reactions {
  id uuid [primary key]
  emoji text [not null]
  created_at timestamp
}

Table posts_reactions {
  id uuid [primary key]
  post_id uuid [not null]
  reaction_id uuid [not null]
  user_id uuid [not null]
  created_at timestamp

  Indexes {
    (post_id, reaction_id, user_id) [unique]
  }
}

Table comments {
  id uuid [primary key]
  post_id uuid [not null]
  comment text [not null]
  user_id uuid [not null]
  created_at timestamp
}

Ref: posts.location_id > locations.id

Ref: comments.user_id > users.id
Ref: comments.post_id > posts.id

Ref: posts_reactions.user_id > users.id
Ref: posts_reactions.post_id > posts.id
Ref: posts_reactions.reaction_id > reactions.id

