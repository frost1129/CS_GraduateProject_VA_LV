## 1. HOW TO BACKUP DATABASE/SCHEMA
- Step 1: Use MYSQL Workbench to connect to the current database.
- Step 2: Select 'Server' > 'Data Export'
- Step 3: Specify 'Tables to Export'
- Step 4: At 'Export Options', choose 'Export to Self-Contained File'


## 2. WHERE TO STORE BACKUP FILES
- Store the exported file in 'backup_db' folder.


## 3. WHAT IS 'current_db' FOLDER FOR
- This folder store **ONLY 1** backup file to use to init database/schema on new MySQL Container creation. 
- The stored file can be stored with any name (doesn't have to be the same as the database).