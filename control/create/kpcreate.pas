unit kpcreate;
interface 
    uses crt, sysutils, process,
        terminalprint in './effect/print/terminalprint',
        getos in './system/getos';
    procedure kpcreate_run;
implementation
    procedure help;
    begin
        writeln('Try: kodepas create [option]');
        writeln('Options:');
        writeln('   --help: give help');
        writeln('   --desktop: create desktop project');
        writeln('   --android: create project for Android divice');
        writeln('   --game: create project with Graphics');
        writeln('   --web: create web project');
    end;
    procedure create_desktop;
    var s: ansistring;
    begin
        if (paramStr(3) = '') then 
            begin
                terminalprint_error('[Error] Project name error');
                exit;
            end;
        case getos_run of
            'linux' : 
                begin
                    writeln('[Start] Clone project from Git');
                    if (RunCommand('git clone https://www.github.com/kodestudio/kodepasproject ' + paramStr(3), s)) then terminalprint_complete('[Done] Create project complete')
                    else terminalprint_error('[Error] Can not create project. Error code: ' + s );
                end;
            'windows':
                begin
                    writeln('[Start] Clone project from GitHub');
                    {ExecuteProcess('git','clone https://www.github.com/kodestudio/kodepasproject '+ paramStr(3));}
                     if (RunCommand('git clone https://www.github.com/kodestudio/kodepasproject ' + paramStr(3), s)) then terminalprint_complete('[Done] Create project complete')
                    else terminalprint_error('[Error] Can not create project. Error code: ' + s );
                end;
            else terminalprint_error('[Error] Unknow OS');
        end;
    end;
    procedure kpcreate_run;
    begin
        case paramStr(2) of 
            '--desktop' : create_desktop;
            '--help' : help;
            else terminalprint_error('[Error] Unknow param(' + paramStr(2) + '). Try "kodepas create --help" to see help');
        end;
    end;
end.