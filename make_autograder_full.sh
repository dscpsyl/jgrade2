#! /usr/bin/env bash

# This script is used to create the autograder.zip file for the autograder
# submission on Gradescope. 
echo "Creating autograder.zip file for Gradescope submission..."
echo "--------------------------------------------------"

echo "Making jGrade2 jar file..."
./mvnw clean package -DskipTests

echo "Copying jGrade2 jar file to examples/gradescope/lib/..."
cp target/jgrade2-2.0.0-a2-all.jar examples/gradescope/lib/

echo "Zipping up autograder files..."
cd examples/gradescope || exit
zip -r autograder.zip lib/ res/ src/ compile.sh run.sh setup.sh run_autograder
mv autograder.zip zips/

echo "Moving autograder.zip file to root directory..."
mv zips/autograder.zip ../../

echo "Cleaning up..."
rm lib/jgrade2-2.0.0-a2-all.jar
cd ../..

