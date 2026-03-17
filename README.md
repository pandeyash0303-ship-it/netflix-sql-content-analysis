# 🎬 Netflix Content Analysis — SQL Project

## 📌 Project Overview
Advanced SQL analysis on Netflix's content library to solve
15 real-world business problems using PostgreSQL.
Demonstrates proficiency in data exploration, aggregation,
window functions, string manipulation, CTEs, and business
logic implementation.

---

## 🗃️ Dataset
- **Source:** Netflix Movies and TV Shows dataset
- **Table:** `netflix_details`
- **Total Records:** 8,000+ titles
- **Key Columns:** show_id, type, title, director, cast,
  country, date_added, release_year, rating, duration,
  listed_in, description

---

## 🛠️ Tools & Skills Used
- **Database:** PostgreSQL
- **Skills:** Aggregations · GROUP BY · Window Functions
  (RANK, PARTITION BY) · CTEs · ILIKE · unnest() ·
  string_to_array() · split_part() · Date Functions ·
  CASE WHEN · NULL Handling · Subqueries

---

## 📊 15 Business Problems Solved

| # | Business Problem | SQL Concepts Used |
|---|---|---|
| 1 | Count Movies vs TV Shows | GROUP BY, COUNT |
| 2 | Most common rating per type | Window Function, RANK |
| 3 | Movies released in 2020 | WHERE, Filter |
| 4 | Top 5 countries by content | unnest(), string_to_array() |
| 5 | Longest movie duration | Subquery, MAX |
| 6 | Content added in last 5 years | Date Function, INTERVAL |
| 7 | Content by director Rajiv Chilaka | ILIKE, Pattern Match |
| 8 | TV Shows with 5+ seasons | split_part(), CAST |
| 9 | Content count by genre | unnest(), GROUP BY |
| 10 | Yearly content % for India | EXTRACT, TO_DATE |
| 11 | List all documentaries | ILIKE |
| 12 | Content without a director | NULL Handling |
| 13 | Salman Khan movies last 10 years | ILIKE, Date Filter |
| 14 | Top 10 Indian actors by content | unnest(), ORDER BY |
| 15 | Classify content Good/Bad | CTE, CASE WHEN, ILIKE |

---

## 💡 Key Insights
- Movies dominate Netflix's library compared to TV Shows
- USA and India are the top content-producing countries
- Documentaries form a significant content category
- Most content without directors are TV Shows
- A measurable portion of content contains violence
  keywords — classified as sensitive content

---

## 🗂️ Project Structure
```
netflix-sql-content-analysis/
│
├── README.md                 ← Project documentation
└── Netflix_solution.sql      ← All 15 SQL queries
```

---

## 👤 Author
**Yash Pandey**
Data Analyst | IIT Guwahati Certified (NSDC) | Top Performer

🔗 [LinkedIn](https://www.linkedin.com/in/yash-pandey-0728yp/)
🔗 [GitHub](https://github.com/pandeyash0303-ship-it)
