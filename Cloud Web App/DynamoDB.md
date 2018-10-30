# DynamoDB

Amazon DynamoDB is a nonrelational database that delivers reliable performance at any scale. It's a fully managed, multi-region, multi-master database that provides consistent single-digit millisecond latency, and offers built-in security, backup and restore, and in-memory caching.



## Task1: Create a New Table

1. In the console, click Service, then click DynamoDB.
2. Click Create table.
3. For Table name, type: Music
4. For primary key, type Artist and leave String selected.
5. Select **Add sorted key**, then in the new field type song and leave **String** selected. Your table will use default setting for indexes and provisioned capacity.
6. Click Create.



## Task2: Add Data

1. Click the Items tab, then click Create item.

2. For Artist String, type: Pink Floyd.

3. For song String, type: Money.

4. To create additional attribute, click the plus sign to the left of Song, then click append.

5. In the drop-down list, select String.

6. For the new attribute, enter:

   In FIELD, type: Album

   In VALUE, type: The Dark side of the Moon

7. ...



## Task3: Modify an Existing Item

1. Click Psy.
2. Change the Year from 2011 to 2012.
3. Click save.



## Task4: Query the table

1. Click the drop-down list showing Scan (located below the Create item button) and change it to Query.
2. Enter these details: Partition Key, Sort Key.
3. Click Start Search.
4. Click Add Filter.

## Task5: Delete the Table

Click the Delete table. On the confirmation panel, click Delete.