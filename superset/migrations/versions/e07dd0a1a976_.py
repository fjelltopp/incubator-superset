"""empty message
Revision ID: e07dd0a1a976
Revises: 55e910a74826
Create Date: 2018-11-16 09:01:10.619168
"""

# revision identifiers, used by Alembic.
revision = 'e07dd0a1a976'
down_revision = '55e910a74826'

from alembic import op
import sqlalchemy as sa
from sqlalchemy.sql import expression



def upgrade():
    op.add_column('columns', sa.Column('geofilterable', sa.Boolean(),
                                       nullable=True,
                                       server_default=expression.false()))
    op.add_column('table_columns', sa.Column('geofilterable', sa.Boolean(), nullable=True,
                                             server_default=expression.false()))


def downgrade():
    op.drop_column('table_columns', 'geofilterable')
    op.drop_column('columns', 'geofilterable')
