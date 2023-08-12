function apply_cron(){
su - root <<!
master
crontab -r
crontab -l > list_job_root_01
cat /Area_cron/list_job_root_01 >> list_job_root_01
crontab list_job_root_01
rm list_job_root_01 -f
crontab -l
!
}

