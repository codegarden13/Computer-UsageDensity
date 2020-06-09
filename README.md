
# Enumerate Workplace - Usage
## Get a dataset about a windows machine's usage.

- Who used this computer during this year. 
- When did each of this users use this client last time. 
- Timespan (daycount) between first and last usage over all profiles which have been active this year.
- The "Magic Factor"

## Sidenotes
- Timestamp-Test are going against lastwritetime property of each user's profile. 
- Learned: This corresponds to the last file change of ntuserdat.pol of the profile.
- Ntuser.dat's timestamp is not sufficiant, as it changes at each cumulative update over all profiles. (Presents of this file is indicator that the folder is a real user profile)

## Get the "magic factor"
This should be the final indicator. Maybe there are other indicators like profile age, size ... 

Divide two results to get a maybe-relevant factor:
```
(Daycount between all last client-usages) / (count of active profiles thois year)
```
## Result:

A factor which may be usable to describe usage-density.

A date-range, when the machine has been used and from which user.

## Thesis
Factor tends to zero: one user is using the machine. 
Factor is high, more users depend on that machine in the given daterange (for now: This year)
Maxybe the factor helpd to find real "Standard - Clients"