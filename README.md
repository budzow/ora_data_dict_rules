# ora_data_dict_rules
PL/SQL sample triggering SonarQube rules based on Oracle Data Dictionary (S3641, S3921, S3618, S3651).

The project can be used to create database objects and illustrate SonarQube PL/SQL analysis triggering rules
based on Oracle Data Dictionary (S3641, S3921, S3618, S3651).

Once the `dict_rules_final.sql` script is executed under the given schema
the analysis can be configured similarly to what we see in `sonar-project.properties`.

(We assume that the Oracle driver is present in the folder from which the analysis is triggered).

See: https://docs.sonarsource.com/sonarqube/latest/analyzing-source-code/languages/pl-sql/#data-dictionary
