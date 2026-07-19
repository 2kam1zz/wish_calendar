create TABLE friends (
    user_id     number          not NULL,
    friend_id   number          not NULL,
    status      varchar2(20)    DEFAULT 'pending',
    created_at  timestamp       DEFAULT CURRENT_TIMESTAMP,
    updated_at  timestamp       DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (user_id, friend_id),

    CONSTRAINT fk_friend_user FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT fk_friend_friend FOREIGN KEY (friend_id) REFERENCES users(id),
    CONSTRAINT chck_friend_status CHECK (status IN ('pending', 'accepted', 'rejected'))
);
--поиск друзей юзера
create INDEX idx_user_friends on friends(user_id);
--кто добавил юзера в друзья
create INDEX idx_friend_friend on friends(friend_id);