program kodepas;
uses crt, sysutils,
    getos in 'system/getos',
    kphelp in 'help/kphelp',
    terminalprint in 'effect/print/terminalprint',
    kpsetup in 'setup/kpsetup',
    kpcreate in 'create/kpcreate',
    kpbuild in 'build/kpbuild',
    kplog in 'log/kplog',
    kpini in 'file/kpini',
    kprun in 'run/kprun',
    kptime in 'time/kptime',
    kpstart in 'start/kpstart',
    legends in './effect/legends/legends',
    magicletter in './effect/magic/magicletter',
    kpversion in './version/kpversion',
    getkpdir in './system/getkpdir';
begin
    if (ParamCount > 0) then
    begin
        case paramStr(1) of 
            'setup' : kpsetup_run;
            'help' : kphelp_run;
            'create': kpcreate_run;
            'build': kpbuild_run;
            'log' : kplog_get;
            'run': kprun_run;
            'start' : kpstart_run;
            'legends': legends_run;
            'version': kpversion_run;
            else terminalprint_error('[Error] Unknow param (' + paramStr(1) + ') try "kodepas help" to see more param');
        end;
    end
    else 
        kphelp_run;
end.