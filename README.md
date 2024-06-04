
# PicoNote

This Flutter application is designed to help users create, read, update, and delete notes. The application uses Isar Database for storing notes and provides a personalized experience with different themes, such as light and dark modes. The user interface follows Material Design principles, ensuring a clean and intuitive user experience across different screen sizes.

https://github.com/sambitskr/PicoNote/assets/87202351/15f8a9c1-06af-4986-99f1-5049a118478b

## Features

### Notes Management
- Create Note: Users can create new notes with a title and body.
- Read Notes: Users can view a list of all notes and read the content of each note.
- Update Note: Users can edit the title and body of existing notes.
- Delete Note: Users can delete notes they no longer need.
### Personalization
- Themes: Users can switch between light and dark modes for a personalized experience.
### UI/UX
- Clean Design: Follows Material Design principles for a clean and intuitive interface.
- Responsive: Ensures seamless operation on different screen sizes and orientations.

## Getting Started
### Prerequisites
- Flutter installed on your machine
### Installation
1. Clone the repository:

   ```bash
   git clone https://github.com/sambitskr/PicoNote.git

2. Set up Isar Database
- Follow the instructions for setting up Isar DB for Flutter.

## Project Structure
```bash 
lib/
│
├── components/              # Contains reusable UI components
│   ├── drawer_title.dart    # Widget for drawer title
│   ├── drawer.dart          # Widget for app drawer
│   ├── note_title.dart      # Widget to display note title
│   └── noteSettings.dart    # Widget for note settings
│
├── models/                  # Contains data models
│   ├── note_database.dart   # Note database model
│   ├── note.dart            # Note model
│   └── note.g.dart          # Generated code for note model
│
├── pages/                   # Contains the UI pages/screens
│   ├── newNotePage.dart     # Page to create a new note
│   ├── notes_page.dart      # Page displaying the list of notes
│   ├── openNotePage.dart    # Page to open and update a note
│   └── settings_page.dart   # Page for app settings
│
├── theme/                   # Contains theme-related files
│   ├── theme_provider.dart  # Provider for managing theme state
│   ├── theme.dart           # Contains theme data
│
└── main.dart                # Entry point of the application
```



## Usage
### Creating a Note
- Navigate to the "Create Note" screen from the home screen.
- Enter the note's title and body.
- Tap the "Save" button to store the note.
### Reading Notes
- All saved notes are displayed on the home screen.
- Tap on any note to view its details.
### Updating a Note
- Tap on any note to update its details.
- Update the title or body of the note.
- Tap the "Save" button to save the changes.
### Deleting a Note
- On the note detail screen, tap the "Delete" button to remove the note.
### Personalization
- Navigate to the "Settings" screen from the home screen.
- Choose between light and dark modes to personalize the theme.

## Additional Information
### Dark Mode/Light Mode
The app includes a toggle for switching between dark and light modes, providing a better user experience.
## Contact
For any queries or further assistance, please contact skrsambit@gmail.com
