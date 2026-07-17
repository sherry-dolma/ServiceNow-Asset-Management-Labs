# 🚀 ServiceNow HAM: Automated Hardware Data Governance Project

## 📌 Project Overview
In a real-world ServiceNow environment, inconsistent data entry (typos, non-standard naming) leads to "dirty" CMDB data, which causes errors in procurement, auditing, and lifecycle management.

This project demonstrates my proficiency in **ServiceNow Hardware Asset Management (HAM) Professional**, specifically implementing **automated normalization logic** to transform inconsistent data into industry-standard records.

---

## 🛠️ The Challenge: "Dirty" Data Entry
I simulated a common user error where an asset model was created with typos and missing identifiers.

- **Manufacturer Entry:** `Appel Inc` (Typo)
- **Model Name:** `Macbook 15 inch 2022`
- **Result:** The system status shows **"Match Not Found"**. Without normalization, this asset is "invisible" to the global library.

**[IMAGE 1:
*Caption: Initial record entry showing unnormalized status.*

---

## ⚙️ The Solution: Configuring the Content Service
To resolve this, I configured the **ServiceNow Content Service**. By opting into this service, the instance connects to the ServiceNow Global Content Library (a master database of millions of hardware models).

- **Action:** Enabled Data Sharing & Opt-in.
- **Benefit:** Allows the system to pull standard manufacturer names, lifecycle dates, and product details automatically.

**[IMAGE 2:
*Caption: Configuration of the HAM Content Service engine.*

---

## ✅ The Result: Automated Normalization
By adding the industry-standard unique identifier (**Model Number: A2485**), the normalization engine was triggered.

### **The Transformation:**
1. **Manufacturer Auto-Corrected:** Changed from `Appel Inc` to `Apple`.
2. **Data Standardized:** The record is now aligned with official product specifications.
3. **Status:** Changed to **Normalized**.

**[IMAGE 3:
*Caption: The standardized, fully normalized record.*

---

## 📈 Business Impact
- **Reporting Accuracy:** 100% visibility into actual hardware stock.
- **Cost Savings:** Accurate tracking of End-of-Life (EOL) and End-of-Support (EOS) dates to prevent emergency hardware spend.
- **Automation:** Reduced manual data cleanup time for Asset Managers.

---
**Technical Skills:** ServiceNow HAM Pro, Data Normalization, CMDB Governance, Content Library Management.
