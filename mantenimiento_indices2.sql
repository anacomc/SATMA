use Anaco_Tributos;
GO

CREATE FUNCTION FilteredIndexFragmentation(@DatabaseID INT,     @ObjectID INT,     @IndexID  INT,     @PartitionNumber INT=NULL,     @AverageFragmentation INT =0,     @FragmentCount BIGINT =0)
RETURNS @IndexStats TABLE(DatabaseID SMALLINT,    ObjectID INT,    IndexID  INT,    PartitionNumber INT,    IndexDepth TINYINT,    FragmentationRate FLOAT,    FragmentCount BIGINT,    AverageFragmentSize FLOAT,    PageCount BIGINT)
BEGIN
    INSERT INTO @IndexStats(DatabaseID, ObjectID, IndexID, PartitionNumber, IndexDepth,FragmentationRate,FragmentCount, AverageFragmentSize, PageCount)
    SELECT database_id, object_id, index_id, partition_number,
         index_depth, avg_fragmentation_in_percent, fragment_count, avg_fragment_size_in_pages, page_count
    FROM sys.dm_db_index_physical_stats (@DatabaseID, @ObjectID, @IndexID, @PartitionNumber, 'LIMITED' )
    WHERE index_type_desc IN('CLUSTERED INDEX', 'NONCLUSTERED INDEX')
    AND avg_fragmentation_in_percent > @AverageFragmentation
    AND fragment_count>@FragmentCount
RETURN
END
GO

CREATE PROCEDURE dbo.DefragmentaIndices( @Tipo VARCHAR(10) )
AS 
DECLARE @db_id INT ;
DECLARE @NumPages BIGINT ;
DECLARE @NumIndexes INT ;
DECLARE @Comando NVARCHAR(MAX);
DECLARE @DB INT
SET NOCOUNT ON;
--– Requerido por modo de compatibilidad 80.
SET @DB=DB_ID()        
IF (@Tipo NOT IN('Grandes', 'Medianos', 'Pequenos'))
    BEGIN
    RAISERROR('Parametro @Tipo Invalido, use: Grandes, Medianos o Pequenos', 16,1);
    RETURN;
    END

SET @db_id = DB_ID(N'Adam');
SET @Comando='';

 

IF @Tipo='Grandes'
    BEGIN
    --— Reindexa las 10 mas grandes sin importar el tamano
    SELECT TOP 10 @Comando=@Comando+CHAR(13)+CHAR(10)+'ALTER INDEX '
        + Indexes.Name
        +' ON '+OBJECT_NAME(ObjectID)+' REBUILD;'
    FROM FilteredIndexFragmentation(@DB, NULL, NULL, NULL, 30,10) AS FIF
    JOIN SYS.INDEXES AS Indexes
        ON INDEXES.OBJECT_ID=ObjectID
            AND INDEXES.INDEX_ID=IndexID
    ORDER BY (IndexDepth*IndexDepth*FragmentationRate*FragmentCount/100) DESC
    END
ELSE
    BEGIN
    --— Reindexa las 10 si es Medianos, 50 si es Pequenos
    SELECT TOP (CASE WHEN @Tipo='Medianos' THEN 10 ELSE 50 END)
        @Comando=@Comando+CHAR(13)+CHAR(10)+'ALTER INDEX '
        + IndexPages.Name
        +' ON '+OBJECT_NAME(ObjectID)+' REBUILD;'
    FROM (SELECT indexes.object_id,indexes.index_id, Indexes.Name, sum(allocation_units.total_pages) as totalPages
            FROM sys.indexes AS indexes
            JOIN sys.partitions AS partitions
            ON indexes.object_id = partitions.object_id
                    and indexes.index_id = partitions.index_id
            JOIN sys.allocation_units AS allocation_units
            ON partitions.partition_id = allocation_units.container_id
            WHERE indexes.index_id >0
             AND allocation_units.total_pages>0
            GROUP BY indexes.object_id, indexes.index_id, Indexes.Name
            HAVING sum(allocation_units.total_pages) BETWEEN 32 AND
                (CASE WHEN @Tipo='Medianos' THEN 8192 ELSE 256 END)        
            ) AS IndexPages
    JOIN FilteredIndexFragmentation(@DB, NULL, NULL, NULL, 20,3) AS FIF
    ON IndexPages.object_id=FIF.ObjectID
        AND IndexPages.index_id=FIF.IndexID
    ORDER BY (IndexDepth*IndexDepth*FragmentationRate*FragmentCount/100) DESC
    END

EXEC sp_executesql @Comando

GO
--- USE Anaco_Tributos
--- EXEC dbo.DefragmentaIndices 'Grandes'