json.extract! forum, :id, :title, :author, :subject, :user_id
json.url api_forums_url(forum, format: :json)

