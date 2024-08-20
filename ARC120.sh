gcloud compute instances create my-instance \
    --machine-type=e2-medium \
    --zone=$ZONE \
    --image-project=debian-cloud \
    --image-family=debian-11 \
    --boot-disk-size=10GB \
    --boot-disk-type=pd-balanced \
    --create-disk=size=100GB,type=pd-standard,mode=rw,device-name=additional-disk \
    --tags=http-server
gcloud compute disks create mydisk \
    --size=200GB \
    --zone=$ZONE
gcloud compute instances attach-disk my-instance \
    --disk=mydisk \
    --zone=$ZONE
gcloud compute ssh my-instance --zone=$ZONE --quiet
