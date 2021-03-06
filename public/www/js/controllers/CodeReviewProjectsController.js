// Generated by CoffeeScript 1.10.0
app.controller('CodeReviewProjectsController', function($scope, $http) {
  $scope.filteredProjects = $scope.json.report.projects.filter(function(x) {
    return x.code_review_issue_count > 0;
  });
  $scope.projects = $scope.filteredProjects;
  $scope.filteredProjects = $scope.projects;
  $scope.selectFilter = "status";
  $scope.selected = ["on track"];
  $scope.statusList = [];

  $scope.statusList = getStatuses($scope.projects, $scope.selectFilter);
  $scope.filteredProjects = filterProjects($scope.selected, $scope.projects, $scope.selectFilter);

  $scope.change = function(){
    $scope.statusList = getStatuses($scope.projects, $scope.selectFilter);
    $scope.filteredProjects = filterProjects($scope.selected, $scope.projects, $scope.selectFilter);
  }

  $scope.toggle = function(item, list) {
    var idx = list.indexOf(item);

    if (idx > -1) {
      list.splice(idx, 1);
    }
    else {
      list.push(item);
    }
    $scope.filteredProjects = filterProjects(list, $scope.projects, $scope.selectFilter);
    $scope.title = "Code Review " + $scope.filteredProjects.length;
  };

  $scope.exists = function (item, list) {
    return list.indexOf(item) > -1;
  };

  $scope.isStuck = function(status){
    if (status) {
      return status.toLowerCase() == "stuck";
    } else{
      return false;
    }
  }

  $scope.noStatus = function(status){
    if (status) {
      return false;
    }
    return true;
  }

  return $scope.title = "Code Review " + $scope.filteredProjects.length;
});
