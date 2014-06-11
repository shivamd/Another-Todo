angular.module('taskApp')
       .controller("TaskCtrl", ['$scope','$resource', ($scope, $resource) ->

  Task = $resource("/api/tasks/:id", {id: "@id"}, {update: {method: "PATCH"}})
  $scope.tasks = Task.query()

  $scope.addTask = ->
    task = Task.save({name: $scope.taskName, done: false})
    $scope.tasks.push(task)
    $scope.taskName = ''
    $scope.taskForm.$setPristine()

  $scope.deleteTask = ($index) ->
    $scope.tasks[$index].$remove()
    $scope.tasks.splice($index, 1)

  $scope.updateStatus = (task) ->
    task.completed = !task.completed
    Task.update({task: task, id: task.id})
  $scope.editTask = (task) ->
    task.editing = true

  $scope.doneEditing = (task) ->
    task.editing = false
    Task.update({task: task, id: task.id})

  $scope.remaining = ->
    count = 0
    angular.forEach($scope.tasks, (task) ->
      unless task.completed
        count+= 1
    )
    count + if count == 1 then " task" else " tasks"
])



