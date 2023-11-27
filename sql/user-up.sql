create table if not exists `user` (
    `id`                    bigint auto_increment not null,
    `firstName`             nvarchar(100),
    `lastName`              nvarchar(100),
    `email`                 nvarchar(100)   not null,
    `password`              varchar(100)   not null,
    `password_algorithm`    enum('sha-256', 'md5')     not null,
    `salt`                  varchar(25)     not null,
    `dateOfBirth`           date,

    primary key (`id`)
)
Engine=InnoDB;

call insert_user("John", "Doe", "john@mail.com", "root", "1995-11-09");
call insert_user("Sally", "Murphy", "john@mail.com", "random", "1995-11-09");
call insert_user("Mike", "Sullivan", "john@mail.com", "foo", "1995-11-09");
call insert_user("Jessica", "Doe", "john@mail.com", "bar", "1995-11-09");


create table if not exists `role` (
    `id`    int auto_increment not null,
    `name`  varchar(100) not null,

    primary key (`id`)
)
Engine=InnoDB;

insert into `role` (`name`)
values ("admin"), ("user");

create table if not exists `user_role` (
    userId bigint not null,
    roleId    int not null,

    foreign key (`userId`) references `user` (`id`),
    foreign key (`roleId`) references `role` (`id`)
)
Engine=InnoDB;

insert into `user_role` (`userId`, `roleId`)
values
    (1, 2),
    (2, 1),
    (3, 2),
    (4, 2);
