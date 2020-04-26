unit kprun;
interface 
    uses crt, sysutils, process,
        terminalprint in 'effect/terminalprint',
        kpbuid in 'build/kpbuild',
        kplog in 'log/kplog',
        kpini in 'file/kpini';
    procedure kprun_run;
implementation
    procedure help;
    begin
        writeln('Try: kodepas run [option]');
        writeln('Options:');
        writeln('   --clear: clear and run');
        writeln('   --help: give help');
        writeln('   --only: run only');
    end;
    procedure kprun_now;
    var f_bin: string;
    begin
        f_bin := kpini_string('local.ini', 'CONFIG', 'filebin');
        ExecuteProcess(f_bin,'');
    end;
    procedure kprun_run;
    begin
        if (paramCount = 1) then
            begin
                kpbuild_now;
                terminalprint_process('[Start] Running');
                kprun_now;
            end
        else
            case paramStr(2) of
                '--help' :help;
                '--only':
                    begin
                        kprun_now;
                    end; 
                else terminalprint_error('[Error] Unknow param(' + paramStr(2) + '). Try "kodepas run --help" to see more param');
            end;
    end;
end.