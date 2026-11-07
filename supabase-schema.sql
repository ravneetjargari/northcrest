-- Northcrest Electrical project gallery
-- Run this entire script in Supabase Dashboard > SQL Editor.
create extension if not exists pgcrypto;

create table if not exists public.projects (
  id uuid primary key default gen_random_uuid(),
  title text not null check (char_length(title) between 1 and 120),
  description text not null default '',
  category text not null check (category in ('residential','commercial','industrial')),
  location text not null default '',
  image_paths text[] not null default '{}',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.projects enable row level security;
drop policy if exists "Public can view projects" on public.projects;
create policy "Public can view projects" on public.projects for select using (true);
drop policy if exists "Authenticated users can insert projects" on public.projects;
create policy "Authenticated users can insert projects" on public.projects for insert to authenticated with check (true);
drop policy if exists "Authenticated users can update projects" on public.projects;
create policy "Authenticated users can update projects" on public.projects for update to authenticated using (true) with check (true);
drop policy if exists "Authenticated users can delete projects" on public.projects;
create policy "Authenticated users can delete projects" on public.projects for delete to authenticated using (true);

insert into storage.buckets (id,name,public,file_size_limit,allowed_mime_types)
values ('project-photos','project-photos',true,12582912,array['image/jpeg','image/png','image/webp'])
on conflict (id) do update set public=true,file_size_limit=12582912,allowed_mime_types=array['image/jpeg','image/png','image/webp'];

drop policy if exists "Public can view project photos" on storage.objects;
create policy "Public can view project photos" on storage.objects for select using (bucket_id='project-photos');
drop policy if exists "Client can upload project photos" on storage.objects;
create policy "Client can upload project photos" on storage.objects for insert to authenticated with check (bucket_id='project-photos' and (storage.foldername(name))[1]=auth.uid()::text);
drop policy if exists "Client can delete project photos" on storage.objects;
create policy "Client can delete project photos" on storage.objects for delete to authenticated using (bucket_id='project-photos' and (storage.foldername(name))[1]=auth.uid()::text);
