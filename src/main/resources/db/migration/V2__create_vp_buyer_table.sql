SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Buyers
-- ----------------------------

CREATE TABLE vp_buyer (
    buyer_id INT NOT NULL AUTO_INCREMENT,
    company_id varchar(100) DEFAULT NULL COMMENT 'Mastercard ICCP company unique identifier',
    create_time datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    update_time datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
    delete_time datetime(3) DEFAULT NULL,
    is_active tinyint(1) DEFAULT 0,
    is_deleted tinyint(1) DEFAULT 0,
    PRIMARY KEY (buyer_id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;