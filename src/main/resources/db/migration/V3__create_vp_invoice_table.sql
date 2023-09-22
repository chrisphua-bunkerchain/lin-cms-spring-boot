SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Invoices
-- ----------------------------

DROP TABLE IF EXISTS vp_invoice;
CREATE TABLE vp_invoice (
    invoice_id int PRIMARY KEY AUTO_INCREMENT,
    invoice_number VARCHAR(20) NOT NULL,
    buyer_id int NOT NULL,
    invoice_date DATE NOT NULL,
    due_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status tinyint(1) NOT NULL COMMENT '0: PENDING, 1: UNPAID, 2: PAID',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

ALTER TABLE vp_invoice
ADD CONSTRAint fk_vp_invoice_buyer_id
FOREIGN KEY (buyer_id) REFERENCES vp_buyer(buyer_id);

-- ----------------------------
-- Invoice Items
-- ----------------------------

DROP TABLE IF EXISTS vp_invoice_item;
CREATE TABLE vp_invoice_item (
    item_id int PRIMARY KEY AUTO_INCREMENT,
    invoice_id int NOT NULL,
    description VARCHAR(255) NOT NULL,
    quantity int NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE vp_invoice_item
ADD CONSTRAint fk_vp_invoice_item_invoice_id
FOREIGN KEY (invoice_id) REFERENCES vp_invoice(invoice_id);
