# awk -F',' '$5 > "5000" {print}' employees.csv
# awk -F',' 'NR > 1 {count++} END {print count}' employees.csv

# awk -F',' ' $3 > "25" && $3 < "35" {print}' employees.csv

# awk -F',' ' {total += $5} END {print total / NR - 1}' employees.csv

# awk -F',' ' NR > 1 { if ($5 > max) {max=$5; emp=$2}} END {print emp}' employees.csv



#  ================================== sed =========================================
# sed -n '2,4p' employees.csv # print lines from 2 to 4
# sed -n '/IT/p' employees.csv   # print lines that match the pattern "IT"
# sed 's/IT/Globally/' employees.csv  # replace "IT" with "Globally" in the output
# sed -n '1d; p' employees.csv  # delete the first line (header) and print the rest

# sed '/Finance/d' employees.csv  # delete lines that match the pattern "Finance" and print the rest

# sed -i '2,4s/Delhi/New Delhi/p' employees.csv  # replace "Delhi" with "New Delhi" and print the modified lines
# sed '/^$/d' employees.csv  # delete empty lines and print the rest
# sed -n /Bob/,/David/p employees.csv  # print lines from "Bob" to "David" (inclusive)

# while IFS= read -r line;
# do
#     echo "$line"
# done < employees.csv

#  Write a script to monitor disk usage and send an alert.
# Find all .log files and delete older than 7 days.



# sed 's/[0-9]*/Num/p' employees.csv



# awk -F',' '{total += $5} END {print total}' employees.csv


#  =================== Practice with Awk =========================

# Print all records.
# Print only the name and salary columns.
# Print employees whose salary is greater than 60000.
# Print employees from the IT department.
# Print employees whose city is Mumbai.
# Count total number of records.
# Print only the header row.
# Print only the last column (experience).
# Print employees with age greater than 30.
# Display first 5 records.
# Print employees whose salary is between 50000 and 70000.
# Print names of employees with more than 5 years of experience.
# Calculate the average salary of all employees.
# Find the total salary of IT department.
# Count how many employees are in each department.
# Print employees whose name starts with 'A'.
# Print employees working in Delhi with salary > 50000.
# Print the highest salary.
# Print the lowest salary.
# Sort employees by salary (ascending/descending).

# =============== Answering the questions with Awk =================
# awk -F',' '{print}' employees.csv
# awk -F',' '{print $2, $5}' employees.csv
# awk -F',' '$5 > 6000 {print $2}' employees.csv
# awk -F',' '$4 == "IT" {print}' employees.csv
# awk -F',' '$6 == "Mumbai" {print}' employees.csv
# awk -F',' 'END {print NR - 1}' employees.csv
# awk -F',' 'NR < 2 {print}' employees.csv
# awk -F',' '{print $7}' employees.csv
# awk -F',' '$3 > 30 {print}' employees.csv
# awk -F',' 'NR > 1 && NR <= 6 {print}' employees.csv 
# awk -F',' '$5 >= 50000 && $5 <= 70000 {print}' employees.csv
# awk -F',' ' NR > 1 && $7 > 5 {print $2}' employees.csv\\
# awk -F',' '{sum += $5} END {print sum / NR - 1}' employees.csv
# awk -F',' '$4 == "IT" {total += $5} END {print total}' employees.csv
# awk -F',' 'NR > 1  {dept[$4]++} END { for (dep in dept) print dep, dept[dep]}' employees.csv
# awk -F',' 'NR > 1 && substr($2,1,1) == "A" {print}' employees.csv 
# awk -F',' '$6 == "Delhi" && $5 > 50000 {print}' employees.csv
# awk -F',' 'NR > 1 { if (max < $5 ) {max = $5; emp = $2 }} END {print emp, max}' employees.csv
# awk -F',' 'NR==2 {min=$5; emp=$2} { if (min > $5) {min = $5; emp = $2 }} END {print emp, min}' employees.csv
# awk -F',' 'NR==1{print; next} NR>1' employees.csv | sort -t',' -k5,5n



# ===================== Practice with SED ============================

# Replace "Delhi" with "NewDelhi".
# Delete the header row.
# Print only first 10 lines.
# Delete blank lines (if any).
# Replace all commas with tabs.
# Print only lines containing "IT".
# Replace salary 40000 with 45000.
# Add prefix "EMP: " to each line.
# Add suffix " - Record" to each line.
# Print only line number 5.
# Replace "Mumbai" with "Bombay" only in lines 5–15.
# Delete employees with salary less than 50000.
# Print lines between "Bob" and "David".
# Replace all numeric values with "NUM".
# Insert a new header at the top.
# Append a footer line at the end.
# Replace only the first occurrence of "IT" in each line.
# Print only even-numbered lines.
# Print only odd-numbered lines.
# Replace "HR" with "HumanResource" only in matching lines.

# =============== Answering the questions with SED =================
# sed -n 's/Delhi/NewDelhi/p' employees.csv
# sed -n '1d; p' employees.csv
# sed -n '1,10p' employees.csv
# sed '/^$/d' employees.csv
# sed 's/,/\t/g' employees.csv
# sed -n '/IT/p' employees.csv
# sed 's/40000/45000/' employees.csv
# sed 's/^/EMP: /; s/$/ - Record/' employees.csv
# sed -n '5p' employees.csv
# sed -n '5,20s/Mumbai/Bombay/p' employees.csv
# sed '/,[0-4][0-9]\{4\},/d' employees.csv



#  ================ Quesitons on the grep and find commands ===================
