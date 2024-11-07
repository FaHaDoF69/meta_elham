-- Create ENUM type for status
CREATE TYPE user_status AS ENUM ('active', 'inactive', 'banned');

-- Create ENUM type for role
CREATE TYPE user_role AS ENUM ('parent', 'educator', 'child', 'admin');

-- Create users table
CREATE TABLE users (
   id UUID PRIMARY KEY, -- id matches auth.users
   first_name VARCHAR(100) NOT NULL,
   last_name VARCHAR(100) NOT NULL,
   email VARCHAR(255) UNIQUE NOT NULL,
   role user_role NOT NULL DEFAULT 'parent', -- Role as ENUM (parent, educator, child, admin)
   ip_address INET,
   last_login timestampz,
   created_at timestamp DEFAULT NOW(),
   updated_at timestamp DEFAULT NOW(),
   updated_by UUID,
   status user_status NOT NULL DEFAULT 'active' -- User status as ENUM (active, inactive, banned)
);
