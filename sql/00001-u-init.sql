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

insert into `user` (`firstName`, `lastName`, `email`, `password`, `password_algorithm`, `salt`, `dateOfBirth`)
values
    ("John", "Doe", "john@mail.com", "63a9f0ea7bb98050796b649e85481845", "md5", "random", "1995-11-09"),
    ("Sally", "Murphy", "john@mail.com", "random", "sha-256", "random", "1995-11-09"),
    ("Mike", "Sullivan", "john@mail.com", "random", "sha-256", "random", "1995-11-09"),
    ("Jessica", "Doe", "john@mail.com", "random", "md5", "random", "1995-11-09");


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
