"""empty message

Revision ID: cd46abc041a0
Revises: 9bacd6d44932
Create Date: 2020-11-07 23:15:55.490783

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'cd46abc041a0'
down_revision = '9bacd6d44932'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_unique_constraint(None, 'picture', ['id'])
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint(None, 'picture', type_='unique')
    # ### end Alembic commands ###
