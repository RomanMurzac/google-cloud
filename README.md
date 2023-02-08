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
- TBD

### 3_task_df
#### Description:
TBD

#### Content:
- TBD

### 4_task_af
#### Description:
TBD

#### Content:
- TBD
