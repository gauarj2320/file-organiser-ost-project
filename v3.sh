# Contributor 3 Bhoumik Sundaram (22070123034)
# Directory to organize (Initial part of the script)
#!/usr/bin/bash
DIR_TO_ORGANIZE="$1"

# Check if directory is provided
if [ -z "$DIR_TO_ORGANIZE" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Change to the specified directory with error handling
cd "$DIR_TO_ORGANIZE" || {
  echo "Directory not found or not accessible!"
  exit 1
}

# Create log file (This section can be kept here if needed)
LOG_FILE="log.txt"
touch "$LOG_FILE"

# Create directories for different file types (Can also be kept in Contributor 1)
mkdir -p Images Documents Music Videos Archives Web Other

# Main file organization loop (Integrate logic from Contributor 1 and Contributor 2)
for file in *; do
  # Skip directories with error handling
  if [ -d "$file" ]; then
    continue
  fi

  # Move files to their corresponding directories with logging (from Contributor 2)
  case "${file##*.}" in
  jpg | jpeg | png | gif)
    mv "$file" Images/ && echo "$(date): Moved $file to Images/" >>"$LOG_FILE"
    ;;
  pdf | doc | docx | txt)
    mv "$file" Documents/ && echo "$(date): Moved $file to Documents/" >>"$LOG_FILE"
    ;;
  mp3 | wav | aac)
    mv "$file" Music/ && echo "$(date): Moved $file to Music/" >>"$LOG_FILE"
    ;;
  mp4 | mkv | avi)
    mv "$file" Videos/ && echo "$(date): Moved $file to Videos/" >>"$LOG_FILE"
    ;;
  zip | tar | gz)
    mv "$file" Archives/ && echo "$(date): Moved $file to Archives/" >>"$LOG_FILE"
    ;;
  html | css | js)
    mv "$file" Web/ && echo "$(date): Moved $file to Web/" >>"$LOG_FILE"
    ;;
  *)
    mv "$file" Other/ && echo "$(date): Moved $file to Other/" >>"$LOG_FILE"
    ;;
  esac
done

echo "Files organized successfully!"
