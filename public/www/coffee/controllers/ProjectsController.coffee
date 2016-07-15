app.controller 'ProjectsController', ($scope, $http) ->
  $scope.projects = $scope.json.report.projects
  $scope.title = "Total Projects #{$scope.projects.length}"
