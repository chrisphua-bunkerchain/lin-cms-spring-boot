SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Cards
-- ----------------------------

DROP TABLE IF EXISTS vp_card;
CREATE TABLE vp_card (
    card_id int PRIMARY KEY AUTO_INCREMENT,
    card_owner VARCHAR(255) NOT NULL,
    card_type int(2) NOT NULL,
    card_number VARCHAR(20) NOT NULL,
    buyer_id int NOT NULL,
    expiry_month int NOT NULL,
    expiry_year int NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

ALTER TABLE vp_card
ADD CONSTRAINT fk_vp_card_buyer_id
FOREIGN KEY (buyer_id) REFERENCES vp_buyer(buyer_id);

-- ----------------------------
-- Card Transactions
-- ----------------------------

DROP TABLE IF EXISTS vp_card_transaction;
CREATE TABLE vp_card_transaction (
    invoice_id int NOT NULL,
    card_id int NOT NULL,
    status tinyint(1) NOT NULL COMMENT '0: PENDING, 1: APPROVED, 2: REJECTED',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT uc_card_transaction UNIQUE (invoice_id, card_id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

ALTER TABLE vp_card_transaction
ADD CONSTRAINT fk_vp_card_transaction_invoice_id
FOREIGN KEY (invoice_id) REFERENCES vp_invoice(invoice_id);

ALTER TABLE vp_card_transaction
ADD CONSTRAINT fk_vp_card_transaction_card_id
FOREIGN KEY (card_id) REFERENCES vp_card(card_id);
