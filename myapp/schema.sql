DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS post;
DROP TABLE IF EXISTS comment;
CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL
);

CREATE TABLE post (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  author_id INTEGER NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT (datetime(CURRENT_TIMESTAMP,'localtime')),
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  FOREIGN KEY (author_id) REFERENCES user (id)
);


CREATE TABLE comment (
  authorid INTEGER NOT NULL,
  postid INTEGER NOT NULL,
  userid INTEGER NOT NULL,
  ctext TEXT NOT NULL,
  ctime TIMESTAMP NOT NULL DEFAULT (datetime(CURRENT_TIMESTAMP,'localtime')),
  enable_dis BOOLEAN NOT NULL,
  reply_targetid INTEGER,
  FOREIGN KEY (userid) REFERENCES user (id),
  FOREIGN KEY (reply_targetid) REFERENCES user (id),
  FOREIGN KEY (authorid) REFERENCES post (author_id),
  FOREIGN KEY (postid) REFERENCES post (id) ON DELETE CASCADE
);