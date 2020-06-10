
# Enumerate Workplace - Usage
Get data about each windows machine's usage in an organisation.

- Who used this computer during this year. 
- When did each of this users use this client last time. 
- Timespan (daycount) between first and last usage over all profiles which have been active this year.
- "Magic Factor" - result of profile changes in the usage timespan: Count of using users, count of usage days over all days for the queried timespan.


## Sidenotes
- Timestamp-Test are going against lastwritetime property of each user's profile. 
- Learned: This corresponds to the last file change of ntuserdat.pol of the profile.
- Ntuser.dat's timestamp is not sufficiant, as it changes at each cumulative update over all profiles. (Presents of this file is indicator that the folder is a real user profile)

## Get the "magic factor"
This should be the final indicator. Maybe there are other indicators like profile age, size ... 

```
(Daycount between client-usages this year) / (count of active profiles this year)
```
## Results:

- "magic factor": may be usable to describe usage-density.
- Usage-Date-Range: When has the machine been used from which user over the queried year.

## not implemented yet
- Find the master user 
- Enumerate terminal server usage
- Query dateranges more precise