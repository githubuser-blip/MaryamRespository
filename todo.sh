#!/bin/sh
create() {
  read -p "enter a title for your task : " task_title
  read -p "enter a description of your task (optional) : " task_description
  read -p "enter a location for your task (optional): " task_location
  read -p "enter the due date of your task (YYYY-MM-D): " task_due_date
  read -p "enter the time of your task (HH:MM)(optional): " task_time  
  completion_marker=false
  echo 
"${task_id},${task_title},${task_description},${task_location},${task_due_date},${time}" 
>> db.txt
  echo "your task had been created sucessfully"
}
list_tasks() {
  today=$(date +%Y-%m-%d)
  echo "Completed tasks:"
  grep "Completed: true.*Due Date: $today" db.txt
  echo "Uncompleted tasks:"
  grep "Completed: false.*Due Date: $today" db.txt
}
show_task() {
  read -p "Enter the ID of the task you want to view: " task_id
  task=$(grep "^$task_id," db.txt)
  if [ -z "$task" ]; then
    echo "Task not found."
  else
    echo "Task ID: ${task_id}"
    echo "Title: $(echo "$task" | cut -d, -f2)"
    echo "Description: $(echo "$task" | cut -d, -f3)"
    echo "Location: $(echo "$task" | cut -d, -f4)"
    echo "Due Date: $(echo "$task" | cut -d, -f5)"
    echo "Completed: $(echo "$task" | cut -d, -f6)"
  fi
}
list(){
   cat db.sh
}
update(){
   read -p "Enter the id of the task you want to update: " task_id
   
   if ! grep -q "^$task_id," "$db.txt"
   then
   echo"Task not found">&2
   fi

   read -p "Enter a new title for your task :" new_title
   read -p "Enter a new description of your task :" new_description
   read -p "Enter a new location for your task :" new_location
   read -p "Enter a new date of your task :" new_date
   read -p "Enetr a new time of your task :" new_time
   read -p "This task is completed ? (yes/no) :" new_completion_marker
   
   if [ -n "$new_date" ]
   then
     if ! date -d "$new_date" &>/dev/null 
     then
       echo "Invalid time. Please enter a valid time in the format HH:MM." 
>&2
      fi
    fi
if [ -n "$new_time" ]
   then 
   if ! date -d "$new_date $new_time" $> /dev/null
   then 
      echo"Invalid time. Please enter a valid time time in the format 
HH:MM." 
>&2
   fi
fi
sed -i 
"/^^$task_id,/s/\(.*)$/\1,$new_title,$new_description,$new_location,$new_date,$new_time,$new_completion_marker/" 
"$db.txt"

echo "Your task has been updated successfully"
}
delete(){
  read -p "Enter the id of the task you want to delete: "
  task_id=$REPLY
  if grep -q "^$task_id," db.txt
  then
    sed -i "/^$task_id,/d" db.txt
    echo "Task with Id $task_id has been deleted."
  else
    echo "Task with Id $task_id not found in the database."
  fi 
}

list_tasks_by_day(){
  read -p "Enter the date you want to list tasks for (YYYY-MM-DD): "
  read -r task_due_date
  echo "Completed tasks:"
  grep ".*Completed: true.*Due Date: ${task_due_date} .*" db.txt
  echo "Uncompleted tasks:"
  grep ".*Completed: false.*Due Date: ${task_due_date} .*" db.txt
}
search() {
   read -p "Enter the title of the task you want to search for: " 
task_title
  grep ".*Title: .*${task_title}.*" db.txt
}

if [ "$1" = "list" ]; then
  list
fi
if [ "$1" = "create" ]
then
  create
fi
if [ "$1" = "update" ]
then 
  update
fi 
if [ "$1" = "delete" ]
then
  delete
fi
if [ "$1" = "search" ]
then 
  search
fi
if [ "$1" = "list_tasks_by_day" ]
then 
   list_tasks_by_day
fi
if [ "$1" = "show_task" ]
then 
  show_task
fi
if [ "$1" = "" ]
then
  list_tasks
fi


