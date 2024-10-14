# Create log file
# Contributor 2: Ashish Balsure (22070123030)
LOG_FILE="log.txt"
touch "$LOG_FILE"

# Loop through files in the directory (Retain the loop structure from Contributor 1)
for file in *; do
  # Skip directories
  if [ -d "$file" ]; then
    continue
  fi

  # Move files to their corresponding directories based on extensions
  case "${file##*.}" in
  jpg | jpeg | png | gif)
    mv "$file" Images/
    echo "$(date): Moved $file to Images/" >>"$LOG_FILE"
    ;;
  pdf | doc | docx | txt)
    mv "$file" Documents/
    echo "$(date): Moved $file to Documents/" >>"$LOG_FILE"
    ;;
  mp3 | wav | aac)
    mv "$file" Music/
    echo "$(date): Moved $file to Music/" >>"$LOG_FILE"
    ;;
  mp4 | mkv | avi)
    mv "$file" Videos/
    echo "$(date): Moved $file to Videos/" >>"$LOG_FILE"
    ;;
  zip | tar | gz)
    mv "$file" Archives/
    echo "$(date): Moved $file to Archives/" >>"$LOG_FILE"
    ;;
  html | css | js)
    mv "$file" Web/
    echo "$(date): Moved $file to Web/" >>"$LOG_FILE"
    ;;
  *)
    mv "$file" Other/
    echo "$(date): Moved $file to Other/" >>"$LOG_FILE"
    ;;
  esac
done
