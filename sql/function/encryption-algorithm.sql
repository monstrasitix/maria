
drop function if exists encryption_algorithm;

create function if not exists encryption_algorithm(
    in $pass varchar(100),
    in $algo varchar(100)
)
    returns varchar(255)
begin
    return case $algo
        when "sha-256"  then sha2($pass, 256)
        when "md5"      then md5($pass)
        else ""
    end;
end;
