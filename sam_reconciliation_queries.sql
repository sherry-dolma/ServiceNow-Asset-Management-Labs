-- ==============================================================================
-- Enterprise Software Asset Management (SAM) Reconciliation & Compliance Queries
-- Author: Tsering (Sherie) Dolma
-- Repository: ServiceNow-Asset-Management-Labs
-- Description: Queries used to normalize deployment feeds, isolate non-compliant 
--              software assets, and calculate vendor financial exposure.
-- ==============================================================================

-- 1. Identify Non-Compliant Software Assets (Audit Risk Exposure)
-- Returns all active/inactive deployments that exceed entitled licenses or lack valid contracts.
SELECT 
    Asset_ID,
    Vendor,
    Software_Title,
    Department,
    Deployment_Status,
    Device_Type,
    Installed_Licenses,
    Entitled_Licenses,
    License_Cost_USD,
    Compliance_Status
FROM sam_inventory_reconciliation
WHERE Compliance_Status = 'Non-Compliant'
ORDER BY License_Cost_USD DESC;


-- 2. Aggregate Total Financial Exposure by Vendor
-- Calculates total financial exposure and potential true-up costs per vendor for non-compliant software.
SELECT 
    Vendor,
    COUNT(Asset_ID) AS Non_Compliant_Asset_Count,
    SUM(License_Cost_USD) AS Total_Financial_Exposure_USD
FROM sam_inventory_reconciliation
WHERE Compliance_Status = 'Non-Compliant'
GROUP BY Vendor
ORDER BY Total_Financial_Exposure_USD DESC;


-- 3. Departmental Non-Compliance & Spend Breakdown
-- Summarizes where non-compliant assets are deployed across business units.
SELECT 
    Department,
    COUNT(Asset_ID) AS Total_Non_Compliant_Assets,
    SUM(License_Cost_USD) AS Total_Department_Risk_USD
FROM sam_inventory_reconciliation
WHERE Compliance_Status = 'Non-Compliant'
GROUP BY Department
ORDER BY Total_Department_Risk_USD DESC;


-- 4. License Harvesting Queue (Cost Optimization)
-- Identifies inactive user installations that can be reclaimed to reduce recurring software costs.
SELECT 
    Asset_ID,
    Vendor,
    Software_Title,
    Department,
    Deployment_Status,
    License_Cost_USD
FROM sam_inventory_reconciliation
WHERE Deployment_Status = 'Inactive' AND Installed_Licenses > 0
ORDER BY License_Cost_USD DESC;