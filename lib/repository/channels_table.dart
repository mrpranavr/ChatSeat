
const tableName = 'channels';

// Column Names
const colId = 'id';
const colName = 'name';
const colAvatarFilePath = 'avatar_file';
const colLastViewedTimeStamp = 'last_viewed_timestamp';

// Queries
const createQuery = '''
create table $tableName (
    $colId integer primary key,
    $colName text not null,
    $colAvatarFilePath text,
    $colLastViewedTimeStamp integer not null
)
''';


