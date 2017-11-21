
/* ============================================================================================ */
/*					Prototype 1.4.0 Start					*/

var Class = (function() {
  function create() {
    return function() {
      this.initialize.apply(this, arguments);
    }
  }
    
  function Create() {       // 摘自 Prototype 1.7, 并经过修改
    function klass() {
      this.initialize.apply(this, arguments);
    }

    if (!klass.prototype.initialize)
      klass.prototype.initialize = function(){};
    klass.prototype.constructor = klass;
    
    var source = arguments[0];
    var properties = Object.keys(source);
    for (var i = 0, length = properties.length; i < length; i++) {
      var property = properties[i], value = source[property];
      klass.prototype[property] = value;
    }

    return klass;
  };
  
  function subclass() {};
  function Inherit() {      // 摘自 Prototype 1.7, 并经过修改
    function klass() {
      this.initialize.apply(this, arguments);
    }

    var parent = arguments[0]; //properties.shift();
    subclass.prototype = parent.prototype;
    klass.prototype = new subclass;
//    klass.prototype['superclassInit'] = parent.prototype.initialize;

    var source = arguments[1];
    var properties = Object.keys(source);
    for (var i = 0, length = properties.length; i < length; i++) {
      var property = properties[i], value = source[property];
      klass.prototype[property] = value;
      if( property in parent.prototype )
        klass.prototype['$'+property] = parent.prototype[property];
    }

    if (!klass.prototype.initialize)
      klass.prototype.initialize = function(){};

    klass.prototype.constructor = klass;
    return klass;
  }
  return {
    create: create,
    Create: Create,
    Inherit: Inherit
  };
})();

var Abstract = new Object();

Object.extend = function(destination, source) {
  for (property in source) {
    destination[property] = source[property];
  }
  return destination;
}

Object.inspect = function(object) {
  try {
    if (object == undefined) return 'undefined';
    if (object == null) return 'null';
    return object.inspect ? object.inspect() : object.toString();
  } catch (e) {
    if (e instanceof RangeError) return '...';
    throw e;
  }
}

Object.keys = function(object){     // 摘自 Prototype 1.7, 并经过修改
    var results = [];
    for (var property in object) {
      if (object.hasOwnProperty(property)) {
        results.push(property);
      }
    }
    return results;
}


Function.prototype.bind = function() {
  var __method = this, args = $A(arguments), object = args.shift();
  return function() {
    return __method.apply(object, args.concat($A(arguments)));
  }
}

Function.prototype.bindAsEventListener = function(object) {
  var __method = this;
  return function(event) {
    return __method.call(object, event || window.event);
  }
}

function $() {
  var elements = new Array();
  for (var i = 0; i < arguments.length; i++) {
    var element = arguments[i];
    if (typeof element == 'string')
      element = document.getElementById(element);
    if (arguments.length == 1)
      return element;
    elements.push(element);
  }
  return elements;
}

function $A(iterable) {     // 摘自 Prototype 1.7
  if (!iterable) return [];
  if ('toArray' in Object(iterable)) return iterable.toArray();
  var length = iterable.length || 0, results = new Array(length);
  while (length--) results[length] = iterable[length];
  return results;
}


/*					Prototype 1.4.0 End					*/
/* ============================================================================================ */





String.prototype.Contains = function( A ){
    return (this.indexOf(A)>-1);
};







/* Common 命名空间
/* -------------------------------------------------------------------------------------------- */
var Common = {};

var _s = navigator.userAgent.toLowerCase();
Common.Browser = {
    IsIE : _s.Contains('msie'),
    IsIE7 : _s.Contains('msie 7'),
    IsGecko : _s.Contains('gecko/'),
    IsSafari : _s.Contains('safari'),
    IsOpera : _s.Contains('opera'),
    IsMac : _s.Contains('macintosh')
};
(function(A)
    {
	A.IsGeckoLike=(A.IsGecko||A.IsSafari||A.IsOpera);
	if( A.IsGecko ){
	    var B=s.match(/gecko\/(\d+)/)[1];
	    A.IsGecko10=((B<20051111)||(/rv:1\.7/.test(s)));
	} else 
            A.IsGecko10=false;
    }
)( Common.Browser );



/* 中文转换为拼音
/* -------------------------------------------------------------------------------------------- */
Common.SpellCharGB = '啊阿埃挨哎唉哀皑癌蔼矮艾碍爱隘鞍氨安俺按暗岸胺案肮昂盎凹敖熬翱袄傲奥懊澳芭捌扒叭吧笆八疤巴拔跋靶把耙坝霸罢爸白柏百摆佰败拜稗斑班搬扳般颁板版扮拌伴瓣半办绊邦帮梆榜膀绑棒磅蚌镑傍谤苞胞包褒剥薄雹保堡饱宝抱报暴豹鲍爆杯碑悲卑北辈背贝钡倍狈备惫焙被奔苯本笨崩绷甭泵蹦迸逼鼻比鄙笔彼碧蓖蔽毕毙毖币庇痹闭敝弊必辟壁臂避陛鞭边编贬扁便变卞辨辩辫遍标彪膘表鳖憋别瘪彬斌濒滨宾摈兵冰柄丙秉饼炳病并玻菠播拨钵波博勃搏铂箔伯帛舶脖膊渤泊驳捕卜哺补埠不布步簿部怖擦猜裁材才财睬踩采彩菜蔡餐参蚕残惭惨灿苍舱仓沧藏操糙槽曹草厕策侧册测层蹭插叉茬茶查碴搽察岔差诧拆柴豺搀掺蝉馋谗缠铲产阐颤昌猖场尝常长偿肠厂敞畅唱倡超抄钞朝嘲潮巢吵炒车扯撤掣彻澈郴臣辰尘晨忱沉陈趁衬撑称城橙成呈乘程惩澄诚承逞骋秤吃痴持匙池迟弛驰耻齿侈尺赤翅斥炽充冲虫崇宠抽酬畴踌稠愁筹仇绸瞅丑臭初出橱厨躇锄雏滁除楚础储矗搐触处揣川穿椽传船喘串疮窗幢床闯创吹炊捶锤垂春椿醇唇淳纯蠢戳绰疵茨磁雌辞慈瓷词此刺赐次聪葱囱匆从丛凑粗醋簇促蹿篡窜摧崔催脆瘁粹淬翠村存寸磋撮搓措挫错搭达答瘩打大呆歹傣戴带殆代贷袋待逮怠耽担丹单郸掸胆旦氮但惮淡诞弹蛋当挡党荡档刀捣蹈倒岛祷导到稻悼道盗德得的蹬灯登等瞪凳邓堤低滴迪敌笛狄涤翟嫡抵底地蒂第帝弟递缔颠掂滇碘点典靛垫电佃甸店惦奠淀殿碉叼雕凋刁掉吊钓调跌爹碟蝶迭谍叠丁盯叮钉顶鼎锭定订丢东冬董懂动栋侗恫冻洞兜抖斗陡豆逗痘都督毒犊独读堵睹赌杜镀肚度渡妒端短锻段断缎堆兑队对墩吨蹲敦顿囤钝盾遁掇哆多夺垛躲朵跺舵剁惰堕蛾峨鹅俄额讹娥恶厄扼遏鄂饿恩而儿耳尔饵洱二贰发罚筏伐乏阀法珐藩帆番翻樊矾钒繁凡烦反返范贩犯饭泛坊芳方肪房防妨仿访纺放菲非啡飞肥匪诽吠肺废沸费芬酚吩氛分纷坟焚汾粉奋份忿愤粪丰封枫蜂峰锋风疯烽逢冯缝讽奉凤佛否夫敷肤孵扶拂辐幅氟符伏俘服浮涪福袱弗甫抚辅俯釜斧脯腑府腐赴副覆赋复傅付阜父腹负富讣附妇缚咐噶嘎该改概钙盖溉干甘杆柑竿肝赶感秆敢赣冈刚钢缸肛纲岗港杠篙皋高膏羔糕搞镐稿告哥歌搁戈鸽胳疙割革葛格蛤阁隔铬个各给根跟耕更庚羹埂耿梗工攻功恭龚供躬公宫弓巩汞拱贡共钩勾沟苟狗垢构购够辜菇咕箍估沽孤姑鼓古蛊骨谷股故顾固雇刮瓜剐寡挂褂乖拐怪棺关官冠观管馆罐惯灌贯光广逛瑰规圭硅归龟闺轨鬼诡癸桂柜跪贵刽辊滚棍锅郭国果裹过哈骸孩海氦亥害骇酣憨邯韩含涵寒函喊罕翰撼捍旱憾悍焊汗汉夯杭航壕嚎豪毫郝好耗号浩呵喝荷菏核禾和何合盒貉阂河涸赫褐鹤贺嘿黑痕很狠恨哼亨横衡恒轰哄烘虹鸿洪宏弘红喉侯猴吼厚候后呼乎忽瑚壶葫胡蝴狐糊湖弧虎唬护互沪户花哗华猾滑画划化话槐徊怀淮坏欢环桓还缓换患唤痪豢焕涣宦幻荒慌黄磺蝗簧皇凰惶煌晃幌恍谎灰挥辉徽恢蛔回毁悔慧卉惠晦贿秽会烩汇讳诲绘荤昏婚魂浑混豁活伙火获或惑霍货祸击圾基机畸稽积箕肌饥迹激讥鸡姬绩缉吉极棘辑籍集及急疾汲即嫉级挤几脊己蓟技冀季伎祭剂悸济寄寂计记既忌际妓继纪嘉枷夹佳家加荚颊贾甲钾假稼价架驾嫁歼监坚尖笺间煎兼肩艰奸缄茧检柬碱硷拣捡简俭剪减荐槛鉴践贱见键箭件健舰剑饯渐溅涧建僵姜将浆江疆蒋桨奖讲匠酱降蕉椒礁焦胶交郊浇骄娇嚼搅铰矫侥脚狡角饺缴绞剿教酵轿较叫窖揭接皆秸街阶截劫节桔杰捷睫竭洁结解姐戒藉芥界借介疥诫届巾筋斤金今津襟紧锦仅谨进靳晋禁近烬浸尽劲荆兢茎睛晶鲸京惊精粳经井警景颈静境敬镜径痉靖竟竞净炯窘揪究纠玖韭久灸九酒厩救旧臼舅咎就疚鞠拘狙疽居驹菊局咀矩举沮聚拒据巨具距踞锯俱句惧炬剧捐鹃娟倦眷卷绢撅攫抉掘倔爵觉决诀绝均菌钧军君峻俊竣浚郡骏喀咖卡咯开揩楷凯慨刊堪勘坎砍看康慷糠扛抗亢炕考拷烤靠坷苛柯棵磕颗科壳咳可渴克刻客课肯啃垦恳坑吭空恐孔控抠口扣寇枯哭窟苦酷库裤夸垮挎跨胯块筷侩快宽款匡筐狂框矿眶旷况亏盔岿窥葵奎魁傀馈愧溃坤昆捆困括扩廓阔垃拉喇蜡腊辣啦莱来赖蓝婪栏拦篮阑兰澜谰揽览懒缆烂滥琅榔狼廊郎朗浪捞劳牢老佬姥酪烙涝勒乐雷镭蕾磊累儡垒擂肋类泪棱楞冷厘梨犁黎篱狸离漓理李里鲤礼莉荔吏栗丽厉励砾历利傈例俐痢立粒沥隶力璃哩俩联莲连镰廉怜涟帘敛脸链恋炼练粮凉梁粱良两辆量晾亮谅撩聊僚疗燎寥辽潦了撂镣廖料列裂烈劣猎琳林磷霖临邻鳞淋凛赁吝拎玲菱零龄铃伶羚凌灵陵岭领另令溜琉榴硫馏留刘瘤流柳六龙聋咙笼窿隆垄拢陇楼娄搂篓漏陋芦卢颅庐炉掳卤虏鲁麓碌露路赂鹿潞禄录陆戮驴吕铝侣旅履屡缕虑氯律率滤绿峦挛孪滦卵乱掠略抡轮伦仑沦纶论萝螺罗逻锣箩骡裸落洛骆络妈麻玛码蚂马骂嘛吗埋买麦卖迈脉瞒馒蛮满蔓曼慢漫谩芒茫盲氓忙莽猫茅锚毛矛铆卯茂冒帽貌贸么玫枚梅酶霉煤没眉媒镁每美昧寐妹媚门闷们萌蒙檬盟锰猛梦孟眯醚靡糜迷谜弥米秘觅泌蜜密幂棉眠绵冕免勉娩缅面苗描瞄藐秒渺庙妙蔑灭民抿皿敏悯闽明螟鸣铭名命谬摸摹蘑模膜磨摩魔抹末莫墨默沫漠寞陌谋牟某拇牡亩姆母墓暮幕募慕木目睦牧穆拿哪呐钠那娜纳氖乃奶耐奈南男难囊挠脑恼闹淖呢馁内嫩能妮霓倪泥尼拟你匿腻逆溺蔫拈年碾撵捻念娘酿鸟尿捏聂孽啮镊镍涅您柠狞凝宁拧泞牛扭钮纽脓浓农弄奴努怒女暖虐疟挪懦糯诺哦欧鸥殴藕呕偶沤啪趴爬帕怕琶拍排牌徘湃派攀潘盘磐盼畔判叛乓庞旁耪胖抛咆刨炮袍跑泡呸胚培裴赔陪配佩沛喷盆砰抨烹澎彭蓬棚硼篷膨朋鹏捧碰坯砒霹批披劈琵毗啤脾疲皮匹痞僻屁譬篇偏片骗飘漂瓢票撇瞥拼频贫品聘乒坪苹萍平凭瓶评屏坡泼颇婆破魄迫粕剖扑铺仆莆葡菩蒲埔朴圃普浦谱曝瀑期欺栖戚妻七凄漆柒沏其棋奇歧畦崎脐齐旗祈祁骑起岂乞企启契砌器气迄弃汽泣讫掐恰洽牵扦钎铅千迁签仟谦乾黔钱钳前潜遣浅谴堑嵌欠歉枪呛腔羌墙蔷强抢橇锹敲悄桥瞧乔侨巧鞘撬翘峭俏窍切茄且怯窃钦侵亲秦琴勤芹擒禽寝沁青轻氢倾卿清擎晴氰情顷请庆琼穷秋丘邱球求囚酋泅趋区蛆曲躯屈驱渠取娶龋趣去圈颧权醛泉全痊拳犬券劝缺炔瘸却鹊榷确雀裙群然燃冉染瓤壤攘嚷让饶扰绕惹热壬仁人忍韧任认刃妊纫扔仍日戎茸蓉荣融熔溶容绒冗揉柔肉茹蠕儒孺如辱乳汝入褥软阮蕊瑞锐闰润若弱撒洒萨腮鳃塞赛三叁伞散桑嗓丧搔骚扫嫂瑟色涩森僧莎砂杀刹沙纱傻啥煞筛晒珊苫杉山删煽衫闪陕擅赡膳善汕扇缮墒伤商赏晌上尚裳梢捎稍烧芍勺韶少哨邵绍奢赊蛇舌舍赦摄射慑涉社设砷申呻伸身深娠绅神沈审婶甚肾慎渗声生甥牲升绳省盛剩胜圣师失狮施湿诗尸虱十石拾时什食蚀实识史矢使屎驶始式示士世柿事拭誓逝势是嗜噬适仕侍释饰氏市恃室视试收手首守寿授售受瘦兽蔬枢梳殊抒输叔舒淑疏书赎孰熟薯暑曙署蜀黍鼠属术述树束戍竖墅庶数漱恕刷耍摔衰甩帅栓拴霜双爽谁水睡税吮瞬顺舜说硕朔烁斯撕嘶思私司丝死肆寺嗣四伺似饲巳松耸怂颂送宋讼诵搜艘擞嗽苏酥俗素速粟僳塑溯宿诉肃酸蒜算虽隋随绥髓碎岁穗遂隧祟孙损笋蓑梭唆缩琐索锁所塌他它她塔獭挞蹋踏胎苔抬台泰酞太态汰坍摊贪瘫滩坛檀痰潭谭谈坦毯袒碳探叹炭汤塘搪堂棠膛唐糖倘躺淌趟烫掏涛滔绦萄桃逃淘陶讨套特藤腾疼誊梯剔踢锑提题蹄啼体替嚏惕涕剃屉天添填田甜恬舔腆挑条迢眺跳贴铁帖厅听烃汀廷停亭庭挺艇通桐酮瞳同铜彤童桶捅筒统痛偷投头透凸秃突图徒途涂屠土吐兔湍团推颓腿蜕褪退吞屯臀拖托脱鸵陀驮驼椭妥拓唾挖哇蛙洼娃瓦袜歪外豌弯湾玩顽丸烷完碗挽晚皖惋宛婉万腕汪王亡枉网往旺望忘妄威巍微危韦违桅围唯惟为潍维苇萎委伟伪尾纬未蔚味畏胃喂魏位渭谓尉慰卫瘟温蚊文闻纹吻稳紊问嗡翁瓮挝蜗涡窝我斡卧握沃巫呜钨乌污诬屋无芜梧吾吴毋武五捂午舞伍侮坞戊雾晤物勿务悟误昔熙析西硒矽晰嘻吸锡牺稀息希悉膝夕惜熄烯溪汐犀檄袭席习媳喜铣洗系隙戏细瞎虾匣霞辖暇峡侠狭下厦夏吓掀锨先仙鲜纤咸贤衔舷闲涎弦嫌显险现献县腺馅羡宪陷限线相厢镶香箱襄湘乡翔祥详想响享项巷橡像向象萧硝霄削哮嚣销消宵淆晓小孝校肖啸笑效楔些歇蝎鞋协挟携邪斜胁谐写械卸蟹懈泄泻谢屑薪芯锌欣辛新忻心信衅星腥猩惺兴刑型形邢行醒幸杏性姓兄凶胸匈汹雄熊休修羞朽嗅锈秀袖绣墟戌需虚嘘须徐许蓄酗叙旭序畜恤絮婿绪续轩喧宣悬旋玄选癣眩绚靴薛学穴雪血勋熏循旬询寻驯巡殉汛训讯逊迅压押鸦鸭呀丫芽牙蚜崖衙涯雅哑亚讶焉咽阉烟淹盐严研蜒岩延言颜阎炎沿奄掩眼衍演艳堰燕厌砚雁唁彦焰宴谚验殃央鸯秧杨扬佯疡羊洋阳氧仰痒养样漾邀腰妖瑶摇尧遥窑谣姚咬舀药要耀椰噎耶爷野冶也页掖业叶曳腋夜液一壹医揖铱依伊衣颐夷遗移仪胰疑沂宜姨彝椅蚁倚已乙矣以艺抑易邑屹亿役臆逸肄疫亦裔意毅忆义益溢诣议谊译异翼翌绎茵荫因殷音阴姻吟银淫寅饮尹引隐印英樱婴鹰应缨莹萤营荧蝇迎赢盈影颖硬映哟拥佣臃痈庸雍踊蛹咏泳涌永恿勇用幽优悠忧尤由邮铀犹油游酉有友右佑釉诱又幼迂淤于盂榆虞愚舆余俞逾鱼愉渝渔隅予娱雨与屿禹宇语羽玉域芋郁吁遇喻峪御愈欲狱育誉浴寓裕预豫驭鸳渊冤元垣袁原援辕园员圆猿源缘远苑愿怨院曰约越跃钥岳粤月悦阅耘云郧匀陨允运蕴酝晕韵孕匝砸杂栽哉灾宰载再在咱攒暂赞赃脏葬遭糟凿藻枣早澡蚤躁噪造皂灶燥责择则泽贼怎增憎曾赠扎喳渣札轧铡闸眨栅榨咋乍炸诈摘斋宅窄债寨瞻毡詹粘沾盏斩辗崭展蘸栈占战站湛绽樟章彰漳张掌涨杖丈帐账仗胀瘴障招昭找沼赵照罩兆肇召遮折哲蛰辙者锗蔗这浙珍斟真甄砧臻贞针侦枕疹诊震振镇阵蒸挣睁征狰争怔整拯正政帧症郑证芝枝支吱蜘知肢脂汁之织职直植殖执值侄址指止趾只旨纸志挚掷至致置帜峙制智秩稚质炙痔滞治窒中盅忠钟衷终种肿重仲众舟周州洲诌粥轴肘帚咒皱宙昼骤珠株蛛朱猪诸诛逐竹烛煮拄瞩嘱主著柱助蛀贮铸筑住注祝驻抓爪拽专砖转撰赚篆桩庄装妆撞壮状椎锥追赘坠缀谆准捉拙卓桌琢茁酌啄着灼浊兹咨资姿滋淄孜紫仔籽滓子自渍字鬃棕踪宗综总纵邹走奏揍租足卒族祖诅阻组钻纂嘴醉最罪尊遵昨左佐柞做作坐座亍丌兀丐廿卅丕亘丞鬲孬噩丨禺丿匕乇夭爻卮氐囟胤馗毓睾鼗丶亟鼐乜乩亓芈孛啬嘏仄厍厝厣厥厮靥赝匚叵匦匮匾赜卦卣刂刈刎刭刳刿剀剌剞剡剜蒯剽劂劁劐劓冂罔亻仃仉仂仨仡仫仞伛仳伢佤仵伥伧伉伫佞佧攸佚佝佟佗伲伽佶佴侑侉侃侏佾佻侪佼侬侔俦俨俪俅俚俣俜俑俟俸倩偌俳倬倏倮倭俾倜倌倥倨偾偃偕偈偎偬偻傥傧傩傺僖儆僭僬僦僮儇儋仝氽佘佥俎龠汆籴兮巽黉馘冁夔勹匍訇匐凫夙兕亠兖亳衮袤亵脔裒禀嬴蠃羸冫冱冽冼凇冖冢冥讠讦讧讪讴讵讷诂诃诋诏诎诒诓诔诖诘诙诜诟诠诤诨诩诮诰诳诶诹诼诿谀谂谄谇谌谏谑谒谔谕谖谙谛谘谝谟谠谡谥谧谪谫谮谯谲谳谵谶卩卺阝阢阡阱阪阽阼陂陉陔陟陧陬陲陴隈隍隗隰邗邛邝邙邬邡邴邳邶邺邸邰郏郅邾郐郄郇郓郦郢郜郗郛郫郯郾鄄鄢鄞鄣鄱鄯鄹酃酆刍奂劢劬劭劾哿勐勖勰叟燮矍廴凵凼鬯厶弁畚巯坌垩垡塾墼壅壑圩圬圪圳圹圮圯坜圻坂坩垅坫垆坼坻坨坭坶坳垭垤垌垲埏垧垴垓垠埕埘埚埙埒垸埴埯埸埤埝堋堍埽埭堀堞堙塄堠塥塬墁墉墚墀馨鼙懿艹艽艿芏芊芨芄芎芑芗芙芫芸芾芰苈苊苣芘芷芮苋苌苁芩芴芡芪芟苄苎芤苡茉苷苤茏茇苜苴苒苘茌苻苓茑茚茆茔茕苠苕茜荑荛荜茈莒茼茴茱莛荞茯荏荇荃荟荀茗荠茭茺茳荦荥荨茛荩荬荪荭荮莰荸莳莴莠莪莓莜莅荼莶莩荽莸荻莘莞莨莺莼菁萁菥菘堇萘萋菝菽菖萜萸萑萆菔菟萏萃菸菹菪菅菀萦菰菡葜葑葚葙葳蒇蒈葺蒉葸萼葆葩葶蒌蒎萱葭蓁蓍蓐蓦蒽蓓蓊蒿蒺蓠蒡蒹蒴蒗蓥蓣蔌甍蔸蓰蔹蔟蔺蕖蔻蓿蓼蕙蕈蕨蕤蕞蕺瞢蕃蕲蕻薤薨薇薏蕹薮薜薅薹薷薰藓藁藜藿蘧蘅蘩蘖蘼廾弈夼奁耷奕奚奘匏尢尥尬尴扌扪抟抻拊拚拗拮挢拶挹捋捃掭揶捱捺掎掴捭掬掊捩掮掼揲揸揠揿揄揞揎摒揆掾摅摁搋搛搠搌搦搡摞撄摭撖摺撷撸撙撺擀擐擗擤擢攉攥攮弋忒甙弑卟叱叽叩叨叻吒吖吆呋呒呓呔呖呃吡呗呙吣吲咂咔呷呱呤咚咛咄呶呦咝哐咭哂咴哒咧咦哓哔呲咣哕咻咿哌哙哚哜咩咪咤哝哏哞唛哧唠哽唔哳唢唣唏唑唧唪啧喏喵啉啭啁啕唿啐唼唷啖啵啶啷唳唰啜喋嗒喃喱喹喈喁喟啾嗖喑啻嗟喽喾喔喙嗪嗷嗉嘟嗑嗫嗬嗔嗦嗝嗄嗯嗥嗲嗳嗌嗍嗨嗵嗤辔嘞嘈嘌嘁嘤嘣嗾嘀嘧嘭噘嘹噗嘬噍噢噙噜噌噔嚆噤噱噫噻噼嚅嚓嚯囔囗囝囡囵囫囹囿圄圊圉圜帏帙帔帑帱帻帼帷幄幔幛幞幡岌屺岍岐岖岈岘岙岑岚岜岵岢岽岬岫岱岣峁岷峄峒峤峋峥崂崃崧崦崮崤崞崆崛嵘崾崴崽嵬嵛嵯嵝嵫嵋嵊嵩嵴嶂嶙嶝豳嶷巅彳彷徂徇徉後徕徙徜徨徭徵徼衢彡犭犰犴犷犸狃狁狎狍狒狨狯狩狲狴狷猁狳猃狺狻猗猓猡猊猞猝猕猢猹猥猬猸猱獐獍獗獠獬獯獾舛夥飧夤夂饣饧饨饩饪饫饬饴饷饽馀馄馇馊馍馐馑馓馔馕庀庑庋庖庥庠庹庵庾庳赓廒廑廛廨廪膺忄忉忖忏怃忮怄忡忤忾怅怆忪忭忸怙怵怦怛怏怍怩怫怊怿怡恸恹恻恺恂恪恽悖悚悭悝悃悒悌悛惬悻悱惝惘惆惚悴愠愦愕愣惴愀愎愫慊慵憬憔憧憷懔懵忝隳闩闫闱闳闵闶闼闾阃阄阆阈阊阋阌阍阏阒阕阖阗阙阚丬爿戕氵汔汜汊沣沅沐沔沌汨汩汴汶沆沩泐泔沭泷泸泱泗沲泠泖泺泫泮沱泓泯泾洹洧洌浃浈洇洄洙洎洫浍洮洵洚浏浒浔洳涑浯涞涠浞涓涔浜浠浼浣渚淇淅淞渎涿淠渑淦淝淙渖涫渌涮渫湮湎湫溲湟溆湓湔渲渥湄滟溱溘滠漭滢溥溧溽溻溷滗溴滏溏滂溟潢潆潇漤漕滹漯漶潋潴漪漉漩澉澍澌潸潲潼潺濑濉澧澹澶濂濡濮濞濠濯瀚瀣瀛瀹瀵灏灞宀宄宕宓宥宸甯骞搴寤寮褰寰蹇謇辶迓迕迥迮迤迩迦迳迨逅逄逋逦逑逍逖逡逵逶逭逯遄遑遒遐遨遘遢遛暹遴遽邂邈邃邋彐彗彖彘尻咫屐屙孱屣屦羼弪弩弭艴弼鬻屮妁妃妍妩妪妣妗姊妫妞妤姒妲妯姗妾娅娆姝娈姣姘姹娌娉娲娴娑娣娓婀婧婊婕娼婢婵胬媪媛婷婺媾嫫媲嫒嫔媸嫠嫣嫱嫖嫦嫘嫜嬉嬗嬖嬲嬷孀尕尜孚孥孳孑孓孢驵驷驸驺驿驽骀骁骅骈骊骐骒骓骖骘骛骜骝骟骠骢骣骥骧纟纡纣纥纨纩纭纰纾绀绁绂绉绋绌绐绔绗绛绠绡绨绫绮绯绱绲缍绶绺绻绾缁缂缃缇缈缋缌缏缑缒缗缙缜缛缟缡缢缣缤缥缦缧缪缫缬缭缯缰缱缲缳缵幺畿巛甾邕玎玑玮玢玟珏珂珑玷玳珀珉珈珥珙顼琊珩珧珞玺珲琏琪瑛琦琥琨琰琮琬琛琚瑁瑜瑗瑕瑙瑷瑭瑾璜璎璀璁璇璋璞璨璩璐璧瓒璺韪韫韬杌杓杞杈杩枥枇杪杳枘枧杵枨枞枭枋杷杼柰栉柘栊柩枰栌柙枵柚枳柝栀柃枸柢栎柁柽栲栳桠桡桎桢桄桤梃栝桕桦桁桧桀栾桊桉栩梵梏桴桷梓桫棂楮棼椟椠棹椤棰椋椁楗棣椐楱椹楠楂楝榄楫榀榘楸椴槌榇榈槎榉楦楣楹榛榧榻榫榭槔榱槁槊槟榕槠榍槿樯槭樗樘橥槲橄樾檠橐橛樵檎橹樽樨橘橼檑檐檩檗檫猷獒殁殂殇殄殒殓殍殚殛殡殪轫轭轱轲轳轵轶轸轷轹轺轼轾辁辂辄辇辋辍辎辏辘辚軎戋戗戛戟戢戡戥戤戬臧瓯瓴瓿甏甑甓攴旮旯旰昊昙杲昃昕昀炅曷昝昴昱昶昵耆晟晔晁晏晖晡晗晷暄暌暧暝暾曛曜曦曩贲贳贶贻贽赀赅赆赈赉赇赍赕赙觇觊觋觌觎觏觐觑牮犟牝牦牯牾牿犄犋犍犏犒挈挲掰搿擘耄毪毳毽毵毹氅氇氆氍氕氘氙氚氡氩氤氪氲攵敕敫牍牒牖爰虢刖肟肜肓肼朊肽肱肫肭肴肷胧胨胩胪胛胂胄胙胍胗朐胝胫胱胴胭脍脎胲胼朕脒豚脶脞脬脘脲腈腌腓腴腙腚腱腠腩腼腽腭腧塍媵膈膂膑滕膣膪臌朦臊膻臁膦欤欷欹歃歆歙飑飒飓飕飙飚殳彀毂觳斐齑斓於旆旄旃旌旎旒旖炀炜炖炝炻烀炷炫炱烨烊焐焓焖焯焱煳煜煨煅煲煊煸煺熘熳熵熨熠燠燔燧燹爝爨灬焘煦熹戾戽扃扈扉礻祀祆祉祛祜祓祚祢祗祠祯祧祺禅禊禚禧禳忑忐怼恝恚恧恁恙恣悫愆愍慝憩憝懋懑戆肀聿沓泶淼矶矸砀砉砗砘砑斫砭砜砝砹砺砻砟砼砥砬砣砩硎硭硖硗砦硐硇硌硪碛碓碚碇碜碡碣碲碹碥磔磙磉磬磲礅磴礓礤礞礴龛黹黻黼盱眄眍盹眇眈眚眢眙眭眦眵眸睐睑睇睃睚睨睢睥睿瞍睽瞀瞌瞑瞟瞠瞰瞵瞽町畀畎畋畈畛畲畹疃罘罡罟詈罨罴罱罹羁罾盍盥蠲钅钆钇钋钊钌钍钏钐钔钗钕钚钛钜钣钤钫钪钭钬钯钰钲钴钶钷钸钹钺钼钽钿铄铈铉铊铋铌铍铎铐铑铒铕铖铗铙铘铛铞铟铠铢铤铥铧铨铪铩铫铮铯铳铴铵铷铹铼铽铿锃锂锆锇锉锊锍锎锏锒锓锔锕锖锘锛锝锞锟锢锪锫锩锬锱锲锴锶锷锸锼锾锿镂锵镄镅镆镉镌镎镏镒镓镔镖镗镘镙镛镞镟镝镡镢镤镥镦镧镨镩镪镫镬镯镱镲镳锺矧矬雉秕秭秣秫稆嵇稃稂稞稔稹稷穑黏馥穰皈皎皓皙皤瓞瓠甬鸠鸢鸨鸩鸪鸫鸬鸲鸱鸶鸸鸷鸹鸺鸾鹁鹂鹄鹆鹇鹈鹉鹋鹌鹎鹑鹕鹗鹚鹛鹜鹞鹣鹦鹧鹨鹩鹪鹫鹬鹱鹭鹳疒疔疖疠疝疬疣疳疴疸痄疱疰痃痂痖痍痣痨痦痤痫痧瘃痱痼痿瘐瘀瘅瘌瘗瘊瘥瘘瘕瘙瘛瘼瘢瘠癀瘭瘰瘿瘵癃瘾瘳癍癞癔癜癖癫癯翊竦穸穹窀窆窈窕窦窠窬窨窭窳衤衩衲衽衿袂袢裆袷袼裉裢裎裣裥裱褚裼裨裾裰褡褙褓褛褊褴褫褶襁襦襻疋胥皲皴矜耒耔耖耜耠耢耥耦耧耩耨耱耋耵聃聆聍聒聩聱覃顸颀颃颉颌颍颏颔颚颛颞颟颡颢颥颦虍虔虬虮虿虺虼虻蚨蚍蚋蚬蚝蚧蚣蚪蚓蚩蚶蛄蚵蛎蚰蚺蚱蚯蛉蛏蚴蛩蛱蛲蛭蛳蛐蜓蛞蛴蛟蛘蛑蜃蜇蛸蜈蜊蜍蜉蜣蜻蜞蜥蜮蜚蜾蝈蜴蜱蜩蜷蜿螂蜢蝽蝾蝻蝠蝰蝌蝮螋蝓蝣蝼蝤蝙蝥螓螯螨蟒蟆螈螅螭螗螃螫蟥螬螵螳蟋蟓螽蟑蟀蟊蟛蟪蟠蟮蠖蠓蟾蠊蠛蠡蠹蠼缶罂罄罅舐竺竽笈笃笄笕笊笫笏筇笸笪笙笮笱笠笥笤笳笾笞筘筚筅筵筌筝筠筮筻筢筲筱箐箦箧箸箬箝箨箅箪箜箢箫箴篑篁篌篝篚篥篦篪簌篾篼簏簖簋簟簪簦簸籁籀臾舁舂舄臬衄舡舢舣舭舯舨舫舸舻舳舴舾艄艉艋艏艚艟艨衾袅袈裘裟襞羝羟羧羯羰羲籼敉粑粝粜粞粢粲粼粽糁糇糌糍糈糅糗糨艮暨羿翎翕翥翡翦翩翮翳糸絷綦綮繇纛麸麴赳趄趔趑趱赧赭豇豉酊酐酎酏酤酢酡酰酩酯酽酾酲酴酹醌醅醐醍醑醢醣醪醭醮醯醵醴醺豕鹾趸跫踅蹙蹩趵趿趼趺跄跖跗跚跞跎跏跛跆跬跷跸跣跹跻跤踉跽踔踝踟踬踮踣踯踺蹀踹踵踽踱蹉蹁蹂蹑蹒蹊蹰蹶蹼蹯蹴躅躏躔躐躜躞豸貂貊貅貘貔斛觖觞觚觜觥觫觯訾謦靓雩雳雯霆霁霈霏霎霪霭霰霾龀龃龅龆龇龈龉龊龌黾鼋鼍隹隼隽雎雒瞿雠銎銮鋈錾鍪鏊鎏鐾鑫鱿鲂鲅鲆鲇鲈稣鲋鲎鲐鲑鲒鲔鲕鲚鲛鲞鲟鲠鲡鲢鲣鲥鲦鲧鲨鲩鲫鲭鲮鲰鲱鲲鲳鲴鲵鲶鲷鲺鲻鲼鲽鳄鳅鳆鳇鳊鳋鳌鳍鳎鳏鳐鳓鳔鳕鳗鳘鳙鳜鳝鳟鳢靼鞅鞑鞒鞔鞯鞫鞣鞲鞴骱骰骷鹘骶骺骼髁髀髅髂髋髌髑魅魃魇魉魈魍魑飨餍餮饕饔髟髡髦髯髫髻髭髹鬈鬏鬓鬟鬣麽麾縻麂麇麈麋麒鏖麝麟黛黜黝黠黟黢黩黧黥黪黯鼢鼬鼯鼹鼷鼽鼾齄';
Common.spellTable = ['a',0,'ai',2,'an',15,'ang',24,'ao',27,'ba',36,'bai',54,'ban',62,'bang',77,'bao',89,'bei',106,'ben',121,'beng',125,'bi',131,'bian',155,'biao',167,'bie',171,'bin',175,'bing',181,'bo',190,'bu',211,'ca',220,'cai',221,'can',232,'cang',239,'cao',244,'ce',249,'ceng',254,'cha',256,'chai',267,'chan',270,'chang',280,'chao',293,'che',302,'chen',308,'cheng',318,'chi',333,'chong',349,'chou',354,'chu',366,'chuai',382,'chuan',383,'chuang',390,'chui',396,'chun',401,'chuo',408,'ci',410,'cong',422,'cou',428,'cu',429,'cuan',433,'cui',436,'cun',444,'cuo',447,'da',453,'dai',459,'dan',471,'dang',486,'dao',491,'de',503,'deng',506,'di',513,'dian',532,'diao',548,'die',557,'ding',564,'diu',573,'dong',574,'dou',584,'du',591,'duan',606,'dui',612,'dun',616,'duo',625,'e',637,'en',650,'er',651,'fa',659,'fan',667,'fang',684,'fei',695,'fen',707,'feng',722,'fo',737,'fou',738,'fu',739,'ga',784,'gai',786,'gan',792,'gang',803,'gao',812,'ge',822,'gei',839,'gen',840,'geng',842,'gong',849,'gou',864,'gu',873,'gua',891,'guai',897,'guan',900,'guang',911,'gui',914,'gun',930,'guo',933,'ha',939,'hai',940,'han',947,'hang',966,'hao',969,'he',978,'hei',996,'hen',998,'heng',1002,'hong',1007,'hou',1016,'hu',1023,'hua',1041,'huai',1050,'huan',1055,'huang',1069,'hui',1083,'hun',1104,'huo',1110,'ji',1120,'jia',1173,'jian',1190,'jiang',1230,'jiao',1243,'jie',1271,'jin',1298,'jing',1318,'jiong',1343,'jiu',1345,'ju',1362,'juan',1387,'jue',1394,'jun',1404,'ka',1415,'kai',1419,'kan',1424,'kang',1430,'kao',1437,'ke',1441,'ken',1456,'keng',1460,'kong',1462,'kou',1466,'ku',1470,'kua',1477,'kuai',1482,'kuan',1486,'kuang',1488,'kui',1496,'kun',1507,'kuo',1511,'la',1515,'lai',1522,'lan',1525,'lang',1540,'lao',1547,'le',1556,'lei',1558,'leng',1569,'li',1572,'lia',1606,'lian',1607,'liang',1621,'liao',1632,'lie',1645,'lin',1650,'ling',1662,'liu',1676,'long',1687,'lou',1696,'lu',1702,'lv',1722,'luan',1736,'lue',1742,'lun',1744,'luo',1751,'ma',1763,'mai',1772,'man',1778,'mang',1787,'mao',1793,'me',1805,'mei',1806,'men',1822,'meng',1825,'mi',1833,'mian',1847,'miao',1856,'mie',1864,'min',1866,'ming',1872,'miu',1878,'mo',1879,'mou',1896,'mu',1899,'na',1914,'nai',1921,'nan',1926,'nang',1929,'nao',1930,'ne',1935,'nei',1936,'nen',1938,'neng',1939,'ni',1940,'nian',1951,'niang',1958,'niao',1960,'nie',1962,'nin',1969,'ning',1970,'niu',1976,'nong',1980,'nu',1984,'nv',1987,'nuan',1988,'nue',1989,'nuo',1991,'o',1995,'ou',1996,'pa',2003,'pai',2009,'pan',2015,'pang',2023,'pao',2028,'pei',2035,'pen',2044,'peng',2046,'pi',2060,'pian',2077,'piao',2081,'pie',2085,'pin',2087,'ping',2092,'po',2101,'pu',2110,'qi',2125,'qia',2161,'qian',2164,'qiang',2186,'qiao',2194,'qie',2209,'qin',2214,'qing',2225,'qiong',2238,'qiu',2240,'qu',2248,'quan',2261,'que',2272,'qun',2280,'ran',2282,'rang',2286,'rao',2291,'re',2294,'ren',2296,'reng',2306,'ri',2308,'rong',2309,'rou',2319,'ru',2322,'ruan',2332,'rui',2334,'run',2337,'ruo',2339,'sa',2341,'sai',2344,'san',2348,'sang',2352,'sao',2355,'se',2359,'sen',2362,'seng',2363,'sha',2364,'shai',2373,'shan',2375,'shang',2391,'shao',2399,'she',2410,'shen',2422,'sheng',2438,'shi',2449,'shou',2496,'shu',2506,'shua',2539,'shuai',2541,'shuan',2545,'shuang',2547,'shui',2550,'shun',2554,'shuo',2558,'si',2562,'song',2578,'sou',2586,'su',2589,'suan',2602,'sui',2605,'sun',2616,'suo',2619,'ta',2627,'tai',2636,'tan',2645,'tang',2663,'tao',2676,'te',2687,'teng',2688,'ti',2692,'tian',2707,'tiao',2715,'tie',2720,'ting',2723,'tong',2733,'tou',2746,'tu',2750,'tuan',2761,'tui',2763,'tun',2769,'tuo',2772,'wa',2783,'wai',2790,'wan',2792,'wang',2809,'wei',2819,'wen',2852,'weng',2862,'wo',2865,'wu',2874,'xi',2903,'xia',2938,'xian',2951,'xiang',2977,'xiao',2997,'xie',3015,'xin',3036,'xing',3046,'xiong',3061,'xiu',3068,'xu',3077,'xuan',3096,'xue',3106,'xun',3112,'ya',3126,'yan',3142,'yang',3175,'yao',3192,'ye',3207,'yi',3222,'yin',3275,'ying',3291,'yo',3309,'yong',3310,'you',3325,'yu',3346,'yuan',3390,'yue',3410,'yun',3420,'za',3432,'zai',3435,'zan',3442,'zang',3446,'zao',3449,'ze',3463,'zei',3467,'zen',3468,'zeng',3469,'zha',3473,'zhai',3487,'zhan',3493,'zhang',3510,'zhao',3525,'zhe',3535,'zhen',3545,'zheng',3561,'zhi',3576,'zhong',3619,'zhou',3630,'zhu',3644,'zhua',3670,'zhuai',3672,'zhuan',3673,'zhuang',3679,'zhui',3686,'zhun',3692,'zhuo',3694,'zi',3705,'zong',3720,'zou',3727,'zu',3731,'zuan',3739,'zui',3741,'zun',3745,'zuo',3747];

Common.StringToQuanPin = function( str )
    {
	var i,c,t,p,ret='';
        
	for( i=0; i<str.length; i++ ){
	    ret += this._GetSpell( str.charAt(i) );
	}
	return ret;
    }
Common.StringToJianPin = function( str )
    {
	var i,c,t,p,ret='';
        
	for( i=0; i<str.length; i++ ){
	    ret += this._GetSpell( str.charAt(i) ).substring(0,1);
	}
	return ret;
    }
Common._GetSpell = function( sChar )
    {
	var num = sChar.charCodeAt(0);
	if( num > 0 && num < 160 )
	    return sChar;

	var py = '', p, t;
	if( num >= 0x4e00 ){    // 中文字符
            p = this.SpellCharGB.indexOf( sChar );
            if( p>-1 && p<3755 ){
                for( t=this.spellTable.length-1; t>0 ; t=t-2 ){
                    if( this.spellTable[t]<=p )
                        break;
                }
                if( t>0 ){
                    py = this.spellTable[t-1];
//                    if( py.length == 1 ){
//                        py = py.toUpperCase();
//                    } else if( py.length > 1 ){
//                        py = py.charAt(0).toUpperCase() + py.substring(1);
//                    }
	        }
	    }
	}
	return py;
    }
/* */



/* UrlText 类 / 应用类
/* -------------------------------------------------------------------------------------------- */
UrlText = Class.create();
UrlText.prototype = {
    _PostRg : (new RegExp('^(([^#?&]+=[^#?&]+)+)')),
    initialize : function(){
	this.Clear();
	this.Add.apply( this, arguments );
    },
    Clear : function(){
	this.Text = '';
	this._locate = 0;
	this.IsBlank = true;
    },
    Add : function(){
	var len = arguments.length;
	if( len <= 0 ) return;
	for( var i = 0; i < len; i++ ){
	    var arg = arguments[i];
	    if( !arg ) continue;
	    
	    if( arg instanceof Array ){
	        this._AddQuery( arg );
	    } else if( typeof arg == 'string' ){
	    	var argl = arg.toLowerCase();
	    	
	    	if( argl == 'uni' ){
	    	    this._AddQuery( ['uni'] );
	    	    continue;
	    	}
	    	if( /^~[\/\\]/.test( arg ) ){
	    	    this._AddFilePath( arg );
	    	    continue;
	    	}
	    	if( this._PostRg.test( arg ) ){
	    	    this._AppendText( arg );
	    	    continue;
	    	}
	    	this._AddRootUrl( arg );
	    }
	}
	if( this.Text!='' )
	    this.IsBlank = false;
    },
    AddHash : function(){
	;
    },
    _AddRootUrl : function( rootUrl ){
	if( this.Text!='' ) return;
	
	this.Text = rootUrl;
	this._locate = 1;
    },
    _AddFilePath : function( path ){
	if( this.Text=='' || this._locate!=1 ) return;
	
	path = path.replace( /[\\]+/g, '/' );
	path = path.replace( /[\/]+/g, '/' );

	this.Text = this.Text.replace( /[\\]+/g, '/' );
	this.Text = this.Text.replace( /[\/]+/g, '/' );
	this.Text = this.Text.replace( /^((\w+):\/)/i, '$2://' );
	
	if( !/[\/]+$/.test(this.Text) ){
//	    this.Text.replace( /[\/]+$/, '/' );
//	} else{
	    this.Text += '/';
	}
	this.Text = path.replace( /^~[\/]/, this.Text );
    },
    _AddQuery : function( arr ){
	if( !arr || arr.length<1 ) return;
	
	var text = '';
	var qrl = arr[0].toLowerCase();
	if( qrl == 'uni' ){
	    this._AppendText( 'uni=' + Value.UniqueValue() );
	    return;
	}
	
	var value = '';
	var type = typeof arr[1];
	if( type == 'boolean' || type == 'number' ){
	    value = arr[1].toString();
	} else if( type == 'string' ){
	    value = arr[1];
	} else
	    return;
	
	if( qrl == 'optype' ){
	    this._AppendText( 'optype=' + encodeURIComponent(value.toLowerCase()) );
	} else{   //alert(value+'\n'+encodeURIComponent(value))
	    this._AppendText( arr[0] +'='+ encodeURIComponent(value) );   // encodeURI()   decodeURI()
	}
    },
    _AppendText : function( text ){
	if( this.Text == '' ){
	    this.Text = text;
	    this._locate = 2;
	    return;
	}
	
	if( this._locate <= 1 ){
	    this.Text += ('?' + text);
	    this._locate = 2;
	} else if( this._locate == 2 ){
	    this.Text += ('&' + text);
	}
    }
};


/* AjaxRequest 类 / 应用类
/* -------------------------------------------------------------------------------------------- */
AjaxRequest = Class.create();
AjaxRequest.prototype = {
    initialize : function( url, okFunc, errFunc ){	// 初始化函数 自动调用
	this.xmlReq = this.CreateXmlHttp();
	this.xmlReq.onreadystatechange = this._OnPostBackReady_.bind(this);
	
	this.linkGoal = url;
	if( typeof okFunc == 'function' )
	    this.onRespnOk =  okFunc;
	if( typeof errFunc == 'function' )
	    this.onRespnErr =  errFunc;
	this.isReady = true;
    },
    CreateXmlHttp : function(){
	var oXmlHttp;
	try{
            oXmlHttp = new XMLHttpRequest();
            return oXmlHttp;
	} catch( e ){;}

	for( var i=0; i<this.XmlHttpVersion.length; i++ ){
	    try{
	        oXmlHttp = new ActiveXObject( this.XmlHttpVersion[i] );
	        return oXmlHttp;
	    } catch( e ){;}
	}
	throw new Error( 'Microsoft XML is not installed on your system!' );
    },
    Post : function( PostMag, url, okFunc, errFunc ){
	if( !this.isReady ) return false;
	if( !url ){
	    if( this.linkGoal )
	        url = this.linkGoal;
	    else
	        return false;
	}
	if( okFunc && (typeof okFunc == 'function') )
	    this._tOnRespnOk = okFunc;
	if( errFunc && (typeof errFunc == 'function') )
	    this._tOnRespnErr = errFunc;

	this.isReady = false;
	this.xmlReq.open( 'POST', url, true );
	this.xmlReq.setRequestHeader( 'Content-Type', 'application/x-www-form-urlencoded' );
	this.xmlReq.onreadystatechange = this._OnPostBackReady_.bind(this);
	this.xmlReq.send( PostMag );
	return true;
    },
    Get : function( url, okFunc, errFunc ){
	if( !this.isReady ) return false;
	if( !url ){
	    if( this.linkGoal )
	        url = this.linkGoal;
	    else
	        return false;
	}
	if( okFunc && (typeof okFunc == 'function') )
	    this._tOnRespnOk = okFunc;
	if( errFunc && (typeof errFunc == 'function') )
	    this._tOnRespnErr = errFunc;

	this.isReady = false;
	this.xmlReq.open( 'GET', url, true );
	this.xmlReq.setRequestHeader( 'Content-Type', 'application/x-www-form-urlencoded' );
	this.xmlReq.send( null );
	return true;
    },
    _OnPostBackReady_ : function(){
	if( this.xmlReq.readyState != 4 )
	    return;
	var errtxt = '';
	if( this.xmlReq.status == 200 || this.xmlReq.status == 304 ){
	    var resp = this.xmlReq.responseText;
            this.isReady = true;//alert( resp);

	    if( /^ok;;;([^\x00]*)$/i.test(resp) ){
	        resp = RegExp.$1;
	        var r = [];
	        while( true ){      // 用‘;;;’切分字符串
	            if( /^([^\x00]*?);;;([^\x00]*)$/i.test(resp) ){
	                r.push( RegExp.$1 );
	                resp = RegExp.$2;
	                if( resp.length>0 ) continue;
	                else break;
	            } else{
	                if( resp.length>0 ){
	                    r.push( resp );
	                    break;
	                } else break;
	            }
	        }
	        if( r.length<1 ) r='';
	        else if( r.length==1 ) r=r[0];

	        if( this._tOnRespnOk ){
	            this._tOnRespnOk( r );
	            this._tOnRespnOk = null;
	        } else if( this.onRespnOk ){
	            this.onRespnOk( r );
	        }
	        return;
	        
	    } else if( /^error;;;([^\x00]*)$/i.test(resp) ){
	        errtxt = RegExp.$1;
	    } else {	    
	        errtxt = '响应信息格式错误：'+resp;
	    }
	} else{
	    errtxt = '响应错误：'+ this.xmlReq.status;
	}
	if( this._tOnRespnErr ){
	    this._tOnRespnErr( errtxt );
	    this._tOnRespnErr = null;
	} else if( this.onRespnErr ){
	    this.onRespnErr( errtxt );
	}
    },
    XmlHttpVersion : [
	'MSXML2.XMLHTTP.6.0',
	'MSXML2.XMLHTTP.5.0',
	'MSXML2.XMLHTTP.4.0',
	'MSXML2.XMLHTTP.3.0',
	'MSXML2.XMLHTTP'
    ]
};








function foreach( array, fn )
{
    if( typeof array !='object' ) return;
    if( array.length>0 ){
        for( var i=0; i<array.length; i++ ){
            if( fn( i, array[i] )=='break' ) return;
        }
    } else{
        for( var f in array ){
            if( fn( f, array[f] )=='break' ) return;
        }
    }
}

var Value = {
    GetQuery : function( name ){
	var str = location.search;
	if( !str || !name ) return;
	
	var rg = new RegExp( name +'=([^=&#:]*)','i');
	if( rg.test(str) ){
	    return unescape( RegExp.$1 );
	}
    },
    SetQuery : function( name, newValue ){
	var str = location.search;
	if( !str ) return  '?'+ name +'='+ newValue;
	
	var q = name+'='+escape(newValue);
	
	var rg = new RegExp( '('+name +'=[^=&#:]*)','i');
	if( rg.test(str) )
	    return  str.replace( RegExp.$1, q );    //unescape( RegExp.$1 );
	return str + ((str=='?')?'':'&') + q;
    },
    UniqueValue : function(){
	var dt = new Date();
	return dt.getTime();
    },
    ToInt : function( value, defaultValue ){
        var f = parseInt( value );
        if( typeof(defaultValue) != 'number' || isNaN(defaultValue) ) defaultValue = 0; 
        return isNaN(f)? defaultValue: f;
    },
    ToIntP : function( value, defaultValue ){
        var f = parseInt( value );
        if( typeof(defaultValue) != 'number' || isNaN(defaultValue) ) defaultValue = 0; 
        return (isNaN(f)||f<0) ? defaultValue: f;
    },
    ToFloat : function( value, defaultValue ){
        var f = parseFloat( value );
        if( typeof(defaultValue) != 'number' || isNaN(defaultValue) ) defaultValue = 0; 
        return isNaN(f)? defaultValue: f;
    },
    ToFloatP : function( value, defaultValue ){
        var f = parseFloat( value );
        if( !defaultValue ) defaultValue = 0; 
        return (isNaN(f)||f<0) ? defaultValue: f;
    },
    Random : function( min, max ){
        return Math.floor( Math.random()*(max-min+1) ) + min;
    },
    Round : function( num, carryNumber ){   // 小数四舍五入 ，12.2 > 12  12.7 > 13
        num = Math.round(num*100000)/100000;  // 处理jS的数学运算时的精度误差 (默认精度:5位)
        if( !carryNumber ) return num;
        return Math.round(num * carryNumber) / carryNumber;
    },
    Ceiling: function( num, carryNumber ){  // 小数进位，12.2 > 13  12.7 > 13
        num = Math.round(num*100000)/100000;
        if( !carryNumber ) return Math.ceil(num);
        return Math.ceil(num * carryNumber) / carryNumber;
    },
    Floor: function( num, carryNumber ){    // 小数舍去，12.2 > 12  12.7 > 12
        num = Math.round(num*100000)/100000;
        if( !carryNumber ) return Math.floor(num);
        return Math.floor(num * carryNumber) / carryNumber;
    }
}


var CssClass = (function(){
     function Append( elem, name ){     // 添加 新 class
        if( Has( elem, name ) ) return;
        elem.__CssClass[name]='';
        elem.className = elem.__CssClass.toString();
    }
    function Remove( elem, name ){     //  移除 class
        if( Has( elem, name ) ){
            delete  elem.__CssClass[name];
        }
        elem.className = elem.__CssClass.toString();
    }
    function Replace( elem, oldClass, newClass ){     // 替换 class
        if( Has( elem, oldClass ) ){
            delete  elem.__CssClass[oldClass];
        }
        elem.__CssClass[newClass]='';
        elem.className = elem.__CssClass.toString();
    }

    function Has( elem, name ){     // 判断 class 是否包含
        _initElem( elem )
        return (name in elem.__CssClass);
    }
    function _initElem( elem ){
        if( elem.__CssClass ) return;
        
        elem.__CssClass = new _create();
        var clsn = elem.className;  if( clsn=='' ) return;
        var cls = clsn.split(' ');  if( cls.length==1 ){ elem.__CssClass[clsn]=''; return; }
        for( var i=0; i<cls.length; i++ ){
            if( cls[i] ) elem.__CssClass[ cls[i] ]='';
        }
    }
    function _create(){ }
    _create.prototype.toString = function(){
        var s=[];
        for( var n in this ) if( this.hasOwnProperty(n) )s.push( n );
        return s.join(' ');
    }

    function Set( elem, newClass ){
        elem.className = ''+newClass;
        elem.__CssClass = new _create();
        elem.__CssClass[newClass]='';
    }
    function Get( elem ){
        _initElem( elem )
        return elem.className;
    }    
    function Clear( elem, newClass ){
        elem.__CssClass = new _create();
        if( newClass ){
            elem.className = ''+newClass;
            elem.__CssClass[newClass]='';
        } else{
            elem.className = '';
        }
    }
    return{
        Append : Append,
        Remove : Remove,
        Replace : Replace,
        Has : Has,
        Set : Set,
        Set : Set,
        Clear : Clear
    }
})();




/* ====================== 中文金额大写 ====================== */
var UpperMoney = {
    Ay0 :  ['零','壹','贰','叁','肆','伍','陆','柒','捌','玖'],
    Ay1 : ['圆','拾','佰','仟','万','拾','佰','仟','亿',
                '拾','佰','仟','万','拾','佰','仟','兆'],
    Ay2 : ['圆', '0', '0', '0','万', '0', '0', '0','亿',
                 '0', '0', '0','万', '0', '0', '0','兆'],
    Ay3 : ['角','分'],
    
    Get : function( n ){
	return this._I2C( n );
    },
    _I2C : function( n ){
	if( typeof(n)!='number' || n==0 ) return '零';
	
	if(-1 == n.toString().indexOf(".")){
	    return this._Set_I2C(n)+'整';
	}else{
	    var i,istr,f,fstr,a,rstr;
	    a = n.toString().split(".");
	    rstr = this._Set_I2C( a[0] ) + this._Set_F2C( a[1] );
	    return rstr.replace(/^圆/,"");
	}
    },
    _Set_I2C : function( str ){
	var ns = str.toString();
	var tempstr = '';
	var n=ns.length+1;  n = (n>17)?17:n;
	for( var i=1; i<n; i++ ){
	    var t = ns.charAt(ns.length-i);   //.substr( ns.length-i,1 ); ///////////////////////////////////
	    if( t != '0' ) tempstr = ''+ this.Ay0[t-0] + this.Ay1[i-1] + tempstr;
	    else           tempstr = ''+ this.Ay2[i-1] + tempstr;
        }
        return this._G2B(tempstr);
    },
    _Set_F2C : function( str ){
	var ns = str.toString();
	var tempstr = "";
	var n=ns.length;  n = (n>2)?2:n; 
	for( var i=0; i<n; i++ ){
	    var t = ns.charAt(i);   //substr( i,1 ); ///////////////////////////////////
	    if( t != '0' ) tempstr += ''+ this.Ay0[t-0] + this.Ay3[i];
	    else           tempstr += '0';
	}
	return this._G2B(tempstr);
    },
    _G2B : function( str ){
        var rs = str.replace(/0+/g,"0");
        rs = rs.replace(/0(圆|万|亿)/g,"$1");
        rs = rs.replace("亿万","亿");
        rs = rs.replace(/0/g,"零");
        return rs;
    },
    __none : null
}




/* ====================== 中文金额大写 选择器 ====================== */
function i2c(n){
    if( typeof(n)!='number' || n==0 ) return '零';
    
    if(-1 == n.toString().indexOf(".")){
        return seti2c(n)+'整';
    }else{
        var i,istr,f,fstr,a,rstr;
        a = n.toString().split(".");
        rstr = seti2c( a[0] ) + setf2c( a[1] );
        return rstr.replace(/^圆/,"");
//        i = a[0];
//        f = a[1];
//        istr = seti2c(i);
//        fstr = setf2c(f);
//        rstr = istr+fstr;
//        rstr = rstr.replace(/^圆/,"");
//        return rstr;
    }
}

function seti2c(n){
    var ns = n.toString();
    var tempstr = "";
    for(var i=1;i<ns.length+1;i++){
        switch(i){
        case 1:
            var t = ns.substr(ns.length-i,1);
            if(t!="0"){
            tempstr = t+"圆"+tempstr;
            }else{
            tempstr = "圆"+tempstr;
            }
            break;
        case 2:
            var t = ns.substr(ns.length-i,1);
            if(t!="0"){
            tempstr = t+"拾"+tempstr;
            }else{
            tempstr = "0"+tempstr;
            }
            break;
        case 3:
            var t = ns.substr(ns.length-i,1);
            if(t!="0"){
             tempstr = t+"佰"+tempstr;
            }else{
             tempstr = "0"+tempstr;
            }
            break;
        case 4:
            var t = ns.substr(ns.length-i,1);
            if(t!="0"){
            tempstr = t+"仟"+tempstr;
            }else{
            tempstr = "0"+tempstr;
            }
            break;
        case 5:
            var t = ns.substr(ns.length-i,1);
            if(t!="0"){
            tempstr = t+"万"+tempstr;
            }else{
            tempstr = "万"+tempstr;
            }
            break;
        case 6:
            var t = ns.substr(ns.length-i,1);
            if(t!="0"){
            tempstr = t+"拾"+tempstr;
            }else{
            tempstr = "0"+tempstr;
            }
            break;
        case 7:
            var t = ns.substr(ns.length-i,1);
            if(t!="0"){
             tempstr = t+"佰"+tempstr;
            }else{
             tempstr = "0"+tempstr;
            }
            break;
        case 8:
            var t = ns.substr(ns.length-i,1);
            if(t!="0"){
             tempstr = t+"仟"+tempstr;
            }else{
             tempstr = "0"+tempstr;
            }
            break;
        case 9:
            var t = ns.substr(ns.length-i,1);
            if(t!="0"){
             tempstr = t+"亿"+tempstr;
            }else{
             tempstr = "亿"+tempstr;
            }
            break;
        case 10:
            var t = ns.substr(ns.length-i,1);
            if(t!="0"){
             tempstr = t+"拾"+tempstr;
            }else{
             tempstr = "0"+tempstr;
            }
            break;
        case 11:
            var t = ns.substr(ns.length-i,1);
            if(t!="0"){
             tempstr = t+"佰"+tempstr;
            }else{
             tempstr = "0"+tempstr;
            }
            break;
        case 12:
            var t = ns.substr(ns.length-i,1);
            if(t!="0"){
             tempstr = t+"仟"+tempstr;
            }else{
             tempstr = "0"+tempstr;
            }
            break;
        default:break;
        }
    }
    return g2b(tempstr);
}

function setf2c(n){
 var ns = n.toString();
 var tempstr = "";
 for(var i=0;i<ns.length;i++){
  switch(i){
   case 0:
    var t = ns.substr(i,1);
    if(t!="0"){
     tempstr += t+"角";
    }else{
     tempstr += "0";
    }
    break;
   case 1:
    var t = ns.substr(i,1);
    if(t!="0"){
     tempstr += t+"分";
    }
    break;
   default:break;
  }
 }
 return g2b(tempstr);
}

function g2b(s){
 rs = s.replace(/0+/g,"0");
 rs = rs.replace(/0(圆|万|亿)/g,"$1");
 rs = rs.replace("亿万","亿");
 rs = rs.replace(/0/g,"零");
 rs = rs.replace(/1/g,"壹");
 rs = rs.replace(/2/g,"贰");
 rs = rs.replace(/3/g,"叁");
 rs = rs.replace(/4/g,"肆");
 rs = rs.replace(/5/g,"伍");
 rs = rs.replace(/6/g,"陆");
 rs = rs.replace(/7/g,"柒");
 rs = rs.replace(/8/g,"捌");
 rs = rs.replace(/9/g,"玖");
 return rs;
}







// 针对 FF、chrome 中的 DOM 元素 没有 click 方法，不能主动触发事件，仿造一个
if( !Common.Browser.IsIE ){ 
    HTMLElement.prototype.click = function(){
        var evt = this.ownerDocument.createEvent('MouseEvents');
        evt.initMouseEvent('click', true, true, this.ownerDocument.defaultView, 1, 0, 0, 0, 0, false, false, false, false, 0, null);
        this.dispatchEvent(evt);
    }
}

//(function(){
//    function setValue( v ){
//        if( !this || !('value' in this) ) return false;
//        v = ''+v;
//        if( this.value != v ){
//            this.value = v;
//            var ce = this.__OnChange;
//            if( ce && ce.length>0 )
//                for( var i=0; i<ce.length; i++ ) ce[i]();
//        }
//    };
//    
//    try{
//        HTMLInputElement.prototype.SetValue = setValue;
//        HTMLInputElement.prototype.GetValue = function(){ return this.value; };
//    } catch(e){
////        var sp = document.createElement('INPUT');
////        alert( sp.__proto__ );
//    };
//})();


//(function(){
//    function setValue( v ){
//        v = ''+v;
//        if( this.innerText != v ){
//            this.innerText = v;
//            var ce = this.__OnChange;
//            if( ce && ce.length>0 )
//                for( var i=0; i<ce.length; i++ ) ce[i]();
//        }
//    }
//    function setNumber( n ){
//        return setValue( ''+n );
//    }
//    function getValue(){ return this.innerText; }
//    function getNumber(){ return Value.ToFloat(this.innerText); }
//    
//    if( HTMLSpanElement ){
//        HTMLSpanElement.prototype.SetValue  = setValue;
//        HTMLSpanElement.prototype.SetNumber = setNumber
//        HTMLSpanElement.prototype.GetValue  = getValue;
//        HTMLSpanElement.prototype.GetNumber = getNumber
////    } else{
////        var sp = document.createElement('SPAN');
//    }
//})();



var Do = {
    AddValueSetGet : function( elem ){
        elem.SetValue = function( v ){
            if( !this || !('value' in this) ) return false;
            v = ''+v;
            if( this.value != v ){
                this.value = v;
                var ce = this.__OnChange;
                if( ce && ce.length>0 )
                    for( var i=0; i<ce.length; i++ ) ce[i]();
            }
        };
        elem.GetValue = function(){ return this.value; };
    },
    DisableSelectText : function( elem ){
        if( !elem ) elem = document.body;
        var handler = function(){ return false; }
        
        if( elem.addEventListener ){
            elem.addEventListener( 'mousedown', function(){ event.preventDefault(); }, false );
        } else if( elem.attachEvent ){
            elem.attachEvent( 'onselectstart', handler );
        } else{
            elem['onselectstart'] = handler;
        }
    },
    AddListener : function( elem, eventName, handler, srcObject ){
        if( srcObject ) handler = elem['__e_'+handler] = handler.bindAsEventListener( srcObject );
        
        if( elem.addEventListener ){
            eventName = eventName.replace( /on/, '' );
            elem.addEventListener( eventName, handler, false );
        } else if( elem.attachEvent ){
            elem.attachEvent( eventName, handler );
        } else{
            elem[ eventName ] = handler;
        }
    },
    RemoveListener : function( elem, eventName, handler ){
        var hn = '__e_'+handler;
        handler= elem[hn] ? elem[hn] : handler;
        
        if( elem.removeEventListener ){
            eventName = eventName.replace( /on/, '' );
            elem.removeEventListener( eventName, handler, false );
        } else if( elem.detachEvent ){
            elem.detachEvent( eventName, handler );
        } else{
            elem[ eventName ] = null;
        }
        elem[hn] = null;
    },
    AddLoadedListener  : function( iframe, handler ){
        if( iframe.addEventListener ){
            iframe.addEventListener( 'load', handler, false );
        } else if( iframe.attachEvent ){
            var rfn = function(){
                if( iframe.readyState && iframe.readyState!='complete' && iframe.status==200 ) return;
                handler();  
            };
            iframe.attachEvent( 'onreadystatechange', rfn );
//            return rfn;
        } else{
            iframe.onload = handler;
        }
//        return handler;
    },
    RemoveLoadedListener : function( iframe, handler ){
        if( iframe.removeEventListener ){
            iframe.removeEventListener( 'load', handler, false );
        } else if( iframe.attachEvent ){
            iframe.detachEvent( 'onreadystatechange', handler );
        } else{
            iframe.onload = null;
        }
    },
    AddValueListener : function( elem, handler, srcObject ){
        if( srcObject ) handler = elem['__e_'+handler] = handler.bindAsEventListener( srcObject );
        elem['__e_'+handler] = handler;

        if( elem.nodeName=='SPAN' ){
            if( !elem.__OnChange ) elem.__OnChange=[];
            elem.__OnChange.push( handler );
            return;
        }
        
        if( !elem.GetValue ) elem.GetValue = function(){ return elem.value; }
        if( !elem.SetValue ) elem.SetValue = function(v){
            v = ''+v;
            if( elem.value != v ) elem.value = v;
        }

        if( elem.watch ){                   // FireFox
            elem.watch( 'value', handler );
        }
        else if( elem.addEventListener ){   // Chrome / safari / Opera
            elem.addEventListener( 'input', handler, false );  //alert('addEventListener');
            if( !elem.__OnChange ) elem.__OnChange=[];
            elem.__OnChange.push( handler );
            elem.SetValue = function(v){
                v = ''+v;   //alert( elem.value+'   '+  v);
                if( elem.value == v ) return;
                elem.value = v;
                var ec = elem.__OnChange;
                if( ec && ec.length>0 )
                    for( var i=0; i<ec.length; i++ ) ec[i]();
            };
        }
        else{                               // IE
            var pfn = function(){
	        if( event.propertyName=='value' ){ handler(); }
            };
            if( elem.attachEvent )
                elem.attachEvent( 'onpropertychange', pfn );
            else elem['onpropertychange'] = pfn;
            elem['__e_'+handler] = pfn;
        }
    },
    RemoveValueListener : function( elem, handler ){
        var hn = '__e_'+handler;
        handler= elem[hn] ? elem[hn] : handler;
        
        var ec = elem.__OnChange;
        if( ec && ec.length>0 ){
            for( var i=0; i<ec.length; i++ ){ if( ec[i]===handler ) ec.splice(i,1); } //delete ec[i]; }
        }
        if( elem.nodeName=='SPAN' ){ elem[hn] = null; return; }
        
        if( elem.removeEventListener ){
            eventName = eventName.replace( /on/, '' );
            elem.removeEventListener( 'input', handler, false );
        } else if( elem.detachEvent ){
            elem.detachEvent( 'onpropertychange', handler );
        } else{
            elem['onpropertychange'] = null;
        }
        elem[hn] = null;
    },
    NewWindow : function( url ){
        if( !this.__NewWindowLink ){
            var lnk = document.createElement("A");
            lnk.href = '#';
            lnk.target = '_blank';
            lnk.style.display='none';
            document.documentElement.lastChild.appendChild( lnk );
            this.__NewWindowLink = lnk;
        }
        this.__NewWindowLink.href = url;
        this.__NewWindowLink.click();
        this.__NewWindowLink.href = '#';
    },
    DebugOut : function( str ){
        if( !this.__DebugOutObj ){
            this.__DebugOutObj = new DebugOut();
        }
        this.__DebugOutObj.Say( str );
    },
    ClearTextSelection : function(){
        if( document.selection ){
            document.selection.empty();
        } else if( document.getSelection ){
            document.getSelection().removeAllRanges(); 
        }
    }
}


var DebugOut = Class.create();
DebugOut.prototype = {
    initialize : function(){
        var div = document.createElement("DIV");
        div.className = 'DebugOutElem';
        div.innerHTML = '<ul></ul>';
        this.DebugOutElem = div;
        this.DebugOutBox  = div.firstChild;
        document.documentElement.lastChild.appendChild( div );
    },
    Say : function( str ){
        var li = document.createElement("LI");
        li.innerHTML = '<span>'+ str +'</span>';
        this.DebugOutBox.appendChild( li );
    },
    _none : null
}



function CancelDefault()
{
    if( !event ) return;
    if( event['preventDefault'] ) event.preventDefault();
    else event.returnValue = false;
}
function CancelBubble()
{
    if( !event ) return;
    if( event['stopPropagation'] ) event.stopPropagation();
    else event.cancelBubble = true;
}
function CancelDefaultBubble()
{
    CancelBubble();
    CancelDefault();
}

function OffAutoComplete( elem )
{
    if( !elem ) return false;
    if ( 'autocomplete' in elem )
        elem.autocomplete = 'off';
    else
        elem.setAttribute( 'autocomplete', 'off' );
}

// 获取元素位置 (lef, top, right, bottom)
function GetRect( elem )
{
//    if( R ) return elem.getBoundingClientRect();
    
    var ot = elem.offsetTop; 
    var ol = elem.offsetLeft; 
    var ow = elem.offsetWidth; 
    var oh = elem.offsetHeight; 
    while( elem = elem.offsetParent ){ 
        ol += elem.offsetLeft; 
        ot += elem.offsetTop; 
    } 
    return {'left':ol, 'top':ot, 'right':(ol+ow), 'bottom':(ot+oh), 'width':ow, 'height':oh };
}

function GetRectBy( elem, baseElem )
{
//    if( R )
//        return elem.getBoundingClientRect();
    var ot = elem.offsetTop; 
    var ol = elem.offsetLeft; 
    var ow = elem.offsetWidth; 
    var oh = elem.offsetHeight; 
    while( elem = elem.offsetParent ){ 
        ol += elem.offsetLeft; 
        ot += elem.offsetTop; 
    } 
    return {'left':ol, 'top':ot, 'right':(ol+ow), 'bottom':(ot+oh), 'width':ow, 'height':oh };
}


Do.SetInnerHTML_Table = function( elem, html )
{
    if( !Common.Browser.IsIE ){ elem.innerHTML = html; return; }

    ///////////////////////////// 还要判断 tbody thead tfoot tr td th，作不同处理
    var div = document.createElement('DIV');
    div.innerHTML = '<table>'+ html +'</table>'; 
    var tab = div.firstChild.firstChild;
    if( tab ) while( tab.firstChild ) elem.appendChild( tab.firstChild );
};

Do.SetInnerHTML_TR = function( elem, html )
{
    if( !Common.Browser.IsIE ){ elem.innerHTML = html; return; }
    var div = document.createElement('DIV');
    div.innerHTML = '<table><tr>'+ html +'</tr></table>'; 
    var tab = div.firstChild.firstChild.firstChild;
    if( tab ) while( tab.firstChild ) elem.appendChild( tab.firstChild );
};