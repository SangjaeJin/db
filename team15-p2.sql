
create database db_project;
use db_project;

CREATE TABLE CUSTOMER (
    Id VARCHAR(100) NOT NULL,
    Password VARCHAR(30) NOT NULL,
    Name VARCHAR(30),
    Job VARCHAR(30),
    Address VARCHAR(50) NOT NULL,
    Sex CHAR,
    Age INT UNSIGNED,
    Phone VARCHAR(20) NOT NULL,
    Ordertimes INT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (Id)
);
CREATE TABLE ITEM (
    Amount INT UNSIGNED NOT NULL DEFAULT 0,
    Importer VARCHAR(30),
    Made_date DATE NOT NULL,
    Ssn VARCHAR(20) NOT NULL,
    Price INT UNSIGNED NOT NULL,
    MadePlace VARCHAR(50) NOT NULL,
    Maker VARCHAR(30) NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Cat_sub VARCHAR(100) NOT NULL,
    P_ssn VARCHAR(20) NOT NULL,
    PRIMARY KEY (Ssn),
    UNIQUE KEY (Name)
);

CREATE TABLE RETAILER (
    Location VARCHAR(50) NOT NULL,
    MgrName VARCHAR(30) NOT NULL,
    MgrPhone VARCHAR(20) NOT NULL,
    Ssn VARCHAR(20) NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    OrderedTimes INT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (Ssn),
    UNIQUE KEY (MgrPhone , Phone)
);

 
CREATE TABLE PRODUCER (
    Ssn VARCHAR(20) NOT NULL,
    Maker VARCHAR(30) NOT NULL,
    MadePlace VARCHAR(50) NOT NULL,
    PRIMARY KEY (Ssn)
);

CREATE TABLE CATEGORY (
    Class VARCHAR(50) NOT NULL,
    SubClass VARCHAR(100) NOT NULL,
    Amount INT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (SubClass)
);

CREATE TABLE SHOPPINGBAG (
    AMOUNT INT UNSIGNED NOT NULL DEFAULT 0,
    C_id VARCHAR(100) NOT NULL,
    PRIMARY KEY (C_id)
);

CREATE TABLE ORDERS (
    C_id VARCHAR(100) NOT NULL,
    I_ssn VARCHAR(20) NOT NULL,
    OrderAmount INT UNSIGNED NOT NULL DEFAULT 1,
    BuyTime DATETIME NOT NULL,
    PRIMARY KEY (C_id , I_Ssn)
);

CREATE TABLE EXISTS_IN (
    I_ssn VARCHAR(20) NOT NULL,
    R_ssn VARCHAR(20) NOT NULL,
    Amount INT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (I_ssn , R_ssn)
);

CREATE TABLE IS_IN (
    I_ssn VARCHAR(20) NOT NULL,
    S_c_id VARCHAR(100) NOT NULL,
    PRIMARY KEY (I_ssn , S_c_id)
);

alter table ITEM add constraint fk_Cat_sub FOREIGN KEY(Cat_sub) references CATEGORY(subClass) on delete cascade;

alter table ITEM add constraint fk_P_ssn FOREIGN KEY(P_ssn) references PRODUCER(Ssn) on delete CASCADE;

alter table SHOPPINGBAG add constraint fk_C_id FOREIGN KEY(C_id) references CUSTOMER(Id) on delete CASCADE;

alter table ORDERS add constraint fk_O_C_id FOREIGN KEY(C_id) references CUSTOMER(Id) on delete CASCADE;

alter table ORDERS add constraint fk_O_I_Ssn FOREIGN KEY(I_Ssn) references ITEM(Ssn) on delete CASCADE;

alter table EXISTS_IN add constraint fk_E_I_Ssn FOREIGN KEY(I_ssn) references ITEM(Ssn) on delete CASCADE;

alter table EXISTS_IN add constraint fk_R_Ssn FOREIGN KEY(R_ssn) references RETAILER(Ssn) on delete CASCADE;

alter table IS_IN add constraint fk_I_I_Ssn FOREIGN KEY(I_ssn) references ITEM(Ssn) on delete CASCADE;

alter table IS_IN add constraint fk_I_S_c_id FOREIGN KEY(S_c_id) references SHOPPINGBAG(C_id) on delete CASCADE;

INSERT INTO `RETAILER` (`Location`,`MgrName`,`MgrPhone`,`Phone`,`Ssn`,`OrderedTimes`) VALUES ("Seoul","Ivor B. Singleton","010-9568-5065","02-877-6046","12806430899",77);
INSERT INTO `RETAILER` (`Location`,`MgrName`,`MgrPhone`,`Phone`,`Ssn`,`OrderedTimes`) VALUES ("Busan","Barry Y. Fulton","010-4651-6947","051-683-7721","40384067999",18);
INSERT INTO `RETAILER` (`Location`,`MgrName`,`MgrPhone`,`Phone`,`Ssn`,`OrderedTimes`) VALUES ("Daegu","Genevieve N. Spears","010-4150-8810","053-717-0926","94618426099",93);
INSERT INTO `RETAILER` (`Location`,`MgrName`,`MgrPhone`,`Phone`,`Ssn`,`OrderedTimes`) VALUES ("Incheon","Nayda R. Nieves","010-2449-2597","032-236-7362","97379568899",27);
INSERT INTO `RETAILER` (`Location`,`MgrName`,`MgrPhone`,`Phone`,`Ssn`,`OrderedTimes`) VALUES ("Gwangju","Halee K. Bentley","010-2890-2247","062-883-7243","67749053799",18);
INSERT INTO `RETAILER` (`Location`,`MgrName`,`MgrPhone`,`Phone`,`Ssn`,`OrderedTimes`) VALUES ("Daejeon","Arsenio O. Mcgowan","010-1074-3701","042-381-6636","50558947199",3);
INSERT INTO `RETAILER` (`Location`,`MgrName`,`MgrPhone`,`Phone`,`Ssn`,`OrderedTimes`) VALUES ("Ulsan","Chancellor J. Drake","010-9568-9380","052-413-2376","18980651099",45);
INSERT INTO `RETAILER` (`Location`,`MgrName`,`MgrPhone`,`Phone`,`Ssn`,`OrderedTimes`) VALUES ("Sejong","Erasmus C. Powers","010-9069-6724","044-024-4951","80692519199",60);
INSERT INTO `RETAILER` (`Location`,`MgrName`,`MgrPhone`,`Phone`,`Ssn`,`OrderedTimes`) VALUES ("Gyeonggi","Colleen O. Trevino","010-8695-3537","031-919-7817","75491852999",5);
INSERT INTO `RETAILER` (`Location`,`MgrName`,`MgrPhone`,`Phone`,`Ssn`,`OrderedTimes`) VALUES ("Gangwon","Kirsten N. Rodriguez","010-1422-5533","033-596-4999","54906025499",18);
INSERT INTO `RETAILER` (`Location`,`MgrName`,`MgrPhone`,`Phone`,`Ssn`,`OrderedTimes`) VALUES ("Chungbuk","Malik O. Perkins","010-3748-3586","043-744-5709","55803246999",82);
INSERT INTO `RETAILER` (`Location`,`MgrName`,`MgrPhone`,`Phone`,`Ssn`,`OrderedTimes`) VALUES ("Chungnam","Francesca C. Elliott","041-8813-5062","073-050-0698","66394747199",29);
INSERT INTO `RETAILER` (`Location`,`MgrName`,`MgrPhone`,`Phone`,`Ssn`,`OrderedTimes`) VALUES ("Jeonbuk","Kimberley T. Blackburn","010-8359-8698","063-372-5871","61529385599",86);
INSERT INTO `RETAILER` (`Location`,`MgrName`,`MgrPhone`,`Phone`,`Ssn`,`OrderedTimes`) VALUES ("Jeonnam","Cody W. Guzman","010-0447-8627","061-436-0018","15584709299",34);
INSERT INTO `RETAILER` (`Location`,`MgrName`,`MgrPhone`,`Phone`,`Ssn`,`OrderedTimes`) VALUES ("Kyungpook","Iris S. Santana","010-4771-6676","054-236-8988","93741502099",7);
INSERT INTO `RETAILER` (`Location`,`MgrName`,`MgrPhone`,`Phone`,`Ssn`,`OrderedTimes`) VALUES ("Kyungnam","Gretchen T. Sellers","010-3331-5270","055-565-6361","86408459699",69);
INSERT INTO `RETAILER` (`Location`,`MgrName`,`MgrPhone`,`Phone`,`Ssn`,`OrderedTimes`) VALUES ("Jeju","Vance G. West","010-6066-0230","064-849-5809","61229223599",78);


INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`OrderTimes`) VALUES ("dictum.cursus@sitametmassa.co.uk","LJW22WGD8TQ","Seoul 4856 Nisi. Street","010-7479-9668",7);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`OrderTimes`) VALUES ("sem@CraspellentesqueSed.co.uk","DER87MLB4MM","Seoul Ap #537-1676 Sit Rd.","010-3933-3484",8);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`OrderTimes`) VALUES ("id.ante.Nunc@arcu.org","IVE88PCQ7DM","Kyungnam Ap #836-2350 Enim Rd.","010-0017-1954",7);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`OrderTimes`) VALUES ("dignissim.lacus.Aliquam@a.edu","QWQ22LDU6AN","Busan Ap #329-1542 Eros. St.","010-5556-0473",9);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`OrderTimes`) VALUES ("eu.arcu.Morbi@sem.org","XST71LPA0DC","Gwangju 2011 Eros Av.","010-0119-0731",10);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`OrderTimes`) VALUES ("enim.mi@sagittisDuisgravida.edu","ZBJ18XHL3OI","Jeju 3145 Etiam Road","010-0703-0780",11);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`OrderTimes`) VALUES ("justo@Ut.org","JLN32NOO1PZ","Busan P.O. Box 369, 6359 Phasellus Rd.","010-2373-6951",7);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`OrderTimes`) VALUES ("Fusce.dolor@sitametmassa.co.uk","LTE00CGQ9ZY","Seoul 717 Eu Road","010-4668-4136",8);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`OrderTimes`) VALUES ("natoque.penatibus.et@Nullamsuscipit.edu","GNY61MYG8WI","Seoul 270-7396 Tellus Road","010-8396-0347",9);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`OrderTimes`) VALUES ("orci.Donec@nibhAliquam.org","RTZ82KRG1DS","Seoul Ap #481-5575 Vestibulum St.","010-5943-6842",7);

INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`OrderTimes`) VALUES ("a.sollicitudin.orci@placeratCrasdictum.ca","VOE55AGW1FC","Seoul 5237 Hendrerit Rd.","010-7146-6032","F",24,7);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`OrderTimes`) VALUES ("Praesent.luctus.Curabitur@milacinia.org","YEL52SIP6AJ","Seoul P.O. Box 738, 5527 Est. Rd.","010-1808-3925","F",20,9);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`OrderTimes`) VALUES ("luctus.et@ut.ca","OIY82CAA2YG","Seoul P.O. Box 615, 5664 Luctus, Avenue","010-1992-0962","F",40,11);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`OrderTimes`) VALUES ("imperdiet@elit.org","EFN55XJJ9TC","Seoul Ap #781-7348 Sodales. Av.","010-8298-4762","F",42,8);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`OrderTimes`) VALUES ("ullamcorper@metusIn.co.uk","IGQ76KKW5ON","Seoul 4053 Mauris, Av.","010-8949-6832","F",30,8);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`OrderTimes`) VALUES ("nulla.ante@Vivamusnonlorem.ca","ECB06AKQ4YN","Seoul 1112 Ante Avenue","010-3202-2162","M",35,1);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`OrderTimes`) VALUES ("imperdiet.nec.leo@Ut.co.uk","LQH12ZWX7AM","Seoul 3394 Eu St.","010-3764-6612","F",36,2);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`OrderTimes`) VALUES ("interdum.feugiat@nisisem.com","NPL90DSE3RW","Seoul P.O. Box 412, 6599 Dolor Rd.","010-8253-2435","M",31,3);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`OrderTimes`) VALUES ("gravida@liberoDonecconsectetuer.co.uk","DAK99OJR0AM","Seoul 438-6900 Nulla Av.","010-2141-3407","M",42,3);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`OrderTimes`) VALUES ("velit.Aliquam@mieleifendegestas.com","IQL25UQN9DN","Seoul P.O. Box 326, 9611 Leo. Road","010-1681-6313","F",47,3);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`OrderTimes`) VALUES ("vel.turpis@ipsumSuspendissenon.com","VNO55CEI1TS","Seoul P.O. Box 394, 5239 Sapien. St.","010-5581-7453","M",14,2);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`OrderTimes`) VALUES ("quam.Curabitur.vel@at.net","BPZ43CCY1MB","Seoul P.O. Box 491, 1098 Mauris Rd.","010-8324-1877","F",48,1);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`OrderTimes`) VALUES ("risus.Nunc@scelerisque.com","YFP34HUE8PA","Seoul Ap #122-2795 Sodales Avenue","010-3451-0896","M",33,2);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`OrderTimes`) VALUES ("leo.elementum.sem@parturientmontes.co.uk","PZZ98LOD5JV","Seoul 220-5853 Sed Road","010-6317-7846","M",35,4);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`OrderTimes`) VALUES ("molestie@Phasellusfermentumconvallis.net","UQR64GQH1VN","Seoul Ap #849-4955 Fusce Rd.","010-0320-7131","M",45,2);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`OrderTimes`) VALUES ("Suspendisse.ac.metus@nondapibus.org","GSZ85KUZ9VF","Seoul Ap #607-6637 Elit. Ave","010-5883-7929","F",12,1);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`OrderTimes`) VALUES ("nascetur.ridiculus@utquamvel.net","SCL02RIU0WN","Seoul Ap #207-7546 Ligula Road","010-2681-3079","F",20,3);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`OrderTimes`) VALUES ("libero.Integer.in@id.org","QDX24OQJ2JB","Jeju 1288 Eu, St.","010-9928-6103","F",40,5);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`OrderTimes`) VALUES ("ac.tellus@lobortis.net","WXR37NOH5HF","Chungnam P.O. Box 671, 6689 Elementum, Avenue","010-0354-9337","M",23,3);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`OrderTimes`) VALUES ("at.pretium@adipiscingelitAliquam.ca","ZOG18MLN3HU","Gwangju Ap #512-5756 Malesuada Rd.","010-3404-8474","F",22,1);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`OrderTimes`) VALUES ("feugiat@euturpis.net","USB16RFY7LO","Ulsan Ap #168-9386 Penatibus Street","010-1448-7381","M",20,4);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`OrderTimes`) VALUES ("sit.amet@Quisque.org","LGF08MHT6FE","Ulsan P.O. Box 932, 8204 Sapien. Rd.","010-5270-8776","F",22,2);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`OrderTimes`) VALUES ("ante.dictum.mi@hymenaeos.co.uk","BUC79JAA5DP","Busan 6419 Risus. Rd.","010-7422-6440","M",20,3);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`OrderTimes`) VALUES ("fringilla.ornare@diamdictum.co.uk","HQX00MBJ4WD","Ulsan P.O. Box 620, 2234 Non, Road","010-1279-4683","M",18,2);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`OrderTimes`) VALUES ("elementum.at@euturpis.org","NCE05NZG9WP","Kyungnam Ap #129-4749 Nostra, Rd.","010-7608-7462","F",17,3);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`OrderTimes`) VALUES ("sed.leo@mifringillami.com","CKM78KXY9QS","Incheon 6919 Egestas St.","010-3984-5358","F",36,3);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`OrderTimes`) VALUES ("nunc@mi.com","SPR12XDK9FE","Daegu 6321 Sollicitudin Rd.","010-6541-7177","M",44,4);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`OrderTimes`) VALUES ("eu.tellus.Phasellus@semvitae.org","Daegu QVL71CIS4YX","Ap #627-9662 Urna. Ave","010-5313-2852","F",26,4);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`OrderTimes`) VALUES ("ante@nonummyacfeugiat.edu","Daegu ALK15APS8YI","Ap #429-3248 Mi Rd.","010-1043-2882","F",13,2);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`OrderTimes`) VALUES ("rhoncus@elit.org","BEH08HJV7AB","Daegu 215-8142 Proin Rd.","010-0989-4482","M",24,5);

INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`Job`,`OrderTimes`) VALUES ("pellentesque@velitdui.com","ZCS37PJN5NP","Seoul 1508 Cursus St.","010-0615-8002","F",23,"Computer Engineer",5);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`Job`,`OrderTimes`) VALUES ("risus.a.ultricies@Proinvel.edu","QSE42SMV2QU","Seoul P.O. Box 920, 5525 Ac Ave","010-0747-9350","M",34,"Doctor",2);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`Job`,`OrderTimes`) VALUES ("neque.pellentesque.massa@tristiquealiquet.org","RUU01HAW5YW","Seoul 622-1041 Mauris Street","010-5973-6867","F",43,"Teacher",2);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`Job`,`OrderTimes`) VALUES ("eu@nisidictum.edu","HZQ75MBH5HE","Seoul Ap #486-476 Lorem Rd.","010-0253-5887","M",26,"Singer",2);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`Job`,`OrderTimes`) VALUES ("nisl.Quisque@Nullam.org","EQS18SRX8TY","Seoul 616-3162 Nunc Ave","010-1495-8975","M",47,"Actor",1);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`Job`,`OrderTimes`) VALUES ("metus.In@Sedauctor.org","YIC73SSL3FO","Seoul Ap #945-226 Enim. St.","010-1793-6323","F",50,"Actress",1);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`Job`,`OrderTimes`) VALUES ("vulputate@egetmagna.org","DPX30JFX5GY","Seoul P.O. Box 176, 7265 Cubilia Av.","010-8289-8863","M",35,"Student",2);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`Job`,`OrderTimes`) VALUES ("arcu@sempererat.edu","CKJ42ZGN3ES","Seoul 291-2365 Consectetuer Ave","010-6348-9258","M",50,"Student",5);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`Job`,`OrderTimes`) VALUES ("fermentum.risus@liberoatauctor.com","QKG94NLM4DM","Seoul 1309 Donec Rd.","010-0330-0381","F",24,"Professor",2);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`Job`,`OrderTimes`) VALUES ("dui.in.sodales@ac.com","MIV86UBM2LE","Daegu 399-3816 Ornare Rd.","010-7244-8765","M",24,"Teacher",2);
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`Job`) VALUES ("Nullam@enimEtiam.ca","BMA56XUV7RW","Daegu P.O. Box 645, 2376 Dolor Avenue","010-1617-6542","F",27,"Fireman");
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`Job`) VALUES ("Duis.at.lacus@Phaselluselitpede.com","HKR53VKZ8AL","Daegu 5760 Sollicitudin Avenue","010-8935-5723","M",16,"Cop");
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`Job`) VALUES ("Integer.mollis@penatibus.org","TIW09YMM5IF","Daegu Ap #919-9536 Eu Avenue","010-5651-6476","M",13,"Nurse");
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`Job`) VALUES ("vulputate.posuere@elitpretium.com","KIE65BOC7VR","Daegu 407-5657 Enim. Rd.","010-8462-7854","F",34,"Writter");
INSERT INTO `CUSTOMER` (`Id`,`Password`,`Address`,`Phone`,`Sex`,`Age`,`Job`) VALUES ("Phasellus@molestie.com","PPD98SAQ6HW","Daegu 333-3724 Suspendisse Rd.","010-1227-8401","F",46,"Movie director");



INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (10,"dictum.cursus@sitametmassa.co.uk");          /* 이 부분 5개는 customer 첫 블락 위에서 5개 */
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (10,"sem@CraspellentesqueSed.co.uk");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (10,"id.ante.Nunc@arcu.org");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (10,"dignissim.lacus.Aliquam@a.edu");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (10,"eu.arcu.Morbi@sem.org");

INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (1,"a.sollicitudin.orci@placeratCrasdictum.ca");   /*이 부분 10개는 커스터머 두번째 블락에서 10개*/
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (1,"Praesent.luctus.Curabitur@milacinia.org");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (1,"luctus.et@ut.ca");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (1,"imperdiet@elit.org");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (1,"ullamcorper@metusIn.co.uk");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (1,"nulla.ante@Vivamusnonlorem.ca");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (1,"imperdiet.nec.leo@Ut.co.uk");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (1,"interdum.feugiat@nisisem.com");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (1,"gravida@liberoDonecconsectetuer.co.uk");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (1,"velit.Aliquam@mieleifendegestas.com");

INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (0,"vel.turpis@ipsumSuspendissenon.com");      /*여기서부터는 커스터머 두번째블락 11개째부터 */
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (0,"quam.Curabitur.vel@at.net");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (0,"risus.Nunc@scelerisque.com");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (0,"leo.elementum.sem@parturientmontes.co.uk");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (0,"molestie@Phasellusfermentumconvallis.net");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (0,"Suspendisse.ac.metus@nondapibus.org");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (0,"nascetur.ridiculus@utquamvel.net");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (0,"libero.Integer.in@id.org");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (0,"ac.tellus@lobortis.net");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (0,"at.pretium@adipiscingelitAliquam.ca");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (0,"feugiat@euturpis.net");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (0,"sit.amet@Quisque.org");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (0,"ante.dictum.mi@hymenaeos.co.uk");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (0,"fringilla.ornare@diamdictum.co.uk");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (0,"elementum.at@euturpis.org");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (0,"sed.leo@mifringillami.com");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (0,"nunc@mi.com");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (0,"eu.tellus.Phasellus@semvitae.org");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (0,"ante@nonummyacfeugiat.edu");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (0,"rhoncus@elit.org");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (0,"pellentesque@velitdui.com");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (0,"risus.a.ultricies@Proinvel.edu");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (0,"neque.pellentesque.massa@tristiquealiquet.org");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (0,"eu@nisidictum.edu");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (0,"nisl.Quisque@Nullam.org");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (0,"metus.In@Sedauctor.org");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (0,"vulputate@egetmagna.org");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (0,"arcu@sempererat.edu");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (0,"fermentum.risus@liberoatauctor.com");
INSERT INTO `SHOPPINGBAG` (`Amount`,`C_id`) VALUES (0,"dui.in.sodales@ac.com");

INSERT INTO `CATEGORY` (`Class`,`SubClass`,`Amount`) VALUES ( "fruit/nut", "kiwi/chamdare", 17);
INSERT INTO `CATEGORY` (`Class`,`SubClass`,`Amount`) VALUES ( "fruit/nut" ,"바나나/오렌지/외국과일", 85);
INSERT INTO `CATEGORY` (`Class`,`SubClass`,`Amount`) VALUES ( '과일/견과' ,'감귤/한라봉', 1768);
INSERT INTO `CATEGORY` (`Class`,`SubClass`,`Amount`) VALUES ( "정육/계란류","소고기", 8500);
INSERT INTO `CATEGORY` (`Class`,`SubClass`,`Amount`) VALUES ("정육/계란류" ,"돼지고기", 8500);
INSERT INTO `CATEGORY` (`Class`,`SubClass`,`Amount`) VALUES ("정육/계란류" ,"수입육", 8500);
INSERT INTO `CATEGORY` (`Class`,`SubClass`,`Amount`) VALUES ("수산물/해산물/건어물" ,"오징어/낙지", 8500);
INSERT INTO `CATEGORY` (`Class`,`SubClass`,`Amount`) VALUES ("수산물/해산물/건어물" ,"전복/굴/조개류", 8500);

INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1693121096499","KKMC","NewZealand");
INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1664112142499","제스프리","NewZealand");
INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1615042354099","온누리팜","NewZealand");
INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1658112353199","한국참다래유통사업단","NewZealand");

INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1624092303399","신세계 푸드","Ecuador");
INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1683121728999","스미후루코리아","Philippines");
INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1604040126299","AROY FARM CO LTD","Thailand");
INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1644112136499","ONIBASE PTY LTD","Republic of South Afreeca");
INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1664050431099","MISSION PRODUCE INC","USA");

INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1640103057399","영농조합법인 미담","Korea");
INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1689101206999","증원에프엔디","Korea");
INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1641012000499","위미농협","Korea");
INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1648051244199","농업회사법인주식회사 참","Korea");
INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1649091205499","한라농원","Korea");

INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1672072872299","㈜명품횡성청정한우","Korea");
INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1668111353799","(주)태우그린푸드","Korea");
INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1696112132499","설성푸드 주식회사","Korea");

INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1612070775699","(주)보담","Korea");
INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1665061481799","(주)태흥한돈","Korea");
INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1653050663999","(주)도드람푸드","Korea");

INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1689102719799","(주)국제식품진천공장","USA");
INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1644040221399","(주)웰본","Spain");

INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1637020575499","굴비나무","Korea");
INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1649012191999","굴비나무","China");
INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1683121303199","안동간고등어","Korea");
INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1641102423999","착한어부","Korea");
INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1699061316799","흰누리","Norway");

INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1663102847499","청정해","Korea");
INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1643041585699","덕이네수산","Korea");
INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1651022325899","씨엔오션","Vietnam");
INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1690042280499","화남인터내셔날","Philippines");

INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1669040641099","청산바다","Korea");
INSERT INTO `PRODUCER` (`Ssn`,`Maker`,`MadePlace`) VALUES ("1625091882299","대해수산","Korea");

INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (0,"KKMC","2018-05-31","1000017646641",19900,"NewZealand","KKMC","제스프리 골드키위","키위/참다래","1693121096499");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (0,"제스프리인터내셔널코리아","2018-06-03","1000018349957",13900,"NewZealand","KKMC","뉴질랜드 그린키위 점보 개별 118g내외 20개","키위/참다래","1693121096499");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (0,"(주)수일통상","2018-02-15","1000028309028",12900,"NewZealand","제스프리","제스프리 그린키위 16개입(98g 내외)","키위/참다래","1664112142499");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (0,"진원무역","2018-09-27","1000028160226",12800,"NewZealand","온누리팜","그린키위 15개입","키위/참다래","1615042354099");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (17,"제스프리","2018-05-06","1000027953165",48900,"NewZealand","한국참다래유통사업단","제스프리 썬 골드키위 48개입 5.6kg","키위/참다래","1658112353199");

INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (17,"신세계 푸드","2018-08-22","1000028764714",2980,"Ecuador","신세계 푸드","바나밸리 바나나 1봉 / 1.3 kg 내외","바나나/오렌지/외국과일","1624092303399");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (17,"스미후루코리아","2018-05-20","1000028266381",12400,"Philippines","스미후루코리아","스위트마운틴 바나나 2팩 2kg","바나나/오렌지/외국과일","1683121728999");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (17,"(주)썬자이","2018-05-18","1000020939463",13900,"Thailand","AROY FARM CO LTD","태국망고 2개입 600g내외","바나나/오렌지/외국과일","1604040126299");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (17,"글로벌통상 (주)","2018-04-08","1000029724878",11900,"Republic of South Afreeca","ONIBASE PTY LTD","남아공산 자몽 7입 2.1kg내외","바나나/오렌지/외국과일","1644112136499");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (17,"수일통상(주)","2018-06-13","1000029714198",19900,"USA","MISSION PRODUCE INC","미국 아보카도 5개입 1kg 내외","바나나/오렌지/외국과일","1664050431099");

INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (17,null,"2018-04-23","1000018568863",59900,"Korea","영농조합법인 미담","제주 서귀포 황금향 5kg 21-26과","감귤/한라봉","1640103057399");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (17,null,"2018-09-07","1000021060172",22900,"Korea","증원에프엔디","프리미엄 제주 불로초 고급감귤 1.5kg 내외 1박스","감귤/한라봉","1689101206999");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (17,null,"2018-06-30","1000005553945",26900,"Korea","위미농협","문주왕 하우스감귤 3kg","감귤/한라봉","1641012000499");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (17,null,"2018-04-13","1000029471555",25900,"Korea","농업회사법인주식회사 참","제주 황금향 2kg ","감귤/한라봉","1648051244199");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (1700,null,"2018-09-17","1000029266828",23800,"Korea","한라농원","한라농원 제주 황금향 1.5kg 중과","감귤/한라봉","1649091205499");

INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (1700,null,"2018-03-03","0000005410098",128000,"Korea","㈜명품횡성청정한우","명품 횡성한우 정성가득 정육세트 1호","소고기","1672072872299");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (1700,null,"2018-08-14","1000023093627",159000,"Korea","㈜명품횡성청정한우","명품 횡성한우 정성가득 정육세트 2호","소고기","1672072872299");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (1700,null,"2018-02-11","1000028935441",26400,"Korea","(주)태우그린푸드","한우 1등급 불고기 200g ","소고기","1668111353799");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (1700,null,"2018-04-08","1000027532832",21900,"Korea","설성푸드 주식회사","무항생제 한우 부채살 200g","소고기","1696112132499");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (1700,null,"2018-02-21","1000025032666",23900,"Korea","설성푸드 주식회사","무항생제 친환경 한우 차돌박이 300g","소고기","1696112132499");

INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (1700,null,"2018-08-12","1000029127113",18800,"Korea","(주)보담","냉장칼집목심구이용600g","돼지고기","1612070775699");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (1700,null,"2018-04-17","1000025881970",11000,"Korea","(주)태흥한돈","냉장 오겹살 구이 (500g)","돼지고기","1665061481799");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (1700,null,"2018-06-27","1000029004078",6900,"Korea","(주)도드람푸드","냉장 도깨비살 400g","돼지고기","1653050663999");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (1700,null,"2018-01-29","0000007691302",7900,"Korea","(주)도드람푸드","국내산 갈비찜용 600g","돼지고기","1653050663999");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (1700,null,"2018-09-01","1000028286599",13900,"Korea","(주)도드람푸드","숯불구이용 칼집 목심/삼겹살 500g","돼지고기","1653050663999");

INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (1700,"㈜국제식품진천공장","2018-06-11","1000025197143",9900,"USA","(주)국제식품진천공장","La갈비 선물세트 2kg 초이스급","수입육","1689102719799");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (1700,"(주)하이랜드푸드","2018-01-06","1000025031926",4900,"Spain","(주)웰본","냉동 벌집삼겹살 숯불구이용(절단)","수입육","1644040221399");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (1700,"(주)세경상역","2018-03-19","0000010626950",21500,"Austrailia","(주)보담","호주산 냉동우육불고기 1kg","수입육","1612070775699");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (1700,"(주)세경상역","2018-08-21","0000010626624",21500,"Austrailia","(주)보담","호주산 냉동우육 국거리 덩어리1kg","수입육","1612070775699");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (1700,"(주)하이랜드푸드","2018-07-20","1000025450109",3500,"Spain","(주)웰본","냉동 돼지 다짐육 1kg","수입육","1644040221399");

INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (1700,null,"2018-03-07","1000013038780",135000,"Korea","굴비나무","법성포 굴비세트 명품 5호","고등어/갈치/조기/장어","1637020575499");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (1700,"관우물산","2018-02-10","1000025804909",79000,"China","굴비나무","영광 법성포 보리굴비세트 특선","고등어/갈치/조기/장어","1649012191999");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (1700,null,"2018-06-12","1000028974483",43900,"Korea","(주)안동간고등어","안동 간고등어 실속 선물 세트 ","고등어/갈치/조기/장어","1683121303199");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (1700,null,"2018-03-27","1000029573621",18900,"Korea","착한어부","제주도 은갈치 240g내외 x 1팩/총 4토막","고등어/갈치/조기/장어","1641102423999");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (1700,"흰누리","2018-07-31","1000029496997",13900,"Norway","흰누리","흰누리 노르웨이 순살 고등어 2kg ","고등어/갈치/조기/장어","1699061316799");

INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (1700,null,"2018-05-28","100002829177",41000,"Korea","청정해","제주 자숙 돌문어 1kg","오징어/낙지","1663102847499");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (1700,null,"2018-04-24","1000029105357",42900,"Korea","덕이네수산","문어 1kg","오징어/낙지","1643041585699");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (1700,null,"2018-04-04","1000029105352",25900,"Korea","덕이네수산","자숙문어 300g","오징어/낙지","1643041585699");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (1700,"(주)하하물산","2018-03-17","1000028950139",6900,"Vietnam","씨엔오션","절단낙지 L 500g","오징어/낙지","1651022325899");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (1700,"화남인터내셔날","2018-02-25","1000028699843",26900,"Philippines","화남인터내셔날","쫄깃한 자숙문어 900g-1.2kg","오징어/낙지","1690042280499");

INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (1700,null,"2018-05-11","1000029105032",10900,"Korea","덕이네수산","왕 바지락 1kg","전복/굴/조개류","1643041585699");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (1700,null,"2018-02-12","1000029105024",15900,"Korea","덕이네수산","전복 3미","전복/굴/조개류","1643041585699");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (1700,null,"2018-10-01","1000021416651",38800,"Korea","청산바다","자연산 뿔소라 3kg","전복/굴/조개류","1669040641099");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (1700,null,"2018-08-16","1000029105034",22900,"Korea","덕이네수산","대합 1kg","전복/굴/조개류","1643041585699");
INSERT INTO `ITEM` (`Amount`,`Importer`,`Made_date`,`Ssn`,`Price`,`MadePlace`,`Maker`,`Name`,`Cat_sub`,`P_ssn`) VALUES (1700,null,"2018-02-11","1000028037662",8500,"Korea","대해수산","통영굴(냉동) 1kg","전복/굴/조개류","1625091882299");


INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000017646641","dictum.cursus@sitametmassa.co.uk");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000018349957","dictum.cursus@sitametmassa.co.uk");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000028309028","dictum.cursus@sitametmassa.co.uk");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000028160226","dictum.cursus@sitametmassa.co.uk");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000027953165","dictum.cursus@sitametmassa.co.uk");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000028764714","dictum.cursus@sitametmassa.co.uk");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000028266381","dictum.cursus@sitametmassa.co.uk");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000020939463","dictum.cursus@sitametmassa.co.uk");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000029724878","dictum.cursus@sitametmassa.co.uk");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000029714198","dictum.cursus@sitametmassa.co.uk");

INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000018568863","sem@CraspellentesqueSed.co.uk");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000021060172","sem@CraspellentesqueSed.co.uk");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000005553945","sem@CraspellentesqueSed.co.uk");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000029471555","sem@CraspellentesqueSed.co.uk");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000029266828","sem@CraspellentesqueSed.co.uk");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("0000005410098","sem@CraspellentesqueSed.co.uk");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000023093627","sem@CraspellentesqueSed.co.uk");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000028935441","sem@CraspellentesqueSed.co.uk");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000027532832","sem@CraspellentesqueSed.co.uk");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000025032666","sem@CraspellentesqueSed.co.uk");

INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000029127113","id.ante.Nunc@arcu.org");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000025881970","id.ante.Nunc@arcu.org");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000029004078","id.ante.Nunc@arcu.org");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("0000007691302","id.ante.Nunc@arcu.org");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000028286599","id.ante.Nunc@arcu.org");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000025197143","id.ante.Nunc@arcu.org");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000025031926","id.ante.Nunc@arcu.org");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("0000010626950","id.ante.Nunc@arcu.org");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("0000010626624","id.ante.Nunc@arcu.org");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000025450109","id.ante.Nunc@arcu.org");

INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000013038780","dignissim.lacus.Aliquam@a.edu");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000025804909","dignissim.lacus.Aliquam@a.edu");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000028974483","dignissim.lacus.Aliquam@a.edu");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000029573621","dignissim.lacus.Aliquam@a.edu");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000029496997","dignissim.lacus.Aliquam@a.edu");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("100002829177","dignissim.lacus.Aliquam@a.edu");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000029105357","dignissim.lacus.Aliquam@a.edu");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000029105352","dignissim.lacus.Aliquam@a.edu");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000028950139","dignissim.lacus.Aliquam@a.edu");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000028699843","dignissim.lacus.Aliquam@a.edu");

INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000029105032","eu.arcu.Morbi@sem.org");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000029105024","eu.arcu.Morbi@sem.org");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000021416651","eu.arcu.Morbi@sem.org");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000029105034","eu.arcu.Morbi@sem.org");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000028037662","eu.arcu.Morbi@sem.org");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000017646641","eu.arcu.Morbi@sem.org");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000018349957","eu.arcu.Morbi@sem.org");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000028309028","eu.arcu.Morbi@sem.org");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000028160226","eu.arcu.Morbi@sem.org");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000027953165","eu.arcu.Morbi@sem.org");

INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000017646641","a.sollicitudin.orci@placeratCrasdictum.ca");   
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000017646641","Praesent.luctus.Curabitur@milacinia.org");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000017646641","luctus.et@ut.ca");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000017646641","imperdiet@elit.org");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000017646641","ullamcorper@metusIn.co.uk");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000017646641","nulla.ante@Vivamusnonlorem.ca");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000017646641","imperdiet.nec.leo@Ut.co.uk");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000017646641","interdum.feugiat@nisisem.com");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000017646641","gravida@liberoDonecconsectetuer.co.uk");
INSERT INTO `IS_IN` (`I_ssn`,`S_c_id`) VALUES ("1000017646641","velit.Aliquam@mieleifendegestas.com");




INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000017646641","12806430899",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018349957","12806430899",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028309028","12806430899",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028160226","12806430899",0);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027953165","12806430899",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028764714","12806430899",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028266381","12806430899",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000020939463","12806430899",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029724878","12806430899",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029714198","12806430899",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018568863","12806430899",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021060172","12806430899",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000005553945","12806430899",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029471555","12806430899",1);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029266828","12806430899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000005410098","12806430899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000023093627","12806430899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028935441","12806430899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027532832","12806430899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025032666","12806430899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029127113","12806430899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025881970","12806430899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029004078","12806430899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000007691302","12806430899",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028286599","12806430899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025197143","12806430899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025031926","12806430899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626950","12806430899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626624","12806430899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025450109","12806430899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000013038780","12806430899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025804909","12806430899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028974483","12806430899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029573621","12806430899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029496997","12806430899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("100002829177","12806430899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105357","12806430899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105352","12806430899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028950139","12806430899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028699843","12806430899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105032","12806430899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105024","12806430899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021416651","12806430899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105034","12806430899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028037662","12806430899",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000017646641","40384067999",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018349957","40384067999",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028309028","40384067999",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028160226","40384067999",0);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027953165","40384067999",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028764714","40384067999",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028266381","40384067999",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000020939463","40384067999",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029724878","40384067999",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029714198","40384067999",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018568863","40384067999",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021060172","40384067999",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000005553945","40384067999",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029471555","40384067999",1);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029266828","40384067999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000005410098","40384067999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000023093627","40384067999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028935441","40384067999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027532832","40384067999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025032666","40384067999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029127113","40384067999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025881970","40384067999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029004078","40384067999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000007691302","40384067999",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028286599","40384067999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025197143","40384067999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025031926","40384067999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626950","40384067999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626624","40384067999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025450109","40384067999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000013038780","40384067999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025804909","40384067999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028974483","40384067999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029573621","40384067999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029496997","40384067999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("100002829177","40384067999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105357","40384067999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105352","40384067999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028950139","40384067999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028699843","40384067999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105032","40384067999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105024","40384067999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021416651","40384067999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105034","40384067999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028037662","40384067999",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000017646641","94618426099",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018349957","94618426099",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028309028","94618426099",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028160226","94618426099",0);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027953165","94618426099",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028764714","94618426099",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028266381","94618426099",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000020939463","94618426099",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029724878","94618426099",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029714198","94618426099",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018568863","94618426099",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021060172","94618426099",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000005553945","94618426099",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029471555","94618426099",1);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029266828","94618426099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000005410098","94618426099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000023093627","94618426099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028935441","94618426099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027532832","94618426099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025032666","94618426099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029127113","94618426099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025881970","94618426099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029004078","94618426099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000007691302","94618426099",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028286599","94618426099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025197143","94618426099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025031926","94618426099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626950","94618426099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626624","94618426099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025450109","94618426099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000013038780","94618426099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025804909","94618426099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028974483","94618426099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029573621","94618426099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029496997","94618426099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("100002829177","94618426099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105357","94618426099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105352","94618426099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028950139","94618426099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028699843","94618426099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105032","94618426099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105024","94618426099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021416651","94618426099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105034","94618426099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028037662","94618426099",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000017646641","97379568899",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018349957","97379568899",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028309028","97379568899",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028160226","97379568899",0);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027953165","97379568899",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028764714","97379568899",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028266381","97379568899",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000020939463","97379568899",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029724878","97379568899",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029714198","97379568899",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018568863","97379568899",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021060172","97379568899",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000005553945","97379568899",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029471555","97379568899",1);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029266828","97379568899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000005410098","97379568899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000023093627","97379568899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028935441","97379568899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027532832","97379568899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025032666","97379568899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029127113","97379568899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025881970","97379568899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029004078","97379568899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000007691302","97379568899",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028286599","97379568899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025197143","97379568899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025031926","97379568899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626950","97379568899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626624","97379568899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025450109","97379568899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000013038780","97379568899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025804909","97379568899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028974483","97379568899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029573621","97379568899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029496997","97379568899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("100002829177","97379568899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105357","97379568899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105352","97379568899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028950139","97379568899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028699843","97379568899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105032","97379568899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105024","97379568899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021416651","97379568899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105034","97379568899",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028037662","97379568899",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000017646641","67749053799",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018349957","67749053799",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028309028","67749053799",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028160226","67749053799",0);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027953165","67749053799",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028764714","67749053799",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028266381","67749053799",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000020939463","67749053799",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029724878","67749053799",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029714198","67749053799",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018568863","67749053799",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021060172","67749053799",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000005553945","67749053799",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029471555","67749053799",1);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029266828","67749053799",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000005410098","67749053799",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000023093627","67749053799",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028935441","67749053799",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027532832","67749053799",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025032666","67749053799",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029127113","67749053799",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025881970","67749053799",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029004078","67749053799",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000007691302","67749053799",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028286599","67749053799",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025197143","67749053799",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025031926","67749053799",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626950","67749053799",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626624","67749053799",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025450109","67749053799",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000013038780","67749053799",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025804909","67749053799",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028974483","67749053799",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029573621","67749053799",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029496997","67749053799",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("100002829177","67749053799",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105357","67749053799",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105352","67749053799",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028950139","67749053799",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028699843","67749053799",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105032","67749053799",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105024","67749053799",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021416651","67749053799",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105034","67749053799",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028037662","67749053799",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000017646641","50558947199",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018349957","50558947199",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028309028","50558947199",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028160226","50558947199",0);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027953165","50558947199",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028764714","50558947199",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028266381","50558947199",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000020939463","50558947199",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029724878","50558947199",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029714198","50558947199",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018568863","50558947199",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021060172","50558947199",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000005553945","50558947199",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029471555","50558947199",1);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029266828","50558947199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000005410098","50558947199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000023093627","50558947199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028935441","50558947199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027532832","50558947199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025032666","50558947199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029127113","50558947199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025881970","50558947199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029004078","50558947199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000007691302","50558947199",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028286599","50558947199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025197143","50558947199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025031926","50558947199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626950","50558947199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626624","50558947199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025450109","50558947199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000013038780","50558947199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025804909","50558947199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028974483","50558947199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029573621","50558947199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029496997","50558947199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("100002829177","50558947199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105357","50558947199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105352","50558947199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028950139","50558947199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028699843","50558947199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105032","50558947199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105024","50558947199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021416651","50558947199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105034","50558947199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028037662","50558947199",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000017646641","18980651099",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018349957","18980651099",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028309028","18980651099",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028160226","18980651099",0);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027953165","18980651099",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028764714","18980651099",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028266381","18980651099",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000020939463","18980651099",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029724878","18980651099",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029714198","18980651099",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018568863","18980651099",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021060172","18980651099",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000005553945","18980651099",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029471555","18980651099",1);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029266828","18980651099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000005410098","18980651099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000023093627","18980651099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028935441","18980651099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027532832","18980651099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025032666","18980651099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029127113","18980651099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025881970","18980651099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029004078","18980651099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000007691302","18980651099",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028286599","18980651099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025197143","18980651099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025031926","18980651099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626950","18980651099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626624","18980651099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025450109","18980651099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000013038780","18980651099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025804909","18980651099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028974483","18980651099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029573621","18980651099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029496997","18980651099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("100002829177","18980651099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105357","18980651099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105352","18980651099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028950139","18980651099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028699843","18980651099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105032","18980651099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105024","18980651099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021416651","18980651099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105034","18980651099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028037662","18980651099",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000017646641","80692519199",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018349957","80692519199",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028309028","80692519199",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028160226","80692519199",0);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027953165","80692519199",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028764714","80692519199",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028266381","80692519199",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000020939463","80692519199",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029724878","80692519199",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029714198","80692519199",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018568863","80692519199",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021060172","80692519199",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000005553945","80692519199",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029471555","80692519199",1);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029266828","80692519199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000005410098","80692519199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000023093627","80692519199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028935441","80692519199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027532832","80692519199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025032666","80692519199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029127113","80692519199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025881970","80692519199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029004078","80692519199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000007691302","80692519199",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028286599","80692519199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025197143","80692519199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025031926","80692519199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626950","80692519199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626624","80692519199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025450109","80692519199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000013038780","80692519199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025804909","80692519199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028974483","80692519199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029573621","80692519199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029496997","80692519199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("100002829177","80692519199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105357","80692519199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105352","80692519199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028950139","80692519199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028699843","80692519199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105032","80692519199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105024","80692519199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021416651","80692519199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105034","80692519199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028037662","80692519199",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000017646641","75491852999",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018349957","75491852999",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028309028","75491852999",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028160226","75491852999",0);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027953165","75491852999",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028764714","75491852999",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028266381","75491852999",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000020939463","75491852999",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029724878","75491852999",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029714198","75491852999",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018568863","75491852999",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021060172","75491852999",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000005553945","75491852999",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029471555","75491852999",1);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029266828","75491852999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000005410098","75491852999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000023093627","75491852999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028935441","75491852999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027532832","75491852999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025032666","75491852999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029127113","75491852999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025881970","75491852999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029004078","75491852999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000007691302","75491852999",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028286599","75491852999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025197143","75491852999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025031926","75491852999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626950","75491852999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626624","75491852999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025450109","75491852999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000013038780","75491852999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025804909","75491852999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028974483","75491852999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029573621","75491852999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029496997","75491852999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("100002829177","75491852999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105357","75491852999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105352","75491852999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028950139","75491852999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028699843","75491852999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105032","75491852999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105024","75491852999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021416651","75491852999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105034","75491852999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028037662","75491852999",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000017646641","54906025499",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018349957","54906025499",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028309028","54906025499",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028160226","54906025499",0);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027953165","54906025499",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028764714","54906025499",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028266381","54906025499",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000020939463","54906025499",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029724878","54906025499",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029714198","54906025499",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018568863","54906025499",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021060172","54906025499",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000005553945","54906025499",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029471555","54906025499",1);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029266828","54906025499",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000005410098","54906025499",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000023093627","54906025499",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028935441","54906025499",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027532832","54906025499",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025032666","54906025499",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029127113","54906025499",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025881970","54906025499",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029004078","54906025499",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000007691302","54906025499",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028286599","54906025499",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025197143","54906025499",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025031926","54906025499",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626950","54906025499",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626624","54906025499",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025450109","54906025499",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000013038780","54906025499",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025804909","54906025499",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028974483","54906025499",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029573621","54906025499",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029496997","54906025499",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("100002829177","54906025499",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105357","54906025499",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105352","54906025499",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028950139","54906025499",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028699843","54906025499",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105032","54906025499",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105024","54906025499",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021416651","54906025499",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105034","54906025499",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028037662","54906025499",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000017646641","55803246999",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018349957","55803246999",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028309028","55803246999",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028160226","55803246999",0);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027953165","55803246999",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028764714","55803246999",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028266381","55803246999",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000020939463","55803246999",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029724878","55803246999",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029714198","55803246999",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018568863","55803246999",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021060172","55803246999",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000005553945","55803246999",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029471555","55803246999",1);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029266828","55803246999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000005410098","55803246999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000023093627","55803246999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028935441","55803246999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027532832","55803246999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025032666","55803246999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029127113","55803246999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025881970","55803246999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029004078","55803246999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000007691302","55803246999",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028286599","55803246999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025197143","55803246999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025031926","55803246999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626950","55803246999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626624","55803246999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025450109","55803246999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000013038780","55803246999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025804909","55803246999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028974483","55803246999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029573621","55803246999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029496997","55803246999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("100002829177","55803246999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105357","55803246999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105352","55803246999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028950139","55803246999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028699843","55803246999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105032","55803246999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105024","55803246999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021416651","55803246999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105034","55803246999",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028037662","55803246999",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000017646641","66394747199",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018349957","66394747199",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028309028","66394747199",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028160226","66394747199",0);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027953165","66394747199",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028764714","66394747199",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028266381","66394747199",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000020939463","66394747199",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029724878","66394747199",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029714198","66394747199",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018568863","66394747199",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021060172","66394747199",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000005553945","66394747199",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029471555","66394747199",1);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029266828","66394747199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000005410098","66394747199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000023093627","66394747199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028935441","66394747199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027532832","66394747199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025032666","66394747199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029127113","66394747199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025881970","66394747199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029004078","66394747199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000007691302","66394747199",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028286599","66394747199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025197143","66394747199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025031926","66394747199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626950","66394747199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626624","66394747199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025450109","66394747199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000013038780","66394747199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025804909","66394747199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028974483","66394747199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029573621","66394747199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029496997","66394747199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("100002829177","66394747199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105357","66394747199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105352","66394747199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028950139","66394747199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028699843","66394747199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105032","66394747199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105024","66394747199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021416651","66394747199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105034","66394747199",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028037662","66394747199",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000017646641","61529385599",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018349957","61529385599",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028309028","61529385599",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028160226","61529385599",0);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027953165","61529385599",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028764714","61529385599",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028266381","61529385599",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000020939463","61529385599",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029724878","61529385599",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029714198","61529385599",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018568863","61529385599",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021060172","61529385599",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000005553945","61529385599",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029471555","61529385599",1);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029266828","61529385599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000005410098","61529385599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000023093627","61529385599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028935441","61529385599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027532832","61529385599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025032666","61529385599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029127113","61529385599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025881970","61529385599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029004078","61529385599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000007691302","61529385599",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028286599","61529385599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025197143","61529385599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025031926","61529385599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626950","61529385599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626624","61529385599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025450109","61529385599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000013038780","61529385599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025804909","61529385599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028974483","61529385599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029573621","61529385599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029496997","61529385599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("100002829177","61529385599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105357","61529385599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105352","61529385599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028950139","61529385599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028699843","61529385599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105032","61529385599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105024","61529385599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021416651","61529385599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105034","61529385599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028037662","61529385599",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000017646641","15584709299",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018349957","15584709299",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028309028","15584709299",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028160226","15584709299",0);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027953165","15584709299",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028764714","15584709299",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028266381","15584709299",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000020939463","15584709299",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029724878","15584709299",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029714198","15584709299",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018568863","15584709299",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021060172","15584709299",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000005553945","15584709299",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029471555","15584709299",1);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029266828","15584709299",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000005410098","15584709299",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000023093627","15584709299",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028935441","15584709299",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027532832","15584709299",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025032666","15584709299",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029127113","15584709299",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025881970","15584709299",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029004078","15584709299",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000007691302","15584709299",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028286599","15584709299",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025197143","15584709299",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025031926","15584709299",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626950","15584709299",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626624","15584709299",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025450109","15584709299",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000013038780","15584709299",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025804909","15584709299",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028974483","15584709299",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029573621","15584709299",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029496997","15584709299",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("100002829177","15584709299",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105357","15584709299",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105352","15584709299",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028950139","15584709299",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028699843","15584709299",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105032","15584709299",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105024","15584709299",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021416651","15584709299",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105034","15584709299",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028037662","15584709299",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000017646641","93741502099",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018349957","93741502099",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028309028","93741502099",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028160226","93741502099",0);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027953165","93741502099",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028764714","93741502099",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028266381","93741502099",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000020939463","93741502099",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029724878","93741502099",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029714198","93741502099",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018568863","93741502099",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021060172","93741502099",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000005553945","93741502099",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029471555","93741502099",1);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029266828","93741502099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000005410098","93741502099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000023093627","93741502099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028935441","93741502099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027532832","93741502099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025032666","93741502099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029127113","93741502099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025881970","93741502099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029004078","93741502099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000007691302","93741502099",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028286599","93741502099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025197143","93741502099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025031926","93741502099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626950","93741502099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626624","93741502099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025450109","93741502099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000013038780","93741502099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025804909","93741502099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028974483","93741502099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029573621","93741502099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029496997","93741502099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("100002829177","93741502099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105357","93741502099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105352","93741502099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028950139","93741502099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028699843","93741502099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105032","93741502099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105024","93741502099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021416651","93741502099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105034","93741502099",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028037662","93741502099",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000017646641","86408459699",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018349957","86408459699",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028309028","86408459699",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028160226","86408459699",0);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027953165","86408459699",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028764714","86408459699",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028266381","86408459699",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000020939463","86408459699",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029724878","86408459699",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029714198","86408459699",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018568863","86408459699",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021060172","86408459699",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000005553945","86408459699",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029471555","86408459699",1);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029266828","86408459699",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000005410098","86408459699",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000023093627","86408459699",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028935441","86408459699",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027532832","86408459699",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025032666","86408459699",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029127113","86408459699",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025881970","86408459699",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029004078","86408459699",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000007691302","86408459699",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028286599","86408459699",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025197143","86408459699",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025031926","86408459699",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626950","86408459699",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626624","86408459699",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025450109","86408459699",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000013038780","86408459699",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025804909","86408459699",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028974483","86408459699",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029573621","86408459699",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029496997","86408459699",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("100002829177","86408459699",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105357","86408459699",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105352","86408459699",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028950139","86408459699",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028699843","86408459699",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105032","86408459699",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105024","86408459699",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021416651","86408459699",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105034","86408459699",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028037662","86408459699",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000017646641","61229223599",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018349957","61229223599",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028309028","61229223599",0);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028160226","61229223599",0);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027953165","61229223599",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028764714","61229223599",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028266381","61229223599",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000020939463","61229223599",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029724878","61229223599",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029714198","61229223599",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000018568863","61229223599",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021060172","61229223599",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000005553945","61229223599",1);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029471555","61229223599",1);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029266828","61229223599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000005410098","61229223599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000023093627","61229223599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028935441","61229223599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000027532832","61229223599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025032666","61229223599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029127113","61229223599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025881970","61229223599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029004078","61229223599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000007691302","61229223599",100);

INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028286599","61229223599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025197143","61229223599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025031926","61229223599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626950","61229223599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("0000010626624","61229223599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025450109","61229223599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000013038780","61229223599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000025804909","61229223599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028974483","61229223599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029573621","61229223599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029496997","61229223599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("100002829177","61229223599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105357","61229223599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105352","61229223599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028950139","61229223599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028699843","61229223599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105032","61229223599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105024","61229223599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000021416651","61229223599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000029105034","61229223599",100);
INSERT INTO `EXISTS_IN` (`I_ssn`,`R_ssn`,`Amount`) VALUES ("1000028037662","61229223599",100);


INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("dictum.cursus@sitametmassa.co.uk","1000029105034",1,"2016-10-23 17:31:07");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("dictum.cursus@sitametmassa.co.uk","1000028764714",1,"2018-04-30 22:35:26");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("dictum.cursus@sitametmassa.co.uk","1000028266381",10,"2017-07-09 08:58:17");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("dictum.cursus@sitametmassa.co.uk","1000020939463",8,"2016-12-04 15:32:16");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("dictum.cursus@sitametmassa.co.uk","1000029724878",7,"2016-04-29 23:04:26");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("dictum.cursus@sitametmassa.co.uk","1000018568863",2,"2017-04-12 00:54:48");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("dictum.cursus@sitametmassa.co.uk","1000021060172",1,"2016-10-20 22:59:07");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("sem@CraspellentesqueSed.co.uk","1000028037662",5,"2017-03-06 17:59:46");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("sem@CraspellentesqueSed.co.uk","1000028764714",7,"2016-02-07 15:04:41");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("sem@CraspellentesqueSed.co.uk","1000028266381",1,"2016-12-08 16:11:54");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("sem@CraspellentesqueSed.co.uk","1000020939463",8,"2018-03-24 22:57:16");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("sem@CraspellentesqueSed.co.uk","1000029724878",1,"2017-09-07 00:56:35");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("sem@CraspellentesqueSed.co.uk","1000018568863",3,"2016-06-03 20:55:53");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("sem@CraspellentesqueSed.co.uk","1000021060172",6,"2016-05-21 02:35:01");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("sem@CraspellentesqueSed.co.uk","1000005553945",3,"2017-10-10 22:36:16");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("id.ante.Nunc@arcu.org","1000028037662",9,"2017-10-25 23:00:18");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("id.ante.Nunc@arcu.org","1000028764714",5,"2016-09-29 04:37:18");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("id.ante.Nunc@arcu.org","1000028266381",4,"2016-05-08 17:59:14");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("id.ante.Nunc@arcu.org","1000020939463",10,"2016-01-14 23:29:52");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("id.ante.Nunc@arcu.org","1000029724878",3,"2017-03-12 20:24:05");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("id.ante.Nunc@arcu.org","1000018568863",2,"2016-06-10 21:20:57");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("id.ante.Nunc@arcu.org","1000021060172",5,"2016-10-07 23:41:01");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("dignissim.lacus.Aliquam@a.edu","1000028037662",8,"2018-09-26 05:47:14");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("dignissim.lacus.Aliquam@a.edu","1000028266381",9,"2016-06-02 21:35:33");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("dignissim.lacus.Aliquam@a.edu","1000020939463",3,"2017-11-29 11:55:26");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("dignissim.lacus.Aliquam@a.edu","1000028764714",3,"2018-06-10 16:32:00");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("dignissim.lacus.Aliquam@a.edu","1000018568863",5,"2016-03-18 20:07:59");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("dignissim.lacus.Aliquam@a.edu","1000025031926",8,"2017-03-25 02:51:44");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("dignissim.lacus.Aliquam@a.edu","1000005553945",8,"2017-07-26 12:09:39");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("dignissim.lacus.Aliquam@a.edu","0000010626950",2,"2017-09-25 20:02:22");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("dignissim.lacus.Aliquam@a.edu","1000021060172",3,"2016-09-24 09:17:33");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("eu.arcu.Morbi@sem.org","1000027953165",9,"2016-05-07 01:27:31");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("eu.arcu.Morbi@sem.org","1000028764714",10,"2017-01-01 03:26:54");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("eu.arcu.Morbi@sem.org","1000028266381",10,"2018-02-06 19:01:06");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("eu.arcu.Morbi@sem.org","1000029724878",4,"2018-02-01 22:09:06");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("eu.arcu.Morbi@sem.org","1000018568863",2,"2017-05-15 05:18:46");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("eu.arcu.Morbi@sem.org","1000021060172",9,"2016-01-12 11:46:43");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("eu.arcu.Morbi@sem.org","1000005553945",2,"2017-01-10 08:01:18");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("eu.arcu.Morbi@sem.org","1000025031926",9,"2018-09-20 15:05:55");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("eu.arcu.Morbi@sem.org","0000010626950",10,"2016-12-05 13:44:20");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("eu.arcu.Morbi@sem.org","0000010626624",2,"2018-04-17 09:05:48");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("enim.mi@sagittisDuisgravida.edu","1000027953165",8,"2017-12-10 18:30:38");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("enim.mi@sagittisDuisgravida.edu","1000028764714",6,"2016-04-22 20:08:21");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("enim.mi@sagittisDuisgravida.edu","1000028266381",6,"2018-07-08 04:07:14");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("enim.mi@sagittisDuisgravida.edu","1000029724878",2,"2018-04-14 03:51:38");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("enim.mi@sagittisDuisgravida.edu","1000005553945",9,"2018-08-14 09:09:18");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("enim.mi@sagittisDuisgravida.edu","1000021060172",2,"2016-04-08 01:06:18");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("enim.mi@sagittisDuisgravida.edu","0000010626950",2,"2016-10-14 16:07:04");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("enim.mi@sagittisDuisgravida.edu","0000010626624",1,"2016-06-17 08:13:21");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("enim.mi@sagittisDuisgravida.edu","1000025450109",4,"2017-01-05 17:30:17");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("enim.mi@sagittisDuisgravida.edu","1000025804909",1,"2018-05-10 22:22:34");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("enim.mi@sagittisDuisgravida.edu","1000028974483",7,"2016-05-11 21:40:30");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("justo@Ut.org","1000027953165",5,"2017-05-10 01:25:57");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("justo@Ut.org","1000028764714",8,"2017-04-01 14:40:44");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("justo@Ut.org","1000028266381",8,"2017-08-07 17:15:58");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("justo@Ut.org","1000021060172",2,"2016-08-17 09:19:28");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("justo@Ut.org","1000005553945",5,"2016-01-15 15:16:31");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("justo@Ut.org","1000025450109",1,"2018-06-15 19:52:23");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("justo@Ut.org","1000013038780",1,"2018-08-03 16:52:52");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("Fusce.dolor@sitametmassa.co.uk","1000027953165",7,"2016-05-20 10:38:03");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("Fusce.dolor@sitametmassa.co.uk","1000028764714",4,"2016-08-23 06:05:02");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("Fusce.dolor@sitametmassa.co.uk","1000028266381",7,"2016-01-15 20:43:52");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("Fusce.dolor@sitametmassa.co.uk","1000021060172",7,"2018-01-26 04:50:38");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("Fusce.dolor@sitametmassa.co.uk","1000005553945",4,"2016-08-29 14:07:48");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("Fusce.dolor@sitametmassa.co.uk","1000025450109",7,"2016-10-20 03:56:32");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("Fusce.dolor@sitametmassa.co.uk","1000029573621",10,"2017-11-19 11:38:52");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("Fusce.dolor@sitametmassa.co.uk","1000028974483",2,"2018-04-19 06:33:41");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("natoque.penatibus.et@Nullamsuscipit.edu","1000027953165",3,"2017-07-07 01:33:11");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("natoque.penatibus.et@Nullamsuscipit.edu","1000028764714",8,"2016-11-06 19:47:48");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("natoque.penatibus.et@Nullamsuscipit.edu","1000028266381",8,"2017-02-20 23:51:05");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("natoque.penatibus.et@Nullamsuscipit.edu","1000021060172",9,"2016-03-27 18:59:41");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("natoque.penatibus.et@Nullamsuscipit.edu","1000005553945",7,"2018-01-25 07:21:19");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("natoque.penatibus.et@Nullamsuscipit.edu","100002829177",4,"2017-09-28 22:03:19");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("natoque.penatibus.et@Nullamsuscipit.edu","1000029496997",3,"2017-10-20 23:48:46");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("natoque.penatibus.et@Nullamsuscipit.edu","1000029105357",3,"2017-07-04 07:38:10");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("natoque.penatibus.et@Nullamsuscipit.edu","1000029105352",6,"2018-02-15 03:20:46");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("orci.Donec@nibhAliquam.org","1000027953165",6,"2016-01-11 02:58:57");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("orci.Donec@nibhAliquam.org","1000028764714",1,"2016-09-21 00:08:46");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("orci.Donec@nibhAliquam.org","1000028266381",8,"2016-08-09 08:37:46");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("orci.Donec@nibhAliquam.org","1000021060172",4,"2018-01-13 12:32:01");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("orci.Donec@nibhAliquam.org","1000005553945",2,"2017-07-10 07:03:00");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("orci.Donec@nibhAliquam.org","1000028286599",4,"2017-08-28 00:28:08");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("orci.Donec@nibhAliquam.org","0000007691302",5,"2016-12-01 02:15:05");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("a.sollicitudin.orci@placeratCrasdictum.ca","1000028764714",10,"2016-11-08 02:47:22");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("a.sollicitudin.orci@placeratCrasdictum.ca","1000028266381",6,"2017-05-10 02:08:00");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("a.sollicitudin.orci@placeratCrasdictum.ca","1000027953165",2,"2016-04-11 18:45:37");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("a.sollicitudin.orci@placeratCrasdictum.ca","1000020939463",10,"2018-03-28 22:32:18");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("a.sollicitudin.orci@placeratCrasdictum.ca","1000021060172",4,"2016-02-06 08:43:49");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("a.sollicitudin.orci@placeratCrasdictum.ca","1000005553945",4,"2018-08-23 19:07:28");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("a.sollicitudin.orci@placeratCrasdictum.ca","0000007691302",3,"2017-04-03 06:24:09");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("Praesent.luctus.Curabitur@milacinia.org","1000029004078",1,"2016-02-14 02:42:08");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("Praesent.luctus.Curabitur@milacinia.org","1000027953165",6,"2017-10-17 00:38:05");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("Praesent.luctus.Curabitur@milacinia.org","1000028266381",9,"2017-12-09 11:09:11");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("Praesent.luctus.Curabitur@milacinia.org","1000020939463",7,"2018-02-11 06:46:43");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("Praesent.luctus.Curabitur@milacinia.org","1000005553945",9,"2018-03-29 12:46:20");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("Praesent.luctus.Curabitur@milacinia.org","1000025197143",7,"2017-08-13 06:32:56");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("Praesent.luctus.Curabitur@milacinia.org","1000029496997",5,"2017-11-03 20:54:16");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("Praesent.luctus.Curabitur@milacinia.org","1000028699843",7,"2017-09-13 17:35:49");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("Praesent.luctus.Curabitur@milacinia.org","1000028950139",7,"2017-03-08 16:07:13");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("luctus.et@ut.ca","1000005553945",4,"2017-09-12 23:02:22");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("luctus.et@ut.ca","1000028266381",1,"2017-04-01 05:31:53");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("luctus.et@ut.ca","1000028764714",5,"2018-01-07 20:47:45");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("luctus.et@ut.ca","1000027953165",9,"2018-01-15 22:01:53");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("luctus.et@ut.ca","1000025881970",4,"2017-07-01 17:14:10");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("luctus.et@ut.ca","1000029004078",8,"2017-01-19 17:14:45");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("luctus.et@ut.ca","1000025197143",2,"2016-07-09 11:25:47");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("luctus.et@ut.ca","1000029496997",7,"2018-01-29 16:20:34");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("luctus.et@ut.ca","1000029105032",4,"2016-05-13 19:25:30");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("luctus.et@ut.ca","1000029105024",6,"2018-01-02 21:17:03");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("luctus.et@ut.ca","1000021416651",8,"2016-02-29 15:15:37");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("imperdiet@elit.org","1000028764714",6,"2016-05-02 13:15:30");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("imperdiet@elit.org","1000028266381",5,"2016-08-25 14:44:29");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("imperdiet@elit.org","1000005553945",1,"2016-04-30 15:39:34");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("imperdiet@elit.org","1000025032666",2,"2017-09-28 12:15:03");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("imperdiet@elit.org","1000027953165",3,"2016-01-09 18:03:10");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("imperdiet@elit.org","1000029127113",7,"2017-06-11 12:50:24");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("imperdiet@elit.org","1000025881970",1,"2018-04-25 20:28:31");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("imperdiet@elit.org","1000029004078",4,"2016-08-17 12:47:26");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("ullamcorper@metusIn.co.uk","1000028764714",4,"2016-05-08 11:55:41");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("ullamcorper@metusIn.co.uk","1000027953165",5,"2017-03-16 19:05:51");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("ullamcorper@metusIn.co.uk","1000028266381",1,"2017-12-11 17:21:39");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("ullamcorper@metusIn.co.uk","1000005553945",7,"2018-03-23 00:48:04");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("ullamcorper@metusIn.co.uk","1000028935441",2,"2016-05-10 18:15:27");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("ullamcorper@metusIn.co.uk","1000027532832",1,"2018-08-04 04:24:10");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("ullamcorper@metusIn.co.uk","1000025032666",7,"2017-01-16 06:15:07");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("ullamcorper@metusIn.co.uk","1000029127113",2,"2018-08-11 03:03:53");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("nulla.ante@Vivamusnonlorem.ca","1000027953165",4,"2016-09-10 00:49:10");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("imperdiet.nec.leo@Ut.co.uk","1000027953165",2,"2017-10-17 20:41:17");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("imperdiet.nec.leo@Ut.co.uk","1000028764714",8,"2018-08-08 10:21:36");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("interdum.feugiat@nisisem.com","1000027953165",5,"2017-06-28 17:55:17");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("interdum.feugiat@nisisem.com","1000028266381",6,"2018-04-06 14:24:03");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("interdum.feugiat@nisisem.com","1000028764714",5,"2018-07-24 02:40:42");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("gravida@liberoDonecconsectetuer.co.uk","1000028266381",8,"2016-04-21 22:42:08");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("gravida@liberoDonecconsectetuer.co.uk","1000020939463",4,"2016-02-05 15:44:06");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("gravida@liberoDonecconsectetuer.co.uk","1000027953165",4,"2016-05-30 18:30:47");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("velit.Aliquam@mieleifendegestas.com","1000028266381",10,"2017-05-17 14:52:23");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("velit.Aliquam@mieleifendegestas.com","1000020939463",10,"2017-10-28 10:12:43");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("velit.Aliquam@mieleifendegestas.com","1000005553945",1,"2017-09-03 20:30:04");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("vel.turpis@ipsumSuspendissenon.com","1000028266381",4,"2017-07-04 05:03:08");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("vel.turpis@ipsumSuspendissenon.com","1000020939463",6,"2017-09-27 11:58:31");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("quam.Curabitur.vel@at.net","1000028764714",10,"2016-07-17 03:06:26");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("risus.Nunc@scelerisque.com","1000005553945",2,"2018-06-04 02:28:58");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("risus.Nunc@scelerisque.com","1000028764714",3,"2018-02-03 18:27:06");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("leo.elementum.sem@parturientmontes.co.uk","1000027953165",6,"2016-12-08 10:33:16");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("leo.elementum.sem@parturientmontes.co.uk","1000005553945",2,"2016-06-17 10:18:55");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("leo.elementum.sem@parturientmontes.co.uk","1000023093627",1,"2017-04-18 13:15:09");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("leo.elementum.sem@parturientmontes.co.uk","1000028935441",3,"2017-06-16 21:29:47");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("molestie@Phasellusfermentumconvallis.net","1000020939463",4,"2017-07-23 01:21:19");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("molestie@Phasellusfermentumconvallis.net","1000027953165",8,"2018-04-23 13:30:33");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("Suspendisse.ac.metus@nondapibus.org","1000020939463",3,"2016-06-23 06:40:31");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("nascetur.ridiculus@utquamvel.net","1000020939463",8,"2018-05-03 15:25:28");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("nascetur.ridiculus@utquamvel.net","1000028266381",4,"2018-06-11 11:03:27");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("nascetur.ridiculus@utquamvel.net","1000027953165",3,"2018-03-19 21:18:42");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("libero.Integer.in@id.org","1000020939463",7,"2017-02-13 21:57:02");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("libero.Integer.in@id.org","1000005553945",6,"2017-06-25 16:42:11");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("libero.Integer.in@id.org","1000023093627",4,"2018-09-06 11:35:17");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("libero.Integer.in@id.org","1000028935441",6,"2017-06-09 11:35:42");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("libero.Integer.in@id.org","1000029127113",2,"2018-05-02 03:43:24");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("ac.tellus@lobortis.net","1000020939463",9,"2017-10-30 12:40:41");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("ac.tellus@lobortis.net","1000023093627",5,"2016-06-13 19:19:38");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("ac.tellus@lobortis.net","1000028935441",8,"2016-05-01 21:13:56");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("at.pretium@adipiscingelitAliquam.ca","1000020939463",7,"2016-01-16 13:15:32");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("feugiat@euturpis.net","1000020939463",4,"2017-06-09 04:04:04");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("feugiat@euturpis.net","1000005553945",3,"2018-06-14 02:48:25");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("feugiat@euturpis.net","1000027953165",10,"2018-06-20 18:37:32");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("feugiat@euturpis.net","1000023093627",7,"2016-04-01 21:41:14");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("sit.amet@Quisque.org","1000027953165",9,"2016-07-04 05:17:58");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("sit.amet@Quisque.org","0000005410098",2,"2016-02-19 01:38:16");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("ante.dictum.mi@hymenaeos.co.uk","1000027953165",3,"2016-02-03 06:47:17");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("ante.dictum.mi@hymenaeos.co.uk","1000005553945",5,"2017-08-03 15:08:27");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("ante.dictum.mi@hymenaeos.co.uk","0000005410098",7,"2016-01-23 21:36:20");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("fringilla.ornare@diamdictum.co.uk","1000005553945",9,"2017-04-28 07:31:50");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("fringilla.ornare@diamdictum.co.uk","1000020939463",8,"2016-03-28 07:31:50");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("elementum.at@euturpis.org","1000005553945",7,"2018-06-28 06:20:01");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("elementum.at@euturpis.org","0000005410098",5,"2016-12-02 21:39:59");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("elementum.at@euturpis.org","1000023093627",6,"2018-03-22 14:05:31");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("sed.leo@mifringillami.com","1000005553945",5,"2017-05-27 00:47:58");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("sed.leo@mifringillami.com","0000005410098",10,"2016-12-16 05:51:44");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("sed.leo@mifringillami.com","1000023093627",5,"2016-08-16 22:55:43");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("nunc@mi.com","1000005553945",4,"2016-11-23 03:57:03");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("nunc@mi.com","1000029471555",6,"2017-06-30 20:55:22");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("nunc@mi.com","0000005410098",10,"2017-08-25 01:56:28");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("nunc@mi.com","1000023093627",8,"2017-11-25 13:45:42");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("eu.tellus.Phasellus@semvitae.org","1000005553945",10,"2016-05-18 12:19:06");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("eu.tellus.Phasellus@semvitae.org","1000027953165",9,"2018-01-06 01:59:35");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("eu.tellus.Phasellus@semvitae.org","1000029471555",6,"2016-05-15 08:36:08");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("eu.tellus.Phasellus@semvitae.org","0000005410098",7,"2016-01-27 06:57:39");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("ante@nonummyacfeugiat.edu","1000005553945",2,"2016-11-30 12:24:18");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("ante@nonummyacfeugiat.edu","0000005410098",7,"2017-01-06 14:00:09");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("rhoncus@elit.org","1000005553945",6,"2017-06-17 19:31:16");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("rhoncus@elit.org","1000027953165",8,"2018-09-18 17:14:38");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("rhoncus@elit.org","1000029471555",5,"2018-06-01 12:51:54");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("rhoncus@elit.org","0000005410098",10,"2016-06-16 12:22:31");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("rhoncus@elit.org","1000023093627",9,"2016-02-05 14:40:15");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("pellentesque@velitdui.com","1000020939463",1,"2016-05-31 07:35:37");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("pellentesque@velitdui.com","1000005553945",10,"2016-06-21 00:45:56");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("pellentesque@velitdui.com","1000029471555",2,"2017-08-14 04:24:33");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("pellentesque@velitdui.com","0000005410098",3,"2016-03-30 10:37:28");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("pellentesque@velitdui.com","1000023093627",5,"2017-08-15 23:10:06");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("risus.a.ultricies@Proinvel.edu","1000020939463",2,"2017-08-18 15:20:13");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("risus.a.ultricies@Proinvel.edu","1000029471555",6,"2017-10-24 14:19:45");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("neque.pellentesque.massa@tristiquealiquet.org","1000029714198",4,"2016-07-08 09:25:07");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("neque.pellentesque.massa@tristiquealiquet.org","1000029471555",7,"2016-04-01 02:03:21");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("eu@nisidictum.edu","1000027953165",3,"2018-09-23 07:46:47");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("eu@nisidictum.edu","1000029714198",9,"2016-04-08 17:33:23");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("nisl.Quisque@Nullam.org","1000027953165",5,"2017-09-08 16:52:11");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("metus.In@Sedauctor.org","1000020939463",8,"2018-03-28 07:31:50");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("vulputate@egetmagna.org","1000020939463",8,"2017-11-24 17:42:55");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("vulputate@egetmagna.org","1000027953165",2,"2018-07-10 04:34:37");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("arcu@sempererat.edu","1000029471555",8,"2016-08-01 05:59:06");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("arcu@sempererat.edu","1000027953165",3,"2017-02-13 21:50:55");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("arcu@sempererat.edu","1000020939463",2,"2017-03-15 22:52:58");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("arcu@sempererat.edu","1000029724878",4,"2017-12-23 02:01:36");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("arcu@sempererat.edu","1000029714198",6,"2016-03-17 22:40:50");

INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("fermentum.risus@liberoatauctor.com","1000027953165",7,"2016-06-04 08:24:14");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("fermentum.risus@liberoatauctor.com","1000020939463",1,"2018-03-25 09:03:41");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("dui.in.sodales@ac.com","1000029724878",9,"2016-06-23 14:30:36");
INSERT INTO `ORDERS` (`C_id`,`I_ssn`,`OrderAmount`,`BuyTime`) VALUES ("dui.in.sodales@ac.com","1000029714198",9,"2017-07-19 23:03:12");


/*1번*/
SELECT COUNT(*)
FROM ITEM
WHERE Amount  <= 20 ;

/*2번(현재 가입한 고객의 수는 몇 명인가?)*/
SELECT COUNT(*)
FROM CUSTOMER;

/*3번(주문을 7번 이상 진행한 고객은 누구인가?)*/
SELECT id as Customer_id
FROM CUSTOMER
WHERE Ordertimes>=7;

/*4번(지난 6 개월 동안 가장 많은 주문 횟수를 기록한 Top 3 매장은 어디인가?)*/
select distinct R.location, R.ssn as Retailer_ssn , R.orderedtimes
from retailer R, exists_in E ,orders O , item I
where E.I_ssn = O.I_ssn
and e.i_ssn = i.ssn
and E.R_ssn = R.ssn
and O.BuyTime <= '2018-10-01' and O.BuyTime >= '2018-10-01' - interval 6 month
order by R.orderedtimes desc;

select R.ssn , count(*) as numRetail
from retailer R , exists_in E , orders O
where E.I_ssn = O.I_ssn
and E.R_ssn = R.ssn
and O.BuyTime <= '2018-10-01' and O.BuyTime >= '2018-10-01' - interval 6 month
group by R.ssn 
order by numRetail desc;


/*5번(주문 횟수가 7번 이상인 고객들이 가장 자주 주문한 제품은 무엇인가?)*/
select M.name , M.nItems
from (select I.name , count(*) as nItems
      from customer C , orders O , item I
      where C.Ordertimes >= 7 
      and C.id = O.C_id and O.I_ssn = I.ssn
      group by I.name) M
order by m.nItems desc limit 1;

/*6번(장바구니에 상품이 하나도 없는 고객들을 대상으로 과거 매출 Top 5 는 무엇인가?)*/
select distinct I.name , I.price * O.orderAmount as sales
from (select distinct I.name
      from Item I , Customer C , Shoppingbag S , Orders O
      where S.amount = 0
      and s.c_id = C.id
      and O.C_id = C.id
      and O.I_ssn = I.ssn) T,item I,orders O
where T.name = I.name and O.i_ssn=I.ssn
order by sales desc;

select distinct I.name
      from Item I , Customer C , Shoppingbag S , Orders O
      where S.amount = 0
      and s.c_id = C.id
      and O.C_id = C.id
      and O.I_ssn = I.ssn;
/*7번(지난 1 년간, 남성 고객들이 가장 자주 구매한 제품의 카테고리는 무엇인가?)*/
select M.class , M.subClass
from (select Ca.class , Ca.subclass , count(*) as nItems
      from Item i , customer C , Orders O, Category Ca
      where C.sex='F'
      and O.C_id = C.id and O.I_ssn = I.ssn
      and O.BuyTime <='2018-10-01' and o.buytime >='2017-10-01'
      and I.cat_sub = Ca.subClass
      group by Ca.class , Ca.subclass) M
order by M.nItems desc limit 1;

/*9번(현재 장바구니에 담긴 모든 물품이 주문된다고 하였을 때, 전체 재고가 모자란 제품은 무엇인가?)*/
select T.name
from (select i.name , count(*) as nItems
	  from shoppingbag s, item i, is_in , customer c
      where is_in.I_ssn = i.ssn and is_in.s_c_id = s.c_id
      and s.c_id = c.id
      group by i.name) T , item I
where I.amount < T.nItems
and T.name = i.name;

