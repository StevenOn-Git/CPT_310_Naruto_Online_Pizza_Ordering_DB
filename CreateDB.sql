CREATE DATABASE ninjapizzadb;

use ninjapizzadb;

CREATE TABLE tblorders (
	ord_id int unsigned UNIQUE AUTO_INCREMENT,
    emp_id int unsigned not null,
    cus_id int unsigned not null,
    ord_timestamp timestamp DEFAULT CURRENT_TIMESTAMP,
	ord_price double,
	ord_tax double,
	ord_total double,
    PRIMARY KEY (ord_id)
);

CREATE TABLE tblaccess(
	access_id int unsigned UNIQUE AUTO_INCREMENT,
    access_name varchar(40) not null,
    PRIMARY KEY(access_id)
);


CREATE TABLE tblperson(
	per_id int unsigned UNIQUE AUTO_INCREMENT,
    per_usr varchar(20),
    per_pwd varchar(40),
    per_fname varchar(40),
    per_lname varchar(40),
    per_email varchar(40) not null,
    per_phonenum int unsigned not null,
    per_start timestamp DEFAULT CURRENT_TIMESTAMP,
    per_isactive boolean DEFAULT true,
    access_id int unsigned not null,
    PRIMARY KEY(per_id)
);

CREATE TABLE tblemployees (
    emp_id int unsigned unique AUTO_INCREMENT,
    emp_pay double,
    emp_merit double,
    emp_availability varchar(20),
    per_id int unsigned not null,
    PRIMARY KEY (emp_id),
    CONSTRAINT FK_PersonEmployee FOREIGN KEY (per_id)
    	REFERENCES tblperson(per_id) ON DELETE CASCADE
);

CREATE TABLE tblpaycheck(
	paychk_id int unsigned unique auto_increment,
	emp_id int not null,
	paychk_ts date,
	paychk_hours double not null,
	paychk_pay double not null,
	primary key(paychk_id)	
);

CREATE TABLE tbltimeclock (
    clock_id int unsigned unique AUTO_INCREMENT,
    clock_ts timestamp not null default CURRENT_TIMESTAMP,
    emp_id int unsigned not null,
    clock_in boolean not null default true,
    PRIMARY KEY (clock_id)
);

CREATE TABLE tblschedule(
	schd_id int unsigned AUTO_INCREMENT,
    schd_month int unsigned not null,
    schd_year int unsigned not null,
    schd_day int unsigned not null,
	schd_task varchar(40) not null,
    schd_timestamp timestamp not null DEFAULT CURRENT_TIMESTAMP,
    emp_id int unsigned not null,
    mgr_emp_id int unsigned not null,
    PRIMARY KEY(schd_id)
);

CREATE TABLE tblcustomer (
    cus_id int unsigned unique AUTO_INCREMENT,
    cus_points int unsigned DEFAULT 0,
	point_id int unsigned,
    per_id int unsigned not null,
    PRIMARY KEY(cus_id),
    CONSTRAINT FK_PersonCustomer FOREIGN KEY (per_id)
    	REFERENCES tblperson(per_id) ON DELETE CASCADE    
);

CREATE TABLE tblcard(
	card_id int unsigned auto_increment,
	card_number varchar(16) not null,
    card_expmonth int unsigned not null,
    card_expyear int unsigned not null,
	card_cvv int unsigned not null,
    card_fname varchar(40) not null,
    card_lname varchar(40),
    cus_id int unsigned not null,
    PRIMARY KEY(card_id)
);

CREATE TABLE tblsupplier(
	sup_id int unsigned AUTO_INCREMENT,
    sup_qty double not null,
    sup_ts timestamp not null DEFAULT CURRENT_TIMESTAMP,
    sup_price double,
	inv_id int unsigned not null,
    per_id int unsigned not null,
    PRIMARY KEY(sup_id),
    CONSTRAINT FK_PersonSupplier FOREIGN KEY (per_id)
    	REFERENCES tblperson(per_id) ON DELETE CASCADE    
);

CREATE TABLE tblinventory(
	inv_id int unsigned UNIQUE AUTO_INCREMENT,
	inv_name varchar(100) not null,	
    inv_qty double not null,
    inv_UOM varchar (10) not null,
    inv_active boolean not null default true,
    PRIMARY KEY (inv_id)
);

CREATE TABLE tblingredients(
	ing_id int unsigned UNIQUE AUTO_INCREMENT,
    ing_qty double not null,
    ing_UOM varchar (10) not null,
	ing_price double not null,
    inv_id int unsigned not null,
    menu_id int unsigned not null,
    PRIMARY KEY (ing_id)
);

CREATE TABLE tblmenu(
	menu_id int unsigned UNIQUE AUTO_INCREMENT,
    menu_name varchar(100) not null,
    menu_active boolean not null default true,
	point_reward int unsigned,
    PRIMARY KEY (menu_id)
);

CREATE TABLE tblpoints(
	point_id int unsigned unique auto_increment,
	point_name varchar(40) not null,
	point_cost int unsigned not null,
	primary key (point_id)
);

CREATE TABLE tblintake(
	in_id int unsigned UNIQUE AUTO_INCREMENT,
    ord_id int unsigned not null,
    menu_id int not null,
    menu_qty int not null DEFAULT 1,
    PRIMARY KEY (in_id)
);

CREATE TABLE tbl_person_audit(
    id int unsigned UNIQUE AUTO_INCREMENT, 
    audit_data VARCHAR(100) not null,
    PRIMARY KEY (id)
);

CREATE TABLE tbl_uomconversion(
	id int unsigned unique AUTO_INCREMENT,
	uom_before varchar(10) not null,
	uom_after varchar(10) not null,
	uom_value double not null,
	PRIMARY KEY (id)
);

CREATE VIEW viewCusOrders AS
	SELECT ord.ord_timestamp, ord.ord_id, per.per_fname as emp_fname, menu.menu_name, intake.menu_qty, ord.ord_price, ord.ord_tax, ord.ord_total
	FROM tblintake as intake 
		inner join tblorders as ord on ord.ord_id=intake.ord_id
		inner join tblmenu as menu on menu.menu_id=intake.menu_id
		inner join tblemployees as emp on emp.emp_id=ord.emp_id
		inner join tblperson as per on per.per_id=emp.per_id
	ORDER BY ord.ord_timestamp desc;

CREATE VIEW viewCusInfo AS
	SELECT cus.cus_id, card.card_id, cus.cus_points, per.per_email AS cus_email, per.per_phonenum AS cus_phonenum, per.per_usr AS cus_usr, per.per_pwd AS cus_pwd, per.per_fname AS cus_fname, per.per_lname AS cus_lname, per.per_start AS cus_start
	FROM tblcustomer as cus
	inner join tblperson as per on per.per_id=cus.per_id
	inner join tblcard as card on card.cus_id=cus.cus_id;
	
CREATE VIEW viewSupInvoice AS
	SELECT sup.sup_id, per.per_fname AS sup_fname, per.per_lname AS sup_lname, per.per_email AS sup_email, per.per_phonenum AS sup_phonenum, per.per_usr AS sup_usr, per.per_pwd AS sup_pwd, per.per_start AS sup_start, sup.sup_ts, inv.inv_name AS sup_invname, sup.sup_qty, inv.inv_uom AS sup_uom, sup.sup_price
	FROM tblsupplier as sup 
		inner join tblperson as per on per.per_id=sup.per_id
		inner join tblinventory as inv on inv.inv_id=sup.inv_id
	ORDER BY sup_ts desc;
	

DELIMITER $$

CREATE TRIGGER ins_person
AFTER INSERT ON tblperson FOR EACH ROW
BEGIN
	INSERT INTO tbl_person_audit(audit_data) VALUES (CONCAT("New employee ",NEW.per_fname," ",NEW.per_lname," with ID=",NEW.per_id," was added on ",NEW.per_start));
END$$

CREATE TRIGGER del_person
AFTER DELETE ON tblperson FOR EACH ROW
BEGIN
	INSERT INTO tbl_person_audit(audit_data) VALUES (CONCAT("Employee ",OLD.per_fname," ",OLD.per_lname," with ID=",OLD.per_id," was deleted on ",CURRENT_DATE));
END$$

CREATE TRIGGER ins_supplier
AFTER INSERT ON tblsupplier FOR EACH ROW
BEGIN
	UPDATE tblinventory SET inv_qty=(inv_qty + NEW.sup_qty) WHERE tblinventory.inv_id = NEW.inv_id;
END$$

CREATE TRIGGER upd_cuspointsused
AFTER UPDATE ON tblcustomer FOR EACH ROW
BEGIN
	DECLARE point_cost int;	
	IF NEW.point_id is not null
	THEN
		SELECT point_cost
		INTO @point_cost
		FROM tblpoints
		WHERE OLD.point_id=NEW.point_id;
		UPDATE tblcustomer SET cus_points=(cus_points-@point_cost) WHERE NEW.cus_id=OLD.cus_id; 
	END IF;
END$$

DELIMITER ;