DROP DATABASE IF EXISTS isuumo;
CREATE DATABASE isuumo;

DROP TABLE IF EXISTS isuumo.estate;
DROP TABLE IF EXISTS isuumo.chair;

CREATE TABLE isuumo.estate
(
    id          INTEGER             NOT NULL PRIMARY KEY,
    name        VARCHAR(64)         NOT NULL,
    description VARCHAR(4096)       NOT NULL,
    thumbnail   VARCHAR(128)        NOT NULL,
    address     VARCHAR(128)        NOT NULL,
    latitude    DOUBLE PRECISION    NOT NULL,
    longitude   DOUBLE PRECISION    NOT NULL,
    rent        INTEGER             NOT NULL,
    door_height INTEGER             NOT NULL,
    door_width  INTEGER             NOT NULL,
    features    VARCHAR(64)         NOT NULL,
    popularity  INTEGER             NOT NULL,
    popularity_desc INTEGER AS (-popularity) NOT NULL -- generated column でカラムを追加する
);

-- Add index
ALTER TABLE isuumo.estate ADD INDEX idx_estate_rent(rent);
ALTER TABLE isuumo.estate ADD INDEX idx_estate_popularity(popularity_desc);
ALTER TABLE isuumo.estate ADD INDEX idx_estate_rent_door_width(rent, door_width);
ALTER TABLE isuumo.estate ADD INDEX idx_estate_rent_door_height(rent, door_height);
ALTER TABLE isuumo.estate ADD INDEX idx_estate_laitiude_longitude(latitude, longitude);


CREATE TABLE isuumo.chair
(
    id          INTEGER         NOT NULL PRIMARY KEY,
    name        VARCHAR(64)     NOT NULL,
    description VARCHAR(4096)   NOT NULL,
    thumbnail   VARCHAR(128)    NOT NULL,
    price       INTEGER         NOT NULL,
    height      INTEGER         NOT NULL,
    width       INTEGER         NOT NULL,
    depth       INTEGER         NOT NULL,
    color       VARCHAR(64)     NOT NULL,
    features    VARCHAR(64)     NOT NULL,
    kind        VARCHAR(64)     NOT NULL,
    popularity  INTEGER         NOT NULL,
    stock       INTEGER         NOT NULL
);

-- Add index
ALTER TABLE isuumo.chair ADD INDEX idx_chair_price(price);
ALTER TABLE isuumo.chair ADD INDEX idx_chair_price_stock(price, stock);
ALTER TABLE isuumo.chair ADD INDEX idx_chair_height_stock(height, stock);
ALTER TABLE isuumo.chair ADD INDEX idx_chair_kind_stock(kind, stock);