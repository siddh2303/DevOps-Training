 #!/bin/bash

# Define the URL or API endpoint to be accessed
URL="https://myapp.local/frontend"

# Loop 1000 times
for ((i=1; i<=1000; i++))
do
    # Execute the curl command
   
    curl -k https://myapp.local/frontend 
done

echo "Completed 1000 curl requests."
