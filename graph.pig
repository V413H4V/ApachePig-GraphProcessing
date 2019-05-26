G = LOAD '$G' USING PigStorage(',') AS ( vertex:double, neighbor:long );
groupings = GROUP G by vertex;
count = FOREACH groupings GENERATE $0, COUNT($1);
result_grp = GROUP count BY $1;
result = FOREACH result_grp GENERATE $0, COUNT($1);
STORE result INTO '$O' USING PigStorage (' ');

