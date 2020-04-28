unit getkpdir;
interface 
    uses crt, sysutils;
    function getkpdir_run: string;
implementation
    function getkpdir_run: string;
    var f: text;
        s: string;
    begin   
        assign(f, getuserDir + '/.kodepas/quick.txt');
        reset(f);
        readln(f, s);
        close(f);
        exit(s);
    end;
end.