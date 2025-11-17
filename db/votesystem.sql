SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `admin` (`id`, `username`, `password`, `firstname`, `lastname`) VALUES
(1, 'admin1', 'password123', 'Alice', 'Johnson'),
(2, 'admin2', 'password456', 'Bob', 'Smith'),
(3, 'admin3', 'password789', 'Charlie', 'Brown'),
(4, 'admin4', 'password321', 'David', 'Williams'),
(5, 'admin5', 'password654', 'Eve', 'Davis');

CREATE TABLE `candidates` (
  `id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `candidates` (`id`, `position_id`, `firstname`, `lastname`) VALUES
(1, 1, 'James', 'Wilson'),
(2, 1, 'Maria', 'Rodriguez'),
(3, 1, 'Michael', 'Johnson'),
(4, 2, 'Sarah', 'Davis'),
(5, 2, 'Robert', 'Smith'),
(6, 2, 'Jennifer', 'Garcia'),
(7, 3, 'William', 'Martinez'),
(8, 3, 'Elizabeth', 'Anderson'),
(9, 3, 'David', 'Taylor'),
(10, 4, 'Patricia', 'Thomas'),
(11, 4, 'Richard', 'Moore'),
(12, 4, 'Linda', 'Jackson'),
(13, 5, 'Joseph', 'White'),
(14, 5, 'Barbara', 'Harris'),
(15, 5, 'Thomas', 'Lewis'),
(16, 6, 'Susan', 'Walker'),
(17, 6, 'Charles', 'Young'),
(18, 7, 'Karen', 'Hall'),
(19, 7, 'Daniel', 'Allen'),
(20, 7, 'Nancy', 'King');

CREATE TABLE `positions` (
  `id` int(11) NOT NULL,
  `description` varchar(50) NOT NULL,
  `max_vote` int(11) NOT NULL,
  `priority` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `positions` (`id`, `description`, `max_vote`, `priority`) VALUES
(1, 'President', 100, 1),
(2, 'Vice President', 90, 2),
(3, 'Governor', 80, 3),
(4, 'Senator', 70, 4),
(5, 'Prime Minister', 85, 5);

CREATE TABLE `voters` (
  `id` int(11) NOT NULL,
  `voters_id` varchar(15) NOT NULL,
  `password` varchar(60) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `voters` (`id`, `voters_id`, `password`, `firstname`, `lastname`) VALUES
(1, 'VOTER001', 'password123', 'John', 'Doe'),
(2, 'VOTER002', 'password456', 'Jane', 'Smith'),
(3, 'VOTER003', 'password789', 'Alice', 'Johnson'),
(4, 'VOTER004', 'password321', 'Bob', 'Brown'),
(5, 'VOTER005', 'password654', 'Charlie', 'Davis');

CREATE TABLE `votes` (
  `id` int(11) NOT NULL,
  `voters_id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `votes` (`id`, `voters_id`, `candidate_id`, `position_id`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 3, 2),
(5, 5, 5, 4);

ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `voters`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `candidates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

ALTER TABLE `positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `voters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

CREATE TABLE `ElectionDetails` (
  `election_year` int(11) NOT NULL,
  `election_date` date NOT NULL,
  `election_type` varchar(50) NOT NULL,
  `total_votes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `ElectionDetails` (`election_year`, `election_date`, `election_type`, `total_votes`) VALUES
(2023, '2023-11-07', 'Presidential', 10000000),
(2024, '2024-11-05', 'Presidential', 12000000);

COMMIT;
