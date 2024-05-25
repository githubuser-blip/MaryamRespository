# MaryamRespository
# ToDo Shell Script

## Project Description
This project is a simple ToDo application implemented as a shell script. The script allows users to create, update, delete, list, show, and search tasks stored in a text file (db.txt).
The Todo application is a command-line based task management system that allows users to create, update, delete, and view tasks. The application is designed to be simple, yet powerful, and is intended for personal use.

## Design Choices

### Data Storage
- *db.txt*: Tasks are stored in a plain text file with each task consisting of multiple fields:
  - Id: Unique identifier for the task.
  - Title: The title of the task.
  - Description: A brief description of the task.
  - Location: The location where the task is to be performed.
  - Due Date: The due date of the task.
  - Completion marker: Marks the task as completed or uncompleted.
    
The file is organized in a specific format, with each task represented as a line in the file. Each line contains the task ID, title, description, location, due date, and completion status, separated by commas.

### Code Organization
- *todo.sh*: The main script containing all the functionalities.
- *db.txt*: A file that stores the tasks.

## How to Run the Program
1. *Clone the repository*:
    sh
    git clone https://github.com/githubuser-blip/MaryamRespository/edit/main/README.md
    

2. *Make the script executable*:
    sh
    chmod u+x todo.sh
    

3. *Run the script with the desired command*:
    sh
    ./todo.sh <command> or bash todo.sh
    
4.How to Run the Program

To run the Todo application, simply execute the todo.sh script in your terminal or command prompt. You can run the script with various arguments to perform different actions:

todo.sh create: Create a new task
todo.sh update <task_id>: Update an existing task
todo.sh delete <task_id>: Delete a task
todo.sh show <task_id>: View a task
todo.sh list: List all tasks
todo.sh search <title>: Search for tasks by title

##Code Organization
The code is organized into separate functions for each major feature of the application. The functions are designed to be modular and reusable, making it easier to maintain and extend the application.


## Commands
- create: Add a new task.
- update: Update an existing task.
- delete: Delete a task.
- list: lists the task.
- show_task: Show details of a specific task.
- search: Search for tasks by title.
- list_tasks_by_day: list tasks that  completed and uncompleted tasks of the current day.

##Conclusion

The Todo application is a simple, yet powerful, command-line based task management system. With its modular design and reusable code, it is easy to maintain and extend. The application is designed to be user-friendly and easy to use, making it perfect for personal use.
