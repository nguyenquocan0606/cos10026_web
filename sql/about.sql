-- ABT-1: about table (team members and their contributions)
-- Owner: Tran Trung Tin
-- Loaded by about.php for the member cards and the fun facts table.
-- To be merged into the team's main .sql file (NOP-2).
--
-- part2_contribution holds each member's PLANNED Part 2 tasks from the plan
-- sheet. Replace it with what each person actually did before submission (ABT-8).

DROP TABLE IF EXISTS about;

CREATE TABLE about (
  member_id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  display_order      TINYINT UNSIGNED NOT NULL,
  full_name          VARCHAR(60)  NOT NULL,
  student_id         CHAR(9)      NOT NULL,
  part1_contribution TEXT         NOT NULL,
  part2_contribution TEXT         NOT NULL,
  quote              VARCHAR(255) NOT NULL,
  dream_job          VARCHAR(60)  NOT NULL,
  dream_job_icon     VARCHAR(8)   NOT NULL DEFAULT '',
  coding_snack       VARCHAR(40)  NOT NULL,
  hometown           VARCHAR(40)  NOT NULL,
  PRIMARY KEY (member_id),
  UNIQUE KEY uq_about_student_id (student_id),
  UNIQUE KEY uq_about_display_order (display_order)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO about
  (display_order, full_name, student_id, part1_contribution, part2_contribution,
   quote, dream_job, dream_job_icon, coding_snack, hometown)
VALUES
  (1, 'Tran Trung Tin', '106200136',
   'Set up the Jira board and confirmed tutor access. Built the About page and the shared footer.',
   'Planned: about and users tables, about page loaded from the database, login and logout with account lockout, Jira tasks for Part 2, README and GenAI credits.',
   'i feel like there is a sleep in me that needs to be slept but eachtime i sleep i don''t sleep that sleep.',
   'Security engineer/analyst', '🔐', 'Banh Mi', 'Hanoi'),

  (2, 'Nguyen Quoc An', '105550652',
   'Built the Index page, deployed the site with GitHub Pages and prepared the final ZIP.',
   'Planned: shared PHP includes, settings.php and helper functions, folder restructure, manage page with all HR queries, final SQL file and submission.',
   'Life is like coding: Every bug is a lesson, every fix is a step forward.',
   'AI Engineer', '💻', 'Bugs', 'Hanoi'),

  (3, 'Nguyen Chi Hien', '106393625',
   'Built the Jobs page and checked form validation, keyboard navigation and layouts.',
   'Planned: jobs table, jobs page and home page loaded from the database, job search, styling review of the new pages.',
   '90% of gamblers quit right before they''re about to hit big!',
   'Gambler', '🎰', 'Chips', 'Hanoi'),

  (4, 'Do Dinh Phu', '105559808',
   'Built the Apply page and its form validation, then validated all four HTML pages and checked links.',
   'Planned: eoi table, apply form posting to process_eoi.php, server-side validation and sanitising, final link and validator check.',
   'You squash a bug and 100 more come out~',
   'Game programmer/tester', '🎮', 'Potato Chips', 'Nam Dinh');
