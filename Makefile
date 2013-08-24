# Set up your PostgreSql credentials here
PGUSER=changeme
PGPASSWORD=changeme
TEMPLATE=template1
# Setup these paths to match your system
CLASSPATH="/usr/share/java/postgresql-jdbc2.jar:."
JAVA_BIN="/opt/j2sdk1.4.2_08/bin/"

all:
	echo Run "make load_db" to load the database, or "make test" to run build and run the client

test:
	$(JAVA_BIN)/javac *.java
	$(JAVA_BIN)/java -classpath $(CLASSPATH) FlashCardController

clean:
	rm -f *.bak *\~

create_db: delete_db
	echo Creating the database...
	createdb -U $(PGUSER) -T $(TEMPLATE) aleman

create_tables: create_db
	psql -U $(PGUSER) aleman < create_tables.sql

load_db: create_tables
	echo Loading data...
	psql -U $(PGUSER) aleman < load_cardholder.sql
	psql -U $(PGUSER) aleman < load_declension.sql
	psql -U $(PGUSER) aleman < load_nouns.sql
	psql -U $(PGUSER) aleman < load_conjunctions.sql
	psql -U $(PGUSER) aleman < load_determiner.sql
	psql -U $(PGUSER) aleman < load_preposition.sql
	psql -U $(PGUSER) aleman < load_pronouns.sql	
	psql -U $(PGUSER) aleman < load_verbs.sql
	psql -U $(PGUSER) aleman < load_adverbs.sql
	psql -U $(PGUSER) aleman < load_interjections.sql
	psql -U $(PGUSER) aleman < load_adjectives.sql

delete_db:
	dropdb -U $(PGUSER) aleman >& /dev/null || echo Database deleted

