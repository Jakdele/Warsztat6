create table User
(
  id       int auto_increment
    primary key,
  email    varchar(255) not null,
  enabled  bit          not null,
  password varchar(255) not null,
  username varchar(255) not null,
  constraint UK_e6gkqunxajvyxl5uctpl2vl2p
  unique (email),
  constraint UK_jreodf78a7pl5qidfh43axdfb
  unique (username)
);

create table Message
(
  id          int                                not null
    primary key,
  checked     bit                                null,
  receiver_id int                                null,
  sender_id   int                                null,
  msgtext     varchar(255)                       null,
  created     datetime default CURRENT_TIMESTAMP null,
  constraint FK2hnqtmi68j7g8y1bwhxq4apd5
  foreign key (receiver_id) references User (id),
  constraint FKcrnfc5k5lxdfurq3b97o52dnv
  foreign key (sender_id) references User (id)
);

create index FK2hnqtmi68j7g8y1bwhxq4apd5
  on Message (receiver_id);

create index FKcrnfc5k5lxdfurq3b97o52dnv
  on Message (sender_id);

create table Tweet
(
  id      int                                not null
    primary key,
  created datetime default CURRENT_TIMESTAMP null,
  text    varchar(140)                       not null,
  title   varchar(50)                        not null,
  user_id int                                null,
  constraint FKtjo83phj1ffkewrkbxqmfvw36
  foreign key (user_id) references User (id)
);

create table Comment
(
  id       int                                not null
    primary key,
  created  datetime default CURRENT_TIMESTAMP null,
  text     varchar(60)                        not null,
  tweet_id int                                null,
  user_id  int                                null,
  constraint FKcc5n08r8pndrkekxtc05q69e4
  foreign key (tweet_id) references Tweet (id),
  constraint FKhlbnnmiua9xpvfq8y1u1a15ie
  foreign key (user_id) references User (id)
);

create index FKcc5n08r8pndrkekxtc05q69e4
  on Comment (tweet_id);

create index FKhlbnnmiua9xpvfq8y1u1a15ie
  on Comment (user_id);

create index FKtjo83phj1ffkewrkbxqmfvw36
  on Tweet (user_id);

create table hibernate_sequence
(
  next_val bigint null
);



