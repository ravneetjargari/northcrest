# Northcrest Electrical — Projects gallery + admin backend

## Included files
- `index.html` — updated from the supplied `index-redesigned.html`; desktop and mobile Recent Projects links now open `projects.html`.
- `projects.html` — public project gallery with category filters and photo lightbox.
- `admin.html` — password-protected client dashboard for creating, editing and deleting projects, removing individual photos, and deleting all photos with a project.
- `site.css` — shared responsive Northcrest styling for the admin dashboard and public projects gallery.
- `site.css` — shared styling for the new pages.
- `northcrest-logo.png` — extracted from the supplied homepage.
- `supabase-config.js` — already configured with the supplied Supabase Project URL and publishable key.
- `supabase-schema.sql` — database, public image bucket and row-level security policies.

## Supabase setup
1. Create a Supabase project at https://supabase.com/dashboard.
2. In **SQL Editor**, run all of `supabase-schema.sql`.
3. `supabase-config.js` is already configured with the Project URL and publishable key supplied for this project. Do not replace the publishable key with a secret key.
4. In **Authentication → Providers / Sign In**, disable public email sign-ups. Keep email/password sign-in enabled.
5. In **Authentication → Users**, create/invite the client's user account. Do not expose a service-role/secret key to the browser.
6. Test the gallery at `/projects.html` and sign in at `/admin.html`.
7. To remove one photo, edit its project, choose **Remove photo** under the image, then click **Save changes**. To remove an entire project and all its photos, use **Delete** beside the project.

The SQL allows public read access to published projects/photos and authenticated write access. The storage policy also restricts uploaded file paths to the signed-in user's UID folder. With public sign-ups disabled and only the client's account created, that account is the editor.

## Deploy to Netlify
Upload/deploy the contents of this folder as the site root, or copy the files into the root of the existing site. Keep `index.html`, `projects.html`, `admin.html`, `site.css`, `supabase-config.js`, and `northcrest-logo.png` together at the root. The existing site's other assets and files should also remain in place. Netlify does not need a server function for this setup.

## Important before launch
- The six old homepage cards are sample showcase content; replace them with real client-approved project details/photos or remove that section.
- Add real project photos in the admin dashboard after the Supabase account is configured.
- The website configuration now points to the supplied Supabase project. The database schema, storage bucket, client login account and Netlify deployment still need to be completed and tested.
