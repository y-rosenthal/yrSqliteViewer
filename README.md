# yrSqliteViewer

*An "all in one" html file for viewing sqlite databases.*

## What is yrSqliteViewer

I created yrSqliteViewer out of frustration when trying to teach the basics of SQL to computer novices. 
I decided to focus on SQLite databases since a server is not needed. 
I wanted something that could be run in a web browser without students needing to install any other software.
I did this quickly by "vibe-coding" yrSqliteViewer with Cursor in the 2023/2024 timeframe. 

This product is intended for teaching/learning purposes and is not intended a "production" level product.
I recommend using small databases (i.e. a few tables and not an overwhelming amount of data in each table).

Alternatives are packages such as DB Browser or SQLite Viewer. However, I needed to support students 
with all sorts of computers (windows, mac, chromebook, etc) and I didn't want to spend a lot of time 
teaching a particular software package. I wanted to focus on the SQL commands. I thought a browser
interface would be best and I couldn't find anything that I wanted to use. If something else is
available when you're reading this, perhaps try it - and let me know about it :)

FYI - the "yr" in the name "yrSqliteViewer" are my initials. I know the name doesn't have great marketing
appeal but there already was a product named "Sqlite Viewer" :)


## Quick Start

To get started quickly do the following:

1. Navigate to https://github.com/y-rosenthal/yrSqliteViewer and download the following file
   (*this is the only file you really need*)

   * <a href="https://github.com/y-rosenthal/yrSqliteViewer/raw/master/yrSqliteViewer.html" download>yrSqliteViewer.html</a> *right click and choose "Save Link As" or "Save As"*

   > NOTE:
   > Due to technical considerations to download this first file (yrSqliteViewer.html)
   > right click on the link and choose "Save Link As" or "Save As".
   > The other files below can be downloaded by just clicking on the links.


2. Download these additiional file (*optional*).

   * <a href="https://github.com/y-rosenthal/yrSqliteViewer/raw/master/sampleDatabase-books-v025.sqlite" download>sampleDatabase-books-v025.sqlite</a> - sample sqlite database *(you can use any sqlite database file)*

   * <a href="https://github.com/y-rosenthal/yrSqliteViewer/raw/master/yrSqliteViewerSession-sample.yrslv" download>yrSqliteViewerSession-sample.yrslv</a> - sample session file *(see below)*

     
3. open yrSqliteViewer.html with a web browser. 
   Probably best to use Chrome. You can try other browsers but they weren't tested as well as Chrome was.

4. Press the "Load Database File" button and choose the file ***sampleDatabase-books-v025.sqlite***
   that you downloaded above. Wait a few seconds for the database file to load.
 
5. Click the "Show Rows (for all tables)" button to see the rows in the tables.

6. Click the "Show Structure (for all tables)" button to see the structure of the tables.
 
7. Type a SQL select statement - *e.g. select * from title where price < 20* - in the box entitled "SQL Command 1". 
   Then press the "Run Query" button.
 
8. Type another SQL select statement - *e.g. select pub_name, city from publishers* - in the box entitled "SQL Command 2", etc.
 
9. Press the "Save Session" button (*at the top of the page*). Specifiy a filename. This file will contain
   both the database file you were using as well as the queries that you have run.
 
10. Close your browser. Then open the yrSqliteViewer.html file again in the browser. This time 
   press the "Restore Session" button and choose the file you saved in the previous step. 
   This opens the database as well as restores the SQL statements that you had run before.

   You can instead press the "Restore Session" button and choose the file ***yrSqliteViewerSession-sample.yrslv***
   file that you downloaded in the first step above to view the sample SQL statements that were
   included in that file.

## Features

The current version has the following features:

- load a sqlite database
- view the **structure** of the database (*column names and datatypes*) without running ANY SQL commands
- view the **data** in the database (*i.e. the actual rows*) without running ANY SQL commands
- execute SELECT statements against the loaded database
- **save a session** and **restore a session**
  The session is saved in a file with a .yrslv extension.
  If you open a saved session (by pressing "Restore Session" button) you will automatically load the database file
  as well as any SQL commands that were typed when you saved the session file.

## NOT currently supported (*but may be in the future*)

There are MANY additional features that could be added to this. The following are NOT currently
supported but may be added in the future:

- the current version does NOT support sql commands other than SELECT (e.g. update, delete, etc)
- reordering the existing queries in the interface
- better support for large databases
- showing the "entity relationship diagram" (either via image files or mermaid ERDs or similar)
- many other features ...


## Sample database (yrSqliteViewer-sample-v025.sqlite)

There is a sample database included in the repo (sampleDatabase-books-v025.sqlite). 
The "-v025" is my own version number of this sqlite file - I've been using this database to teach my classes
for several years and I've modified the database slightly every now and then. 

There is also a "session" file (yrSqliteViewerSession-sample.yrslv) in the repo that contains this 
database along with a few sample queries (see explanation of session files in the *features* section above).

The sample database is derived from the database that was used in the following book. 
It is a wonderful book for learning SQL but unfortunately it seems to currently be out of print.

> SQL: Visual QuickStart Guide, 3rd Edition
> By Chris Fehily
> Published Jun 4, 2008 by Peachpit Press


## About the code

The code uses Pyodide to enable running Python directly in a browser.
The code then uses standard Python packages to interact with the sqlite files. 

The code is very messy. It was "vibe-coded" circal 2023/2024. It worked for my purposes but 
attempts to improve the functionality became difficult with just "vibe coding".
I didn't have time to focus on turning this into a real product (I started but didn't have time
to focus on this). 

In the time since I first coded this, vibe coding has gotten a LOT better. Claude Code Max is currently 
amazing (June 2025) and could possibly recreate this with a few prompts. However, I don't have time 
now to focus on a new implementation. Simple changes could probably be done with the existing code base
without too much difficulty. If you want to add a lot more functionality, I recommend possibly starting from scratch. 
