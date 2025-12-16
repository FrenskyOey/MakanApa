# Supabase Database – Schema & Migrations

This directory contains the complete database configuration for the **Makan Apa** backend, including table schemas, security policies, and migration scripts.

## 📂 Directory Structure

- **`migrations/`**: SQL scripts applied in order to set up the database.

---

## 🗄️ Database Schema

The database is organized into domain-specific schemas to maintain separation of concerns.

### 1. Schema: `food`
*Core domain data for recipes and ingredients.*

| Table | Description |
| :--- | :--- |
| **`Resep`** | The master recipe table. Contains metadata like `name`, `type`, `class`, `picture`, and `steps_link`. |
| **`Bahan`** | Inventory of available ingredients (`name`, `unit`, `type`). |
| **`ResepDetail`** | **Junction Table**. Links `Resep` to `Bahan` with a specific `quantity`. |
| **`Resep_Bookmark`** | Stores user interactions. Links `auth.users` to `food.Resep` with an `is_bookmarked` flag. |

### 2. Schema: `plan`
*User-specific meal planning data.*

| Table | Description |
| :--- | :--- |
| **`group`** | Represents a planning period (e.g., a week) defined by `start_date` and `end_date`. |
| **`meal`** | Stores specific meal slots (Lunch/Dinner) for a date within a group. |
| **`meal_details_view`** | **[View]** A pre-joined view combining `meal`, `group`, and `food.Resep` to simplify API queries for the home page. |

### 3. Schema: `public`
*Standard Supabase schema.*

| Table | Description |
| :--- | :--- |
| **`user_profile`** | Extended user profile data linked to `auth.users`. Stores `user_name`, `email`, `phone_number`, and `avatar`. |
| **`faq`** | Content for the Frequently Asked Questions section (`question`, `answer`). |

---

## 🔐 Security (RLS & Permissions)

Row Level Security (RLS) is strictly enforced.

### Policies
- **Public/Shared Data**: Tables in `food` (like `Resep`) are generally readable by authenticated users but writable only by admins.
- **Private Data**: Tables in `plan` and `Resep_Bookmark` are restricted to the row owner (`user_id = auth.uid()`).

### Permissions (`grants.sql`)
- **Schema Ownership**: `postgres` role owns `food` and `plan`.
- **API Access**: `USAGE` is granted to `anon` and `authenticated` roles, allowing the Supabase JS Client to query these schemas (subject to RLS).

---

## ⚡ Functions & Enums

- **Functions**: Custom PostgreSQL functions (defined in migrations) handle triggers for timestamps or complex data validation.
- **Enums**: Custom data types are used to enforce values for columns like `Bahan.type` (e.g., 'MEA', 'VEG') or `Resep.type`.

---
