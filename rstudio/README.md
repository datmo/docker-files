To run this environment:

1. Run the following command in the directory containing the dockerfile:
`/usr/lib/rstudio-server/bin/rserver --server-daemonize=0 --server-app-armor-enabled=0`

2. In your browser, go to `localhost:8787`

3. If prompted, enter the username and password for the RStudio server (`rstudio`/`rstudio`)

4. To close the container running RStudio, jump back to the terminal and press `CTRL+C` twice to exit the process.