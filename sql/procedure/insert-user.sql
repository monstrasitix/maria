drop procedure if exists insert_user;

create procedure if not exists insert_user(
    in $firstName   nvarchar(100),
    in $lastName    nvarchar(100),
    in $email       nvarchar(100),
    in $pass        varchar(100),
    in $dateOfBirth date
)
begin
    declare $salt varchar(128);
    set $salt = salt();

    insert into `user`
        ( `firstName`
        , `lastName`
        , `email`
        , `password`
        , `password_algorithm`
        , `salt`
        , `dateOfBirth`
        )
    values
        ( $firstName
        , $lastName
        , $email
        , md5(concat($pass, $salt))
        , "md5"
        , $salt
        , $dateOfBirth
        );
end
