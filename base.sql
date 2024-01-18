select * from user;
select * from type;
select * from pokemon_type;
select * from pokemon;
select * from package;

-- 新增 user
insert into user(username,password,level) values('user1','123',1);

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
insert into pokemon(id,name,img,description) values(1,'妙蛙種子','0001.png','經常可見牠在太陽下睡午覺的樣子。在沐浴了充足的陽光之後，牠背上的種子就會成長茁壯。');
insert into pokemon(id,name,img,description ) values(2,'妙蛙草','0002.png','下盤為了支撐背上的花苞而變得強韌。當待在太陽底下一動也不動的時間變長，就表示大朵的花即將盛開。');
insert into pokemon(id,name,img,description) values(3,'妙蛙花','0003.png','據說充足的營養和陽光會讓花朵的顏色變得更加鮮豔。花朵散發的香氣能夠療癒人心。');
insert into pokemon(id,name,img,description) values(4,'小火龍','0004.png','天生喜歡熱熱的東西。據說當牠被雨淋濕的時候，尾巴的末端會冒出煙來。');
insert into pokemon(id,name,img,description) values(5,'火恐龍','0005.png','揮動燃燒著火焰的尾巴，用鋒利的爪子撕裂對手。性情十分粗暴。');
insert into pokemon(id,name,img,description) values(6,'噴火龍','0006.png','會噴出彷彿連岩石都能燒焦的灼熱火焰。有時會引發森林火災。');
insert into pokemon(id,name,img,description) values(7,'傑尼龜','0007.png','甲殼的作用不僅是用來保護自己，圓潤的外形和表面的溝槽會減少水的阻力，使牠能夠快速地游泳。');
insert into pokemon(id,name,img,description) values(8,'卡咪龜','0008.png','長滿蓬鬆毛髮的大尾巴，顏色會隨著年齡增長而變深。甲殼上的傷痕是強者的證明。');
insert into pokemon(id,name,img,description) values(9,'水箭龜','0009.png','甲殼上的噴射口能夠精確地瞄準目標。射出的水彈可以命中５０公尺外的空罐子。');
insert into pokemon(id,name,img,description) values(10,'綠毛蟲','0010.png','會從頭部的觸角釋放出強烈的氣味來趕走敵人，藉此保護自己。');
insert into pokemon(id,name,img,description) values(11,'鐵甲蛹','0011.png','正處於等待進化的狀態。除了變硬之外什麼都做不了，只能動也不動以免遭受攻擊。');
insert into pokemon(id,name,img,description) values(12,'巴大蝶','0012.png','當牠飛快地拍動翅膀，帶有劇毒的鱗粉就會隨著風向這裡飄過來。');
insert into pokemon(id,name,img,description) values(13,'獨角蟲','0013.png','有著非常靈敏的嗅覺。能用大大的紅鼻子聞出自己喜歡吃和不喜歡吃的葉子。');
insert into pokemon(id,name,img,description) values(14,'鐵殼蛹','0014.png','雖然掛在樹上幾乎一動也不動，但體內正為了進化而忙碌準備著。證據就是牠的身體會變得很熱。');
insert into pokemon(id,name,img,description) values(15,'大針鋒','0015.png','大針蜂非常重視自己的地盤，為了安全起見，最好不要接近牠的住處。一旦生氣就會成群結隊襲擊而來。');
insert into pokemon(id,name,img,description) values(16,'波波','0016.png','因為方向感非常好，所以無論到了離巢穴多遠的地方，都能不迷路地飛回巢穴。');
insert into pokemon(id,name,img,description) values(17,'比比鳥','0017.png','會飛在空中巡視自己廣大的地盤。要是有誰膽敢侵犯牠的地盤，牠會毫不留情地用利爪狠狠教訓一番。');
insert into pokemon(id,name,img,description) values(18,'大比鳥','0018.png','有著亮麗羽毛的寶可夢。有許多訓練家被大比鳥頭上美麗的羽毛深深吸引而開始培育牠。');
insert into pokemon(id,name,img,description) values(19,'小拉達','0019.png','門牙會終生生長，如果長得太長，就會因為無法進食而餓死。');
insert into pokemon(id,name,img,description) values(20,'拉達','0020.png','據說牠為了躲避敵人，會用後腳的小蹼在海中游泳，渡海逃往別的島嶼。');
insert into pokemon(id,name,img,description) values(21,'烈雀','0021.png','生性魯莽衝動，只要是為了守護自己的地盤，即使對手是大型寶可夢也會正面迎戰。');
insert into pokemon(id,name,img,description) values(22,'大嘴雀','0022.png','在大嘴雀的地盤上帶著食物走動是件危險的事，食物轉眼間就會被奪走。');
insert into pokemon(id,name,img,description) values(23,'阿柏蛇','0023.png','會藉由讓下顎脫臼來吞食比自己更大的獵物。進食之後會蜷縮起身子休息。');
insert into pokemon(id,name,img,description) values(24,'阿柏怪','0024.png','最新的研究結果顯示，牠們肚子上的花紋有２０種以上的不同圖案。');
insert into pokemon(id,name,img,description) values(25,'皮卡丘','0025.png','雙頰上有儲存電力的囊袋。一旦生氣就會把儲存的電力一口氣釋放出來。');
insert into pokemon(id,name,img,description) values(778,'謎擬Q','0778.png','棲息在陽光照射不到的陰暗處。在人們面前現身時會用看似皮卡丘的布來隱藏全身。');
insert into pokemon(id,name,img,description) values(384,'烈空座','0384.png','據說已經生存了數億年。世上留存著牠調解了固拉多與蓋歐卡之間爭鬥的傳說。');



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
