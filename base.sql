select * from user;
select * from type;
select * from pokemon_type;
select * from pokemon;
select * from package;

-- 新增 user
insert into user(name,password) values('user1','123');

-- 新增 屬性
insert into type(id,name) values(1,'一般');
insert into type(id,name) values(2,'火');
insert into type(id,name) values(3,'水');
insert into type(id,name) values(4,'草');
insert into type(id,name) values(5,'電');
insert into type(id,name) values(6,'冰');
insert into type(id,name) values(7,'格鬥');
insert into type(id,name) values(8,'毒');
insert into type(id,name) values(9,'地面');
insert into type(id,name) values(10,'飛行');
insert into type(id,name) values(11,'超能力');
insert into type(id,name) values(12,'蟲');
insert into type(id,name) values(13,'岩石');
insert into type(id,name) values(14,'幽靈');
insert into type(id,name) values(15,'龍');
insert into type(id,name) values(16,'惡');
insert into type(id,name) values(17,'鋼');
insert into type(id,name) values(18,'妖精');


-- 新增 寶可夢
insert into pokemon(id,name,img) values(1,'妙蛙種子','0001.png');
insert into pokemon(id,name,img) values(2,'妙蛙草','0002.png');
insert into pokemon(id,name,img) values(3,'妙蛙花','0003.png');
insert into pokemon(id,name,img) values(4,'小火龍','0004.png');
insert into pokemon(id,name,img) values(5,'火恐龍','0005.png');
insert into pokemon(id,name,img) values(6,'噴火龍','0006.png');
insert into pokemon(id,name,img) values(7,'傑尼龜','0007.png');
insert into pokemon(id,name,img) values(8,'卡咪龜','0008.png');
insert into pokemon(id,name,img) values(9,'水箭龜','0009.png');
insert into pokemon(id,name,img) values(10,'綠毛蟲','0010.png');
insert into pokemon(id,name,img) values(11,'鐵甲蛹','0011.png');
insert into pokemon(id,name,img) values(12,'巴大蝶','0012.png');
insert into pokemon(id,name,img) values(13,'獨角蟲','0013.png');
insert into pokemon(id,name,img) values(14,'鐵殼蛹','0014.png');
insert into pokemon(id,name,img) values(15,'大針鋒','0015.png');
insert into pokemon(id,name,img) values(16,'波波','0016.png');
insert into pokemon(id,name,img) values(17,'比比鳥','0017.png');
insert into pokemon(id,name,img) values(18,'大比鳥','0018.png');
insert into pokemon(id,name,img) values(19,'小拉達','0019.png');
insert into pokemon(id,name,img) values(20,'拉達','0020.png');
insert into pokemon(id,name,img) values(21,'烈雀','0021.png');
insert into pokemon(id,name,img) values(22,'大嘴雀','0022.png');
insert into pokemon(id,name,img) values(23,'阿柏蛇','0023.png');
insert into pokemon(id,name,img) values(24,'阿柏怪','0024.png');
insert into pokemon(id,name,img) values(25,'皮卡丘','0025.png');
insert into pokemon(id,name,img) values(778,'謎擬Q','0778.png');
insert into pokemon(id,name,img) values(384,'烈空座','0384.png');



-- 新增 寶可夢屬性
insert into pokemon_type(pokemon_id, type_id) values(1,4);
insert into pokemon_type(pokemon_id, type_id) values(1,8);
insert into pokemon_type(pokemon_id, type_id) values(2,4);
insert into pokemon_type(pokemon_id, type_id) values(2,8);
insert into pokemon_type(pokemon_id, type_id) values(3,4);
insert into pokemon_type(pokemon_id, type_id) values(3,8);
insert into pokemon_type(pokemon_id, type_id) values(4,2);
insert into pokemon_type(pokemon_id, type_id) values(5,2);
insert into pokemon_type(pokemon_id, type_id) values(6,2);
insert into pokemon_type(pokemon_id, type_id) values(6,10);
insert into pokemon_type(pokemon_id, type_id) values(7,3);
insert into pokemon_type(pokemon_id, type_id) values(8,3);
insert into pokemon_type(pokemon_id, type_id) values(9,3);
insert into pokemon_type(pokemon_id, type_id) values(10,12);
insert into pokemon_type(pokemon_id, type_id) values(11,12);
insert into pokemon_type(pokemon_id, type_id) values(12,12);
insert into pokemon_type(pokemon_id, type_id) values(12,10);
insert into pokemon_type(pokemon_id, type_id) values(13,12);
insert into pokemon_type(pokemon_id, type_id) values(13,8);
insert into pokemon_type(pokemon_id, type_id) values(14,12);
insert into pokemon_type(pokemon_id, type_id) values(14,8);
insert into pokemon_type(pokemon_id, type_id) values(15,12);
insert into pokemon_type(pokemon_id, type_id) values(15,8);
insert into pokemon_type(pokemon_id, type_id) values(16,1);
insert into pokemon_type(pokemon_id, type_id) values(16,10);
insert into pokemon_type(pokemon_id, type_id) values(17,1);
insert into pokemon_type(pokemon_id, type_id) values(17,10);
insert into pokemon_type(pokemon_id, type_id) values(18,1);
insert into pokemon_type(pokemon_id, type_id) values(18,10);
insert into pokemon_type(pokemon_id, type_id) values(19,1);
insert into pokemon_type(pokemon_id, type_id) values(20,1);
insert into pokemon_type(pokemon_id, type_id) values(21,1);
insert into pokemon_type(pokemon_id, type_id) values(21,10);
insert into pokemon_type(pokemon_id, type_id) values(22,1);
insert into pokemon_type(pokemon_id, type_id) values(22,10);
insert into pokemon_type(pokemon_id, type_id) values(23,8);
insert into pokemon_type(pokemon_id, type_id) values(24,8);
insert into pokemon_type(pokemon_id, type_id) values(25,5);
insert into pokemon_type(pokemon_id, type_id) values(778,14);
insert into pokemon_type(pokemon_id, type_id) values(778,18);
insert into pokemon_type(pokemon_id, type_id) values(384,15);
insert into pokemon_type(pokemon_id, type_id) values(384,10);



-- 新增 package
insert into package(user_id, pokemon_id, cp) values(1,1,50);
insert into package(user_id, pokemon_id, cp) values(1,1,30);
insert into package(user_id, pokemon_id, cp) values(1,778,50);


-- 根據 user 查詢他蒐集那些寶可夢
select u.name,k.name, p.cp from user u, package p, pokemon k where
u.id = p.user_id and k.id = p.pokemon_id;

-- 根據 寶可夢ID 查詢牠的屬性
select p.pokemonid,t.typename from pokemon p , type t,pokemon_type pt where
p.pokemonId =pt.pokemon_id and t.typeId = pt.type_id order by p.pokemonid; 
