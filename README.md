# dbt-camunda
DBT transforms to turn your Camunda data into insight
=======
Welcome to your new dbt project!

## Models
This package contains staging models, fact models, dimension models and several example reports for Camunda Workflow management system.
The package intended to work along with the Airbyte camunda_history connector.

## Installation Instructions

Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions, or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.

Include in your `packages.yml`

```yaml
packages:
  - package: metaops-solutions/dbt-camunda
    version: ["0.0.5"]
```

## Configuration

### Source Data Location
Configure the schema for the source data via project variable src_schema which is set to "public" by default
Package expects Data to be present as it was ingested with camunda_history Airbyte connector and schema for this connector defined in models/staging/schema.yml

### Using the starter project

Try running the following commands:
- dbt run
- dbt test

## Database Support

This package has been tested on Postgres, Redshift and Snowflake


### Resources:
- Learn more about [Camunda](https://docs.camunda.org/)
- Use the [Airbyte Connector](https://github.com/metaops-solutions/airbyte-camunda) to extract history events from Camunda
