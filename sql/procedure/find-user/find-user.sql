drop procedure if exists find_user;

create procedure if not exists find_user(
    in email      nvarchar(100),
    in passwords   varchar(100)
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
    `user`.`email` = email
    and `user`.`password` = encryption_algorithm(passwords, `user`.`password_algorithm`);
end;
