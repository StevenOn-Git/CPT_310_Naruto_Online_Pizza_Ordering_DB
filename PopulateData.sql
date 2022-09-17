use ninjapizzadb;

INSERT INTO tblaccess (access_name) VALUES
('Genin'),('Jounin'),('Hokage'),('Okyakusama'),('Shonin');

INSERT INTO tblperson(per_usr, per_pwd, per_fname, per_lname, per_email, per_phonenum, access_id) VALUES 
("nuzumaki", md5('PizzaTime!'), "Naruto", "Uzumaki", "hokagesomeday@hiddenleaf.org", 1111111111, 1), 
("suchiha", md5('PizzaTime!'), "Sasuke", "Uchiha", "revengesomeday@hiddenleaf.org", 1211111111, 1), 
("sharuno", md5('PizzaTime!'), "Sakura", "Haruno", "sasukesomeday@hiddenleaf.org", 1131111111, 1), 
("khatake", md5('PizzaTime!'), "Kakashi", "Hatake", "lovesomeday@hiddenleaf.org", 1111411111, 2), 
("tsenju", md5('PizzaTime!'), "Tsunade", "Senju", "adrinksomeday@hiddenleaf.org", 1111115111, 3), 
("rlee", md5('PizzaTime!'), "Rock", "Lee", "betterthanyesterday@hiddenleaf.org", 1112115111, 4), 
("snara", md5('PizzaTime!'), "Shikamaru", "Nara", "whatadrag@hiddenleaf.org", 1112135111, 4), 
("hhyuga", md5('PizzaTime!'), "Hinata", "Hyuga", "narutosomeday@hiddenleaf.org", 1312435111, 4), 
(null, null, "guest", "guest", "tailedbeasts@hiddenleaf.org", 1112135511, 4), 
("cakimichi", md5('PizzaTime!'), "Choji", "Akimichi", "dontcallmewhat@hiddenleaf.org", 1312435511, 5), 
("jiraiya", md5('PizzaTime!'), "Jiraiya", "", "toad@hiddenleaf.org", 1312332211, 5);

INSERT INTO tblemployees(emp_availability, emp_merit, emp_pay, per_id)
VALUES
("Full Time",0.05,20.00,1),
("Part Time",0.05,20.00,2),
("Full Time",0.05,20.00,3),
("Full Time",0.05,25.00,4),
("Full Time",0.05,30.00,5);

INSERT INTO tblschedule(mgr_emp_id,emp_id,schd_task,schd_month,schd_day,schd_year) VALUE
(4,4,"Supervise",3,1,2021),
(4,1,"Make Line",3,1,2021),
(4,2,"Ovens",3,1,2021),
(4,3,"Front",3,1,2021),
(4,4,"Supervise",3,2,2021),
(4,1,"Make Line",3,2,2021),
(4,2,"Ovens",3,2,2021),
(4,3,"Front",3,2,2021),
(4,4,"Supervise",3,3,2021),
(4,1,"Make Line",3,3,2021),
(4,2,"Ovens",3,3,2021),
(4,3,"Front",3,3,2021),
(5,5,"Manage",3,3,2021),
(4,4,"Supervise",3,4,2021),
(4,1,"Make Line",3,4,2021),
(4,2,"Ovens",3,4,2021),
(4,3,"Front",3,4,2021),
(4,4,"Supervise",3,5,2021),
(4,1,"Make Line",3,5,2021),
(4,2,"Ovens",3,5,2021),
(4,3,"Front",3,5,2021),
(5,5,"Manage",3,5,2021);

INSERT INTO tbl_uomconversion (uom_before,uom_after,uom_value) VALUES
("pin","oz",0.010),
("pin","lbs",0.00079),
("g","oz",0.035274),
("g","lbs",0.00220462),
("oz","lbs",0.0625),
("tsp","tbsp",0.333333),
("tsp","oz",0.166667),
("tsp","cup",0.16667),
("tsp","pt",0.0104167),
("tsp","qt",0.00520833),
("tsp","gal",0.00130208),
("tsp", "lbs", 0.010866412),
("tbsp","oz",0.5),
("tbsp","cup",0.0616115),
("tbsp","pt",0.03125),
("tbsp","qt",0.015625),
("tbsp","gal",0.00390625),
("oz","cup",0.123223),
("oz","pt",0.0625),
("oz","qt",0.03125),
("oz","gal",0.0078125),
("cup","pt",0.50721),
("cup","qt",0.253605),
("cup","gal",0.0634013),
("oz","oz",1),
("gal","gal",1),
("pt","pt",1),
("qt","qt",1),
("lbs","lbs",1);

INSERT INTO tblinventory (inv_name, inv_qty, inv_uom) VALUES
("00 flour",0.00,"lbs"), 
("all-purpose flour",0.00,"lbs"), 
("sea salt",0.00,"lbs"), 
("active dry yeast",0.00,"lbs"), 
("extra-virgin olive oil",0.00,"gal"), 
("tomato paste",0.00,"oz"), 
("tomato sauce",0.00,"oz"), 
("oregano",0.00,"oz"), 
("italian seasoning",0.00,"lbs"), 
("garlic powder",0.00,"lbs"), 
("onion powder",0.00,"oz"), 
("garlic salt",0.00,"oz"), 
("ground black pepper",0.00,"gal"), 
("sugar",0.00,"gal"), 
("four cheese blend", 0.00, "lbs"), 
("pepperoni", 0.00, "oz");

INSERT INTO tblingredients(inv_id, ing_qty, ing_UOM, ing_price, menu_id) VALUES 
(1,77,"g",1.50,1),
(2,77,"g",1.50,1),
(3,4,"g",0.20,1),
(4,1,"g",0.20,1),
(5,0.5,"tsp",0.20,1),
(6,0.5,"tbsp",0.20,1),
(7,1.25,"tbsp",0.20,1),
(8,0.13,"tsp",0.20,1),
(9,0.25,"tsp",0.20,1),
(10,0.21,"tsp",0.19,1),
(11,0.21,"tsp",0.10,1),
(12,0.21,"tbsp",0.10,1),
(13,0.11,"tsp",0.10,1),
(14,0.13,"tsp",0.10,1),
(15,5,"oz",3.00,1),
(1,77,"g",1.50,2),
(2,77,"g",1.50,2),
(3,4,"g",0.20,2),
(4,1,"g",0.20,2),
(5,0.5,"tsp",0.20,2),
(6,0.5,"tbsp",0.20,2),
(7,1.25,"tbsp",0.20,2),
(8,0.13,"tsp",0.20,2),
(9,0.25,"tsp",0.20,2),
(10,0.21,"tsp",0.19,2),
(11,0.21,"tsp",0.10,2),
(12,0.21,"tbsp",0.10,2),
(13,0.11,"tsp",0.10,2),
(14,0.13,"tsp",0.10,2),
(15,5,"oz",3.00,2),
(16,1.25,"oz",1.00,2);

INSERT INTO tblmenu(menu_name, point_reward) VALUES 
("MEDIUM Cheese Pizza",5),
("MEDIUM Pepperoni Pizza",5);

INSERT INTO tblpoints (point_name,point_cost) VALUES
("FREE SODA",15),
("FREE SALAD",20),
("FREE BREADSTICKS",25),
("FREE 6 PIECE WINGS",30),
("FREE SMALL 1 TOPPING PIZZA",35),
("FREE SMALL SPECIALTY PIZZA",40),
("FREE 12 PIECE WINGS",45),
("FREE MEDIUM 1 TOPPING PIZZA",50),
("FREE MEDIUM SPECIALTY PIZZA",55),
("FREE LARGE 1 TOPPING PIZZA",60),
("FREE LARGE SPECIALTY PIZZA",65),
("FREE LARGE SPECIALTY PIZZA",70),
("FREE SHINOBI FAMILY PACK",75);

INSERT INTO tblsupplier(inv_id,per_id, sup_qty, sup_price) VALUES
(1,10,55,35.00),
(2,10,50,21.00),
(3,10,25,19.00),
(4,10,4,16.00),
(5,10,2,16.00),
(6,10,75,20.00),
(7,10,50,15.00),
(8,10,20,18.00),
(9,10,2,27.00),
(10,10,5.25,29.00),
(11,10,18,11.00),
(12,10,41.25,10.25),
(13,10,18,15.00),
(14,10,25,38.00),
(15,10,51,25.99),
(16,10,10,86.00);

INSERT INTO tblcustomer(per_id) VALUES
(6),(7),(8),(9);

INSERT INTO tblcard(cus_id, card_fname, card_lname, card_number, card_expmonth, card_expyear, card_cvv) VALUES
(1,"Rock","Lee","1111222233334444",01,24,111),
(2,"Shikamaru","Nara","1111222993334444",07,21,145),
(3,"Hinata","Hyuga","1144222233334444",05,22,178),
(4,"Naruto","Uzumaki","9999999999999999",09,29,999);

INSERT INTO tblorders(emp_id,cus_id) VALUES
(3, 1),
(3, 2),
(3, 3),
(1, 4);

INSERT INTO tblintake(ord_id, menu_id, menu_qty) VALUES
(1,1,1),(1,2,3),(2,2,1),(3,1,1),(4,1,2),(4,2,2);

SET SQL_SAFE_UPDATES=0;

UPDATE tblorders SET 
	ord_price = (
		SELECT 
			ord_price
		FROM(
			SELECT 
				intake.ord_id,
				SUM(A.menu_price * intake.menu_qty) as ord_price,
				SUM((A.menu_price * intake.menu_qty) * 0.0725) as ord_tax
			FROM tblintake intake,(
				SELECT 
					menu_id,
					SUM(ing_price) as menu_price
				FROM tblingredients 
				GROUP BY menu_id
			) AS A
			WHERE A.menu_id=intake.menu_id
			GROUP BY intake.ord_id
		) AS B
		WHERE B.ord_id=tblorders.ord_id
	),
	ord_tax = (
		SELECT 
			truncate(ord_tax,2) as ord_tax
		FROM(
			SELECT 
				intake.ord_id,
				SUM(A.menu_price * intake.menu_qty) as ord_price,
				SUM((A.menu_price * intake.menu_qty) * 0.0725) as ord_tax
			FROM tblintake intake,(
				SELECT 
					menu_id,
					SUM(ing_price) as menu_price
				FROM tblingredients 
				GROUP BY menu_id
			) AS A
			WHERE A.menu_id=intake.menu_id
			GROUP BY intake.ord_id
		) as B
		WHERE B.ord_id=tblorders.ord_id
	),
	ord_total = (
		SELECT 
			truncate((ord_price + ord_tax),2) as ord_total
		FROM(
			SELECT 
				intake.ord_id,
				SUM(A.menu_price * intake.menu_qty) as ord_price,
				SUM((A.menu_price * intake.menu_qty) * 0.0725) as ord_tax
			FROM tblintake intake,(
				SELECT 
					menu_id,
					SUM(ing_price) as menu_price
				FROM tblingredients 
				GROUP BY menu_id
			) AS A
			WHERE A.menu_id=intake.menu_id
			GROUP BY intake.ord_id
		) AS B
		WHERE B.ord_id=tblorders.ord_id
	); 

UPDATE tblinventory SET
	inv_qty = (
		SELECT inv_qty
		FROM
			(
			SELECT 
				truncate((inv.inv_qty-(c.ing_qty * uom_value)),3) as inv_qty,
				inv.inv_id
			FROM
				(
				SELECT inv_id, ing_uom, sum((menu_qty * ing_qty)) as ing_qty 
				FROM 
					(
						SELECT 	intake.menu_id, intake.menu_qty, ing.inv_id, ing.ing_uom,ing.ing_qty
						FROM (
							SELECT 
								menu_id, menu_qty 
							FROM tblintake intake 
								inner join tblorders ord on ord.ord_id=intake.ord_id 
							WHERE ord.ord_timestamp > CURRENT_DATE
						) AS intake inner join tblingredients ing
						WHERE ing.menu_id=intake.menu_id
					) as b
				GROUP BY inv_id, ing_uom
				) AS c 
				inner join tblinventory inv on inv.inv_id=c.inv_id
				inner join tbl_uomconversion on uom_before=ing_uom and uom_after=inv_uom
			) AS d
		WHERE inv_id=tblinventory.inv_id
	);
	
SET SQL_SAFE_UPDATES=1;