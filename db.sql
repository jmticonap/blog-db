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

insert into blog.public.user ("name","email","password","age")
values 
('Donovan','donovan@gmail.com','password',8),
('Mia','mia.mauren@gmail.com','password',15),
('Ada','ada.pacheco@gmail.com','password',74),
('Godofredo','segundo.usa@hotmail.com','password',70);

insert into blog.public.category ("name")
values
('Generico'),
('Anuncio'),
('Personal'),
('Noticia'),
('Trend'),
('Politica'),
('Deporte'),
('Economía'),
('Internacional'),
('Cultura'),
('Musica');

insert into blog.public.post ("title","content" ,"author")
values 
('Cumpleaños de mi princesa','Este año fueron los 15 años de mi princesa',4);

insert into blog.public.post_category ("post_id","category_id")
values
(1,3),
(1,2);

insert into blog.public.coment ("comment","post_id","author")
values
('Si fue el cumple de mi hermanita',1,1),
('Mi nieta ya está grande',1,2);