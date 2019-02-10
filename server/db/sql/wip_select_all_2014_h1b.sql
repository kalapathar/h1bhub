truncate h1b2014s;

insert into h1b2014s (id, pw_1, pw_2, status, pw_unit_1, pw_unit_2, visa_class,
  pw_source_1, pw_source_2, decision_date, full_time_pos, total_workers,
  lca_case_number, lca_case_submit, yr_source_pub_1, yr_source_pub_2,
  lca_case_soc_code, lca_case_soc_name, lca_case_job_title, lca_case_naics_code,
  other_wage_source_1, other_wage_source_2, lca_case_wage_rate_to,
  lca_case_employer_city, lca_case_employer_name, lca_case_workloc1_city,
  lca_case_workloc2_city, lca_case_employer_state, lca_case_wage_rate_from,
  lca_case_wage_rate_unit, lca_case_workloc1_state, lca_case_workloc2_state,
  lca_case_employer_address, lca_case_employment_end_date, lca_case_employer_postal_code,
  lca_case_employment_start_date
  )
SELECT
id as id,
NULLIF(data->>'pw_1', '')::bigint AS pw_1,
NULLIF(data->>'pw_2', '')::bigint AS pw_2,
data->>'status' AS status,
data->>'pw_unit_1' AS pw_unit_1,
data->>'pw_unit_2' AS pw_unit_2,
data->>'visa_class' AS visa_class,
data->>'pw_source_1' AS pw_source_1,
data->>'pw_source_2' AS pw_source_2,
NULLIF(data->>'decision_date', '')::timestamp AT time zone 'UTC' AS decision_date,
data->>'full_time_pos' AS full_time_pos,
NULLIF(data->>'total_workers', '')::int AS total_workers,
data->>'lca_case_number' AS lca_case_number,
NULLIF(data->>'lca_case_submit', '')::timestamp AT time zone 'UTC' AS lca_case_submit,
NULLIF(data->>'yr_source_pub_1', '')::int AS yr_source_pub_1,
data->>'yr_source_pub_2' AS yr_source_pub_2,
data->>'lca_case_soc_code' AS lca_case_soc_code,
data->>'lca_case_soc_name' AS lca_case_soc_name,
data->>'lca_case_job_title' AS lca_case_job_title,
NULLIF(data->>'lca_case_naics_code', '')::int AS lca_case_naics_code,
data->>'other_wage_source_1' AS other_wage_source_1,
data->>'other_wage_source_2' AS other_wage_source_2,
NULLIF(data->>'lca_case_wage_rate_to', '')::bigint AS lca_case_wage_rate_to,
data->>'lca_case_employer_city' AS lca_case_employer_city,
data->>'lca_case_employer_name' AS lca_case_employer_name,
data->>'lca_case_workloc1_city' AS lca_case_workloc1_city,
data->>'lca_case_workloc2_city' AS lca_case_workloc2_city,
data->>'lca_case_employer_state' AS lca_case_employer_state,
NULLIF(data->>'lca_case_wage_rate_from', '')::bigint AS lca_case_wage_rate_from,
data->>'lca_case_wage_rate_unit' AS lca_case_wage_rate_unit,
data->>'lca_case_workloc1_state' AS lca_case_workloc1_state,
data->>'lca_case_workloc2_state' AS lca_case_workloc2_state,
data->>'lca_case_employer_address' AS lca_case_employer_address,
NULLIF(data->>'lca_case_employment_end_date', '')::timestamp AT time zone 'UTC' AS lca_case_employment_end_date,
data->>'lca_case_employer_postal_code' AS lca_case_employer_postal_code,
NULLIF(data->>'lca_case_employment_start_date', '')::timestamp AT time zone 'UTC' AS lca_case_employment_start_date
FROM temp_table_2014s;