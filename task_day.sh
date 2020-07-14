#!/bin/bash
echo "
################################################################################
# Project Overview                                                             #
################################################################################

- Capacity Estimate
- Project Estimates
- Task Estimates
- Current Task Status

+------------------------------------------------------------------------------+
+ Capacity Estimate                                                            +
+------------------------------------------------------------------------------+

Today's Date....................:`date +"%e %B %Y, %r"`
Current Project Count...........: `task summary | sed '$!d'`
Tasks Pending...................: `task stats | grep "Pending" | awk '{print $2}'`
Tasks Waiting...................: `task stats | grep "Waiting" | awk '{print $2}'`

+------------------------------------------------------------------------------+
+ Project Estimates                                                            +
+------------------------------------------------------------------------------+

Overall Net Fix Rate............: `task burndown.daily | grep "Net Fix Rate" | awk '{print $4;}'`
Overall Estimated Completion....: `task burndown.daily | grep "Estimated completion" | awk '{print $3" - "$4}'`
Task Time Tracked This Week.....: `timew summary :week | awk '{print $NF}' | tail -n 2 | head -n 1`

+------------------------------------------------------------------------------+
+ Task Estimates                                                               +
+------------------------------------------------------------------------------+

Avg Task Added per Month........: `task history.monthly | grep "Average" | awk '{print $2}'`
Avg Task Completed per Month....: `task history.monthly | grep "Average" | awk '{print $3}'`
Avg Task Deleted Per Month......: `task history.monthly | grep "Average" | awk '{print $4}'`
Avg Task Net per Month..........: `task history.monthly | grep "Average" | awk '{print $5}'`

+------------------------------------------------------------------------------+
+ Current Task Stats                                                           +
+------------------------------------------------------------------------------+

Active Project..................: `task active | awk 'NR==4' | awk '{print $5"..."}'`
Active Task Count...............: `task active | sed '$!d'`
Time Started....................: `timew | grep "Started" | awk '{print $2}'`
Time Worked.....................: `timew | grep "Total" | awk '{print $2}'`
"

