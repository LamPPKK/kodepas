unit kptime;
interface
    uses crt, sysutils, DateUtils;
    function kptime_do(time_start, time_end: TDateTime): int64;
implementation
    function kptime_do(time_start, time_end: TDateTime): int64;
    var time : int64;
    begin   
        time := MilliSecondsBetween(time_start, time_end);
        exit(time);
    end;
end.