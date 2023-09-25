from typing import List
from app.api.models import NoteDB, NoteSchema
from app.db import notes, database


async def get_all() -> List[NoteDB]:
    query = notes.select()
    return await database.fetch_all(query=query)


async def get(id: int) -> NoteDB:
    """Creates a select by id query and returns the note."""
    query = notes.select().where(id == notes.c.id)
    return await database.fetch_one(query=query)


async def post(payload: NoteSchema):
    """
    Creates a note insert query using SQLAlchemy,
    executes it and returns the generated ID.
    """
    query = notes.insert().values(title=payload.title, description=payload.description)
    return await database.execute(query=query)
