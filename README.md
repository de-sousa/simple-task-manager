# Simple Task Manager

## Tutorial

I'm gonna be using `school/math` as an example of a project.
`math` is a project and `school` is a group of projects. It can have as many levels as you want.

- Adding a task, like `Study chapter 3`, to the project is done like:
```
pro add school/math "Study chapter 3"
```

- Adding multiple tasks, like `Study chapter 3`, `Solve chapter 3 exercises` and `Review`, to the project is done like:
```
pro add school/math
```
and typing on the following prompt:
```
Study chapter 3
Solve chapter 3 exercises
Review
```
followed by `Control-d`.

- These lists are ordered, and work like a queue, and only the one at the front can be removed at a time.
	- Checking all the tasks in a project can be done like:
```
pro show school/math
```
which would output:
```
Study chapter 3
Solve chapter 3 exercises
Review
```

	- Checking the task at the front can be done like:
```
pro next school/math	
```
which would output:
```
Study chapter 3
```

- Marking the task in front can be done like:
```
pro done school/math
```
which would output:
```
DONE:
Study chapter 3
```
and doing `pro next school/math` would output:
```
Solve chapter 3 exercises
```

- To manage multiple projects, adding for example `school/english` and `reading`:
	- Checking all of them can be done with:
```
pro all
```
which would output:
```
> school/english
> school/math
> reading
```
	- Showing the next task in all projects can be done with:
```
pro next
```
which would output:
```

> school/english
Study grammar

> school/math
Solve chapter 3 exercises

> reading
Read next pages of book

```

- Removing tasks can be done with:
```
pro remove school/math
```
or removing group of projects with:
```
pro remove school
```

## Notes

- Projects are just files and directories. It's possible to edit the files and creating directories, instead of using `pro add`.

- There's also a history of solved tasks. Since this is a small script, it can be figured out by analyzing it.

- Only allowing to remove the tasks at the front is a personal preference, to allow the breakdown of complex projects into simple sequential tasks with the intention of reducing cognitive load.
