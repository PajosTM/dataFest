#FEATURE ENGINEERING 

#ATTENDANCE PERFORMANCE 
ALTER TABLE sms.academic_records
ADD COLUMN attendance_category VARCHAR(10);

SET SQL_SAFE_UPDATES = 0;
UPDATE sms.academic_records
SET attendance_category = 
    CASE 
        WHEN attendance_rate BETWEEN 80 AND 100 THEN 'High'
        WHEN attendance_rate BETWEEN 60 AND 79 THEN 'Medium'
        ELSE 'Low'
    END;


#PARENT INVOLVEMENT 
-- Add a new column for the parental engagement score, if not already present
ALTER TABLE sms.parent_involvement ADD COLUMN parental_engagement_score VARCHAR(10);


UPDATE sms.parent_involvement
SET parental_engagement_score = 
    CASE 
        WHEN Attendance = TRUE AND academic_performance = TRUE THEN 'High'
        WHEN Attendance = TRUE OR academic_performance = TRUE THEN 'Medium'
        ELSE 'Low'
    END;



# TEACHER INFLUENCE FACTOR 



#
