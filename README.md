# Devops-automation-toolkit
# PRESENTED BY: MEHAKPREET KAUR
 # 1.What is a repository?
- A repository (repo) is a storage location where project files, source code, configuration files, and version history are managed using Git.
It contains:

Project files


Commit history


Branches


Contributors


Version tracking (.git directory)

# 2. What are the types of repositories?
- There are two main types:

1. Local Repository

Stored on your computer

Created using:

 git init

Used for development and testing

2. Remote Repository

Hosted on platforms like GitHub


Used for collaboration


Connected using:

 git remote add origin <repository-url>

# 3.  Difference between Public and Private repository.
 
#  1.Visibility
           Public: Anyone on the internet can view the code.
            Private: Only authorized users can view the code.
 # 2. Access Control
           Public: Read access is open to everyone
           Private: Access is restricted to selected collaborators.
 
# 3. Collaboration
           Public: Anyone can fork and suggest changes (via pull requests).
           Private: Only invited members can contribute.
  
# 4 .Use Case
         Public: Open-source projects, portfolios, community contributions.
         Private: Company projects, confidential code, internal tools.


# 5. Security Level
           Public: Code is exposed; not suitable for sensitive data.
           Private: Code is protected; suitable for proprietary projects.


# 6. Cost (Platform Dependent)
            Public: Usually free.
            Private: May require a paid plan for advanced features (depending on platform).


# 7. Searchability
          Public: Searchable and discoverable by anyone.
          Private: Not searchable by the public.


# 8. Forking
        Public: Can be forked by anyone.
        Private: Cannot be forked publicly without permission


     # 4. What does cloning do?

- Cloning creates a complete copy of a remote repository on your local machine. It downloads all files, branches, and commit history.

Command:
git clone https://github.com/username/devops-automation-toolkit.git

# 4. What is the origin in Git?
- Origin is the default name given to the remote repository when you clone a project. It acts as a reference to the GitHub repository.


Check origin:
git remote -v

# 5. What is the staging area in Git?
- The staging area (also called the index) is an intermediate area where changes are prepared before committing. When we use git add, the selected files are moved to the staging area. After that, git commit saves those staged changes permanently to the repository history.

# 6.  Why should developers avoid working directly on the main branch?

 Developers should avoid working directly on the main branch because:
- The main branch should remain stable and production-ready.
- Direct changes can introduce bugs.
- Feature branches allow testing and code review before merging.
- It prevents breaking the live project.

 # 7. write set-up script
  #!/bin/bash

  #- Variables
PROJECT_NAME="devops-automation-toolkit"

SCRIPTS_DIR="scripts"

LOGS_DIR="logs"

BACKUP_DIR="backup"

LOG_FILE="$LOGS_DIR/setup.log"

echo "Starting setup..."

#- Create directories if not exist

for dir in $SCRIPTS_DIR $LOGS_DIR $BACKUP_DIR

do
    
    if [ ! -d "$dir" ]; then
        mkdir -p $dir
        echo "$dir directory created." >> $LOG_FILE
    else
        echo "$dir directory already exists." >> $LOG_FILE
    fi
done

#- Create sample files
 for file in sample1.txt sample2.txt
 do
 
    touch $BACKUP_DIR/$file
    echo "Sample content for $file" > $BACKUP_DIR/$file
done



#- Completion message
 
 echo "Setup completed successfully!"
echo "Setup completed on $(date)" >> $LOG_FILE

# 8. backup script

#!/bin/bash

#- Variables

PROJECT_DIR=$(pwd)

BACKUP_DIR="backup"

DATE=$(date +%Y_%m_%d)

BACKUP_FILE="$BACKUP_DIR/backup_$DATE.tar.gz"

LOG_FILE="logs/backup.log"

echo "Starting backup..."

#- Create backup directory if not exists

if [ ! -d "$BACKUP_DIR" ]; then

    mkdir -p $BACKUP_DIR
fi

#- Compress project files

tar -czf $BACKUP_FILE . --exclude=$BACKUP_DIR --exclude=.git

echo "Backup created: $BACKUP_FILE" >> $LOG_FILE

#- Delete backups older than 7 days

find $BACKUP_DIR -name "*.tar.gz" -type f -mtime +7 -exec rm -f {} \;

echo "Old backups deleted." >> $LOG_FILE

echo "Backup completed successfully!"

# 9. monitoring script

#!/bin/bash

LOG_FILE="logs/monitor.log"

echo "System Monitoring Report - $(date)"

echo "-----------------------------------"

echo "Disk Usage:"

df -h


echo ""

echo "Memory Usage:"

free -h

echo ""

echo "Logged-in Users:"

who


echo ""

echo "Top Running Processes:"

top -b -n 1 | head -10

echo "Monitoring executed on $(date)" >> $LOG_FILE

# 10. Menu-script 

#!/bin/bash

#- Variables

SETUP_SCRIPT="./scripts/setup.sh"

BACKUP_SCRIPT="./scripts/backup.sh"

MONITOR_SCRIPT="./scripts/monitor.sh"

#- Functions

run_setup() {

    bash $SETUP_SCRIPT
}

run_backup() {
  
    bash $BACKUP_SCRIPT
}

run_monitor() {
    
    bash $MONITOR_SCRIPT
}

#- Menu Loop

while true

do

    echo "-----------------------------"
    echo " DevOps Automation Toolkit "
    echo "-----------------------------"
    echo "1. Setup Environment"
    echo "2. Backup Files"
    echo "3. Monitor System"
    echo "4. Exit"
    echo "-----------------------------"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            run_setup
            ;;
        2)
            run_backup
            ;;
        3)
            run_monitor
            ;;
        4)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Try again."
            ;;
    esac
done
# 11. When should developers use git diff?
    
     - Developers use git diff before committing to:
    -Review file modifications
    -Compare working directory changes with last commit
    -Check staged vs unstaged changes
    -Avoid committing unwanted changes


     # 12. What information does git log show?

git log shows:

Commit hash (SHA)

Author name and email

Commit date

Commit message

Branch history (when using options)

# 13. diff bet fetch and pull

git fetch downloads changes from the remote repository.

git pull downloads changes and merges them into your current branch.

git fetch does NOT modify your working files.

git pull updates your working directory automatically.

git fetch is safer because it lets you review changes first.

git pull can cause merge conflicts immediately.

After git fetch, you must run git merge manually.

git pull = git fetch + git merge.

# 14. What is the difference between merge and rebase?
 - git merge
 
 git merge combines two branches and creates a new merge commit.

 It keeps the complete history of both branches.
 - git rebase
 git rebase moves (replays) your branch commits on top of another branch. 

 It creates a linear history.
# 15. Why do open-source projects use forks?
- Open-source projects use forks because:

 1️. Safe Contribution

Contributors do not get direct write access to the original repository.

2️. Protect Main Code

The main project remains stable and secure.

3️. Independent Development
Developers can experiment without affecting the original project.

4️. Code Review System

Pull Requests allow maintainers to:

Review code

Suggest improvements

Maintain quality

5️. Collaboration at Scale

Thousands of contributors can work on the same project safely.

# 16. Why should log files usually not be stored in Git?

- Log files should usually not be stored in Git because:

1️. They Change Frequently

Logs update constantly, creating unnecessary commits.

2️. They Increase Repository Size

Logs can grow very large over time.

3️. They Are Auto-Generated

They are generated by applications and can be recreated anytime.

4️. They Create Merge Conflicts

Multiple developers generating logs can cause conflicts.

5️. They May Contain Sensitive Data

Logs can contain:

IP addresses

System paths

Error traces

Use fetch when you want control; use pull when you want automatic update.



