# README

## Goal

This goal of this interview is to learn more about what it would be like to work together, especially:

- How you break down complex problems
- Your knowledge of web applications in general and Ruby on Rails in particular
- What it's like to pair program with you for a couple of hours, which is something we do relatively often as a team

We are excited to work with folks transitioning from other stacks, but we'll be working on a Rails-based project for this interview. If you are more familiar with another stack, we will help you translate the idioms and concepts during the interview. :)

## How to prepare

- Read the sections below and take a glance at the models, views, and controllers
- Make sure you can boot the application and run test suite of this project

If you have worked with Ruby on Rails recently, you shouldn't need to spend more than 15-20 minutes to prepare for the interview.

## Running the project

1. Run `bundle install` to install gem dependencies
2. Run `rails db:setup` to create the dev/test databases, load the schema, and create some seed records
3. Run `bin/dev`
4. Visit `localhost:3000` and ensure that you see the "You're on Rails!" page
5. Run `bin/rspec` to run the test suite

## Overview

We'll spend the first few minutes of the interview answering any questions you might have about the project. After that we are going to go over the specific requirements for the interview problem.

For our backend-leaning interview, be ready to extend the data model below to support a new feature.

For our frontend-leaning interview, be ready to evolve the design of a page and add some new functionality to it.

> Note that this is a Rails 7 project, which means it uses `importmap` and `hotwire` (Turbo, Stimulus, etc) by default. We don't expect you to have any specific knowledge of these technologies, but they are available if you would like to use them for anything.

> Note that we tried to keep this application as simple as possible. This also means that there are some quirks and missing pieces - for example authentication.


## The application

The application is divided into two main components:
* A admin component used by our employees (people that work at Brightline)
* A member component used by our members (people we provide care for)

You can find the respective controllers for each component in `app/controllers/admin` and `app/controllers/members`.

## The data model

At Brightline we assign homework to a `Member` in the form of an `ExerciseAssignment`. Some important things that you should know:

- Each `ExerciseAssignment` is assigned to a `Member`
- An `ExerciseAssignment` references an `Exercise`
- An `Exercise` encodes common information of the homework that we assign - for example the URL of the handout / video / ...
- The same `Exercise` can be assigned to a `Member` multiple times by creating multiple `ExeciseAssignment`s
- An `ExerciseAssignment` can be completed by setting the `status` to `completed`
- We define `Exercise`s in a YAML file

## How do Exercises work?

We've omitted some lower-level details of `Exercises` that don't really apply to this scenario, such as per-exercise data schemas or permissions. You can assume that `ExerciseAssignments` generally work as follows:

1. A admin assigns an `Exercise` to a `Member`
2. The member logs into their account and sees a list of pending assignments
3. They select an assignment and are presented with a multi-step UI for completing it
4. They fill out several fields and submit the assignment
5. A Rails controller sets the status to `completed` and populates `response` columns for the relevant `ExerciseAssignment`

As a specific example, here's how "Learning to Relax" might work:

1. "Before we start - how are you feeling?" (slider from 1-10 where 1 = very stressed, 10 = very relaxed)
2. Member completes a guided meditation exercise presented via video
3. "How are you feeling now?" (slider from 1-10 again)

Then the backend would persist `starting_feeling` and `ending_feeling` in the JSONB `response`
column on `ExerciseAssignment`.

Each exercise may collect unique data points, which is why it uses an unstructured JSONB column.
