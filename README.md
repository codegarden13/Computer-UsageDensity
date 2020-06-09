# Analyzing Usage of a Workplace
This will make a number from users and their last usage of that computer.

- Check what Users have been using this computer this year. 
- Find out when each of them used it last time. 
- Get the Timespan between first and lasdt usage over all profiles

Testing was done against last writetime of each user profile. This point in time correspons to the last file change of ntuserdat.pol in the profile.
Ntuser.dat was not sufficiant as it changes at each cumulative update fur all ntuser.dat.

You may divide 
- the count of days between all that last usages
- with the count of that active profiles

## Result:

A factor which may be usable to describe usage-density.

A daterange, when the machine has been used and from wchich user.

If the factor is low, one user is using the machine. 
Is ist high, more users depend on that Machine in the given daterange (for now: This year)