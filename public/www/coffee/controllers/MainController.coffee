app.controller 'MainController', ($scope, $location, $http) ->
  $scope.goto = (path) ->
    $location.path(path)

  $scope.json = {}
  $scope.colors = ['#9300a5', '#ed8875', '#ed3363', '#ef8ca8']
  $scope.offices = ['Deva', 'Cluj-Napoca', 'Oradea']

  $http(method: 'GET', url: 'jira-cli/reports/report.json').then((response) ->
    $scope.json.report = response.data
    activeProjectsLastMonth = 0
    onTrackProjects = 0
    for prj in $scope.json.report.projects
      prj.old = isOld(prj)
      prj.tkwDescription = parseTkwDescription(prj)
      onTrackProjects += 1 if activeProjectsLastMonth == "On track"
      activeProjectsLastMonth += 1 if not prj.old
    $scope.json.report.onTrackProjects = onTrackProjects
    $scope.json.report.activeProjectsLastMonth = activeProjectsLastMonth
  )

  $http(method: 'GET', url: 'tkw-ldap/reports/graph.json').then((response) ->
    $scope.json.users = response.data
    cnt = 0
    for loc in $scope.json.users
      cnt += loc.y if $scope.offices.indexOf(loc.key) != -1
    $scope.json.employeeCount = cnt
  )
