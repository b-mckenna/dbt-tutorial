-- reads lead_scoring.csv from bigquery
-- splits it into multiple tables 

--todo: move dbt project to continual-dev so you can run dml (Billing has not been enabled for this project. Enable billing at https://console.cloud.google.com/billing. DML queries are not allowed in the free tier. Set up a billing account to remove this restriction.
)
-- populate cookie with random variable
--TODO: website_table(session_id, session_duration, cookie)
--TODO: create converted table
-- Converted - The target variable. Indicates whether a lead has been successfully converted or not.

-- TODO: Figure out a relational table structure (how are the tables related or connected? Will they all have the prospect_ID?)
-- TODO: create some fake data to add to the tables that you can then edit out in your dbt pipeline
-- TODO: figure out how to build a feature set in continual 
-- TODO: converted wouldn't just appear out of no where. it would be derived from payment system or something. 

create table `airy-phalanx-334500.dbt_brendan.prospects` as(
    select Prospect_ID
    from `airy-phalanx-334500.dbt_brendan.lead_scoring`
);

ALTER TABLE `airy-phalanx-334500.dbt_brendan.prospects`
  ADD cookie string(50) NULL;
UPDATE `airy-phalanx-334500.dbt_brendan.prospects` SET cookie = NEWID();


create table `airy-phalanx-334500.dbt_brendan.useractivity` as(
    select Prospect_ID
    , TotalVisits
    , Total_Time_Spent_on_Website
    , Page_Views_Per_Visit
    from `airy-phalanx-334500.dbt_brendan.lead_scoring`
);

create table if not exists `airy-phalanx-334500.dbt_brendan.course_survey_responses` as(
    select Prospect_ID
    , Country
    , Specialization
    , City
    , How_did_you_hear_about_X_Education
    , What_matters_most_to_you_in_choosing_a_course
    , What_is_your_current_occupation
    , Through_Recommendations
    , Receive_More_Updates_About_Our_Courses
    , Search
    , Magazine
    , Newspaper_Article
    , X_Education_Forums
    , Newspaper
    , Digital_Advertisement
    , I_agree_to_pay_the_amount_through_cheque
    , a_free_copy_of_Mastering_The_Interview
    , Update_me_on_Supply_Chain_Content
    , Get_updates_on_DM_Content
    from `airy-phalanx-334500.dbt_brendan.lead_scoring`
);

create table if not exists `airy-phalanx-334500.dbt_brendan.sales_leads` as(
    select Prospect_ID
    , Lead_Number
    , Lead_Origin
    , Lead_Source
    , Lead_Quality
    , Lead_Profile
    , Tags
    from `airy-phalanx-334500.dbt_brendan.lead_scoring`
);

create table if not exists `airy-phalanx-334500.dbt_brendan.marketing` as(
    select Prospect_ID
    , Do_Not_Email
    , Do_Not_Call
    , Last_Activity
    , Last_Notable_Activity
    from `airy-phalanx-334500.dbt_brendan.lead_scoring`
);

create table if not exists `airy-phalanx-334500.dbt_brendan.lead_analytics` as(
    select Prospect_ID
    , Asymmetrique_Activity_Index
    , Asymmetrique_Profile_Index
    , Asymmetrique_Activity_Score
    , Asymmetrique_Profile_Score
    from `airy-phalanx-334500.dbt_brendan.lead_scoring`
);

create table `airy-phalanx-334500.dbt_brendan.prospects` as(
    select Prospect_ID
    from `airy-phalanx-334500.dbt_brendan.lead_scoring`
);

ALTER TABLE `airy-phalanx-334500.dbt_brendan.prospects`ADD column cookie string;
UPDATE `airy-phalanx-334500.dbt_brendan.prospects` SET cookie = NEWID();
