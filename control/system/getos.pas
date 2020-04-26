unit getos;
interface 
    uses crt, sysutils;
    function getos_run: string;
implementation 
    function getos_run: string;
    begin
        {$IFDEF Linux}
        exit('linux');
        {$ELSE}
        {$IFDEF WINDOWS}
        exit('windows');
        {$ENDIF}
        {$ENDIF}
    end;
end.