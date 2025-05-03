from sqlalchemy import Column, Integer, String, Boolean, Date, ForeignKey
from database import Base

class User(Base):
    __tablename__ = "Users"
    user_id = Column(Integer, primary_key=True, index=True)
    name = Column(String(100), nullable=False)
    email = Column(String(100), unique=True, nullable=False)

class Task(Base):
    __tablename__ = "Tasks"
    task_id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("Users.user_id"), nullable=False)
    title = Column(String(200), nullable=False)
    description = Column(String(255))
    due_date = Column(Date)
    completed = Column(Boolean, default=False)
