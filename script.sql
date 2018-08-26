create table hibernate_sequence
(
  next_val bigint null
);

create table tweeter_user
(
  id        int          not null
    primary key,
  email     varchar(255) null,
  firstName varchar(255) not null,
  lastName  varchar(255) not null
);

create table tweeter_tweet
(
  id        int                                not null
    primary key,
  created   datetime default CURRENT_TIMESTAMP null,
  title     varchar(50)                        not null,
  tweetText varchar(160)                       not null,
  user_id   int                                null,
  constraint FK1unki369igbm7msadckxjnrvh
  foreign key (user_id) references tweeter_user (id)
);

create index FK1unki369igbm7msadckxjnrvh
  on tweeter_tweet (user_id);


