-> alert

=== alert ===
You receive an alert that a Production SQS queue has high oldest message age.

 + Acknowledge the alert
    Now what?
    ** Restart the service
        The queue continues to grow
        -> alert
    ++ Check Datadog
        -> datadog
    ++ Check AWS
        -> aws
 * Wait for the alert to autoresolve
    ** Wait for 10 minutes
        *** -> alert
 * Turn off your phone
    Really?
        ** Yes
        Joe won't be happy
            -> END
        ** No, I was jk
            -> alert
            
=== datadog ===
* Logs
    -> problematic_task
* APM
    -> nothing_new_dd
+ Dashboards
    ** SQS
        -> nothing_new_dd
    ** Celery
        -> problematic_task

=== nothing_new_dd ===
You don't learn anything new
-> datadog

=== aws ===
* Batch
    -> nothing_new_aws
* ECS
    -> nothing_new_aws
* Cloudwatch
    -> problematic_task
* SQS
    -> nothing_new_aws

=== nothing_new_aws ===
* You don't learn anything new
    -> aws

=== problematic_task ===
* You see a spike of error logs from a specific task
    ** Rollback
        -> remediated
    ** Deploy a hotfix
        -> remediated
    ** Toggle a feature flag
        -> remediated
    
=== remediated ===
+ The errors have subsided, but the queue is still backed up
    ** Do nothing
        Really?
        *** Yes
            The queue is eventually worked off, after hours of additional and avoidable customer impact
            -> end
        *** No
            -> remediated
    ** Spin up more workers
        We catch up to current time
        -> end

=== end ===
- The incident has been resolved! Now put your postmortem hat on :)
    -> END

-> END

