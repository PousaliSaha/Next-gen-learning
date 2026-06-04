-- Run this in your Supabase SQL Editor
-- Dashboard → SQL Editor → New query

-- 1. Create the courses table
CREATE TABLE IF NOT EXISTS public.courses (
  id          UUID          PRIMARY KEY DEFAULT gen_random_uuid(),
  title       TEXT          NOT NULL,
  progress    INTEGER       NOT NULL CHECK (progress >= 0 AND progress <= 100),
  icon_name   TEXT          NOT NULL DEFAULT 'BookOpen',
  created_at  TIMESTAMPTZ   NOT NULL DEFAULT NOW()
);

-- 2. Enable Row Level Security
ALTER TABLE public.courses ENABLE ROW LEVEL SECURITY;

-- 3. Allow anonymous read access
CREATE POLICY "Allow public read" ON public.courses
  FOR SELECT USING (true);

-- 4. Seed data
INSERT INTO public.courses (title, progress, icon_name) VALUES
  ('Advanced React Patterns',    75, 'Code2'),
  ('System Design Fundamentals', 42, 'Network'),
  ('TypeScript Deep Dive',       88, 'FileCode'),
  ('Next.js 16 Mastery',         31, 'Layers');
