#README
## Basics

Below is a description of the entities in your database and how they relate to each other.

  *Entry: The entry is your basic video post. It has a title, description, video and tags.  Each entry belongs to a specific user and can be voted on.    
  *User: Entries can be posted, edited, and deleted by their owners (the user that posted them). Other users can interact with given entry by liking or reposting it. Users can follow other users, and can be followed. They have a timeline (their own page) as well as a feed (what their friends are posting).  
   *Album: An album is simply a collection of entries. It has a name and cover photo.  
   *Repost: A repost as a "retweet". It is simply a reference to a single post, its original author (the poster), and the current user (the reposter). By reposting an entry, the current user can display the entry on his/her timeline. It will then be visible to his/her followers.   
