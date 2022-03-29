# README

2022-03-28: We just made a big change to this project in order to start supporting a new frontend interview track. The project now uses Rails 7 + SQLite instead of Rails 6 + PostgreSQL.

If you've already set things up with Rails 6 + PostgreSQL, no need to make any changes. Just wanted to call this out in case you see a mismatch between your local copy and this repo on GitHub.

## Goal

This goal of this interview is to learn more about what it would be like to work together, especially:

- How you break down complex problems
- Your knowledge of web applications in general and Ruby on Rails in particular
- What it's like to pair program with you for a couple of hours, which is something we do relatively often as a team

We are excited to work with folks transitioning from other stacks, but we'll be working on a Rails-based project for this interview. If you are more familiar with another stack, we will help you translate the idioms and concepts during the interview. :)

## How to prepare

- Read the sections below and take a glance at the models, views, and controllers
- Make sure you can run the application and test suite of this project

If you have worked with Ruby on Rails recently, you shouldn't need to spend more than 15-20 minutes to prepare for the interview.

## Running the project

1. Run `bundle install` to install gem dependencies
2. Run `rails db:setup` to create the dev/test databases, load the schema, and create some seed records
3. Run `bin/dev`
4. Visit `localhost:3000` and ensure that you see the "You're on Rails!" page

## Overview

We'll spend the first few minutes of the interview answering any questions you might have about the project. After that we are going to go over the specific requirements for the interview problem.

For our backend-leaning interview, be ready to extend the data model below to support a new feature.

For our frontend-leaning interview, be ready to evolve the design of a page and add some new functionality to it.

Note that this is a Rails 7 project, which means it uses `importmap` and `hotwire` (Turbo, Stimulus, etc) by default. We don't expect you to have any specific knowledge of these technologies, but they are available if you would like to use them for anything.

## The data model

At Brightline we assign homework to a `Member` in the form of an `ExerciseAssignment`. Some important things that you should know:

- Each `ExerciseAssignment` is assigned to a `Member`
- An `ExerciseAssignment` references an `Exercise`
- An `Exercise` encodes common information of the homework that we assign - for example the URL of the handout / video / ...
- A member can complete the same `Exercise` multiple times
- An `ExerciseAssignment` can be completed by setting the `completed_at` date
- We define `Exercise`s in a YAML file

## How do Exercises work?

We've omitted some lower-level details of `Exercises` that don't really apply to this scenario, such as per-exercise data schemas or permissions. You can assume that `ExerciseAssignments` generally work as follows:

1. A member logs into their account and sees a list of active assignments
2. They select an assignment and are presented with a multi-step UI for completing it
3. They fill out several fields and submit the assignment
4. A Rails controller populates the `completed_at` and `data` columns for the relevant ExerciseAssignment

As a specific example, here's how "Learning to Relax" might work:

1. "Before we start - how are you feeling?" (slider from 1-10 where 1 = very stressed, 10 = very relaxed)
2. Member completes a guided meditation exercise presented via video
3. "How are you feeling now?" (slider from 1-10 again)

Then the backend would persist `starting_feeling` and `ending_feeling` in the JSONB `data`
column on ExerciseAssignment.

Each exercise may collect unique data points, which is why it uses an unstructured JSONB column.
