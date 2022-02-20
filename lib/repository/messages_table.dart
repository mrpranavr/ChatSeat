import './channels_table.dart' as channels_table;
const tableName = 'messages';

// Column Names
const colId = 'id';
const colType = 'type';
const colFrom = 'from_id';
const colChannel = 'channel_fk';
const colTimestamp = 'time_millis';
const colBody = 'body';
const colUrl = 'url';
const colFileName = 'file_name';
const colFileSize = 'file_size';
const colLocalPath = 'local_path';

// Queries
const createQuery = '''
create table if not exists $tableName (
    $colId integer primary key,
    $colType smallint not null,
    $colFrom text not null,
    $colChannel integer not null references ${channels_table.tableName}(${channels_table.colId}),
    $colTimestamp integer not null,
    $colBody text,
    $colUrl text,
    $colFileName text,
    $colFileSize integer,
    $colLocalPath text,
    check (($colType = 0 and $colBody is not null) or ($colUrl is not null and $colFileName is not null, $colFileSize is not null))
  )
''';


