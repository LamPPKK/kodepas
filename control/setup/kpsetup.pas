unit kpsetup;
interface 
    uses crt, sysutils, strutils,
    terminalprint in './effect/print/terminalprint',
    getos in './system/getos';
    procedure kpsetup_run;
implementation
    procedure kpsetup_run;
    var kpdir, fpcdir: string;
        f: text;
        i, line: longint;
        a: array[1..10000] of string;
    begin
        write('[Input] KodePas directory: ');
        readln(kpdir);
        write('[Input] FPC directory: ');
        readln(fpcdir);
        {Kiểm tra đường dẫn có tồn tại không}
        writeln('[Start] Check directory');
        if (DirectoryExists(kpdir)) then terminalprint_complete('[Done ] KodePas directory found')
        else begin
            terminalprint_error('[Error] KodePas directory not found');
                terminalprint_error('[Stop ] Setup fail');
                exit;
            end;
        if (DirectoryExists(fpcdir)) then terminalprint_complete('[Done ] FPC directory found')
        else
            begin
                terminalprint_error('[Error] FPC directory not found');
                terminalprint_error('[Stop ] Setup fail');
                exit;
            end;
        {Kiểm tra LCL trong KPDIR}
        writeln('[Start] Check LCL');
        if (directoryexists(kpdir + '/lcl')) then terminalprint_complete('[Done ] LCL found in KodePas Directory')
        else 
            begin
                terminalprint_error('[Error] LCL not found');
                terminalprint_error('[Stop ] Setup fail');
                exit;
            end;
        {Đọc dữ liệu trong native}
        {Kiểm tra xem native conf hay mất}
        writeln('[Start] Check environmentoptions.xml');
        if (not fileExists(kpdir + '/bin/native/environmentoptions.xml'))  then 
            begin
                terminalprint_error('[Error] Environmentoptions.xml not found in Native');
                terminalprint_error('[Stop ] Setup fail');
            end
            else terminalprint_complete('[Done ] Environmentoptions.xml found');
        {Đọc file nguyên mẫu}
        assign(f, kpdir + '/bin/native/environmentoptions.xml');
        reset(f);
        line := 1;
        while (not eof(f)) do
            begin
                readln(f, a[line]);
                inc(line);
            end;
        close(f);
        {Thay đổi nội dung environmentoptions.xml}
        for i:=1 to line do
            begin
                a[i] := ReplaceStr(a[i], 'KodePasDirectoryValue', kpdir);
                a[i] := ReplaceStr(a[i], 'FPCDirectoryValue', fpcdir);
            end;
        {ghi config}
        case getos_run of
            'linux' : 
                begin
                    {tạo đường dẫn}
                    writeln('[Start] Write config');
                    createDir(getuserdir + '/.kodepas');
                    assign(f, getuserdir + '/.kodepas/environmentoptions.xml');
                    rewrite(f);
                    for i:=1 to line do writeln(f, a[i]);
                    close(f);
                    assign(f, getuserdir + '/.kodepas/quick.txt');
                    rewrite(f);
                    writeln(f, kpdir);
                    close(f);
                    terminalprint_complete('[Done ] Setup complete');
                end;
            'windows' : 
                begin
                    writeln('[Start] Write config');
                    createDir(getuserdir + '/.kodepas');
                    assign(f, getuserdir + '/.kodepas/environmentoptions.xml');
                    rewrite(f);
                    for i:=1 to line do writeln(f, a[i]);
                    close(f);
                    assign(f, getuserdir + '/.kodepas/quick.txt');
                    rewrite(f);
                    writeln(f, kpdir);
                    close(f);
                    terminalprint_complete('[Done ] Setup complete');
                end;
            else terminalprint_error('[Stop ] Unknow OS. Setup fail');
        end;
    end;
end.