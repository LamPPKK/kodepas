unit kpstart;
interface
    uses crt, sysutils,
        terminalprint in './effect/print/terminalprint',
        kpbuild in './build/kpbuild',
        kprun in './run/kprun',
        kplog in './log/kplog';
    procedure kpstart_run;
implementation
    procedure help;
    begin
        writeln('KodePas Live help. ');
        writeln('In KodePas Live, you press key to control. ');
        writeln('Key:');
        writeln('   "h" give help');
        writeln('   "b" build project without run');
        writeln('   "r" build and run project');
        writeln('   "l" show log');
        writeln('   "c" stop KodePas Live');
    end;
    procedure main;
    var keys: char;
    begin
        keys := readkey;
        case keys of
            'r' : 
                begin
                    terminalprint_process('Run project');
                    kprun_run;
                end;
            'b':
                begin 
                    terminalprint_process('Build project');
                    kpbuild_now;
                end;
            'h' : help;
            'c': exit;
            'l':
                begin
                    terminalprint_process('Log');
                    kplog_get;
                end; 
            'd': clrscr;
            else writeln('Unknow key, try press "h" to get help')
        end; 
        writeln('-----------------------------------------------------');
        main;
    end;
    procedure kpstart_run;
    begin
        terminalprint_process('KodePas Live. Press "h" to see help, "c" to end.');
        main
    end; 
end.