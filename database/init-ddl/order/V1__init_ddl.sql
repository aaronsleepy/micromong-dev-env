-- order
create table orders
(
    id                bigint auto_increment primary key comment 'ID',
    order_token       varchar(255) not null comment 'order_token',
    user_id           bigint       not null comment '유저 ID',
    pay_method        varchar(30)  not null comment '결제수단',
    receiver_name     varchar(30)  not null comment '수령자명',
    receiver_phone    varchar(30)  not null comment '수령자 휴대폰번호',
    receiver_zipcode  varchar(10)  not null comment '수령자 우편번호',
    receiver_address1 varchar(255) not null comment '수령자 주소1',
    receiver_address2 varchar(255) not null comment '수령자 주소2',
    etc_message       varchar(255) not null comment '남기는 말',
    status            varchar(30)  not null default 'INIT' comment '상태',
    ordered_at        datetime(6) not null comment '주문 일시',
    created_at        datetime(6) not null comment '생성 일시',
    updated_at        datetime(6) null comment '수정 일시'
) comment 'orders' charset = utf8mb4;

create
index order_idx01 on orders (order_token);

create
index order_idx02 on orders (user_id);

create
index order_idx03 on orders (ordered_at);

create
index order_idx04 on orders (created_at);

create
index order_idx05 on orders (updated_at);


-- order_items
create table order_items
(
    id              bigint auto_increment primary key comment 'ID',
    order_id        bigint       not null comment 'order_id',
    order_count     tinyint      not null comment '주문갯수',
    partner_id      bigint       not null comment '파트너 ID',
    item_id         bigint       not null comment '상품 ID',
    item_name       varchar(255) not null comment '상품명',
    item_token      varchar(30)  not null comment '상품 token',
    item_price      int(11) not null comment '상품 가격',
    delivery_status varchar(30)  not null default 'BEFORE_DELIVERY' comment '상태',
    created_at      datetime(6) not null comment '생성 일시',
    updated_at      datetime(6) null comment '수정 일시'
) comment 'order_items' charset = utf8mb4;

create
index order_item_idx01 on order_items (order_id);

create
index order_item_idx02 on order_items (partner_id);

create
index order_item_idx03 on order_items (item_id);

create
index order_item_idx04 on order_items (item_token);

create
index order_item_idx05 on order_items (created_at);

create
index order_item_idx06 on order_items (updated_at);


-- order_item_option_groups
create table order_item_option_groups
(
    id                     bigint auto_increment primary key comment 'ID',
    order_item_id          bigint       not null comment 'order_item_id',
    ordering               tinyint(3) not null comment '정렬순서',
    item_option_group_name varchar(255) not null comment '상품 옵션 그룹명',
    created_at             datetime(6) not null comment '생성 일시',
    updated_at             datetime(6) null comment '수정 일시'
) comment 'order_item_option_groups' charset = utf8mb4;

create
index order_item_option_groups_idx01 on order_item_option_groups (order_item_id);

create
index order_item_option_groups_idx02 on order_item_option_groups (created_at);

create
index order_item_option_groups_idx03 on order_item_option_groups (updated_at);


-- order_item_options
create table order_item_options
(
    id                         bigint auto_increment primary key comment 'ID',
    order_item_option_group_id bigint       not null comment 'order_item_option_group_id',
    ordering                   tinyint(3) not null comment '정렬순서',
    item_option_name           varchar(255) not null comment '상품 옵션명',
    item_option_price          int(11) not null comment '상품 옵션 가격',
    created_at                 datetime(6) not null comment '생성 일시',
    updated_at                 datetime(6) null comment '수정 일시'
) comment 'order_item_options' charset = utf8mb4;

create
index order_item_options_idx01 on order_item_options (order_item_option_group_id);

create
index order_item_options_idx02 on order_item_options (created_at);

create
index order_item_options_idx03 on order_item_options (updated_at);
