SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Real cards
-- ----------------------------

DROP TABLE IF EXISTS vp_real_card;
CREATE TABLE vp_real_card (
    real_card_id INT PRIMARY KEY AUTO_INCREMENT,
    rcn_id VARCHAR(20) NOT NULL,
    rcn_alias VARCHAR(255) NOT NULL,
    buyer_id INT NOT NULL,
    is_default tinyint(1) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

ALTER TABLE vp_real_card
ADD CONSTRAINT fk_vp_real_card_buyer_id
FOREIGN KEY (buyer_id) REFERENCES vp_buyer(buyer_id);

-- ----------------------------
-- Virtual cards
-- ----------------------------

DROP TABLE IF EXISTS vp_virtual_card;
CREATE TABLE vp_virtual_card (
    virtual_card_id INT PRIMARY KEY AUTO_INCREMENT,
    real_card_id INT NOT NULL,
    card_owner VARCHAR(255) NOT NULL,
    card_type INT(2) NOT NULL,
    card_number VARCHAR(20) NOT NULL,
    expiry_month INT NOT NULL,
    expiry_year INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

ALTER TABLE vp_virtual_card
ADD CONSTRAINT fk_vp_virtual_card_real_card_id
FOREIGN KEY (real_card_id) REFERENCES vp_real_card(real_card_id);

-- ----------------------------
-- Card Transactions
-- ----------------------------

DROP TABLE IF EXISTS vp_card_transaction;
CREATE TABLE vp_card_transaction (
    card_transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    invoice_id INT NOT NULL,
    real_card_id INT NOT NULL,
    status tinyint(1) NOT NULL COMMENT '0: PENDING, 1: APPROVED, 2: REJECTED',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT uc_card_transaction UNIQUE (invoice_id, real_card_id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

ALTER TABLE vp_card_transaction
ADD CONSTRAINT fk_vp_card_transaction_invoice_id
FOREIGN KEY (invoice_id) REFERENCES vp_invoice(invoice_id);

ALTER TABLE vp_card_transaction
ADD CONSTRAINT fk_vp_real_card_transaction_card_id
FOREIGN KEY (real_card_id) REFERENCES vp_real_card(real_card_id);
