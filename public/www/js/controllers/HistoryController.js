app.controller('HistoryController', function($scope, $location, $http) {
  $scope.data = {}

  $scope.last = function(hash){
    keys = Object.keys(hash)
    keys.sort()
    return hash[keys[keys.length - 1]]
  }

  $scope.progress = function(year, week) {
    before = (week - 1).toString();

    if ($scope.data[year][before]){
      before_week = $scope.data[year][before]
      current_week = $scope.data[year][week]

      first_progress = $scope.last(before_week.days)[$scope.last(before_week.days).length - 1].codeReviewProjects / $scope.last(before_week.days)[$scope.last(before_week.days).length - 1].onTrackProjects;
      second_progress = $scope.last(current_week.days)[$scope.last(current_week.days).length - 1].codeReviewProjects / $scope.last(current_week.days)[$scope.last(current_week.days).length - 1].onTrackProjects;

      first_progress = Math.round(first_progress * 100)
      second_progress = Math.round(second_progress * 100)

      if (first_progress === Infinity || isNaN(first_progress)) {
        first_progress = 0;
      }
      if (second_progress === Infinity) {
        second_progress = 0;
      }

      return second_progress - first_progress;

    } else {
      return 0;
    }
  }

  return $http({
    method: 'GET',
    url: '/api/projects/graph'
  }).then(function(response) {
    $scope.data = response.data.body.graph;
  });
});
