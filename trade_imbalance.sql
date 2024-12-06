WITH trade_aggregated AS (
    SELECT
        country_group,
        year,
        SUM(exports) AS total_exports,
        SUM(imports) AS total_imports,
        SUM(exports - imports) AS trade_balance
    FROM
        trade_data
    WHERE
        country_group IN ('BRICS', 'US', 'EU', 'UK')
    GROUP BY
        country_group, year
)
SELECT
    country_group,
    year,
    total_exports,
    total_imports,
    trade_balance,
    CASE
        WHEN trade_balance > 0 THEN 'Surplus'
        ELSE 'Deficit'
    END AS trade_status
FROM
    trade_aggregated
ORDER BY
    year, country_group;
