# url_mon_v1.sh Documentation

## Overview
The `url_mon` script is designed to monitor the `curl status` for a list of urls on a Solaris host. It provides observability of solaris url status into dynatrace (pre-built extension not available).

## Configuration
To configure the script, you'll need to specify the following parameters:
- `DT_ENDPOINT` - Dynatrace tenant URL with environment ID and api endpoint.
- `DT_TOKEN` - Dynatrace PAAS token with Ingest.Metrics permission.
- `HOST_IP` - The host ip of the source.
- `URL_FILE` - Absolute path to `urls.txt`.
- `PAYLOAD` - Absolute path to payload temp file.
- `Metric Name` - Metric name to be configured in the payload (recommended format: custom.app_name...)

Ensure that the configuration values follow the required format to avoid issues during execution.

## Setup Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/Mohammed-Aftab-Siddique/dynatrace-solaris-url-monitoring.git
   ```
2. Navigate to the cloned directory:
   ```bash
   cd dynatrace-solaris-url-monitoring
   ```
3. Ensure that you have the necessary permissions to execute the script:
   ```bash
   chmod +x url_mon_v1.sh
   ```
4. Create a text file which shall contain a list of urls for which the curl status has to be monitored.
      ```bash
   touch urls.txt
   ```
5. Add the urls in the text file you just created (one url in each line).
   
## Metric Overview
Metric Name(s):
 ```bash
   custom.url.status
   ```
Metric Dimensions:
 ```bash
   host & url
   ```
Metric Value:
 ```bash
   status
   ```
## Security Considerations
- Be aware of the sensitivity of the data being processed. Avoid exposing sensitive information in the output files.
- Run the script in a secure environment to prevent unauthorized access.

## Troubleshooting
- **Permission Denied**: Check that the script has appropriate execution permissions.

## Examples
To run the parser on a log file, use the following command:
```bash
./url_mon_v1.sh
```

This command will process the specified log file and ingest an output to dynatrace.

# Version History

## url_mon_v1
- Initial Release

