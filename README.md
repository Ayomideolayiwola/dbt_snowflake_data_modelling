#Algora Sales — dbt Analytics Engineering Project


A dbt project that transforms raw transactional data in Snowflake into clean, analytics-ready models used by business stakeholders and connected to Looker Studio dashboards.

Table of Contents
What this project does
How data flows through the project
Project structure
Models
Staging layer
Prep layer

What this project does
Raw business data arrives in Snowflake every day — orders, customers, products, campaigns, returns, and ratings. That raw data is messy: column names are inconsistent, data types need casting, and business logic is buried.

This project uses dbt (data build tool) to transform that raw data step by step into clean, reliable tables that business users and dashboards can query directly. No SQL knowledge is required to use the final output — just connect your BI tool and go.

How data flows through the project
Data moves through four layers, each building on the previous:

Snowflake — RAW_BUSINESS_DATA.transactional_data_output
        │
        │  (raw source tables: orders, customers, products, etc.)
        │
        ▼
    BASE layer  →  Views — rename columns, cast types, no logic
        │
        ▼
    PREP layer  →  Tables — clean, join, derive new columns

        

Project structure
algora_sales/
├── models/
│   ├── base/           → one model per source table
│   ├── prep/           → transformations and joins



Models
Staging layer
Location: models/base/ Materialized as: Views

The staging layer is the entry point. Each model maps 1:1 to a raw source table in Snowflake. No business logic lives here — only renaming, recasting, and light categorisation. The goal is to give every downstream model a consistent, well-named starting point.

Model	Source table	What it does
stg_orders	orders	Renames and casts order header fields
stg_orderitems	orderitems	Renames and casts line-item fields
stg_customer	customer	Renames customer fields, standardises casing
stg_product	product	Renames product fields
stg_category	category	Renames category fields
stg_subcategory	subcategory	Renames subcategory fields
stg_supplier	supplier	Renames supplier fields
stg_returns	returns	Renames returns and refund fields
stg_payment_method	payment_method	Renames payment method fields
stg_customer_product_ratings	customer_product_ratings	Renames rating and sentiment fields
stg_marketing_campaigns	marketing_campaigns	Renames campaign fields
stg_campaign_product_subcategory	campaign_product_subcategory	Renames campaign-product bridge fields

Prep layer
Location: models/prep/ Materialized as: Tables

The prep layer is where the real transformation work happens. Models here join base models together, apply business logic, derive calculated columns, and produce clean, enriched records ready to feed into dimensional models.

Examples of what happens here:

Concatenating first and last name into a full name
Converting amounts from cents to dollars
Applying discount rates to get discounted prices
Classifying ratings as high / medium / low
Joining products to their categories and subcategories
Dimensional layer
Location: models/dimensional/ Materialized as: Tables
