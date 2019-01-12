## glass - genuine(?) lightweight about screen sample(?)

### What is glass?

glass is a barebones about screen for Android applications. It is a bit hard to name it a library, since it doesn't have an API. It's feasible to add glass in your project without hassle though.

### Why did you write it, if there are some good libraries available?

Most(if not all) libraries require gradle to build. I want to be able to build applications without it (e.g. on mobile in Termux).

### How can I add glass in my project?

1. Copy res/ and src/ directories in your project.
2. Change content of res/values/glass\_app\_info.xml with your data
  2.1. There are two sections in the "Thanks to" part: Contributors and Projects. Items of each section correspond to 3 string arrays(names, information, links). All three arrays must have the same size.
  2.2. By default, the activity pastes version name from R.string.glass\_app\_version to R.string.glass\_text, where %s is located. If you don't want version name in the text, edit the Activity's onCreate to remove formatting.
  2.3. Links to feedback, source code, support pages can be hidden by setting their urls empty.
3. Import your application\'s R class in all files where it is used.
4. Add activity in project\'s AndroidManifest.xml

### How can I help you?

This project needs more translations. If you want to code something for glass, please write an issue to discuss the changes.

### License
```
Copyright 2019 Anri Dellal

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
