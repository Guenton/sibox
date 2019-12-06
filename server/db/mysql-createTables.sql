
CREATE TABLE IF NOT EXISTS cost_curr (
  costcurr_id INT AUTO_INCREMENT PRIMARY KEY,
  iso CHAR(3), 
  title VARCHAR(255),
  is_deleted BOOLEAN DEFAULT false,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO cost_curr (iso, title) VALUES
  ("USD", "United States dollar"),
  ("ANG", "Netherlands Antillean guilder"),
  ("AWG", "Aruban florin"),
  ("EUR", "Euro")
;
CREATE TABLE cost_sig (
  costsig_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255),
  sig_limit DECIMAL(13, 2),
  is_deleted BOOLEAN DEFAULT false,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO cost_sig (title, sig_limit) VALUES
  ("Management", 999999999.99),
  ("CSO", 30000.00),
  ("GOM", 2500.00),
  ("GIM", 2500.00)
;
CREATE TABLE cost_type (
  costtype_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255),
  is_deleted BOOLEAN DEFAULT false,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO cost_type (title) VALUES
	("Telephone Expenses"),
  ("Office Expenses"),
  ("Operating Expenses"),
  ("Transportation Expenses"),
  ("Personnel Travel Expenses"),
  ("Personnel Training Expenses"),
  ("Personnel Other Expenses"),
  ("Equipment Expenses"),
  ("Repair & Maintenance Expenses")
;


CREATE TABLE IF NOT EXISTS scope_dept (
  scopedept_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL
);
INSERT INTO scope_dept (title) VALUES
  ("Within S&I"), ("Other Department"), ("Outside Bank")
;
CREATE TABLE IF NOT EXISTS scope_locat (
  scopelocat_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL
);
INSERT INTO scope_locat (title) VALUES
  ("Local"), ("Inter-Island"), ("International")
;
CREATE TABLE IF NOT EXISTS scope_sub (
  scopesub_id INT AUTO_INCREMENT PRIMARY KEY,
  shorthand VARCHAR(25) NOT NULL,
  country VARCHAR(100) NOT NULL,
  title VARCHAR(100) NOT NULL,
  is_deleted BOOLEAN DEFAULT false,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO scope_sub (shorthand, country, title) VALUES
  ("MCB", "Curacao", "Maduro & Curiel's Bank N.V."),
  ("CMB", "Aruba", "Caribbean Mercantile Bank N.V."),
  ("MCBB", "Bonaire", "Maduro & Curiel's Bank (Bonaire) N.V."),
  ("WIB", "St. Maarten", "Windward Islands Bank Ltd.")
;


CREATE TABLE IF NOT EXISTS serv_main (
  servmain_id INT AUTO_INCREMENT PRIMARY KEY,
  described VARCHAR(255) NOT NULL,
  is_deleted BOOLEAN DEFAULT false,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS serv_reg (
  servmain_id INT,
  footprint INT,
  cm_year YEAR,
  cm_seq INT,
  is_deleted BOOLEAN DEFAULT false,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (servmain_id) REFERENCES serv_main(servmain_id)
);
CREATE TABLE IF NOT EXISTS serv_arch (
  servarch_id INT AUTO_INCREMENT PRIMARY KEY,
  shorthand VARCHAR(25) DEFAULT NULL,
  title VARCHAR(100) NOT NULL
);
INSERT INTO serv_arch (shorthand, title) VALUES
  ("Lead", "Security Leadership"),
  ("Inv", "Investigations"),
  ("Equip", "Security Equipment"),
  ("Prot", "Asset Protection"),
  ("Exec", "Executive Protection")
;
CREATE TABLE IF NOT EXISTS serv_type (
  servtype_id INT AUTO_INCREMENT PRIMARY KEY,
  servarch_id INT,
  title VARCHAR(255) NOT NULL,
  FOREIGN KEY (servarch_id) REFERENCES serv_arch(servarch_id)
);
INSERT INTO serv_type (title, servarch_id)
VALUES
  ("Management", 1),
  ("Supervision", 1),
  ("General Investigations", 2),
  ("Electronic Investigations", 2),
  ("Screening", 2),
  ("Inspection/Maintenance", 3),
  ("Purchasing/Installation", 3),
  ("Guarding", 4),
  ("Patrolling", 4),
  ("Roving", 4),
  ("Shadowing", 5),
  ("Transportation", 5),
  ("Domicile Protection", 5)
;
CREATE TABLE IF NOT EXISTS serv_scope (
  servmain_id INT,
  servarch_id INT,
  servtype_id INT,
  scopedept_id INT,
  scopelocat_id INT,
  is_deleted BOOLEAN DEFAULT false,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (servmain_id) REFERENCES serv_main(servmain_id),
  FOREIGN KEY (servarch_id) REFERENCES serv_arch(servarch_id),
  FOREIGN KEY (servtype_id) REFERENCES serv_type(servtype_id),
  FOREIGN KEY (scopedept_id) REFERENCES scope_dept(scopedept_id),
  FOREIGN KEY (scopelocat_id) REFERENCES scope_locat(scopelocat_id)
);


CREATE TABLE IF NOT EXISTS pos_main (
  posmain_id INT AUTO_INCREMENT PRIMARY KEY,
  shorthand VARCHAR(25) DEFAULT NULL,
  title VARCHAR(100) NOT NULL,
  is_deleted BOOLEAN DEFAULT false,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO pos_main (shorthand, Title)
VALUES
  ("CSO", "Chief Security Officer"),
  ("Adm.Cord", "Administrative Coordinator"),
  ("Proj.Man", "Project Manager"),
  ("GOM	Group", "Operations Manager"),
  ("GIM	Group", "Investigations Manager"),
  ("IM", "Investigations Manager"),
  ("SM", "Security Manager"),
  ("CRCM", "Control & Response Center Manager"),
  ("TC", "Technical Coordinator"),
  ("TCI", "Technical Coordinator & Investigator"),
  ("IA", "Investigator A"),
  ("IB", "Investigator B (Senior)"),
  ("IE", "Investigator Electronic"),
  ("Profilist",	"Profile Analyst"),
  ("SS", "Security Supervisor"),
  ("PO", "Patrol Officer"),
  ("CRCOps", "Control & Response Center Operator"),
  ("SO", "Security Officer")
;

CREATE TABLE IF NOT EXISTS pos_assig (
  posmain_id INT,
  servtype_id INT,
  PRIMARY KEY (posmain_id, servtype_id),
  FOREIGN KEY (posmain_id) REFERENCES pos_main(posmain_id),
  FOREIGN KEY (servtype_id) REFERENCES serv_type(servtype_id)
);

CREATE TABLE IF NOT EXISTS emp_main (
  empmain_id INT AUTO_INCREMENT PRIMARY KEY,
  posmain_id INT NOT NULL,
  scopesub_id INT NOT NULL,
  is_deleted BOOLEAN DEFAULT false,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (posmain_id) REFERENCES pos_main(posmain_id),
  FOREIGN KEY (scopesub_id) REFERENCES scope_sub(scopesub_id)
);
CREATE TABLE IF NOT EXISTS emp_name (
	empmain_id INT,
  firstname VARCHAR(100),
  middlename VARCHAR(100),
  lastname VARCHAR(100),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (empmain_id) REFERENCES emp_main(empmain_id)
);
CREATE TABLE IF NOT EXISTS emp_email (
	empmain_id INT,
  email VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (empmain_id) REFERENCES emp_main(empmain_id)
);
CREATE TABLE IF NOT EXISTS emp_addr (
	empmain_id INT,
  addr VARCHAR(255),
  hood VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (empmain_id) REFERENCES emp_main(empmain_id)
);
CREATE TABLE IF NOT EXISTS emp_dob (
	empmain_id INT,
  dob DATE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (empmain_id) REFERENCES emp_main(empmain_id)
);
CREATE TABLE IF NOT EXISTS emp_ident (
	empmain_id INT,
  passport VARCHAR(15),
  ident VARCHAR(15),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (empmain_id) REFERENCES emp_main(empmain_id)
);
CREATE TABLE IF NOT EXISTS emp_google (
  google_id BIGINT PRIMARY KEY,
	empmain_id INT,
  img_url VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (empmain_id) REFERENCES emp_main(empmain_id)
);
CREATE TABLE IF NOT EXISTS emp_auth (
	empmain_id INT,
  code CHAR(6),
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (empmain_id) REFERENCES emp_main(empmain_id)
);
