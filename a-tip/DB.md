users
- id
- status (valid, invalid)
- role(admin, viewer)
- nickname
- profile_url

user_auth
- id
- user_id(required)
- type(standard, google, github, facebook ...)
- passport_info(json)

categories
- id
- user_id(required)
- status(valid, invalid)
- name

articles
- id
- user_id(required)
- category_id(required)
- status(valid, invalid)
- subject
- content_md
- content_text
- content_html

article_snapshots
- id
- article_id(required)
- subject
- content_md
- content_text
- content_html

media
- id
- user_id(required)
- type(image, video)
- mime_type
- url
- thumbnail_url