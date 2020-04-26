unit kpini;
interface
    uses crt, sysutils, inifiles, strutils;
    function kpini_string(fname, node, key : string): string;
    procedure kpini_xml(xml, str1, str2 : string );
implementation
    function kpini_string(fname, node, key : string): string;
    var ini: TIniFile;
        outStr : string;
    begin
        ini := TIniFile.Create(fname);
        outStr := ini.ReadString(node, key, '');
        exit(outStr);
    end;
    procedure kpini_xml(xml, str1, str2: string);
    var f: text;
        i, line: longint;
        a :array[1..10000] of string;
    begin
        assign(f, xml);
        reset(f);
        line := 1;
        while (not eof(f)) do 
            begin
                readln(f, a[line]);
                inc(line);
            end;
        close(f);
        for i:=1 to line do
        begin
            a[i] := ReplaceStr(a[i], str1, str2);
        end;
        assign(f, xml);
        rewrite(f);
        for i:=1 to line-1 do
            writeln(f, a[i]);
        close(f);
    end;
end.