-- ============================================================
-- Makan Apa - Database Schema
-- This file contains enums type
-- ============================================================

-- ============================================================
-- ENUMS
-- ============================================================

create type classtype as enum(
  'Indonesia',
  'China',
  'Korea',
  'Jepang',
  'Western',
  'Thailand',
  'Lainnya'
) 

create type bahantype as enum (
  'MEA',
  'VEG',
  'OTH'
);

create type unittype as enum (
  'kg',
  'g',
  'buah',
  'bungkus',
  'biji',
  'porsi'
);

create type reseptype as enum (
  'Utama',
  'Pendamping'
);

create type image_status as enum (
  'pending',
  'processing',
  'completed',
  'failed'
);