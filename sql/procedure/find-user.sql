drop procedure if exists find_user;

create procedure if not exists find_user(
    in $email   nvarchar(100),
    in $pass    varchar(100)
)
begin
    select
        `user`.`id`,
        `user`.`firstName`,
        `user`.`lastName`,
        `user`.`email`,
        `user`.`dateOfBirth`
    from `user`
    where
        `user`.`email` = $email
        and `user`.`password` = encryption_algorithm(
            concat($pass, `user`.`salt`),
            `user`.`password_algorithm`
        );
end;
