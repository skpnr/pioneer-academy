-- =======================================================
-- PIONEER ACADEMY - SUPABASE DATABASE SCHEMA (FREE TIER)
-- =======================================================

-- 1. Create Students Table
CREATE TABLE IF NOT EXISTS public.students (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    mobile VARCHAR(10) UNIQUE NOT NULL,
    name VARCHAR(100) DEFAULT 'अधिकृत छात्र',
    password VARCHAR(50) DEFAULT '070719',
    status VARCHAR(20) DEFAULT 'ACTIVE' CHECK (status IN ('ACTIVE', 'BLOCKED')),
    activation_key VARCHAR(10),
    added_by VARCHAR(20) DEFAULT 'ADMIN_CONSOLE',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
    last_login TIMESTAMP WITH TIME ZONE
);

-- 2. Create Admin Table
CREATE TABLE IF NOT EXISTS public.admins (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    mobile VARCHAR(10) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,
    name VARCHAR(100) DEFAULT 'सनी सर (Admin)',
    role VARCHAR(20) DEFAULT 'SUPER_ADMIN',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 3. Create Test Submissions Table (For Live Scores & Leaderboard)
CREATE TABLE IF NOT EXISTS public.test_submissions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    student_mobile VARCHAR(10) REFERENCES public.students(mobile) ON DELETE CASCADE,
    test_id VARCHAR(50) NOT NULL,
    score NUMERIC(5, 2) NOT NULL,
    accuracy NUMERIC(5, 2) NOT NULL,
    correct_count INT NOT NULL,
    wrong_count INT NOT NULL,
    unattempted_count INT NOT NULL,
    total_questions INT DEFAULT 100,
    submitted_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 4. Enable Row Level Security (RLS)
ALTER TABLE public.students ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.admins ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.test_submissions ENABLE ROW LEVEL SECURITY;

-- 5. Policies for Public Anon Access (Controlled by App Logic)
CREATE POLICY "Allow public read students" ON public.students FOR SELECT USING (true);
CREATE POLICY "Allow public insert students" ON public.students FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow public update students" ON public.students FOR UPDATE USING (true);
CREATE POLICY "Allow public delete students" ON public.students FOR DELETE USING (true);

CREATE POLICY "Allow public read admins" ON public.admins FOR SELECT USING (true);

CREATE POLICY "Allow public read test_submissions" ON public.test_submissions FOR SELECT USING (true);
CREATE POLICY "Allow public insert test_submissions" ON public.test_submissions FOR INSERT WITH CHECK (true);

-- 6. Insert Default Master Admin Credentials
INSERT INTO public.admins (mobile, password, name, role)
VALUES ('9155933842', '000000', 'सनी सर (Admin)', 'SUPER_ADMIN')
ON CONFLICT (mobile) DO UPDATE SET password = EXCLUDED.password;

-- 7. Insert the 10 Pre-Approved Students
INSERT INTO public.students (mobile, name, password, status, activation_key) VALUES
('7903539200', 'छात्र 01 (7903539200)', '070719', 'ACTIVE', '316684'),
('8603199361', 'छात्र 02 (8603199361)', '070719', 'ACTIVE', '723386'),
('6207570594', 'छात्र 03 (6207570594)', '070719', 'ACTIVE', '505501'),
('6201862281', 'छात्र 04 (6201862281)', '070719', 'ACTIVE', '574588'),
('9229735570', 'छात्र 05 (9229735570)', '070719', 'ACTIVE', '613149'),
('8252234919', 'छात्र 06 (8252234919)', '070719', 'ACTIVE', '885544'),
('9142666255', 'छात्र 07 (9142666255)', '070719', 'ACTIVE', '969188'),
('9525511525', 'छात्र 08 (9525511525)', '070719', 'ACTIVE', '551710'),
('9470712197', 'छात्र 09 (9470712197)', '070719', 'ACTIVE', '405819'),
('9572850513', 'छात्र 10 (9572850513)', '070719', 'ACTIVE', '498305')
ON CONFLICT (mobile) DO NOTHING;
