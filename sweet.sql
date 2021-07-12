SET NAMES UTF8;
DROP DATABASE IF EXISTS sweet;
CREATE DATABASE sweet CHARSET=UTF8;
USE sweet;

/**用户信息**/
CREATE TABLE user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16),
  avatar VARCHAR(128),        #头像图片路径
  real_name VARCHAR(32),      #用户名，如王小明
  gender INT                  #性别  0-女  1-男
);
INSERT INTO user VALUES
(NULL, 'dingding', '123456789a', 'ding@qq.com', '13501234567', 'img/avatar/default.png', '丁伟', '1'),
(NULL, 'dangdang', '123456789a', 'dang@qq.com', '13501234568', 'img/avatar/default.png', '林当', '1'),
(NULL, 'doudou', '123456789a', 'dou@qq.com', '13501234569', 'img/avatar/default.png', '窦志强', '1'),
(NULL, 'yaya', '123456789a', 'ya@qq.com', '13501234560', 'img/avatar/default.png', '秦小雅', '0');

/* 地址信息 */
CREATE  TABLE  address(
  aid INT PRIMARY KEY  AUTO_INCREMENT , # 地址编号
  user_id INT, # 地址对应用户编号
  recevier_name VARCHAR(20), # 收件人
  phone_number VARCHAR(11), # 联系电话
  region VARCHAR(20), # 区，如 “锦江区”
  adddress_detail VARCHAR(50), # 详细地址，街道等
  is_default BOOLEAN # 是否设置为默认地址
);

/* 订单信息 */
CREATE TABLE product_order(
  rid INT PRIMARY KEY  AUTO_INCREMENT, # 订单编号
  address_id INT, # 地址编号
  order_number VARCHAR(50), # 订单实际编号，以时间毫秒作为实际编号
  total_price DECIMAL(10,2), # 总计价格
  status INT, # 订单状态，0——生成失败，1——生成订单成功
  send_time VARCHAR (50) # 配送时间 
);

/* 购物车 */
CREATE  TABLE  shoppingcar(
  cid INT PRIMARY KEY  AUTO_INCREMENT , # 购物车编号
  user_id INT, # 用户编号
  product_id INT, # 商品编号
  product_count INT # 对应商品数量
);

/* 商品 */
CREATE  TABLE  product(
  pid INT PRIMARY KEY  AUTO_INCREMENT , # 商品编号
  pname VARCHAR(30), # 标题
  price DECIMAL(10,2), # 单价
  description VARCHAR(80), # 详情页上面文字描写
  product_imgs VARCHAR(1280), # 商品对应的两张图片，展示图放第一个，下面的图放最后一个
  shelf_time BIGINT, # 上架时间
  material VARCHAR(80), # 原材料
  is_onsale BOOLEAN, # 是否在售
  category VARCHAR(20), # 商品分类
  sweetness TINYINT # 甜度
);

INSERT INTO product VALUES
(NULL,'宫廷乳酪|Palace Cheese',148.00,'*需要提前3小时订购|清爽微酸的野生蓝莓与浓郁的法国乳酪。','/pictures/cheese/cake1_1|/pictures/cheese/cake1_2',NULL,'甄选蓝莓|法国乳酪|法国淡奶油|比利时乳脂奶油',true,'奶酪蛋糕', 4),
(NULL,'青岚牛乳|Breeze Milk',158.00,'*需要提前3小时订购|抹茶的清新与红豆的甘甜，乳酪的浓郁。','/pictures/cheese/cake2_1|/pictures/cheese/cake2_2',NULL,'甄选抹茶|法国乳酪|法国淡奶油|比利时乳脂奶油|甄选红豆|法国全脂牛奶',true,'奶酪蛋糕', 4),
(NULL,'草莓芝士|Strawberry Cheese',138.00,'*需要提前3小时订购|浓郁的芝士搭配现摘的草莓，大兴安岭的蓝莓干与柚子茶的清新。','/pictures/cheese/cake3_1|/pictures/cheese/cake3_2',NULL,'应季草莓|法国乳酪|法国淡奶油|比利时乳脂奶油|法国全脂牛奶|大兴安岭蓝莓干',true,'奶酪蛋糕', 3),
(NULL,'咖啡马斯卡波尼|Mascarpone Coffee',138.00,'*需要提前3小时订购|纯正的意大利马斯卡彭，与马萨拉酒，古巴咖啡豆，与美国咖啡酒。','/pictures/cheese/cake4_1|/pictures/cheese/cake4_2',NULL,'意大利马斯卡彭乳酪|意大利马萨拉酒|法国黑巧克力|法国淡奶油|古巴咖啡豆|比利时乳脂奶油',true,'奶酪蛋糕', 4),
(NULL,'真爱|True Love',178.00,'*需要提前3小时订购|甘草香气的白巧克力，淡苦的牛奶巧克力，浓烈的黑巧克力，干爽的黄油巧克力蛋糕。','/pictures/chocolate/cake1_1|/pictures/chocolate/cake1_2',NULL,'法国黑巧克力|法国可可粉|比利时乳脂奶油|法国淡奶油|法国白巧克力|法国牛奶巧克力',true,'巧克力蛋糕', 5),
(NULL,'骑士|Cocoa',148.00,'*需要提前3小时订购|每一个男孩子都深藏着一颗骑士之心，谦逊包容，乐观与执着。','/pictures/chocolate/cake2_1|/pictures/chocolate/cake2_2',NULL,'法国黑巧克力|法国可可粉|法国樱桃白兰地|比利时黄油|法国可可脂|澳洲稀奶油|甄选核桃|韩国幼砂糖',true,'巧克力蛋糕', 4),
(NULL,'焦糖斯诺|Caramel',148.00,'*需要提前3小时订购|核桃搭配焦糖与咖啡，是午后慵懒的时光。','/pictures/chocolate/cake3_1|/pictures/chocolate/cake3_2',NULL,'哥伦比亚咖啡|法国白巧克力|核桃|澳洲淡奶油|澳洲黄油|韩国幼砂糖',true,'巧克力蛋糕', 3),
(NULL,'新·玫瑰密语|Rose Whisper',148.00,'*需要提前3小时订购|新· 是一种突破，每一次改变都更加接近完美。','/pictures/chocolate/cake4_1|/pictures/chocolate/cake4_2',NULL,'哥伦比亚咖啡|法国白巧克力|核桃|澳洲淡奶油|澳洲黄油|韩国幼砂糖',false,'巧克力蛋糕', 5),
(NULL,'安地列斯|Antilles',128.00,'*需要提前3小时订购|香气浓郁的百香果，酸爽，凛冽。','/pictures/cream/cake1_1|/pictures/cream/cake1_2',NULL,'百香果|法国白巧克力|澳洲淡奶油|韩国幼砂糖',true,'乳脂蛋糕', 2),
(NULL,'焦糖斯诺|Caramel',148.00,'*需要提前3小时订购|核桃搭配焦糖与咖啡，是午后慵懒的时光。','/pictures/cream/cake2_1|/pictures/cream/cake2_2',NULL,'哥伦比亚咖啡|法国白巧克力|核桃|澳洲淡奶油|澳洲黄油|韩国幼砂糖',true,'乳脂蛋糕', 2),
(NULL,'冬至未央|Midwinter not end',158.00,'*需要提前3小时订购|天然动物性马斯卡波尼奶油，马达加斯加香草荚制作的低脂蛋糕。','/pictures/cream/cake3_1|/pictures/cream/cake3_2',NULL,'马达加斯加香草籽|应季草莓|比利时黄油|法国马斯卡波尼奶油',true,'乳脂蛋糕', 3),
(NULL,'爱琴海|Aegean Sea',158.00,'*需要提前3小时订购|淡淡的咸与浓郁奶香，是否会让你想起大海的味道？','/pictures/cream/cake4_1|/pictures/cream/cake4_2',NULL,'法国白巧克力|新鲜水果|澳洲淡奶油|韩国幼砂糖',false,'乳脂蛋糕', 5),
(NULL,'花夕巧克力|Flower and chocolate',258.00,'*需要提前6小时订购|清甜的淡奶油，浓郁丝滑的巧克力，辅以玫瑰花香，萦絮味蕾。','/pictures/inches/cake1_1|/pictures/inches/cake1_2',NULL,'澳洲淡奶油|比利时黄油|法国巧克力|韩国幼砂糖|玫瑰花瓣',true,'九寸蛋糕系列', 3),
(NULL,'唯•爱|Only Love',258.00,'*需要提前6小时订购|时令草莓是鲜甜，澳洲奶油是香甜，马达加斯加香草荚是清甜。','/pictures/inches/cake2_1|/pictures/inches/cake2_2',NULL,'澳洲淡奶油|马达加斯加香草荚|韩国幼砂糖|甄选草莓',true,'九寸蛋糕系列', 2),
(NULL,'圣诞|Christmas',278.00,'*需要提前6小时订购|Merry，Merry Christmas to you，感谢你不让我一个人。','/pictures/inches/cake3_1|/pictures/inches/cake3_2',NULL,'澳洲淡奶油|芒果|澳洲黄油|法国牛奶|法国可可粉|马达加斯加香草荚|法国可可脂|韩国幼砂糖|菠菜粉|草莓粉',true,'九寸蛋糕系列', 4),
(NULL,'下雪了|Snowing',278.00,'*需要提前6小时订购|下雪了,看着窗外一片片的雪花飞落,就像一个个小精灵一样在灰色的天空中跳舞。','/pictures/inches/cake4_1|/pictures/inches/cake4_2',NULL,'澳洲淡奶油|草莓|澳洲黄油|法国牛奶|法国可可粉|马达加斯加香草荚|韩国幼砂糖|菠菜粉',true,'九寸蛋糕系列', 5),
(NULL,'芒果之吻|KissMango',158.00,'*需要提前3小时订购|新鲜的芒果，酸爽甘甜。','/pictures/mousse/cake1_1|/pictures/mousse/cake1_2',NULL,'新鲜芒果|法国淡奶油|韩国幼砂糖|英国玛丽饼干|韩国柚子茶',true,'慕斯蛋糕', 3),
(NULL,'核桃栗子|Walnut Chestnut',178.00,'*需要提前3小时订购|新鲜的芒果，酸爽甘甜栗子的甘甜，核桃的脆爽与绵软的杰诺瓦士蛋糕。','/pictures/mousse/cake2_1|/pictures/mousse/cake2_2',NULL,'甄选栗子|法国淡奶油|韩国幼砂糖|英国玛丽饼干|韩国柚子茶',true,'慕斯蛋糕', 3),
(NULL,'安地列斯|Antilles',178.00,'*需要提前3小时订购|新鲜的芒果，酸爽甘甜栗子的甘甜，核桃的脆爽与绵软的杰诺瓦士蛋糕。','/pictures/mousse/cake3_1|/pictures/mousse/cake3_2',NULL,'甄选栗子|法国淡奶油|韩国幼砂糖|英国玛丽饼干|韩国柚子茶',true,'慕斯蛋糕', 4),
(NULL,'芒果之吻|KissMango',178.00,'*需要提前3小时订购|新鲜的芒果，酸爽甘甜栗子的甘甜，核桃的脆爽与绵软的杰诺瓦士蛋糕。','/pictures/mousse/cake4_1|/pictures/mousse/cake4_2',NULL,'甄选栗子|法国淡奶油|韩国幼砂糖|英国玛丽饼干|韩国柚子茶',true,'慕斯蛋糕', 3),
(NULL,'宫廷乳酪|Palace Cheese',148.00,'*需要提前3小时订购|清爽微酸的野生蓝莓与浓郁的法国乳酪。','/pictures/nut/cake1_1|/pictures/nut/cake1_2',NULL,'甄选蓝莓|法国乳酪|法国淡奶油|比利时乳脂奶油',true,'奶酪蛋糕', 4),
(NULL,'青岚牛乳|Breeze Milk',158.00,'*需要提前3小时订购|抹茶的清新与红豆的甘甜，乳酪的浓郁。','/pictures/nut/cake2_1|/pictures/nut/cake2_2',NULL,'甄选抹茶|法国乳酪|法国淡奶油|比利时乳脂奶油|甄选红豆|法国全脂牛奶',true,'奶酪蛋糕', 3),
(NULL,'草莓芝士|Strawberry Cheese',138.00,'*需要提前3小时订购|浓郁的芝士搭配现摘的草莓，大兴安岭的蓝莓干与柚子茶的清新。','/pictures/nut/cake3_1|/pictures/nut/cake3_2',NULL,'应季草莓|法国乳酪|法国淡奶油|比利时乳脂奶油|法国全脂牛奶|大兴安岭蓝莓干',true,'奶酪蛋糕', 4),
(NULL,'咖啡马斯卡波尼|Mascarpone Coffee',138.00,'*需要提前3小时订购|纯正的意大利马斯卡彭，与马萨拉酒，古巴咖啡豆，与美国咖啡酒。','/pictures/nut/cake4_1|/pictures/nut/cake4_2',NULL,'意大利马斯卡彭乳酪|意大利马萨拉酒|法国黑巧克力|法国淡奶油|古巴咖啡豆|比利时乳脂奶油',true,'奶酪蛋糕', 3),
(NULL,'Alive&Well 祝好花集/仲夏夜之梦/韩式混搭花篮',98.00,'花束直径40-45cm左右 鲜花均为手工制作，均无库存。 请大家提前1-2日预定。','/pictures/flower/cake1_1|/pictures/flower/cake1_2',NULL,'向日葵|香槟玫瑰|蝴蝶玫瑰|进口六出花|洋桔梗|小雏菊',true,'鲜花系列', NULL),
(NULL,'Alive&Well 祝好花集/仲夏夜之梦/韩式混搭花篮',98.00,'花束直径40-45cm左右 鲜花均为手工制作，均无库存。 请大家提前1-2日预定。','/pictures/flower/cake2_1|/pictures/flower/cake2_2',NULL,'向日葵|香槟玫瑰|蝴蝶玫瑰|进口六出花|洋桔梗|小雏菊',true,'鲜花系列', NULL),
(NULL,'ins风 鲜花花束 玫瑰花束 大连同城送花 祝好花集',98.00,'花束直径40-45cm左右 鲜花均为手工制作，均无库存。 请大家提前1-2日预定。','/pictures/flower/cake3_1|/pictures/flower/cake3_2',NULL,'向日葵|香槟玫瑰|蝴蝶玫瑰|进口六出花|洋桔梗|小雏菊',true,'鲜花系列', NULL),
(NULL,'ins风 鲜花花束 玫瑰花束 大连同城送花 祝好花集',98.00,'花束直径40-45cm左右 鲜花均为手工制作，均无库存。 请大家提前1-2日预定。','/pictures/flower/cake4_1|/pictures/flower/cake4_2',NULL,'向日葵|香槟玫瑰|蝴蝶玫瑰|进口六出花|洋桔梗|小雏菊',true,'鲜花系列', NULL);

