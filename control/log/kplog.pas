unit kplog;
interface 
    uses crt, sysutils,
        terminalprint in './effect/terminalprint';
    procedure kplog_get;
    procedure kplog_write(input: ansistring);
implementation
    procedure kplog_get;
    var f: text;
        i, line: longint;
        a: array[1..10000] of string;
    begin
        if (not FileExists(getcurrentDir + '/build.log')) then
            begin
                terminalprint_error('[Error] File log not found in project');
                exit;
            end;
        assign(f, getcurrentDir + '/build.log');
        reset(f);
        line := 1;
        while (not eof(f)) do
            begin
                readln(f, a[line]);
                inc(line);
            end;
        for i:=1 to (line-1) do writeln(a[i]);
        close(f);
    end;
    procedure kplog_write(input : ansistring);
    var f: text;
    begin
        assign(f, getcurrentDir + '/build.log');
        rewrite(f);
        writeln(f, input);
        close(f);
    end;
end.