# Receiving Checklist: setup (about 10 minutes, once)

## 1. Create the free database (Supabase)
1. Go to supabase.com and sign up (free, no card).
2. Click **New project**. Name it `checklist`, set any database password, pick the region closest to you, and click Create. Wait about 2 minutes.
3. In the left menu open **SQL Editor** > **New query**. Open `schema.sql` from this folder, copy everything, paste it in, and click **Run**. It should say "Success".
4. In the left menu open **Project Settings** > **API Keys** (or **API**). Copy:
   - the **Project URL** (looks like `https://abcd1234.supabase.co`)
   - the **anon / publishable** key (a long text; never the `service_role` or secret key).

## 2. Put the two values in `config.js`
Open `config.js` in any text editor (Notepad is fine, or edit it on github.com with the pencil icon) and paste them between the quotes:

    SUPABASE_URL: "https://abcd1234.supabase.co",
    SUPABASE_KEY: "your-anon-key",

Leave `LIST_CODE` as it is. It is the private name of your list.

## 3. Put it on Vercel
1. On github.com create a new repository and upload all the files in this folder (Add file > Upload files).
2. On vercel.com choose Add New > Project, import that repository, and click Deploy.
3. Open the link on your phone and use Add to Home Screen.

Use the same link on every device and they all show the same list.

## Keeping your data safe
- Items live in your Supabase database, not in the phone.
- "Delete" only moves an item to Trash. The database has no permission to delete rows, so nothing can be erased from the website. Restore from the Trash tab.
- Free Supabase projects pause after 1 week with no visits. Nothing is lost: open the Supabase dashboard and click Restore. Opening the checklist at least once a week avoids the pause.
- "Download backup (CSV)" at the bottom of the page saves the list to your phone.
