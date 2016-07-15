app = angular.module('app', [
  'ngRoute'
])

Object.defineProperty Array.prototype, 'chunk', value: (chunkSize) ->
  R = []
  i = 0
  while i < @length
    R.push @slice(i, i + chunkSize)
    i += chunkSize
  while R[R.length - 1].length != chunkSize
    R[R.length - 1].push []
  R

app.config ['$routeProvider', ($routeProvider) ->
  $routeProvider
    .when('/', templateUrl: 'www/partials/dashboard.html', controller: 'DashboardController')
    .when('/customers', templateUrl: 'www/partials/customers.html', controller: 'CustomersController')
    .when('/projects', templateUrl: 'www/partials/projects.html', controller: 'ProjectsController')
    .when('/projects/code_review', templateUrl: 'www/partials/projects.html', controller: 'CodeReviewProjectsController')
    .otherwise(redirectTo: '/')
  return
]

app.filter 'percentage', ['$window', ($window) ->
  (input, decimals, suffix) ->
    decimals = if angular.isNumber(decimals) then decimals else 0
    suffix = suffix or '%'
    return 0 + suffix if $window.isNaN(input)
    r = Math.round(input * 10 ** (decimals + 2)) / 10 ** decimals
    r = 0 if r == Infinity
    r + suffix
]

isOld = (prj) ->
  return true unless prj.last_activity?
  date = new Date()
  date.setTime( date.getTime() - 30 * 24 * 60 * 60 * 1000 )
  new Date(prj.last_activity) < date

parseTkwDescription = (prj) ->
  try
    json_string = prj.description.split('----')[1]
    json = JSON.parse(json_string)
    return json
  catch
    console.log prj.description
    return {}
