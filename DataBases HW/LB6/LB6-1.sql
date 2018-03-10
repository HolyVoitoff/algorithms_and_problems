USE litdb;

/* memory */
DROP TABLE IF EXISTS `litsketch_memory`;
CREATE TABLE `litsketch_memory` (
  `sk_id` int(11) NOT NULL,
  `sk_aut` varchar(30) NOT NULL,
  PRIMARY KEY (`sk_id`)
) ENGINE=MEMORY;

INSERT INTO litsketch_memory
  SELECT sk_id, sk_aut FROM litsketch;
  
SELECT * FROM litsketch_memory
  ORDER BY sk_id;
  
/* CSV */
DROP TABLE IF EXISTS `litsketch_csv`;
CREATE TABLE `litsketch_csv` (
  `sk_id` int(11) NOT NULL,
  `sk_aut` varchar(30) NOT NULL
) ENGINE=CSV;

INSERT INTO litsketch_csv
  SELECT sk_id, sk_aut FROM litsketch;
  
SELECT * FROM litsketch_csv
  ORDER BY sk_id;
  
/* ARCHIVE */
DROP TABLE IF EXISTS `litsketch_archive`;
CREATE TABLE `litsketch_archive` (
  `sk_id` int(11) NOT NULL,
  `sk_aut` varchar(30) NOT NULL
) ENGINE=ARCHIVE;

INSERT INTO litsketch_archive
  SELECT sk_id, sk_aut FROM litsketch;
  
SELECT * FROM litsketch_archive
  ORDER BY sk_id;
  
/* MERGE */
DROP TABLE IF EXISTS `litsketch_merge`;
CREATE TABLE `litsketch_merge` (
  `sk_id` int(11) NOT NULL,
  `sk_aut` varchar(30) NOT NULL
) ENGINE=MERGE;

INSERT INTO litsketch_merge
  SELECT sk_id, sk_aut FROM litsketch;
  
SELECT * FROM litsketch_merge
  ORDER BY sk_id;
  
/* BLACKWHOLE */
DROP TABLE IF EXISTS `litsketch_blackhole`;
CREATE TABLE `litsketch_blackhole` (
  `sk_id` int(11) NOT NULL,
  `sk_aut` varchar(30) NOT NULL
) ENGINE=BLACKHOLE;

INSERT INTO litsketch_blackhole
  SELECT sk_id, sk_aut FROM litsketch;
  
SELECT * FROM litsketch_blackhole
  ORDER BY sk_id;

/* EXAMPLE */
DROP TABLE IF EXISTS `litsketch_example`;
CREATE TABLE `litsketch_example` (
  `sk_id` int(11) NOT NULL,
  `sk_aut` varchar(30) NOT NULL
) ENGINE=MERGE;

INSERT INTO litsketch_example
  SELECT sk_id, sk_aut FROM litsketch;
  
SELECT * FROM litsketch_example
  ORDER BY sk_id;
