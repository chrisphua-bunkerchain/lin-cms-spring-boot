SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Buyers
-- ----------------------------

CREATE TABLE vp_buyer (
    buyer_id int NOT NULL AUTO_INCREMENT,
    application_user_id varchar(100) DEFAULT NULL COMMENT 'Unique identifier of buyer in the client application',
    application_client_id varchar(100) DEFAULT NULL COMMENT 'Unique identifier of the client application provision by the authorization server',
    email varchar(100) DEFAULT NULL COMMENT 'Email address of the buyer',
    default_card_id int NOT NULL,
    create_time datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    update_time datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
    delete_time datetime(3) DEFAULT NULL,
    is_active tinyint(1) DEFAULT 0,
    is_deleted tinyint(1) DEFAULT 0,
    PRIMARY KEY (buyer_id),
    CONSTRAint uc_buyer UNIQUE (application_user_id, application_client_id, delete_time)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
  
ALTER TABLE vp_buyer
ADD CONSTRAint fk_vp_buyer_default_card_id
FOREIGN KEY (default_card_id) REFERENCES vp_card(card_id);