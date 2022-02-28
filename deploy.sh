GOOGLE_PROJECT_ID=distributed-computing-338906
CLOUD_RUN_SERVICE=distributed-computing-338906-service
INSTANCE_CONNECTION_NAME = distributed-computing-338906:us-central1:classproject
DB_USER=root
DB_PASS=abcd
DB_NAME=test_db

gcloud builds submit -tag gcr.io/$GOOGLE_PROJECT_ID/$CLOUD_RUN_SERVICE \
--project=$GOOGLE_PROJECT_ID

gcloud run deploy $CLOUD_RUN_SERVICE \
 --image gcr.io/$GOOGLE_PROJECT_ID/$CLOUD_RUN_SERVICE \
 --add-cloudsql-instances $INSTANCE_CONNECTION_NAME \
 --updated-envvars INSTANCE_CONNECTION_NAME =$INSTANCE_CONNECTION_NAME,DB_PASS=$DB_PASS,DB_USER=$DB_USER,DB_NAME=$DB_NAME \
 --platform managed \
 --region us-central1 \
 --allow-unauthenticated \
 --project=$GOOGLE_PROJECT_ID