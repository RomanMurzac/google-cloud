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
Create an airflow job to read data from BigQuery for last hour and store it into new BQ table and GCS bucket. Airflow job should be running hourly. Create a query to get data from BQ table for last hour and calculate new column base on the data. Query should be put into af_task_query.sql file. Source table for the job should be Dataflow output table. GCS file format should be NEW_LINE_DELIMITED_JSON. Output BQ table and GCS bucket should be deployed by terraform. To finish this task deploy a composer in the GCP project. Composer could be deployed manually from GCP console (without terraform).


#### Content:
- Folder *schemas*:
  - File *task-af.json*
- Folder *sql*:
  - File *af_task_query.sql*
- Files:
  - *af_task_dag.py*
  - *cloudbuild.yaml*
  - *main.tf*
  - *variables.tf*
