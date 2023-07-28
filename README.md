# GitLab CI/CD Pipeline Configuration

This repository contains a GitLab CI/CD pipeline configuration that deploys code to a remote server via SSH.

## Variables

The pipeline uses the following variables:

- `SSH_HOST`: The hostname of the remote server.
- `SSH_USER`: The username to use for the SSH connection.

These variables are prompted for when the script starts.

## Stages

The pipeline consists of a single stage: `deploy`.

## Jobs

The `deploy` job uses the `alpine:latest` Docker image and runs on the `api`, `web`, and `triggers` branches. It uses the `enable_ssh.sh` script to set up SSH before running the main script.

## Usage

To use this pipeline, uncomment the line in the `script` section and replace `<path to script>` with the path to your script.

If you want to assign a specific runner for this job, uncomment the `tags` line and replace `<runner_tag>` with your runner tag.

## After Script

The `after_script` section contains commands that should be run after all jobs.

## Contributing

If you have suggestions for improving the pipeline, please open an issue or submit a pull request.

