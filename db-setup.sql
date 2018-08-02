CREATE TABLE scuttlespace_user (
  rowid BIGSERIAL PRIMARY KEY,
  username VARCHAR(64) UNIQUE NOT NULL,
  external_id VARCHAR(64) UNIQUE NOT NULL,
  enabled BOOLEAN NOT NULL,
  domain VARCHAR(128),
  about TEXT
);

CREATE INDEX user_username_index ON scuttlespace_user(username);
CREATE INDEX user_external_id_index ON scuttlespace_user(external_id);
CREATE INDEX user_domain_index ON scuttlespace_user(domain);

CREATE TABLE user_permissions ( 
  rowid BIGSERIAL PRIMARY KEY,
  assignee_external_id VARCHAR(64) NOT NULL REFERENCES scuttlespace_user(external_id),
  assigner_external_id VARCHAR(64) NOT NULL REFERENCES scuttlespace_user(external_id),
  permissions TEXT NOT NULL
);