# Create directories for different file types (Extend this section)
# Arjunsingh Gautam (22070123043)
# Contributor 1
mkdir -p Images Documents Music Videos Archives Web Other

# Loop through files in the directory (Keep the loop structure intact)
for file in *; do
  # Skip directories
  if [ -d "$file" ]; then
    continue
  fi

  # Move files to their corresponding directories based on extensions
  case "${file##*.}" in
  jpg | jpeg | png | gif)
    mv "$file" Images/
    ;;
  pdf | doc | docx | txt)
    mv "$file" Documents/
    ;;
  mp3 | wav | aac)
    mv "$file" Music/
    ;;
  mp4 | mkv | avi)
    mv "$file" Videos/
    ;;
  zip | tar | gz)
    mv "$file" Archives/
    ;;
  html | css | js)
    mv "$file" Web/
    ;;
  *)
    mv "$file" Other/
    ;;
  esac
done
