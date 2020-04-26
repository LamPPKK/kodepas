program updates;
uses crt, sysutils, process,
    terminalprint in './effect/print/terminalprint';
var s: ansistring;
begin
    writeln('[Start] Updates KodePas');
    if (runcommand('git pull', s)) then
        begin
            terminalprint_complete('[Done ] KodePas up to date');
        end
    else 
        begin
            terminalprint_error('[Error] Updates error. Code:');
            writeln(s);
        end;
end.