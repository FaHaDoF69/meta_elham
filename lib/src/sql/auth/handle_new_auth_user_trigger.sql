-- Step 1: Create Trigger Function to insert data into public.users
CREATE FUNCTION handle_new_auth_user() RETURNS TRIGGER AS $$
BEGIN
    -- Insert a ne`w user into public.users with data from auth.users
INSERT INTO public.users (
    id,
    first_name,
    last_name,
    email,
    role,
    status,
    created_at,
    updated_at
)
VALUES (
           NEW.id,
           NEW.raw_user_meta_data->>'first_name',  -- Assuming first_name is stored in auth.users metadata
           NEW.raw_user_meta_data->>'last_name',   -- Assuming last_name is stored in auth.users metadata
           NEW.email,
           'parent', -- Default role set to 'parent', can be changed based on your logic
           'active', -- Default status set to 'active'
           NOW(), -- created_at
           NOW()  -- updated_at
       );

RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Step 2: Create the Trigger to invoke the function after a new user is added to auth.users
CREATE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW
    EXECUTE FUNCTION handle_new_auth_user();
