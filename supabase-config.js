// Northcrest Electrical Supabase connection.
// This publishable key is designed for use in browser code; database access
// remains controlled by the Row Level Security policies in supabase-schema.sql.
window.SUPABASE_URL = 'https://aelvtsadydylwpqjylua.supabase.co';
window.SUPABASE_PUBLISHABLE_KEY = 'sb_publishable_BJ2Ecz_XKlP0ScbaMmINZQ_v1_cZl0t';

window.supabaseClient = window.supabase.createClient(
  window.SUPABASE_URL,
  window.SUPABASE_PUBLISHABLE_KEY
);
