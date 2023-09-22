SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Merchants
-- ----------------------------

DROP TABLE IF EXISTS vp_merchant;
CREATE TABLE vp_merchant (
    merchant_id int PRIMARY KEY AUTO_INCREMENT,
    payment_process_merchant_id VARCHAR(255) NOT NULL,
    payment_processor_type tinyint(1) NOT NULL COMMENT '0: CYBERSOURCE',
    is_active tinyint(1) DEFAULT 0,
    is_deleted tinyint(1) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;