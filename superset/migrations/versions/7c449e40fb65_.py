"""empty message

Revision ID: 7c449e40fb65
Revises: d46591f7d3ef
Create Date: 2019-01-03 08:29:20.833940

"""

# revision identifiers, used by Alembic.
revision = '7c449e40fb65'
down_revision = 'd46591f7d3ef'

from alembic import op
import sqlalchemy as sa


def upgrade():
    op.add_column('columns', sa.Column('geojson_filter_name_key', sa.String(length=225), nullable=True))
    op.add_column('table_columns', sa.Column('geojson_filter_name_key', sa.String(length=225), nullable=True))

def downgrade():
    op.drop_column('table_columns', 'geojson_filter_name_key')
    op.drop_column('columns', 'geojson_filter_name_key')
