app.controller 'CodeReviewProjectsController', ($scope, $http) ->
  $scope.projects = $scope.json.report.projects.filter (x) -> x.code_review_issue_count > 0
  $scope.title = "Code Review #{$scope.projects.length}"
