from pydantic import BaseModel


class User(BaseModel):
    user_id: int
    first_name: str
    last_name: str
    username: str
    email: str
    role: str
    password: str

    @property
    def password(self):
        return "********"

    @password.setter
    def password(self, value):
        pass

    def get_authorities(self):
        return [self.role]

    def is_account_non_expired(self):
        return True

    def is_account_non_locked(self):
        return True

    def is_credentials_non_expired(self):
        return True

    def is_enabled(self):
        return True
