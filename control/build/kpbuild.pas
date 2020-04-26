unit kpbuild;
interface 
    uses crt, sysutils, process, DateUtils, 
        terminalprint in './effect/print/terminalprint',
        kpini in './file/kpini',
        getos in 'system/getos',
        kplog in './log/kplog',
        kptime in './time/kptime';
    procedure kpbuild_now;
    procedure kpbuild_run;
    procedure kpbuild_clear;
implementation
    procedure help;
    begin
        writeln('Try: kodepas build [option]');
        writeln('Options: ');
        writeln('   --clear: clear temp and build');
    end;
    procedure kpbuild_clear;
    var f_bin, f_compiled : string;
    begin
        writeln('[Start] Clear project temp file');
         if (FileExists(getCurrentDir + '/local.ini')) then terminalprint_complete('[Done ] Local.ini found')
        else    
            begin
                terminalprint_error('[Stop ] File local.ini not found. try "kodepas init --local" to create it');
                exit;
            end;
        f_bin := kpini_string('local.ini', 'CONFIG', 'filebin');
        f_compiled := kpini_string('local.ini', 'CONFIG','compiled');
        removedir(f_compiled);
        if (DeleteFile(getCurrentDir + '/' + f_bin)) then ;
    end;
    procedure kpbuild_now;
    var f_project, f_bin, f_compiled : string;
        s: ansistring;
        t_start, t_end : TDateTime;
    begin
        t_start := now;
        terminalprint_process('[Run  ] Build project');
        {kiểm tra xem local.ini có không}
        writeln('[Start] Check file local.ini');
        if (FileExists(getCurrentDir + '/local.ini')) then terminalprint_complete('[Done ] Local.ini found')
        else    
            begin
                terminalprint_error('[Stop ] File local.ini not found. try "kodepas init --local" to create it');
                exit;
            end;
        {lấy dữ liệu ở local.ini}
        writeln('[Start] Get data in local.ini');
        f_project := kpini_string('local.ini', 'CONFIG', 'run');
        f_bin := kpini_string('local.ini', 'CONFIG', 'filebin');
        f_compiled := kpini_string('local.ini', 'CONFIG','compiled');
        {chuyển từ .ini sang .xml}
        terminalprint_complete('[Done ] Get data done');
        writeln('[Start] Render from local.ini to project');
        kpini_xml(getCurrentDir + '/' + f_project, 'bin\project', f_bin);
        kpini_xml(getCurrentDir + '/' + f_project, 'compiled\$(TargetCPU)-$(TargetOS)', f_compiled);
        terminalprint_complete('[Done ] Render complete');
        {Xóa tệp chạy cũ}
        if (FileExists(getCurrentDir + '/' + f_bin)) then    
                if (DeleteFile(getCurrentDir + '/' + f_bin)) then ;
        {kết nối kodepaskernel và build}
        case getos_run of
            'linux':
                begin
                    writeln('[Start] Call KodePas Kernel (Linux) to compiler and build');
                    if (runcommand('kodepaskernel --build-all ' + f_project, s)) then
                        begin
                            t_end := now;
                            terminalprint_complete('[Done ] Called Kernel and build done in {'+ inttostr(kptime_do(t_start, t_end)) + '} ms');
                        end
                    else 
                        begin
                            terminalprint_error('[Error] Build error. Try: "kodepas log" to see error code');
                            kplog_write(s);
                            terminalprint_error('[Stop ] Stop build project');
                            exit;
                        end;
                end;
            'windows':
                begin
                    writeln('[Start] Call KodePas Kernel (Windows) to compiler and build');
                    if (runcommand('kodepaskernel --build-all ' + f_project, s)) then
                        begin
                            terminalprint_complete('[Done ] Called Kernel and build done in {'+ inttostr(kptime_do(t_start, t_end)) + '} ms');
                        end
                    else 
                        begin
                            terminalprint_error('[Error] Build error. Try: "kodepas log" to see error code');
                            terminalprint_error('[Stop ] Stop build project');
                            exit;
                        end;
                end;
            else terminalprint_error('[Error] Unknow OS');
        end;
    end;

    procedure kpbuild_run;
    begin
        if (paramCount = 1) then kpbuild_now
        else 
            case paramStr(2) of
                '--help': help;
                '--clear':
                    begin
                        kpbuild_clear;
                        kpbuild_now;
                    end;
                else terminalprint_error('[Error] Unknow param (' + paramStr(2) + '). Try "kodepas build --help" to see param can use');
            end;
    end;
end.