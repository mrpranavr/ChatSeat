import 'package:onionchatflutter/repository/messages_table.dart' as messages_table;

const tableName = 'channels';
const viewName = 'ch_view';

// Column Names
const colId = 'id';
const colName = 'name';
const colAvatarFilePath = 'avatar_file';
const colLastViewedTimeStamp = 'last_viewed_time_millis';

const vColLastMessage = 'last_message';
const vColUnreadCount = 'unread_count';

// Queries
const createQuery = '''
create table $tableName if not exists (
    $colId integer primary key,
    $colName text not null,
    $colAvatarFilePath text,
    $colLastViewedTimeStamp integer not null
)
''';

const createViewQuery = '''
create view ch_view
as
select 
    $colId, 
    $colName, 
    $colAvatarFilePath, 
    $colLastViewedTimeStamp, 
    ${messages_table.tableName}.${messages_table.colBody} as $vColLastMessage, 
    unread_counter.unread as $vColUnreadCount
from
    $tableName
inner join ${messages_table.tableName} on $tableName.$colId = ${messages_table.tableName}.${messages_table.colChannel}
inner join (
    select 
       $tableName.$colId as channel, 
       count(${messages_table.tableName}.${messages_table.colId}) as unread
    from 
        ${messages_table.tableName}.${messages_table.tableName} 
    inner join $tableName on 
            $tableName.$colId = ${messages_table.tableName}.${messages_table.colChannel}
    where 
        ${messages_table.tableName}.${messages_table.colTimestamp} > $tableName.$colLastViewedTimeStamp
    group by $tableName.$colId
) as unread_counter on $tableName.$colId = unread_counter.channel
group by $tableName.$colId;
''';

