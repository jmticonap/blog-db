create table blog.public.user(
"id" serial primary key,
"name" varchar not null,
"email" varchar not null,
"password" varchar not null,
"age" int
);

create table blog.public.category(
"id" serial primary key,
"name" varchar not null
);

create table blog.public.post(
"id" serial primary key,
"title" varchar not null,
"content" text,
"author" int,
constraint fk_user_post foreign key (author) references blog.public.user(id)
);

create table blog.public.coment(
"id" serial primary key,
"comment" text,
"post_id" int,
"author" int,
constraint fk_post_coment foreign key (post_id) references blog.public.post(id),
constraint fk_user_coment foreign key (author) references blog.public.user(id)
);

create table blog.public.post_category(
"id" serial primary key,
"post_id" int,
"category_id" int,
constraint fk_post__post_category foreign key (post_id) references blog.public.post(id),
constraint fk_category__post_category foreign key (category_id) references blog.public.category(id)
);

