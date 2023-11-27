drop function if exists salt;

create function salt()
    returns varchar(128)
begin
    return SUBSTRING(MD5(RAND()), -10);
end

