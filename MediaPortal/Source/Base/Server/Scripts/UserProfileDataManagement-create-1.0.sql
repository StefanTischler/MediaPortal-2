-- This script creates the UserProfileDataManagement schema. DO NOT MODIFY!


-- User-profiles

-- Contains all registered user profiles. A user profile is a mixture of a user and a collection of user settings.
-- We bind settings/usage data to user profile instances but later, we could also bind permissions to it.
CREATE TABLE USER_PROFILES (
  PROFILE_ID %GUID% PRIMARY KEY,
  NAME %STRING(250)% NOT NULL,

  CONSTRAINT USER_PROFILES_NAME_UK UNIQUE (NAME)
);


-- Playlist data of all profiles

CREATE TABLE USER_PLAYLIST_DATA (
  PROFILE_ID %GUID% NOT NULL,
  PLAYLIST_ID %GUID% NOT NULL,
  DATA_KEY %STRING(250)% NOT NULL,
  PLAYLIST_DATA %STRING(2000)% NOT NULL,

  CONSTRAINT USER_PLAYLIST_DATA_PK PRIMARY KEY (PROFILE_ID, PLAYLIST_ID, DATA_KEY),
  CONSTRAINT USER_PLAYLIST_DATA_USER_PROFILE_FK FOREIGN KEY (PROFILE_ID) REFERENCES USER_PROFILES (PROFILE_ID) ON DELETE CASCADE,
  CONSTRAINT USER_PLAYLIST_DATA_PLAYLIST_FK FOREIGN KEY (PLAYLIST_ID) REFERENCES PLAYLISTS (PLAYLIST_ID) ON DELETE CASCADE
);


-- Media item data of all profiles

CREATE TABLE USER_MEDIA_ITEM_DATA (
  PROFILE_ID %GUID% NOT NULL,
  MEDIA_ITEM_ID %GUID% NOT NULL,
  DATA_KEY %STRING(250)% NOT NULL,
  MEDIA_ITEM_DATA %STRING(2000)% NOT NULL,

  CONSTRAINT USER_MEDIA_ITEM_DATA_PK PRIMARY KEY (PROFILE_ID, MEDIA_ITEM_ID, DATA_KEY),
  CONSTRAINT USER_MEDIA_ITEM_DATA_USER_PROFILE_FK FOREIGN KEY (PROFILE_ID) REFERENCES USER_PROFILES (PROFILE_ID) ON DELETE CASCADE,
  CONSTRAINT USER_MEDIA_ITEM_DATA_MEDIA_ITEM_FK FOREIGN KEY (MEDIA_ITEM_ID) REFERENCES MEDIA_ITEMS (MEDIA_ITEM_ID) ON DELETE CASCADE
);


-- Additional data of all profiles

CREATE TABLE USER_ADDITIONAL_DATA (
  PROFILE_ID %GUID% NOT NULL,
  DATA_KEY %STRING(250)% NOT NULL,
  ADDITIONAL_DATA %STRING(2000)% NOT NULL,

  CONSTRAINT USER_ADDITIONAL_DATA_PK PRIMARY KEY (PROFILE_ID, DATA_KEY),
  CONSTRAINT USER_ADDITIONAL_DATA_USER_PROFILE_FK FOREIGN KEY (PROFILE_ID) REFERENCES USER_PROFILES (PROFILE_ID) ON DELETE CASCADE
);
