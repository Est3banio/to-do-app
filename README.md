![BanioBits](https://www.baniobits.dev/BanioBits.png)

# Task Manager App

A modern and intuitive to-do application built with Ruby on Rails, allowing users to manage their tasks and organize them by categories.

## Features

- User authentication with registration and login
- Create, read, update, and delete tasks
- Assign multiple categories to tasks
- Color-coded categories for visual organization
- Mobile-responsive design using Tailwind CSS

## Technology Stack

- Ruby 3.4.1
- Rails 8.0.1
- SQLite3 database
- Devise for authentication
- Turbo and Stimulus for JavaScript enhancements
- Tailwind CSS for styling

## Installation

### Prerequisites

- Ruby 3.4.1
- Bundler
- Node.js and Yarn

### Setup

1. Clone the repository

```bash
git clone <repository-url>
cd to-do
```

2. Install dependencies

```bash
bin/setup
```

3. Start the development server

```bash
bin/dev
```

4. Visit <http://localhost:3000> in your browser

## Database Structure

The application has three main models:

- **User**: Manages authentication and owns tasks
- **Todo**: Represents individual tasks belonging to users
- **Category**: Color-coded labels that can be assigned to multiple tasks

## Testing

Run the test suite with:

```bash
bin/rails test
```

## Deployment

This application can be deployed using Docker:

```bash
docker build -t task-manager .
docker run -p 3000:3000 task-manager
```

## License

This project is open source under the MIT license.

