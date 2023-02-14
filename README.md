# Repository for GCP Retraining Program

## Content

### 1_task_cf
#### Description:
Create terraform file to deploy cloud function from task-cf folder and BigQuery table. Create Cloud Build trigger to deploy CF.

#### Content:
- Folder *function*:
  - Archive *function*
    - Files:
      - *main.py*
      - *requiements.txt*
  - Files:
    - *main.py*
    - *requirements.txt*
- Folder *schemas*:
  - File *task-cf.json*
- Files:
  - *cloudbuild.yaml*
  - *main.tf*
    
### 2_subtask_cf
#### Description:
Update CF to publish messages into PubSub topic. PubSub topic should be deployed by terraform.

#### Content:
- Folder *function*:
  - Files:
    - *main.py*
    - *requirements.txt*
- Folder *schemas*:
  - File *task-cf.json*
- Archive *function*
    - Files:
      - *main.py*
      - *requiements.txt*
- Files:
  - *cloudbuild.yaml*
  - *main.tf*

### 3_task_df
#### Description:
Create a dataflow job to read messages from pubsub, parse them and store to BigQuery tables. Usual messages should contain 4 fields and should be stored to data table. Error messages should contain 2 fields and should be stored to error table.


#### Content:
- Folder *df_job*:
  - Files:
    - *main.py*
    - *setup.py*
- Folder *function*:
  - Files:
    - *main.py*
    - *requirements.txt*
- Folder *schemas*:
  - Files:
    - *task-cf.json*
    - *task-df.json*
    - *task-df-error.json*
- Folder *terraform*:
  - Files:
    - *main.tf*
    - *variables.tf*
- Files:
  - *cloudbuild.yaml*

### 4_task_af
#### Description:
TBD

#### Content:
- TBD
