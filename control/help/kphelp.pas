unit kphelp;
interface 
    uses crt,
    getos in './system/getos';
    procedure kphelp_run;
implementation
    procedure kphelp_run;
    begin
        case getos_run of
            'linux': writeln('KodePas Control in Linux');
            'windows': writeln('KodePas Control in Windows');
            else writeln('Unknow OS');
        end;
    end;
end.