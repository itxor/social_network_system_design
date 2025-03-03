Table media {
  id uuid [primary key]
  url text [not null]
  type enum('photo') [default: 'photo', not null]
  created_at timestamp
}

Table posts_media {
  id uuid [primary key]
  post_id uuid [not null]
  media_id uuid [not null]
  created_at timestamp
}

Ref: posts_media.media_id > media.id
