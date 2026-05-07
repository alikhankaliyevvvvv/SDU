# Applied Statistics -- Final Project
### Medical Insurance Cost Analysis
> **Course:** Applied Statistics &nbsp;|&nbsp; **Dataset:** [Medical Cost Personal Datasets](https://www.kaggle.com/datasets/mirichoi0218/insurance) — Kaggle

---

## Topics Covered

The project demonstrates applied competency across the following statistical and data science concepts:

- **Descriptive statistics** — measures of central tendency and spread, group comparisons
- **Probability theory** — empirical and conditional probability estimation
- **Sampling theory** — standard error, confidence intervals, bootstrapping
- **Hypothesis testing** — t-tests, p-value interpretation, Type I/II error framing
- **Effect size analysis** — Cohen's d, the distinction between statistical and practical significance
- **Correlation analysis** — Pearson coefficient, scatterplot interpretation
- **Linear & logistic regression** — coefficient interpretation, R², odds ratios
- **Model validation** — train/test split, overfitting awareness, residual analysis
- **Model comparison** — accuracy, F1-score, ensemble vs. linear models
- **SQL data exploration** — aggregations, CASE WHEN, window functions in PostgreSQL

---

## Tools

`Python` &nbsp;·&nbsp; `pandas` &nbsp;·&nbsp; `NumPy` &nbsp;·&nbsp; `SciPy` &nbsp;·&nbsp; `scikit-learn` &nbsp;·&nbsp; `Matplotlib` &nbsp;·&nbsp; `Seaborn` &nbsp;·&nbsp; `PostgreSQL` &nbsp;·&nbsp; `pgAdmin` &nbsp;·&nbsp; `DBeaver`

---

##️ Repository Contents

This repository contains all materials produced for the Applied Statistics final project. The analysis is built around a real-world medical insurance dataset (~1,300 client records, 7 features) and covers the full statistical pipeline — from raw SQL exploration to machine learning model comparison.

| File | Description |
|---|---|
| `insurance.csv` | Source dataset |
| `SQL_Queries.sql` | Exploratory SQL analysis |
| `AppStatProj.ipynb` | Main Python notebook |
| `FINAL_PROJECT.docx` | Written project report |
| `Insurance_Stats_Presentation.pptx` | Final presentation slides |

---

## 📁 File Descriptions

### `insurance.csv`
The raw dataset sourced from Kaggle. Contains **1,338 records** across **7 columns** — 4 numerical (`age`, `bmi`, `children`, `charges`) and 3 categorical (`sex`, `smoker`, `region`). This file serves as the single data source for both the SQL and Python parts of the project. The dataset represents simulated medical insurance client data from an insurance company, with an even regional split and approximately 20% smoker prevalence.

---

### `SQL_Queries.sql`
A structured set of PostgreSQL queries written to perform the initial data exploration before any Python work. The file covers:

- **Table creation** — schema definition with appropriate data types for all 7 columns
- **Basic queries** — row counts, sex/smoker/region distributions using `SELECT`, `COUNT`, and `GROUP BY`
- **Aggregation queries** — `MIN`, `MAX`, and `AVG` comparisons across smoker and age groups, revealing that smokers pay dramatically more on average
- **`CASE WHEN` query** — BMI classification into WHO standard groups (*Underweight / Healthy Weight / Overweight / Obesity*) combined with smoker percentage per group
- **Window function** — an `OVER(PARTITION BY age)` query that computes each client's deviation from their age group's average charge, enabling pattern observation at a granular level

The SQL work established the key directional findings (smoking as the dominant cost driver, age-charge relationship) that the Python analysis later confirmed with formal statistical rigor.

---

### `AppStatProj.ipynb`
The core analytical notebook, written in Python using `pandas`, `numpy`, `scipy`, `matplotlib`, `seaborn`, and `scikit-learn`. The notebook is structured into the following sections:

1. **Descriptive Statistics** -- Mean, median, and standard deviation computed and compared across gender groups for charges, BMI, and age
2. **Probability Analysis** -- Empirical and conditional probabilities, e.g. P(smoker), P(smoker | male), using boolean masking and `.mean()`
3. **Sampling & Confidence Intervals** — Random sampling (n=100), standard error calculation, 95% CI construction using the 1.96 z-score, and **bootstrap CI** (1,000 resamples with replacement) for cross-validation
4. **Hypothesis Testing** -- Independent-samples t-tests comparing male vs. female charges and smoker vs. non-smoker ages, with explicit H₀/H₁ formulation, p-value interpretation, and decision logic
5. **Effect Size** -- Manual derivation and code implementation of **Cohen's d** using both pooled and simple standard deviation, distinguishing *statistical significance* from *practical significance*
6. **Correlation & Visualization** -- Scatterplots and Pearson correlation coefficients across all numerical column pairs, with written interpretation
7. **Regression** -- **Multiple Linear Regression** predicting insurance charges (R² = 0.75); coefficient-level interpretation for each feature
8. **Logistic Regression** -- Binary classification of smoking status with odds ratio interpretation
9. **Model Validation** -- Train/test split, overfitting discussion, residual analysis
10. **Model Comparison** -- Logistic Regression vs. **Random Forest Classifier** evaluated by accuracy and F1-score

---

### `FINAL_PROJECT.docx`
The written report documenting the entire project end-to-end. It describes the dataset, outlines the SQL tasks with annotated query results and screenshots, and provides written conclusions for each statistical section of the notebook. Serves as the formal submission document — each analytical section includes both the task requirement and the interpretation of results in plain language, making the statistical reasoning accessible beyond code alone.

---

### `Insurance_Stats_Presentation.pptx`
A 6-slide presentation summarizing the project for an audience. Covers the dataset overview, key findings, model results, and business-level insights. Designed to communicate conclusions concisely -- highlighting that smoking status is the single most impactful predictor of insurance charges and that random forest outperforms logistic regression due to non-linearity in real-world data.

---

## Key Findings

| Finding | Detail |
|---|---|
| **Smoking is the #1 cost driver** | Cohen's d > 0.8 — large, practically significant effect on charges |
| **Age correlates with charges** | Pearson r ≈ 0.3; effect is partially mediated by smoker concentration in age groups |
| **Gender gap is statistically real, practically negligible** | t-test: p < 0.05; Cohen's d < 0.2 — effect too small to matter |
| **Smoker age gap is noise** | < 1 year difference in mean age; hypothesis test failed to reject H₀ |
| **Linear Regression explains 75% of charge variance** | R² = 0.75 across 5 features |
| **Random Forest outperforms Logistic Regression** | 96.6% vs. 95.7% accuracy; F1 of 0.93 vs. 0.90 |
