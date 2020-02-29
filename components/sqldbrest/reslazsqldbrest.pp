unit reslazsqldbrest;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

Resourcestring
  SSQLDBRESTModule = 'SQLDB REST Bridge Module';
  SSQLDBRESTModuleDesc = 'SQLDB REST Bridge: A Web datamodule for producing strict HTML.';
  SExposeAConnection = 'Expose a connection';
  SSaveSettingsToIni = 'Save settings to INI file';
  SLoadSettingsFromIni = 'Load settings from INI file';
  SJSONFilesFilter = 'Schema files|*.srs|JSON Files|*.json|All files|%s';
  SSaveSchemaToJSONFile = 'Save schema to JSON file';
  SLoadSchemaFromJSONFile = 'Load schema from JSON file';
  SLoadSchemaFromConnection = 'Load schema from connection';
  SErrNoConnectionsFound = 'No connections found on form/frame or datamodule';
  SAddedNTables = 'Added %d tables as resources';
  SClearSchema = 'Clear schema';
  SEditSchema = 'Edit schema';
  SConnectionsChangedUpdateDispatcher = 'The list of connections was modified. %s'+
                                        'Do you wish to update the dispatcher connection list?';

implementation

end.

