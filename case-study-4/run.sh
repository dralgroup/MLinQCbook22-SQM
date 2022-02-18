#!/bin/bash

MNDO_EXE=mndo2020

if [ -z `which $MNDO_EXE` ]; then
	echo
	echo "MNDO executable not found, add it to the PATH variable or provide a full path in the script"
	echo
	exit 1
fi

# Iterate over the dimer and monomers
for s in AB A B; do
	echo Subsystem $s
	cd calculation_$s
	# Run the calculations and extract total energy and dispersion energy
	$MNDO_EXE < mndo.in | grep "^ *TOTAL ENERGY\|DISPERSION ENERGY" || echo "   CALCULATION FAILED !!!"
	cd ..
done

# Delete temporary files
rm -f */fort.15
