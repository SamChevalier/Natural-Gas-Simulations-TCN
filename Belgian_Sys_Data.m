function ngc = Belgian_Sys_Data
% Data from 'The Gas Transmission Problem Solved by an Extension of the Simplex Algorithm'
% Code construction and edits: Dan Wu and Sam Chevalier

% Node data
ngc.node = [
... Node	Type	Load	Max Pres   Min Pres  Pres (Bar, 10^5 Pa)
	1       2       0       77         0         55.822887;
	2       2       0       77         0         55.793487;
	3       1       2.7208  80         30        55.655143;
	4       1       0       80         0         54.108114;
	5       2       0       77         0         53.027490;
	6       1       2.8014  80         30        52.277058;
	7       1       3.65    80         30        52.372622;
	8       2       0       66.2       50        59.851968;
	9       1       0       66.2       0         59.9634;
    10      1       4.42    66.2       30        58.0839;
    11      1       0       66.2       0         56.8424;
    12      1       1.472   66.2       0         54.6762;
    13      2       0       66.2       0         53.187918;
    14      2       0       66.2       0         52.982300;
    15      1       4.756   66.2       0         51.6537;
    16      1       10.84   66.2       50        50.0021;
    17      1       0       66.2       0         56.3464;
    18      1       0       77         0         70.1703;
    19      1       0.154   66.2       0         57.1941;
    20      1       1.0     66.2       25        56.5239];

% Convert Pressures to Pa
ngc.node(:,[4 5 6]) = 1e5*ngc.node(:,[4 5 6]);

% Convert flow from 10^6 m^3/day to m^3/s
ngc.node(:,3) = (1e6/(60*60*24))*ngc.node(:,3);

% Source data
ngc.source = [
... Node	Injection	Pressure      Max Flow   Min Flow
	1       7.5773      55.822887     8.0514      0;
	2       5.84        55.793487     6           0;
    5       1.955       53.027490     3.8         0;
    8       15.286      59.851968     20          0;
    13      0.833       53.187918     1.2         0;
    14      0.667       52.982300     1           0];

% Convert Pressures to Pa
ngc.source(:,3) = 1e5*ngc.source(:,3);

% Convert flow from 10^6 m^3/day to m^3
ngc.source(:,[2 4 5]) = (1e6/(60*60*24))*ngc.source(:,[2 4 5]);

% Pipeline data
ngc.pipeline = [
... From Node	To Node     Lambda            Max Flow       Flow (10^3 meter^3/day, SCM/day)  Diameter (m)  Length (km)
	1           2           4.374166          17.361         3.788642                          0.890        4;
 ...1           2           4.374166          17.361         3.788642                          0.890        4;
    2           3           2.916112          17.361         6.705308                          0.890        6;
 ...2           3           2.916112          17.361         6.705308                          0.890        6;
    3           4           0.67295           17.361         10.689783                         0.890        26;
    5           6           0.048349          17.361         1.954661                          0.5901       43;
    7           6           0.071689          17.361         -0.8467278                        0.5901       29;
    4           7           0.109421          17.361         -4.4967278                        0.5901       19;
    4           14          0.318121          17.361         6.193056                          0.890        55;
    8           9           3.499334          17.361         13.9545                           0.890        5;
 ...8           9           0.052099          17.361         1.7081                            0.3955       5;
    9           10          0.8748312         17.361         13.9321                           0.890        20;
 ...9           10          0.0130249         17.361         1.7                               0.3955       20;
    10           11         0.699865          17.361         9.9927                            0.890        25;
 ...10           11         0.0104199         17.361         1.2193                            0.3955       25;
    11           12         0.4165876         17.361         10.0318                           0.890        42;
    12           13         0.4374166         17.361         8.3798                            0.890        40;
    13           14         3.4993345         17.361         8.740278                          0.890        5;
    14           15         1.7496672         17.361         15.596                            0.890        10;
    15           16         0.699865          17.361         10.84                             0.890        25;
    11           17         0.0248093         17.361         1.1802                            0.3955       10.5;
    17           18         0.00309595        17.361         1.1802                            0.3155       26;
    18           19         0.00082137        17.361         1.1651                            0.3155       98;
    19           20         0.0134158         17.361         1.0111                            0.3155       6];

% Convert Length to meters
ngc.pipeline(:,7) = 1e3*ngc.pipeline(:,7);

% Convert flow from 10^6 m^3/day to m^3
ngc.pipeline(:,[4 5]) = (1e6/(60*60*24))*ngc.pipeline(:,[4 5]);

% Compressor data
ngc.compressor = [
... Node     Ratio    a           b           c        Max Ratio     Min Ratio     Flow      
	8        1.0175   10^(-5)     10^(-4)     0.014    4             1             13.9545;
	17       1.3028   10^(-5)     10^(-4)     0.015    4             1             1.1802];

end