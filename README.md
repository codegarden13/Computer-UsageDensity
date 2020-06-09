# Analyzing Usage of a Workplace
This will make a number from users and their last usage of that computer.

- Who has been using this computer during this year. 
- When did each of them use it last time. 
- Get the timespan between first and last usage over all profiles which have been active this year.

Testing was done against last writetime of each user profile. This point in time corresponds to the last file change of ntuserdat.pol in the profile.
Ntuser.dat was not sufficiant: It changes at each cumulative update over all profiles.

## Divide results to get a valid factor
- the count of days between all that last usages
- with the count of that active profiles

## Final Result:

A factor which may be usable to describe usage-density.

A daterange, when the machine has been used and from wchich user.

If the factor is low, one user is using the machine. 
Is ist high, more users depend on that Machine in the given daterange (for now: This year)