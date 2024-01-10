select * from user;
select * from type;
select * from pokemon;
select * from pokemon_type;
select * from package;

-- 新增 user
insert into user(name,password) values('user1','123');

-- 新增 屬性
insert into type(name) values('水');
insert into type(name) values('雷');
insert into type(name) values('火');
insert into type(name) values('草');
insert into type(name) values('毒');

-- 新增 寶可夢
insert into pokemon(name,img) values('妙娃種子','0001.png');

-- 新增 寶可夢屬性
insert into pokemon_type(pokemon_id, type_id) values(1,4);
insert into pokemon_type(pokemon_id, type_id) values(1,5);

-- 新增 package
insert into package(user_id, pokemon_id, cp) values(1,1,50);
insert into package(user_id, pokemon_id, cp) values(1,1,30);

-- 根據 user 查詢他蒐集那些寶可夢
select u.name,k.name, p.cp from user u, package p, pokemon k where
u.id = p.user_id and k.id = p.pokemon_id;

