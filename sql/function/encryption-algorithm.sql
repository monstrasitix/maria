
drop function if exists encryption_algorithm;

create function if not exists encryption_algorithm(
    in vv varchar(100),
    in alg varchar(100)
)
returns varchar(100)
begin
    if alg = "sha-256" then
        return sha2(vv, 256);
    elseif alg = "md5" then
        return md5(vv);
    else 
        return "";
    end if;
end;
