"""empty message

Revision ID: b3e109bb07cf
Revises: e07dd0a1a976
Create Date: 2018-12-02 11:52:25.232537

"""

# revision identifiers, used by Alembic.
revision = 'b3e109bb07cf'
down_revision = 'e07dd0a1a976'

from alembic import op
import sqlalchemy as sa


def upgrade():
    op.add_column('tables', sa.Column('geo_column_name', sa.String(length=32), nullable=True, server_default='geo'))

def downgrade():
    op.drop_column('tables', 'geo_column_name')
