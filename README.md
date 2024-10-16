# File Organizer Script

## Motivation

Keeping files organized is essential, especially when dealing with a cluttered directory containing multiple file types. Manually organizing files can be tedious and time-consuming. The *File Organizer Script* automates this process by sorting files based on their extensions into designated folders, making file management simpler and more efficient.

## Background Information

This project aims to streamline the task of organizing files in a directory by categorizing them into predefined folders based on file extensions. It uses basic bash commands and introduces file logging to track moved files.

### Features:
- Automatically categorizes files into folders like Images, Documents, Music, etc.
- Handles multiple file extensions for each type.
- Logs file movements into a log file.

## Proposed Method

The *File Organizer Script* follows these steps:

1. **Create directories** for different file types such as Images, Documents, Music, Videos, etc.
2. **Iterate through files** in the directory.
3. **Move files** based on their extension to the appropriate directory.
4. **Log each file movement** to keep track of the organization process.

### Final Code:

```bash
# Directory to organize (Initial part of the script)
DIR_TO_ORGANIZE="$1"

# Check if directory is provided
if [ -z "$DIR_TO_ORGANIZE" ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

# Change to the specified directory with error handling
cd "$DIR_TO_ORGANIZE" || { echo "Directory not found or not accessible!"; exit 1; }

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
        jpg|jpeg|png|gif)
            mv "$file" Images/ && echo "$(date): Moved $file to Images/" >> "$LOG_FILE"
            ;;
        pdf|doc|docx|txt)
            mv "$file" Documents/ && echo "$(date): Moved $file to Documents/" >> "$LOG_FILE"
            ;;
        mp3|wav|aac)
            mv "$file" Music/ && echo "$(date): Moved $file to Music/" >> "$LOG_FILE"
            ;;
        mp4|mkv|avi)
            mv "$file" Videos/ && echo "$(date): Moved $file to Videos/" >> "$LOG_FILE"
            ;;
        zip|tar|gz)
            mv "$file" Archives/ && echo "$(date): Moved $file to Archives/" >> "$LOG_FILE"
            ;;
        html|css|js)
            mv "$file" Web/ && echo "$(date): Moved $file to Web/" >> "$LOG_FILE"
            ;;
        *)
            mv "$file" Other/ && echo "$(date): Moved $file to Other/" >> "$LOG_FILE"
            ;;
    esac
done

echo "Files organized successfully!"
