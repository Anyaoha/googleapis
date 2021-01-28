// This is a generated file (see the discoveryapis_generator project).

// ignore_for_file: camel_case_types
// ignore_for_file: comment_references
// ignore_for_file: file_names
// ignore_for_file: library_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: prefer_final_locals
// ignore_for_file: prefer_interpolation_to_compose_strings
// ignore_for_file: unnecessary_brace_in_string_interps
// ignore_for_file: unnecessary_cast
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: unnecessary_string_interpolations

/// Cloud Build API - v1
///
/// Creates and manages builds on Google Cloud Platform.
///
/// For more information, see <https://cloud.google.com/cloud-build/docs/>
///
/// Create an instance of [CloudBuildApi] to access these resources:
///
/// - [OperationsResourceApi]
/// - [ProjectsResourceApi]
///   - [ProjectsBuildsResourceApi]
///   - [ProjectsLocationsResourceApi]
///     - [ProjectsLocationsBuildsResourceApi]
///     - [ProjectsLocationsOperationsResourceApi]
///   - [ProjectsTriggersResourceApi]
library cloudbuild.v1;

import 'dart:async' as async;
import 'dart:convert' as convert;
import 'dart:core' as core;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:http/http.dart' as http;

import '../src/user_agent.dart';

export 'package:_discoveryapis_commons/_discoveryapis_commons.dart'
    show ApiRequestError, DetailedApiRequestError;

/// Creates and manages builds on Google Cloud Platform.
class CloudBuildApi {
  /// View and manage your data across Google Cloud Platform services
  static const cloudPlatformScope =
      'https://www.googleapis.com/auth/cloud-platform';

  final commons.ApiRequester _requester;

  OperationsResourceApi get operations => OperationsResourceApi(_requester);
  ProjectsResourceApi get projects => ProjectsResourceApi(_requester);

  CloudBuildApi(http.Client client,
      {core.String rootUrl = 'https://cloudbuild.googleapis.com/',
      core.String servicePath = ''})
      : _requester =
            commons.ApiRequester(client, rootUrl, servicePath, userAgent);
}

class OperationsResourceApi {
  final commons.ApiRequester _requester;

  OperationsResourceApi(commons.ApiRequester client) : _requester = client;

  /// Starts asynchronous cancellation on a long-running operation. The server
  /// makes a best effort to cancel the operation, but success is not
  /// guaranteed. If the server doesn't support this method, it returns
  /// `google.rpc.Code.UNIMPLEMENTED`. Clients can use Operations.GetOperation
  /// or other methods to check whether the cancellation succeeded or whether
  /// the operation completed despite cancellation. On successful cancellation,
  /// the operation is not deleted; instead, it becomes an operation with an
  /// Operation.error value with a google.rpc.Status.code of 1, corresponding to
  /// `Code.CANCELLED`.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - The name of the operation resource to be cancelled.
  /// Value must have pattern "^operations/.*$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Empty].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Empty> cancel(
    CancelOperationRequest request,
    core.String name, {
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (request != null) {
      _body = convert.json.encode(request.toJson());
    }
    if (name == null) {
      throw core.ArgumentError('Parameter name is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name') + ':cancel';

    final _response = _requester.request(
      _url,
      'POST',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
      downloadOptions: _downloadOptions,
    );
    return _response.then(
      (data) => Empty.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }

  /// Gets the latest state of a long-running operation. Clients can use this
  /// method to poll the operation result at intervals as recommended by the API
  /// service.
  ///
  /// Request parameters:
  ///
  /// [name] - The name of the operation resource.
  /// Value must have pattern "^operations/.*$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Operation].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Operation> get(
    core.String name, {
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (name == null) {
      throw core.ArgumentError('Parameter name is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name');

    final _response = _requester.request(
      _url,
      'GET',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
      downloadOptions: _downloadOptions,
    );
    return _response.then(
      (data) => Operation.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }
}

class ProjectsResourceApi {
  final commons.ApiRequester _requester;

  ProjectsBuildsResourceApi get builds => ProjectsBuildsResourceApi(_requester);
  ProjectsLocationsResourceApi get locations =>
      ProjectsLocationsResourceApi(_requester);
  ProjectsTriggersResourceApi get triggers =>
      ProjectsTriggersResourceApi(_requester);

  ProjectsResourceApi(commons.ApiRequester client) : _requester = client;
}

class ProjectsBuildsResourceApi {
  final commons.ApiRequester _requester;

  ProjectsBuildsResourceApi(commons.ApiRequester client) : _requester = client;

  /// Cancels a build in progress.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [projectId] - Required. ID of the project.
  ///
  /// [id] - Required. ID of the build.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Build].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Build> cancel(
    CancelBuildRequest request,
    core.String projectId,
    core.String id, {
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (request != null) {
      _body = convert.json.encode(request.toJson());
    }
    if (projectId == null) {
      throw core.ArgumentError('Parameter projectId is required.');
    }
    if (id == null) {
      throw core.ArgumentError('Parameter id is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/projects/' +
        commons.Escaper.ecapeVariable('$projectId') +
        '/builds/' +
        commons.Escaper.ecapeVariable('$id') +
        ':cancel';

    final _response = _requester.request(
      _url,
      'POST',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
      downloadOptions: _downloadOptions,
    );
    return _response.then(
      (data) => Build.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }

  /// Starts a build with the specified configuration. This method returns a
  /// long-running `Operation`, which includes the build ID. Pass the build ID
  /// to `GetBuild` to determine the build status (such as `SUCCESS` or
  /// `FAILURE`).
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [projectId] - Required. ID of the project.
  ///
  /// [parent] - The parent resource where this build will be created. Format:
  /// `projects/{project}/locations/{location}`
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Operation].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Operation> create(
    Build request,
    core.String projectId, {
    core.String parent,
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (request != null) {
      _body = convert.json.encode(request.toJson());
    }
    if (projectId == null) {
      throw core.ArgumentError('Parameter projectId is required.');
    }
    if (parent != null) {
      _queryParams['parent'] = [parent];
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/projects/' +
        commons.Escaper.ecapeVariable('$projectId') +
        '/builds';

    final _response = _requester.request(
      _url,
      'POST',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
      downloadOptions: _downloadOptions,
    );
    return _response.then(
      (data) => Operation.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }

  /// Returns information about a previously requested build. The `Build` that
  /// is returned includes its status (such as `SUCCESS`, `FAILURE`, or
  /// `WORKING`), and timing information.
  ///
  /// Request parameters:
  ///
  /// [projectId] - Required. ID of the project.
  ///
  /// [id] - Required. ID of the build.
  ///
  /// [name] - The name of the `Build` to retrieve. Format:
  /// `projects/{project}/locations/{location}/builds/{build}`
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Build].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Build> get(
    core.String projectId,
    core.String id, {
    core.String name,
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (projectId == null) {
      throw core.ArgumentError('Parameter projectId is required.');
    }
    if (id == null) {
      throw core.ArgumentError('Parameter id is required.');
    }
    if (name != null) {
      _queryParams['name'] = [name];
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/projects/' +
        commons.Escaper.ecapeVariable('$projectId') +
        '/builds/' +
        commons.Escaper.ecapeVariable('$id');

    final _response = _requester.request(
      _url,
      'GET',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
      downloadOptions: _downloadOptions,
    );
    return _response.then(
      (data) => Build.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }

  /// Lists previously requested builds. Previously requested builds may still
  /// be in-progress, or may have finished successfully or unsuccessfully.
  ///
  /// Request parameters:
  ///
  /// [projectId] - Required. ID of the project.
  ///
  /// [filter] - The raw filter text to constrain the results.
  ///
  /// [pageSize] - Number of results to return in the list.
  ///
  /// [pageToken] - Token to provide to skip to a particular spot in the list.
  ///
  /// [parent] - The parent of the collection of `Builds`. Format:
  /// `projects/{project}/locations/location`
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ListBuildsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ListBuildsResponse> list(
    core.String projectId, {
    core.String filter,
    core.int pageSize,
    core.String pageToken,
    core.String parent,
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (projectId == null) {
      throw core.ArgumentError('Parameter projectId is required.');
    }
    if (filter != null) {
      _queryParams['filter'] = [filter];
    }
    if (pageSize != null) {
      _queryParams['pageSize'] = ['${pageSize}'];
    }
    if (pageToken != null) {
      _queryParams['pageToken'] = [pageToken];
    }
    if (parent != null) {
      _queryParams['parent'] = [parent];
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/projects/' +
        commons.Escaper.ecapeVariable('$projectId') +
        '/builds';

    final _response = _requester.request(
      _url,
      'GET',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
      downloadOptions: _downloadOptions,
    );
    return _response.then(
      (data) => ListBuildsResponse.fromJson(
          data as core.Map<core.String, core.dynamic>),
    );
  }

  /// Creates a new build based on the specified build. This method creates a
  /// new build using the original build request, which may or may not result in
  /// an identical build. For triggered builds: * Triggered builds resolve to a
  /// precise revision; therefore a retry of a triggered build will result in a
  /// build that uses the same revision. For non-triggered builds that specify
  /// `RepoSource`: * If the original build built from the tip of a branch, the
  /// retried build will build from the tip of that branch, which may not be the
  /// same revision as the original build. * If the original build specified a
  /// commit sha or revision ID, the retried build will use the identical
  /// source. For builds that specify `StorageSource`: * If the original build
  /// pulled source from Google Cloud Storage without specifying the generation
  /// of the object, the new build will use the current object, which may be
  /// different from the original build source. * If the original build pulled
  /// source from Cloud Storage and specified the generation of the object, the
  /// new build will attempt to use the same object, which may or may not be
  /// available depending on the bucket's lifecycle management settings.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [projectId] - Required. ID of the project.
  ///
  /// [id] - Required. Build ID of the original build.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Operation].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Operation> retry(
    RetryBuildRequest request,
    core.String projectId,
    core.String id, {
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (request != null) {
      _body = convert.json.encode(request.toJson());
    }
    if (projectId == null) {
      throw core.ArgumentError('Parameter projectId is required.');
    }
    if (id == null) {
      throw core.ArgumentError('Parameter id is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/projects/' +
        commons.Escaper.ecapeVariable('$projectId') +
        '/builds/' +
        commons.Escaper.ecapeVariable('$id') +
        ':retry';

    final _response = _requester.request(
      _url,
      'POST',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
      downloadOptions: _downloadOptions,
    );
    return _response.then(
      (data) => Operation.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }
}

class ProjectsLocationsResourceApi {
  final commons.ApiRequester _requester;

  ProjectsLocationsBuildsResourceApi get builds =>
      ProjectsLocationsBuildsResourceApi(_requester);
  ProjectsLocationsOperationsResourceApi get operations =>
      ProjectsLocationsOperationsResourceApi(_requester);

  ProjectsLocationsResourceApi(commons.ApiRequester client)
      : _requester = client;
}

class ProjectsLocationsBuildsResourceApi {
  final commons.ApiRequester _requester;

  ProjectsLocationsBuildsResourceApi(commons.ApiRequester client)
      : _requester = client;

  /// Cancels a build in progress.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - The name of the `Build` to retrieve. Format:
  /// `projects/{project}/locations/{location}/builds/{build}`
  /// Value must have pattern "^projects/[^/]+/locations/[^/]+/builds/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Build].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Build> cancel(
    CancelBuildRequest request,
    core.String name, {
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (request != null) {
      _body = convert.json.encode(request.toJson());
    }
    if (name == null) {
      throw core.ArgumentError('Parameter name is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name') + ':cancel';

    final _response = _requester.request(
      _url,
      'POST',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
      downloadOptions: _downloadOptions,
    );
    return _response.then(
      (data) => Build.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }

  /// Starts a build with the specified configuration. This method returns a
  /// long-running `Operation`, which includes the build ID. Pass the build ID
  /// to `GetBuild` to determine the build status (such as `SUCCESS` or
  /// `FAILURE`).
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - The parent resource where this build will be created. Format:
  /// `projects/{project}/locations/{location}`
  /// Value must have pattern "^projects/[^/]+/locations/[^/]+$".
  ///
  /// [projectId] - Required. ID of the project.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Operation].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Operation> create(
    Build request,
    core.String parent, {
    core.String projectId,
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (request != null) {
      _body = convert.json.encode(request.toJson());
    }
    if (parent == null) {
      throw core.ArgumentError('Parameter parent is required.');
    }
    if (projectId != null) {
      _queryParams['projectId'] = [projectId];
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$parent') + '/builds';

    final _response = _requester.request(
      _url,
      'POST',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
      downloadOptions: _downloadOptions,
    );
    return _response.then(
      (data) => Operation.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }

  /// Returns information about a previously requested build. The `Build` that
  /// is returned includes its status (such as `SUCCESS`, `FAILURE`, or
  /// `WORKING`), and timing information.
  ///
  /// Request parameters:
  ///
  /// [name] - The name of the `Build` to retrieve. Format:
  /// `projects/{project}/locations/{location}/builds/{build}`
  /// Value must have pattern "^projects/[^/]+/locations/[^/]+/builds/[^/]+$".
  ///
  /// [id] - Required. ID of the build.
  ///
  /// [projectId] - Required. ID of the project.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Build].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Build> get(
    core.String name, {
    core.String id,
    core.String projectId,
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (name == null) {
      throw core.ArgumentError('Parameter name is required.');
    }
    if (id != null) {
      _queryParams['id'] = [id];
    }
    if (projectId != null) {
      _queryParams['projectId'] = [projectId];
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name');

    final _response = _requester.request(
      _url,
      'GET',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
      downloadOptions: _downloadOptions,
    );
    return _response.then(
      (data) => Build.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }

  /// Lists previously requested builds. Previously requested builds may still
  /// be in-progress, or may have finished successfully or unsuccessfully.
  ///
  /// Request parameters:
  ///
  /// [parent] - The parent of the collection of `Builds`. Format:
  /// `projects/{project}/locations/location`
  /// Value must have pattern "^projects/[^/]+/locations/[^/]+$".
  ///
  /// [filter] - The raw filter text to constrain the results.
  ///
  /// [pageSize] - Number of results to return in the list.
  ///
  /// [pageToken] - Token to provide to skip to a particular spot in the list.
  ///
  /// [projectId] - Required. ID of the project.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ListBuildsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ListBuildsResponse> list(
    core.String parent, {
    core.String filter,
    core.int pageSize,
    core.String pageToken,
    core.String projectId,
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (parent == null) {
      throw core.ArgumentError('Parameter parent is required.');
    }
    if (filter != null) {
      _queryParams['filter'] = [filter];
    }
    if (pageSize != null) {
      _queryParams['pageSize'] = ['${pageSize}'];
    }
    if (pageToken != null) {
      _queryParams['pageToken'] = [pageToken];
    }
    if (projectId != null) {
      _queryParams['projectId'] = [projectId];
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$parent') + '/builds';

    final _response = _requester.request(
      _url,
      'GET',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
      downloadOptions: _downloadOptions,
    );
    return _response.then(
      (data) => ListBuildsResponse.fromJson(
          data as core.Map<core.String, core.dynamic>),
    );
  }

  /// Creates a new build based on the specified build. This method creates a
  /// new build using the original build request, which may or may not result in
  /// an identical build. For triggered builds: * Triggered builds resolve to a
  /// precise revision; therefore a retry of a triggered build will result in a
  /// build that uses the same revision. For non-triggered builds that specify
  /// `RepoSource`: * If the original build built from the tip of a branch, the
  /// retried build will build from the tip of that branch, which may not be the
  /// same revision as the original build. * If the original build specified a
  /// commit sha or revision ID, the retried build will use the identical
  /// source. For builds that specify `StorageSource`: * If the original build
  /// pulled source from Google Cloud Storage without specifying the generation
  /// of the object, the new build will use the current object, which may be
  /// different from the original build source. * If the original build pulled
  /// source from Cloud Storage and specified the generation of the object, the
  /// new build will attempt to use the same object, which may or may not be
  /// available depending on the bucket's lifecycle management settings.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - The name of the `Build` to retry. Format:
  /// `projects/{project}/locations/{location}/builds/{build}`
  /// Value must have pattern "^projects/[^/]+/locations/[^/]+/builds/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Operation].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Operation> retry(
    RetryBuildRequest request,
    core.String name, {
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (request != null) {
      _body = convert.json.encode(request.toJson());
    }
    if (name == null) {
      throw core.ArgumentError('Parameter name is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name') + ':retry';

    final _response = _requester.request(
      _url,
      'POST',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
      downloadOptions: _downloadOptions,
    );
    return _response.then(
      (data) => Operation.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }
}

class ProjectsLocationsOperationsResourceApi {
  final commons.ApiRequester _requester;

  ProjectsLocationsOperationsResourceApi(commons.ApiRequester client)
      : _requester = client;

  /// Starts asynchronous cancellation on a long-running operation. The server
  /// makes a best effort to cancel the operation, but success is not
  /// guaranteed. If the server doesn't support this method, it returns
  /// `google.rpc.Code.UNIMPLEMENTED`. Clients can use Operations.GetOperation
  /// or other methods to check whether the cancellation succeeded or whether
  /// the operation completed despite cancellation. On successful cancellation,
  /// the operation is not deleted; instead, it becomes an operation with an
  /// Operation.error value with a google.rpc.Status.code of 1, corresponding to
  /// `Code.CANCELLED`.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - The name of the operation resource to be cancelled.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/operations/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Empty].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Empty> cancel(
    CancelOperationRequest request,
    core.String name, {
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (request != null) {
      _body = convert.json.encode(request.toJson());
    }
    if (name == null) {
      throw core.ArgumentError('Parameter name is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name') + ':cancel';

    final _response = _requester.request(
      _url,
      'POST',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
      downloadOptions: _downloadOptions,
    );
    return _response.then(
      (data) => Empty.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }

  /// Gets the latest state of a long-running operation. Clients can use this
  /// method to poll the operation result at intervals as recommended by the API
  /// service.
  ///
  /// Request parameters:
  ///
  /// [name] - The name of the operation resource.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/operations/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Operation].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Operation> get(
    core.String name, {
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (name == null) {
      throw core.ArgumentError('Parameter name is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name');

    final _response = _requester.request(
      _url,
      'GET',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
      downloadOptions: _downloadOptions,
    );
    return _response.then(
      (data) => Operation.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }
}

class ProjectsTriggersResourceApi {
  final commons.ApiRequester _requester;

  ProjectsTriggersResourceApi(commons.ApiRequester client)
      : _requester = client;

  /// Creates a new `BuildTrigger`. This API is experimental.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [projectId] - Required. ID of the project for which to configure automatic
  /// builds.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [BuildTrigger].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<BuildTrigger> create(
    BuildTrigger request,
    core.String projectId, {
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (request != null) {
      _body = convert.json.encode(request.toJson());
    }
    if (projectId == null) {
      throw core.ArgumentError('Parameter projectId is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/projects/' +
        commons.Escaper.ecapeVariable('$projectId') +
        '/triggers';

    final _response = _requester.request(
      _url,
      'POST',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
      downloadOptions: _downloadOptions,
    );
    return _response.then(
      (data) =>
          BuildTrigger.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }

  /// Deletes a `BuildTrigger` by its project ID and trigger ID. This API is
  /// experimental.
  ///
  /// Request parameters:
  ///
  /// [projectId] - Required. ID of the project that owns the trigger.
  ///
  /// [triggerId] - Required. ID of the `BuildTrigger` to delete.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Empty].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Empty> delete(
    core.String projectId,
    core.String triggerId, {
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (projectId == null) {
      throw core.ArgumentError('Parameter projectId is required.');
    }
    if (triggerId == null) {
      throw core.ArgumentError('Parameter triggerId is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/projects/' +
        commons.Escaper.ecapeVariable('$projectId') +
        '/triggers/' +
        commons.Escaper.ecapeVariable('$triggerId');

    final _response = _requester.request(
      _url,
      'DELETE',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
      downloadOptions: _downloadOptions,
    );
    return _response.then(
      (data) => Empty.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }

  /// Returns information about a `BuildTrigger`. This API is experimental.
  ///
  /// Request parameters:
  ///
  /// [projectId] - Required. ID of the project that owns the trigger.
  ///
  /// [triggerId] - Required. Identifier (`id` or `name`) of the `BuildTrigger`
  /// to get.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [BuildTrigger].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<BuildTrigger> get(
    core.String projectId,
    core.String triggerId, {
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (projectId == null) {
      throw core.ArgumentError('Parameter projectId is required.');
    }
    if (triggerId == null) {
      throw core.ArgumentError('Parameter triggerId is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/projects/' +
        commons.Escaper.ecapeVariable('$projectId') +
        '/triggers/' +
        commons.Escaper.ecapeVariable('$triggerId');

    final _response = _requester.request(
      _url,
      'GET',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
      downloadOptions: _downloadOptions,
    );
    return _response.then(
      (data) =>
          BuildTrigger.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }

  /// Lists existing `BuildTrigger`s. This API is experimental.
  ///
  /// Request parameters:
  ///
  /// [projectId] - Required. ID of the project for which to list BuildTriggers.
  ///
  /// [pageSize] - Number of results to return in the list.
  ///
  /// [pageToken] - Token to provide to skip to a particular spot in the list.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ListBuildTriggersResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ListBuildTriggersResponse> list(
    core.String projectId, {
    core.int pageSize,
    core.String pageToken,
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (projectId == null) {
      throw core.ArgumentError('Parameter projectId is required.');
    }
    if (pageSize != null) {
      _queryParams['pageSize'] = ['${pageSize}'];
    }
    if (pageToken != null) {
      _queryParams['pageToken'] = [pageToken];
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/projects/' +
        commons.Escaper.ecapeVariable('$projectId') +
        '/triggers';

    final _response = _requester.request(
      _url,
      'GET',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
      downloadOptions: _downloadOptions,
    );
    return _response.then(
      (data) => ListBuildTriggersResponse.fromJson(
          data as core.Map<core.String, core.dynamic>),
    );
  }

  /// Updates a `BuildTrigger` by its project ID and trigger ID. This API is
  /// experimental.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [projectId] - Required. ID of the project that owns the trigger.
  ///
  /// [triggerId] - Required. ID of the `BuildTrigger` to update.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [BuildTrigger].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<BuildTrigger> patch(
    BuildTrigger request,
    core.String projectId,
    core.String triggerId, {
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (request != null) {
      _body = convert.json.encode(request.toJson());
    }
    if (projectId == null) {
      throw core.ArgumentError('Parameter projectId is required.');
    }
    if (triggerId == null) {
      throw core.ArgumentError('Parameter triggerId is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/projects/' +
        commons.Escaper.ecapeVariable('$projectId') +
        '/triggers/' +
        commons.Escaper.ecapeVariable('$triggerId');

    final _response = _requester.request(
      _url,
      'PATCH',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
      downloadOptions: _downloadOptions,
    );
    return _response.then(
      (data) =>
          BuildTrigger.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }

  /// Runs a `BuildTrigger` at a particular source revision.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [projectId] - Required. ID of the project.
  ///
  /// [triggerId] - Required. ID of the trigger.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Operation].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Operation> run(
    RepoSource request,
    core.String projectId,
    core.String triggerId, {
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (request != null) {
      _body = convert.json.encode(request.toJson());
    }
    if (projectId == null) {
      throw core.ArgumentError('Parameter projectId is required.');
    }
    if (triggerId == null) {
      throw core.ArgumentError('Parameter triggerId is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/projects/' +
        commons.Escaper.ecapeVariable('$projectId') +
        '/triggers/' +
        commons.Escaper.ecapeVariable('$triggerId') +
        ':run';

    final _response = _requester.request(
      _url,
      'POST',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
      downloadOptions: _downloadOptions,
    );
    return _response.then(
      (data) => Operation.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }
}

/// Files in the workspace to upload to Cloud Storage upon successful completion
/// of all build steps.
class ArtifactObjects {
  /// Cloud Storage bucket and optional object path, in the form
  /// "gs://bucket/path/to/somewhere/". (see [Bucket Name
  /// Requirements](https://cloud.google.com/storage/docs/bucket-naming#requirements)).
  /// Files in the workspace matching any path pattern will be uploaded to Cloud
  /// Storage with this location as a prefix.
  core.String location;

  /// Path globs used to match files in the build's workspace.
  core.List<core.String> paths;

  /// Output only. Stores timing information for pushing all artifact objects.
  TimeSpan timing;

  ArtifactObjects();

  ArtifactObjects.fromJson(core.Map _json) {
    if (_json.containsKey('location')) {
      location = _json['location'] as core.String;
    }
    if (_json.containsKey('paths')) {
      paths = (_json['paths'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
    if (_json.containsKey('timing')) {
      timing = TimeSpan.fromJson(
          _json['timing'] as core.Map<core.String, core.dynamic>);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (location != null) {
      _json['location'] = location;
    }
    if (paths != null) {
      _json['paths'] = paths;
    }
    if (timing != null) {
      _json['timing'] = timing.toJson();
    }
    return _json;
  }
}

/// An artifact that was uploaded during a build. This is a single record in the
/// artifact manifest JSON file.
class ArtifactResult {
  /// The file hash of the artifact.
  core.List<FileHashes> fileHash;

  /// The path of an artifact in a Google Cloud Storage bucket, with the
  /// generation number. For example,
  /// `gs://mybucket/path/to/output.jar#generation`.
  core.String location;

  ArtifactResult();

  ArtifactResult.fromJson(core.Map _json) {
    if (_json.containsKey('fileHash')) {
      fileHash = (_json['fileHash'] as core.List)
          .map<FileHashes>((value) =>
              FileHashes.fromJson(value as core.Map<core.String, core.dynamic>))
          .toList();
    }
    if (_json.containsKey('location')) {
      location = _json['location'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (fileHash != null) {
      _json['fileHash'] = fileHash.map((value) => value.toJson()).toList();
    }
    if (location != null) {
      _json['location'] = location;
    }
    return _json;
  }
}

/// Artifacts produced by a build that should be uploaded upon successful
/// completion of all build steps.
class Artifacts {
  /// A list of images to be pushed upon the successful completion of all build
  /// steps. The images will be pushed using the builder service account's
  /// credentials. The digests of the pushed images will be stored in the Build
  /// resource's results field. If any of the images fail to be pushed, the
  /// build is marked FAILURE.
  core.List<core.String> images;

  /// A list of objects to be uploaded to Cloud Storage upon successful
  /// completion of all build steps. Files in the workspace matching specified
  /// paths globs will be uploaded to the specified Cloud Storage location using
  /// the builder service account's credentials. The location and generation of
  /// the uploaded objects will be stored in the Build resource's results field.
  /// If any objects fail to be pushed, the build is marked FAILURE.
  ArtifactObjects objects;

  Artifacts();

  Artifacts.fromJson(core.Map _json) {
    if (_json.containsKey('images')) {
      images = (_json['images'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
    if (_json.containsKey('objects')) {
      objects = ArtifactObjects.fromJson(
          _json['objects'] as core.Map<core.String, core.dynamic>);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (images != null) {
      _json['images'] = images;
    }
    if (objects != null) {
      _json['objects'] = objects.toJson();
    }
    return _json;
  }
}

/// A build resource in the Cloud Build API. At a high level, a `Build`
/// describes where to find source code, how to build it (for example, the
/// builder image to run on the source), and where to store the built artifacts.
/// Fields can include the following variables, which will be expanded when the
/// build is created: - $PROJECT_ID: the project ID of the build. - $BUILD_ID:
/// the autogenerated ID of the build. - $REPO_NAME: the source repository name
/// specified by RepoSource. - $BRANCH_NAME: the branch name specified by
/// RepoSource. - $TAG_NAME: the tag name specified by RepoSource. -
/// $REVISION_ID or $COMMIT_SHA: the commit SHA specified by RepoSource or
/// resolved from the specified branch or tag. - $SHORT_SHA: first 7 characters
/// of $REVISION_ID or $COMMIT_SHA.
class Build {
  /// Artifacts produced by the build that should be uploaded upon successful
  /// completion of all build steps.
  Artifacts artifacts;

  /// Output only. The ID of the `BuildTrigger` that triggered this build, if it
  /// was triggered automatically.
  core.String buildTriggerId;

  /// Output only. Time at which the request to create the build was received.
  core.String createTime;

  /// Output only. Time at which execution of the build was finished. The
  /// difference between finish_time and start_time is the duration of the
  /// build's execution.
  core.String finishTime;

  /// Output only. Unique identifier of the build.
  core.String id;

  /// A list of images to be pushed upon the successful completion of all build
  /// steps. The images are pushed using the builder service account's
  /// credentials. The digests of the pushed images will be stored in the
  /// `Build` resource's results field. If any of the images fail to be pushed,
  /// the build status is marked `FAILURE`.
  core.List<core.String> images;

  /// Output only. URL to logs for this build in Google Cloud Console.
  core.String logUrl;

  /// Google Cloud Storage bucket where logs should be written (see [Bucket Name
  /// Requirements](https://cloud.google.com/storage/docs/bucket-naming#requirements)).
  /// Logs file names will be of the format
  /// `${logs_bucket}/log-${build_id}.txt`.
  core.String logsBucket;

  /// Output only. The 'Build' name with format:
  /// `projects/{project}/locations/{location}/builds/{build}`, where {build} is
  /// a unique identifier generated by the service.
  core.String name;

  /// Special options for this build.
  BuildOptions options;

  /// Output only. ID of the project.
  core.String projectId;

  /// TTL in queue for this build. If provided and the build is enqueued longer
  /// than this value, the build will expire and the build status will be
  /// `EXPIRED`. The TTL starts ticking from create_time.
  core.String queueTtl;

  /// Output only. Results of the build.
  Results results;

  /// Secrets to decrypt using Cloud Key Management Service.
  core.List<Secret> secrets;

  /// IAM service account whose credentials will be used at build runtime. Must
  /// be of the format `projects/{PROJECT_ID}/serviceAccounts/{ACCOUNT}`.
  /// ACCOUNT can be email address or uniqueId of the service account. This
  /// field is in alpha and is not publicly available.
  core.String serviceAccount;

  /// The location of the source files to build.
  Source source;

  /// Output only. A permanent fixed identifier for source.
  SourceProvenance sourceProvenance;

  /// Output only. Time at which execution of the build was started.
  core.String startTime;

  /// Output only. Status of the build.
  /// Possible string values are:
  /// - "STATUS_UNKNOWN" : Status of the build is unknown.
  /// - "QUEUED" : Build or step is queued; work has not yet begun.
  /// - "WORKING" : Build or step is being executed.
  /// - "SUCCESS" : Build or step finished successfully.
  /// - "FAILURE" : Build or step failed to complete successfully.
  /// - "INTERNAL_ERROR" : Build or step failed due to an internal cause.
  /// - "TIMEOUT" : Build or step took longer than was allowed.
  /// - "CANCELLED" : Build or step was canceled by a user.
  /// - "EXPIRED" : Build was enqueued for longer than the value of `queue_ttl`.
  core.String status;

  /// Output only. Customer-readable message about the current status.
  core.String statusDetail;

  /// Required. The operations to be performed on the workspace.
  core.List<BuildStep> steps;

  /// Substitutions data for `Build` resource.
  core.Map<core.String, core.String> substitutions;

  /// Tags for annotation of a `Build`. These are not docker tags.
  core.List<core.String> tags;

  /// Amount of time that this build should be allowed to run, to second
  /// granularity. If this amount of time elapses, work on the build will cease
  /// and the build status will be `TIMEOUT`. `timeout` starts ticking from
  /// `startTime`. Default time is ten minutes.
  core.String timeout;

  /// Output only. Stores timing information for phases of the build. Valid keys
  /// are: * BUILD: time to execute all build steps * PUSH: time to push all
  /// specified images. * FETCHSOURCE: time to fetch source. If the build does
  /// not specify source or images, these keys will not be included.
  core.Map<core.String, TimeSpan> timing;

  Build();

  Build.fromJson(core.Map _json) {
    if (_json.containsKey('artifacts')) {
      artifacts = Artifacts.fromJson(
          _json['artifacts'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('buildTriggerId')) {
      buildTriggerId = _json['buildTriggerId'] as core.String;
    }
    if (_json.containsKey('createTime')) {
      createTime = _json['createTime'] as core.String;
    }
    if (_json.containsKey('finishTime')) {
      finishTime = _json['finishTime'] as core.String;
    }
    if (_json.containsKey('id')) {
      id = _json['id'] as core.String;
    }
    if (_json.containsKey('images')) {
      images = (_json['images'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
    if (_json.containsKey('logUrl')) {
      logUrl = _json['logUrl'] as core.String;
    }
    if (_json.containsKey('logsBucket')) {
      logsBucket = _json['logsBucket'] as core.String;
    }
    if (_json.containsKey('name')) {
      name = _json['name'] as core.String;
    }
    if (_json.containsKey('options')) {
      options = BuildOptions.fromJson(
          _json['options'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('projectId')) {
      projectId = _json['projectId'] as core.String;
    }
    if (_json.containsKey('queueTtl')) {
      queueTtl = _json['queueTtl'] as core.String;
    }
    if (_json.containsKey('results')) {
      results = Results.fromJson(
          _json['results'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('secrets')) {
      secrets = (_json['secrets'] as core.List)
          .map<Secret>((value) =>
              Secret.fromJson(value as core.Map<core.String, core.dynamic>))
          .toList();
    }
    if (_json.containsKey('serviceAccount')) {
      serviceAccount = _json['serviceAccount'] as core.String;
    }
    if (_json.containsKey('source')) {
      source = Source.fromJson(
          _json['source'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('sourceProvenance')) {
      sourceProvenance = SourceProvenance.fromJson(
          _json['sourceProvenance'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('startTime')) {
      startTime = _json['startTime'] as core.String;
    }
    if (_json.containsKey('status')) {
      status = _json['status'] as core.String;
    }
    if (_json.containsKey('statusDetail')) {
      statusDetail = _json['statusDetail'] as core.String;
    }
    if (_json.containsKey('steps')) {
      steps = (_json['steps'] as core.List)
          .map<BuildStep>((value) =>
              BuildStep.fromJson(value as core.Map<core.String, core.dynamic>))
          .toList();
    }
    if (_json.containsKey('substitutions')) {
      substitutions = (_json['substitutions'] as core.Map)
          .cast<core.String, core.String>()
          .map(
            (key, item) => core.MapEntry(
              key,
              item as core.String,
            ),
          );
    }
    if (_json.containsKey('tags')) {
      tags = (_json['tags'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
    if (_json.containsKey('timeout')) {
      timeout = _json['timeout'] as core.String;
    }
    if (_json.containsKey('timing')) {
      timing = (_json['timing'] as core.Map).cast<core.String, core.Map>().map(
            (key, item) => core.MapEntry(
              key,
              TimeSpan.fromJson(item as core.Map<core.String, core.dynamic>),
            ),
          );
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (artifacts != null) {
      _json['artifacts'] = artifacts.toJson();
    }
    if (buildTriggerId != null) {
      _json['buildTriggerId'] = buildTriggerId;
    }
    if (createTime != null) {
      _json['createTime'] = createTime;
    }
    if (finishTime != null) {
      _json['finishTime'] = finishTime;
    }
    if (id != null) {
      _json['id'] = id;
    }
    if (images != null) {
      _json['images'] = images;
    }
    if (logUrl != null) {
      _json['logUrl'] = logUrl;
    }
    if (logsBucket != null) {
      _json['logsBucket'] = logsBucket;
    }
    if (name != null) {
      _json['name'] = name;
    }
    if (options != null) {
      _json['options'] = options.toJson();
    }
    if (projectId != null) {
      _json['projectId'] = projectId;
    }
    if (queueTtl != null) {
      _json['queueTtl'] = queueTtl;
    }
    if (results != null) {
      _json['results'] = results.toJson();
    }
    if (secrets != null) {
      _json['secrets'] = secrets.map((value) => value.toJson()).toList();
    }
    if (serviceAccount != null) {
      _json['serviceAccount'] = serviceAccount;
    }
    if (source != null) {
      _json['source'] = source.toJson();
    }
    if (sourceProvenance != null) {
      _json['sourceProvenance'] = sourceProvenance.toJson();
    }
    if (startTime != null) {
      _json['startTime'] = startTime;
    }
    if (status != null) {
      _json['status'] = status;
    }
    if (statusDetail != null) {
      _json['statusDetail'] = statusDetail;
    }
    if (steps != null) {
      _json['steps'] = steps.map((value) => value.toJson()).toList();
    }
    if (substitutions != null) {
      _json['substitutions'] = substitutions;
    }
    if (tags != null) {
      _json['tags'] = tags;
    }
    if (timeout != null) {
      _json['timeout'] = timeout;
    }
    if (timing != null) {
      _json['timing'] =
          timing.map((key, item) => core.MapEntry(key, item.toJson()));
    }
    return _json;
  }
}

/// Metadata for build operations.
class BuildOperationMetadata {
  /// The build that the operation is tracking.
  Build build;

  BuildOperationMetadata();

  BuildOperationMetadata.fromJson(core.Map _json) {
    if (_json.containsKey('build')) {
      build =
          Build.fromJson(_json['build'] as core.Map<core.String, core.dynamic>);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (build != null) {
      _json['build'] = build.toJson();
    }
    return _json;
  }
}

/// Optional arguments to enable specific features of builds.
class BuildOptions {
  /// Requested disk size for the VM that runs the build. Note that this is
  /// *NOT* "disk free"; some of the space will be used by the operating system
  /// and build utilities. Also note that this is the minimum disk size that
  /// will be allocated for the build -- the build may run with a larger disk
  /// than requested. At present, the maximum disk size is 1000GB; builds that
  /// request more than the maximum are rejected with an error.
  core.String diskSizeGb;

  /// Option to specify whether or not to apply bash style string operations to
  /// the substitutions. NOTE: this is always enabled for triggered builds and
  /// cannot be overridden in the build configuration file.
  core.bool dynamicSubstitutions;

  /// A list of global environment variable definitions that will exist for all
  /// build steps in this build. If a variable is defined in both globally and
  /// in a build step, the variable will use the build step value. The elements
  /// are of the form "KEY=VALUE" for the environment variable "KEY" being given
  /// the value "VALUE".
  core.List<core.String> env;

  /// Option to define build log streaming behavior to Google Cloud Storage.
  /// Possible string values are:
  /// - "STREAM_DEFAULT" : Service may automatically determine build log
  /// streaming behavior.
  /// - "STREAM_ON" : Build logs should be streamed to Google Cloud Storage.
  /// - "STREAM_OFF" : Build logs should not be streamed to Google Cloud
  /// Storage; they will be written when the build is completed.
  core.String logStreamingOption;

  /// Option to specify the logging mode, which determines if and where build
  /// logs are stored.
  /// Possible string values are:
  /// - "LOGGING_UNSPECIFIED" : The service determines the logging mode. The
  /// default is `LEGACY`. Do not rely on the default logging behavior as it may
  /// change in the future.
  /// - "LEGACY" : Cloud Logging and Cloud Storage logging are enabled.
  /// - "GCS_ONLY" : Only Cloud Storage logging is enabled.
  /// - "STACKDRIVER_ONLY" : This option is the same as CLOUD_LOGGING_ONLY.
  /// - "CLOUD_LOGGING_ONLY" : Only Cloud Logging is enabled. Note that logs for
  /// both the Cloud Console UI and Cloud SDK are based on Cloud Storage logs,
  /// so neither will provide logs if this option is chosen.
  /// - "NONE" : Turn off all logging. No build logs will be captured. Next ID:
  /// 6
  core.String logging;

  /// Compute Engine machine type on which to run the build.
  /// Possible string values are:
  /// - "UNSPECIFIED" : Standard machine type.
  /// - "N1_HIGHCPU_8" : Highcpu machine with 8 CPUs.
  /// - "N1_HIGHCPU_32" : Highcpu machine with 32 CPUs.
  core.String machineType;

  /// Requested verifiability options.
  /// Possible string values are:
  /// - "NOT_VERIFIED" : Not a verifiable build. (default)
  /// - "VERIFIED" : Verified build.
  core.String requestedVerifyOption;

  /// A list of global environment variables, which are encrypted using a Cloud
  /// Key Management Service crypto key. These values must be specified in the
  /// build's `Secret`. These variables will be available to all build steps in
  /// this build.
  core.List<core.String> secretEnv;

  /// Requested hash for SourceProvenance.
  core.List<core.String> sourceProvenanceHash;

  /// Option to specify behavior when there is an error in the substitution
  /// checks. NOTE: this is always set to ALLOW_LOOSE for triggered builds and
  /// cannot be overridden in the build configuration file.
  /// Possible string values are:
  /// - "MUST_MATCH" : Fails the build if error in substitutions checks, like
  /// missing a substitution in the template or in the map.
  /// - "ALLOW_LOOSE" : Do not fail the build if error in substitutions checks.
  core.String substitutionOption;

  /// Global list of volumes to mount for ALL build steps Each volume is created
  /// as an empty volume prior to starting the build process. Upon completion of
  /// the build, volumes and their contents are discarded. Global volume names
  /// and paths cannot conflict with the volumes defined a build step. Using a
  /// global volume in a build with only one step is not valid as it is
  /// indicative of a build request with an incorrect configuration.
  core.List<Volume> volumes;

  /// Option to specify a `WorkerPool` for the build. Format:
  /// projects/{project}/locations/{location}/workerPools/{workerPool} This
  /// field is experimental.
  core.String workerPool;

  BuildOptions();

  BuildOptions.fromJson(core.Map _json) {
    if (_json.containsKey('diskSizeGb')) {
      diskSizeGb = _json['diskSizeGb'] as core.String;
    }
    if (_json.containsKey('dynamicSubstitutions')) {
      dynamicSubstitutions = _json['dynamicSubstitutions'] as core.bool;
    }
    if (_json.containsKey('env')) {
      env = (_json['env'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
    if (_json.containsKey('logStreamingOption')) {
      logStreamingOption = _json['logStreamingOption'] as core.String;
    }
    if (_json.containsKey('logging')) {
      logging = _json['logging'] as core.String;
    }
    if (_json.containsKey('machineType')) {
      machineType = _json['machineType'] as core.String;
    }
    if (_json.containsKey('requestedVerifyOption')) {
      requestedVerifyOption = _json['requestedVerifyOption'] as core.String;
    }
    if (_json.containsKey('secretEnv')) {
      secretEnv = (_json['secretEnv'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
    if (_json.containsKey('sourceProvenanceHash')) {
      sourceProvenanceHash = (_json['sourceProvenanceHash'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
    if (_json.containsKey('substitutionOption')) {
      substitutionOption = _json['substitutionOption'] as core.String;
    }
    if (_json.containsKey('volumes')) {
      volumes = (_json['volumes'] as core.List)
          .map<Volume>((value) =>
              Volume.fromJson(value as core.Map<core.String, core.dynamic>))
          .toList();
    }
    if (_json.containsKey('workerPool')) {
      workerPool = _json['workerPool'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (diskSizeGb != null) {
      _json['diskSizeGb'] = diskSizeGb;
    }
    if (dynamicSubstitutions != null) {
      _json['dynamicSubstitutions'] = dynamicSubstitutions;
    }
    if (env != null) {
      _json['env'] = env;
    }
    if (logStreamingOption != null) {
      _json['logStreamingOption'] = logStreamingOption;
    }
    if (logging != null) {
      _json['logging'] = logging;
    }
    if (machineType != null) {
      _json['machineType'] = machineType;
    }
    if (requestedVerifyOption != null) {
      _json['requestedVerifyOption'] = requestedVerifyOption;
    }
    if (secretEnv != null) {
      _json['secretEnv'] = secretEnv;
    }
    if (sourceProvenanceHash != null) {
      _json['sourceProvenanceHash'] = sourceProvenanceHash;
    }
    if (substitutionOption != null) {
      _json['substitutionOption'] = substitutionOption;
    }
    if (volumes != null) {
      _json['volumes'] = volumes.map((value) => value.toJson()).toList();
    }
    if (workerPool != null) {
      _json['workerPool'] = workerPool;
    }
    return _json;
  }
}

/// A step in the build pipeline.
class BuildStep {
  /// A list of arguments that will be presented to the step when it is started.
  /// If the image used to run the step's container has an entrypoint, the
  /// `args` are used as arguments to that entrypoint. If the image does not
  /// define an entrypoint, the first element in args is used as the entrypoint,
  /// and the remainder will be used as arguments.
  core.List<core.String> args;

  /// Working directory to use when running this step's container. If this value
  /// is a relative path, it is relative to the build's working directory. If
  /// this value is absolute, it may be outside the build's working directory,
  /// in which case the contents of the path may not be persisted across build
  /// step executions, unless a `volume` for that path is specified. If the
  /// build specifies a `RepoSource` with `dir` and a step with a `dir`, which
  /// specifies an absolute path, the `RepoSource` `dir` is ignored for the
  /// step's execution.
  core.String dir;

  /// Entrypoint to be used instead of the build step image's default
  /// entrypoint. If unset, the image's default entrypoint is used.
  core.String entrypoint;

  /// A list of environment variable definitions to be used when running a step.
  /// The elements are of the form "KEY=VALUE" for the environment variable
  /// "KEY" being given the value "VALUE".
  core.List<core.String> env;

  /// Unique identifier for this build step, used in `wait_for` to reference
  /// this build step as a dependency.
  core.String id;

  /// Required. The name of the container image that will run this particular
  /// build step. If the image is available in the host's Docker daemon's cache,
  /// it will be run directly. If not, the host will attempt to pull the image
  /// first, using the builder service account's credentials if necessary. The
  /// Docker daemon's cache will already have the latest versions of all of the
  /// officially supported build steps
  /// ([https://github.com/GoogleCloudPlatform/cloud-builders](https://github.com/GoogleCloudPlatform/cloud-builders)).
  /// The Docker daemon will also have cached many of the layers for some
  /// popular images, like "ubuntu", "debian", but they will be refreshed at the
  /// time you attempt to use them. If you built an image in a previous build
  /// step, it will be stored in the host's Docker daemon's cache and is
  /// available to use as the name for a later build step.
  core.String name;

  /// Output only. Stores timing information for pulling this build step's
  /// builder image only.
  TimeSpan pullTiming;

  /// A list of environment variables which are encrypted using a Cloud Key
  /// Management Service crypto key. These values must be specified in the
  /// build's `Secret`.
  core.List<core.String> secretEnv;

  /// Output only. Status of the build step. At this time, build step status is
  /// only updated on build completion; step status is not updated in real-time
  /// as the build progresses.
  /// Possible string values are:
  /// - "STATUS_UNKNOWN" : Status of the build is unknown.
  /// - "QUEUED" : Build or step is queued; work has not yet begun.
  /// - "WORKING" : Build or step is being executed.
  /// - "SUCCESS" : Build or step finished successfully.
  /// - "FAILURE" : Build or step failed to complete successfully.
  /// - "INTERNAL_ERROR" : Build or step failed due to an internal cause.
  /// - "TIMEOUT" : Build or step took longer than was allowed.
  /// - "CANCELLED" : Build or step was canceled by a user.
  /// - "EXPIRED" : Build was enqueued for longer than the value of `queue_ttl`.
  core.String status;

  /// Time limit for executing this build step. If not defined, the step has no
  /// time limit and will be allowed to continue to run until either it
  /// completes or the build itself times out.
  core.String timeout;

  /// Output only. Stores timing information for executing this build step.
  TimeSpan timing;

  /// List of volumes to mount into the build step. Each volume is created as an
  /// empty volume prior to execution of the build step. Upon completion of the
  /// build, volumes and their contents are discarded. Using a named volume in
  /// only one step is not valid as it is indicative of a build request with an
  /// incorrect configuration.
  core.List<Volume> volumes;

  /// The ID(s) of the step(s) that this build step depends on. This build step
  /// will not start until all the build steps in `wait_for` have completed
  /// successfully. If `wait_for` is empty, this build step will start when all
  /// previous build steps in the `Build.Steps` list have completed
  /// successfully.
  core.List<core.String> waitFor;

  BuildStep();

  BuildStep.fromJson(core.Map _json) {
    if (_json.containsKey('args')) {
      args = (_json['args'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
    if (_json.containsKey('dir')) {
      dir = _json['dir'] as core.String;
    }
    if (_json.containsKey('entrypoint')) {
      entrypoint = _json['entrypoint'] as core.String;
    }
    if (_json.containsKey('env')) {
      env = (_json['env'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
    if (_json.containsKey('id')) {
      id = _json['id'] as core.String;
    }
    if (_json.containsKey('name')) {
      name = _json['name'] as core.String;
    }
    if (_json.containsKey('pullTiming')) {
      pullTiming = TimeSpan.fromJson(
          _json['pullTiming'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('secretEnv')) {
      secretEnv = (_json['secretEnv'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
    if (_json.containsKey('status')) {
      status = _json['status'] as core.String;
    }
    if (_json.containsKey('timeout')) {
      timeout = _json['timeout'] as core.String;
    }
    if (_json.containsKey('timing')) {
      timing = TimeSpan.fromJson(
          _json['timing'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('volumes')) {
      volumes = (_json['volumes'] as core.List)
          .map<Volume>((value) =>
              Volume.fromJson(value as core.Map<core.String, core.dynamic>))
          .toList();
    }
    if (_json.containsKey('waitFor')) {
      waitFor = (_json['waitFor'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (args != null) {
      _json['args'] = args;
    }
    if (dir != null) {
      _json['dir'] = dir;
    }
    if (entrypoint != null) {
      _json['entrypoint'] = entrypoint;
    }
    if (env != null) {
      _json['env'] = env;
    }
    if (id != null) {
      _json['id'] = id;
    }
    if (name != null) {
      _json['name'] = name;
    }
    if (pullTiming != null) {
      _json['pullTiming'] = pullTiming.toJson();
    }
    if (secretEnv != null) {
      _json['secretEnv'] = secretEnv;
    }
    if (status != null) {
      _json['status'] = status;
    }
    if (timeout != null) {
      _json['timeout'] = timeout;
    }
    if (timing != null) {
      _json['timing'] = timing.toJson();
    }
    if (volumes != null) {
      _json['volumes'] = volumes.map((value) => value.toJson()).toList();
    }
    if (waitFor != null) {
      _json['waitFor'] = waitFor;
    }
    return _json;
  }
}

/// Configuration for an automated build in response to source repository
/// changes.
class BuildTrigger {
  /// Contents of the build template.
  Build build;

  /// Output only. Time when the trigger was created.
  core.String createTime;

  /// Human-readable description of this trigger.
  core.String description;

  /// If true, the trigger will never automatically execute a build.
  core.bool disabled;

  /// Path, from the source root, to a file whose contents is used for the
  /// template.
  core.String filename;

  /// GitHubEventsConfig describes the configuration of a trigger that creates a
  /// build whenever a GitHub event is received. Mutually exclusive with
  /// `trigger_template`.
  GitHubEventsConfig github;

  /// Output only. Unique identifier of the trigger.
  core.String id;

  /// ignored_files and included_files are file glob matches using
  /// https://golang.org/pkg/path/filepath/#Match extended with support for
  /// "**". If ignored_files and changed files are both empty, then they are not
  /// used to determine whether or not to trigger a build. If ignored_files is
  /// not empty, then we ignore any files that match any of the ignored_file
  /// globs. If the change has no files that are outside of the ignored_files
  /// globs, then we do not trigger a build.
  core.List<core.String> ignoredFiles;

  /// If any of the files altered in the commit pass the ignored_files filter
  /// and included_files is empty, then as far as this filter is concerned, we
  /// should trigger the build. If any of the files altered in the commit pass
  /// the ignored_files filter and included_files is not empty, then we make
  /// sure that at least one of those files matches a included_files glob. If
  /// not, then we do not trigger a build.
  core.List<core.String> includedFiles;

  /// User-assigned name of the trigger. Must be unique within the project.
  /// Trigger names must meet the following requirements: + They must contain
  /// only alphanumeric characters and dashes. + They can be 1-64 characters
  /// long. + They must begin and end with an alphanumeric character.
  core.String name;

  /// Substitutions for Build resource. The keys must match the following
  /// regular expression: `^_[A-Z0-9_]+$`.
  core.Map<core.String, core.String> substitutions;

  /// Tags for annotation of a `BuildTrigger`
  core.List<core.String> tags;

  /// Template describing the types of source changes to trigger a build. Branch
  /// and tag names in trigger templates are interpreted as regular expressions.
  /// Any branch or tag change that matches that regular expression will trigger
  /// a build. Mutually exclusive with `github`.
  RepoSource triggerTemplate;

  BuildTrigger();

  BuildTrigger.fromJson(core.Map _json) {
    if (_json.containsKey('build')) {
      build =
          Build.fromJson(_json['build'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('createTime')) {
      createTime = _json['createTime'] as core.String;
    }
    if (_json.containsKey('description')) {
      description = _json['description'] as core.String;
    }
    if (_json.containsKey('disabled')) {
      disabled = _json['disabled'] as core.bool;
    }
    if (_json.containsKey('filename')) {
      filename = _json['filename'] as core.String;
    }
    if (_json.containsKey('github')) {
      github = GitHubEventsConfig.fromJson(
          _json['github'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('id')) {
      id = _json['id'] as core.String;
    }
    if (_json.containsKey('ignoredFiles')) {
      ignoredFiles = (_json['ignoredFiles'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
    if (_json.containsKey('includedFiles')) {
      includedFiles = (_json['includedFiles'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
    if (_json.containsKey('name')) {
      name = _json['name'] as core.String;
    }
    if (_json.containsKey('substitutions')) {
      substitutions = (_json['substitutions'] as core.Map)
          .cast<core.String, core.String>()
          .map(
            (key, item) => core.MapEntry(
              key,
              item as core.String,
            ),
          );
    }
    if (_json.containsKey('tags')) {
      tags = (_json['tags'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
    if (_json.containsKey('triggerTemplate')) {
      triggerTemplate = RepoSource.fromJson(
          _json['triggerTemplate'] as core.Map<core.String, core.dynamic>);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (build != null) {
      _json['build'] = build.toJson();
    }
    if (createTime != null) {
      _json['createTime'] = createTime;
    }
    if (description != null) {
      _json['description'] = description;
    }
    if (disabled != null) {
      _json['disabled'] = disabled;
    }
    if (filename != null) {
      _json['filename'] = filename;
    }
    if (github != null) {
      _json['github'] = github.toJson();
    }
    if (id != null) {
      _json['id'] = id;
    }
    if (ignoredFiles != null) {
      _json['ignoredFiles'] = ignoredFiles;
    }
    if (includedFiles != null) {
      _json['includedFiles'] = includedFiles;
    }
    if (name != null) {
      _json['name'] = name;
    }
    if (substitutions != null) {
      _json['substitutions'] = substitutions;
    }
    if (tags != null) {
      _json['tags'] = tags;
    }
    if (triggerTemplate != null) {
      _json['triggerTemplate'] = triggerTemplate.toJson();
    }
    return _json;
  }
}

/// An image built by the pipeline.
class BuiltImage {
  /// Docker Registry 2.0 digest.
  core.String digest;

  /// Name used to push the container image to Google Container Registry, as
  /// presented to `docker push`.
  core.String name;

  /// Output only. Stores timing information for pushing the specified image.
  TimeSpan pushTiming;

  BuiltImage();

  BuiltImage.fromJson(core.Map _json) {
    if (_json.containsKey('digest')) {
      digest = _json['digest'] as core.String;
    }
    if (_json.containsKey('name')) {
      name = _json['name'] as core.String;
    }
    if (_json.containsKey('pushTiming')) {
      pushTiming = TimeSpan.fromJson(
          _json['pushTiming'] as core.Map<core.String, core.dynamic>);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (digest != null) {
      _json['digest'] = digest;
    }
    if (name != null) {
      _json['name'] = name;
    }
    if (pushTiming != null) {
      _json['pushTiming'] = pushTiming.toJson();
    }
    return _json;
  }
}

/// Request to cancel an ongoing build.
class CancelBuildRequest {
  /// Required. ID of the build.
  core.String id;

  /// The name of the `Build` to retrieve. Format:
  /// `projects/{project}/locations/{location}/builds/{build}`
  core.String name;

  /// Required. ID of the project.
  core.String projectId;

  CancelBuildRequest();

  CancelBuildRequest.fromJson(core.Map _json) {
    if (_json.containsKey('id')) {
      id = _json['id'] as core.String;
    }
    if (_json.containsKey('name')) {
      name = _json['name'] as core.String;
    }
    if (_json.containsKey('projectId')) {
      projectId = _json['projectId'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (id != null) {
      _json['id'] = id;
    }
    if (name != null) {
      _json['name'] = name;
    }
    if (projectId != null) {
      _json['projectId'] = projectId;
    }
    return _json;
  }
}

/// The request message for Operations.CancelOperation.
class CancelOperationRequest {
  CancelOperationRequest();

  CancelOperationRequest.fromJson(
      // ignore: avoid_unused_constructor_parameters
      core.Map _json);

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    return _json;
  }
}

/// A generic empty message that you can re-use to avoid defining duplicated
/// empty messages in your APIs. A typical example is to use it as the request
/// or the response type of an API method. For instance: service Foo { rpc
/// Bar(google.protobuf.Empty) returns (google.protobuf.Empty); } The JSON
/// representation for `Empty` is empty JSON object `{}`.
class Empty {
  Empty();

  Empty.fromJson(
      // ignore: avoid_unused_constructor_parameters
      core.Map _json);

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    return _json;
  }
}

/// Container message for hashes of byte content of files, used in
/// SourceProvenance messages to verify integrity of source input to the build.
class FileHashes {
  /// Collection of file hashes.
  core.List<Hash> fileHash;

  FileHashes();

  FileHashes.fromJson(core.Map _json) {
    if (_json.containsKey('fileHash')) {
      fileHash = (_json['fileHash'] as core.List)
          .map<Hash>((value) =>
              Hash.fromJson(value as core.Map<core.String, core.dynamic>))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (fileHash != null) {
      _json['fileHash'] = fileHash.map((value) => value.toJson()).toList();
    }
    return _json;
  }
}

/// GitHubEventsConfig describes the configuration of a trigger that creates a
/// build whenever a GitHub event is received. This message is experimental.
class GitHubEventsConfig {
  /// The installationID that emits the GitHub event.
  core.String installationId;

  /// Name of the repository. For example: The name for
  /// https://github.com/googlecloudplatform/cloud-builders is "cloud-builders".
  core.String name;

  /// Owner of the repository. For example: The owner for
  /// https://github.com/googlecloudplatform/cloud-builders is
  /// "googlecloudplatform".
  core.String owner;

  /// filter to match changes in pull requests.
  PullRequestFilter pullRequest;

  /// filter to match changes in refs like branches, tags.
  PushFilter push;

  GitHubEventsConfig();

  GitHubEventsConfig.fromJson(core.Map _json) {
    if (_json.containsKey('installationId')) {
      installationId = _json['installationId'] as core.String;
    }
    if (_json.containsKey('name')) {
      name = _json['name'] as core.String;
    }
    if (_json.containsKey('owner')) {
      owner = _json['owner'] as core.String;
    }
    if (_json.containsKey('pullRequest')) {
      pullRequest = PullRequestFilter.fromJson(
          _json['pullRequest'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('push')) {
      push = PushFilter.fromJson(
          _json['push'] as core.Map<core.String, core.dynamic>);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (installationId != null) {
      _json['installationId'] = installationId;
    }
    if (name != null) {
      _json['name'] = name;
    }
    if (owner != null) {
      _json['owner'] = owner;
    }
    if (pullRequest != null) {
      _json['pullRequest'] = pullRequest.toJson();
    }
    if (push != null) {
      _json['push'] = push.toJson();
    }
    return _json;
  }
}

/// HTTPDelivery is the delivery configuration for an HTTP notification.
class HTTPDelivery {
  /// The URI to which JSON-containing HTTP POST requests should be sent.
  core.String uri;

  HTTPDelivery();

  HTTPDelivery.fromJson(core.Map _json) {
    if (_json.containsKey('uri')) {
      uri = _json['uri'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (uri != null) {
      _json['uri'] = uri;
    }
    return _json;
  }
}

/// Container message for hash values.
class Hash {
  /// The type of hash that was performed.
  /// Possible string values are:
  /// - "NONE" : No hash requested.
  /// - "SHA256" : Use a sha256 hash.
  /// - "MD5" : Use a md5 hash.
  core.String type;

  /// The hash value.
  core.String value;
  core.List<core.int> get valueAsBytes => convert.base64.decode(value);

  set valueAsBytes(core.List<core.int> _bytes) {
    value =
        convert.base64.encode(_bytes).replaceAll('/', '_').replaceAll('+', '-');
  }

  Hash();

  Hash.fromJson(core.Map _json) {
    if (_json.containsKey('type')) {
      type = _json['type'] as core.String;
    }
    if (_json.containsKey('value')) {
      value = _json['value'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (type != null) {
      _json['type'] = type;
    }
    if (value != null) {
      _json['value'] = value;
    }
    return _json;
  }
}

/// Response containing existing `BuildTriggers`.
class ListBuildTriggersResponse {
  /// Token to receive the next page of results.
  core.String nextPageToken;

  /// `BuildTriggers` for the project, sorted by `create_time` descending.
  core.List<BuildTrigger> triggers;

  ListBuildTriggersResponse();

  ListBuildTriggersResponse.fromJson(core.Map _json) {
    if (_json.containsKey('nextPageToken')) {
      nextPageToken = _json['nextPageToken'] as core.String;
    }
    if (_json.containsKey('triggers')) {
      triggers = (_json['triggers'] as core.List)
          .map<BuildTrigger>((value) => BuildTrigger.fromJson(
              value as core.Map<core.String, core.dynamic>))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (nextPageToken != null) {
      _json['nextPageToken'] = nextPageToken;
    }
    if (triggers != null) {
      _json['triggers'] = triggers.map((value) => value.toJson()).toList();
    }
    return _json;
  }
}

/// Response including listed builds.
class ListBuildsResponse {
  /// Builds will be sorted by `create_time`, descending.
  core.List<Build> builds;

  /// Token to receive the next page of results.
  core.String nextPageToken;

  ListBuildsResponse();

  ListBuildsResponse.fromJson(core.Map _json) {
    if (_json.containsKey('builds')) {
      builds = (_json['builds'] as core.List)
          .map<Build>((value) =>
              Build.fromJson(value as core.Map<core.String, core.dynamic>))
          .toList();
    }
    if (_json.containsKey('nextPageToken')) {
      nextPageToken = _json['nextPageToken'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (builds != null) {
      _json['builds'] = builds.map((value) => value.toJson()).toList();
    }
    if (nextPageToken != null) {
      _json['nextPageToken'] = nextPageToken;
    }
    return _json;
  }
}

/// Notification is the container which holds the data that is relevant to this
/// particular notification.
class Notification {
  /// The filter string to use for notification filtering. Currently, this is
  /// assumed to be a CEL program. See https://opensource.google/projects/cel
  /// for more.
  core.String filter;

  /// Configuration for HTTP delivery.
  HTTPDelivery httpDelivery;

  /// Configuration for Slack delivery.
  SlackDelivery slackDelivery;

  /// Configuration for SMTP (email) delivery.
  SMTPDelivery smtpDelivery;

  /// Escape hatch for users to supply custom delivery configs.
  ///
  /// The values for Object must be JSON objects. It can consist of `num`,
  /// `String`, `bool` and `null` as well as `Map` and `List` values.
  core.Map<core.String, core.Object> structDelivery;

  Notification();

  Notification.fromJson(core.Map _json) {
    if (_json.containsKey('filter')) {
      filter = _json['filter'] as core.String;
    }
    if (_json.containsKey('httpDelivery')) {
      httpDelivery = HTTPDelivery.fromJson(
          _json['httpDelivery'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('slackDelivery')) {
      slackDelivery = SlackDelivery.fromJson(
          _json['slackDelivery'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('smtpDelivery')) {
      smtpDelivery = SMTPDelivery.fromJson(
          _json['smtpDelivery'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('structDelivery')) {
      structDelivery = (_json['structDelivery'] as core.Map)
          .cast<core.String, core.Object>()
          .map(
            (key, item) => core.MapEntry(
              key,
              item as core.Object,
            ),
          );
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (filter != null) {
      _json['filter'] = filter;
    }
    if (httpDelivery != null) {
      _json['httpDelivery'] = httpDelivery.toJson();
    }
    if (slackDelivery != null) {
      _json['slackDelivery'] = slackDelivery.toJson();
    }
    if (smtpDelivery != null) {
      _json['smtpDelivery'] = smtpDelivery.toJson();
    }
    if (structDelivery != null) {
      _json['structDelivery'] = structDelivery;
    }
    return _json;
  }
}

/// NotifierConfig is the top-level configuration message.
class NotifierConfig {
  /// The API version of this configuration format.
  core.String apiVersion;

  /// The type of notifier to use (e.g. SMTPNotifier).
  core.String kind;

  /// Metadata for referring to/handling/deploying this notifier.
  NotifierMetadata metadata;

  /// The actual configuration for this notifier.
  NotifierSpec spec;

  NotifierConfig();

  NotifierConfig.fromJson(core.Map _json) {
    if (_json.containsKey('apiVersion')) {
      apiVersion = _json['apiVersion'] as core.String;
    }
    if (_json.containsKey('kind')) {
      kind = _json['kind'] as core.String;
    }
    if (_json.containsKey('metadata')) {
      metadata = NotifierMetadata.fromJson(
          _json['metadata'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('spec')) {
      spec = NotifierSpec.fromJson(
          _json['spec'] as core.Map<core.String, core.dynamic>);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (apiVersion != null) {
      _json['apiVersion'] = apiVersion;
    }
    if (kind != null) {
      _json['kind'] = kind;
    }
    if (metadata != null) {
      _json['metadata'] = metadata.toJson();
    }
    if (spec != null) {
      _json['spec'] = spec.toJson();
    }
    return _json;
  }
}

/// NotifierMetadata contains the data which can be used to reference or
/// describe this notifier.
class NotifierMetadata {
  /// The human-readable and user-given name for the notifier. For example:
  /// "repo-merge-email-notifier".
  core.String name;

  /// The string representing the name and version of notifier to deploy.
  /// Expected to be of the form of "/:". For example:
  /// "gcr.io/my-project/notifiers/smtp:1.2.34".
  core.String notifier;

  NotifierMetadata();

  NotifierMetadata.fromJson(core.Map _json) {
    if (_json.containsKey('name')) {
      name = _json['name'] as core.String;
    }
    if (_json.containsKey('notifier')) {
      notifier = _json['notifier'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (name != null) {
      _json['name'] = name;
    }
    if (notifier != null) {
      _json['notifier'] = notifier;
    }
    return _json;
  }
}

/// NotifierSecret is the container that maps a secret name (reference) to its
/// Google Cloud Secret Manager resource path.
class NotifierSecret {
  /// Name is the local name of the secret, such as the verbatim string
  /// "my-smtp-password".
  core.String name;

  /// Value is interpreted to be a resource path for fetching the actual
  /// (versioned) secret data for this secret. For example, this would be a
  /// Google Cloud Secret Manager secret version resource path like:
  /// "projects/my-project/secrets/my-secret/versions/latest".
  core.String value;

  NotifierSecret();

  NotifierSecret.fromJson(core.Map _json) {
    if (_json.containsKey('name')) {
      name = _json['name'] as core.String;
    }
    if (_json.containsKey('value')) {
      value = _json['value'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (name != null) {
      _json['name'] = name;
    }
    if (value != null) {
      _json['value'] = value;
    }
    return _json;
  }
}

/// NotifierSecretRef contains the reference to a secret stored in the
/// corresponding NotifierSpec.
class NotifierSecretRef {
  /// The value of `secret_ref` should be a `name` that is registered in a
  /// `Secret` in the `secrets` list of the `Spec`.
  core.String secretRef;

  NotifierSecretRef();

  NotifierSecretRef.fromJson(core.Map _json) {
    if (_json.containsKey('secretRef')) {
      secretRef = _json['secretRef'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (secretRef != null) {
      _json['secretRef'] = secretRef;
    }
    return _json;
  }
}

/// NotifierSpec is the configuration container for notifications.
class NotifierSpec {
  /// The configuration of this particular notifier.
  Notification notification;

  /// Configurations for secret resources used by this particular notifier.
  core.List<NotifierSecret> secrets;

  NotifierSpec();

  NotifierSpec.fromJson(core.Map _json) {
    if (_json.containsKey('notification')) {
      notification = Notification.fromJson(
          _json['notification'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('secrets')) {
      secrets = (_json['secrets'] as core.List)
          .map<NotifierSecret>((value) => NotifierSecret.fromJson(
              value as core.Map<core.String, core.dynamic>))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (notification != null) {
      _json['notification'] = notification.toJson();
    }
    if (secrets != null) {
      _json['secrets'] = secrets.map((value) => value.toJson()).toList();
    }
    return _json;
  }
}

/// This resource represents a long-running operation that is the result of a
/// network API call.
class Operation {
  /// If the value is `false`, it means the operation is still in progress. If
  /// `true`, the operation is completed, and either `error` or `response` is
  /// available.
  core.bool done;

  /// The error result of the operation in case of failure or cancellation.
  Status error;

  /// Service-specific metadata associated with the operation. It typically
  /// contains progress information and common metadata such as create time.
  /// Some services might not provide such metadata. Any method that returns a
  /// long-running operation should document the metadata type, if any.
  ///
  /// The values for Object must be JSON objects. It can consist of `num`,
  /// `String`, `bool` and `null` as well as `Map` and `List` values.
  core.Map<core.String, core.Object> metadata;

  /// The server-assigned name, which is only unique within the same service
  /// that originally returns it. If you use the default HTTP mapping, the
  /// `name` should be a resource name ending with `operations/{unique_id}`.
  core.String name;

  /// The normal response of the operation in case of success. If the original
  /// method returns no data on success, such as `Delete`, the response is
  /// `google.protobuf.Empty`. If the original method is standard
  /// `Get`/`Create`/`Update`, the response should be the resource. For other
  /// methods, the response should have the type `XxxResponse`, where `Xxx` is
  /// the original method name. For example, if the original method name is
  /// `TakeSnapshot()`, the inferred response type is `TakeSnapshotResponse`.
  ///
  /// The values for Object must be JSON objects. It can consist of `num`,
  /// `String`, `bool` and `null` as well as `Map` and `List` values.
  core.Map<core.String, core.Object> response;

  Operation();

  Operation.fromJson(core.Map _json) {
    if (_json.containsKey('done')) {
      done = _json['done'] as core.bool;
    }
    if (_json.containsKey('error')) {
      error = Status.fromJson(
          _json['error'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('metadata')) {
      metadata =
          (_json['metadata'] as core.Map).cast<core.String, core.Object>().map(
                (key, item) => core.MapEntry(
                  key,
                  item as core.Object,
                ),
              );
    }
    if (_json.containsKey('name')) {
      name = _json['name'] as core.String;
    }
    if (_json.containsKey('response')) {
      response =
          (_json['response'] as core.Map).cast<core.String, core.Object>().map(
                (key, item) => core.MapEntry(
                  key,
                  item as core.Object,
                ),
              );
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (done != null) {
      _json['done'] = done;
    }
    if (error != null) {
      _json['error'] = error.toJson();
    }
    if (metadata != null) {
      _json['metadata'] = metadata;
    }
    if (name != null) {
      _json['name'] = name;
    }
    if (response != null) {
      _json['response'] = response;
    }
    return _json;
  }
}

/// PullRequestFilter contains filter properties for matching GitHub Pull
/// Requests.
class PullRequestFilter {
  /// Regex of branches to match. The syntax of the regular expressions accepted
  /// is the syntax accepted by RE2 and described at
  /// https://github.com/google/re2/wiki/Syntax
  core.String branch;

  /// Configure builds to run whether a repository owner or collaborator need to
  /// comment `/gcbrun`.
  /// Possible string values are:
  /// - "COMMENTS_DISABLED" : Do not require comments on Pull Requests before
  /// builds are triggered.
  /// - "COMMENTS_ENABLED" : Enforce that repository owners or collaborators
  /// must comment on Pull Requests before builds are triggered.
  /// - "COMMENTS_ENABLED_FOR_EXTERNAL_CONTRIBUTORS_ONLY" : Enforce that
  /// repository owners or collaborators must comment on external contributors'
  /// Pull Requests before builds are triggered.
  core.String commentControl;

  /// If true, branches that do NOT match the git_ref will trigger a build.
  core.bool invertRegex;

  PullRequestFilter();

  PullRequestFilter.fromJson(core.Map _json) {
    if (_json.containsKey('branch')) {
      branch = _json['branch'] as core.String;
    }
    if (_json.containsKey('commentControl')) {
      commentControl = _json['commentControl'] as core.String;
    }
    if (_json.containsKey('invertRegex')) {
      invertRegex = _json['invertRegex'] as core.bool;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (branch != null) {
      _json['branch'] = branch;
    }
    if (commentControl != null) {
      _json['commentControl'] = commentControl;
    }
    if (invertRegex != null) {
      _json['invertRegex'] = invertRegex;
    }
    return _json;
  }
}

/// Push contains filter properties for matching GitHub git pushes.
class PushFilter {
  /// Regexes matching branches to build. The syntax of the regular expressions
  /// accepted is the syntax accepted by RE2 and described at
  /// https://github.com/google/re2/wiki/Syntax
  core.String branch;

  /// When true, only trigger a build if the revision regex does NOT match the
  /// git_ref regex.
  core.bool invertRegex;

  /// Regexes matching tags to build. The syntax of the regular expressions
  /// accepted is the syntax accepted by RE2 and described at
  /// https://github.com/google/re2/wiki/Syntax
  core.String tag;

  PushFilter();

  PushFilter.fromJson(core.Map _json) {
    if (_json.containsKey('branch')) {
      branch = _json['branch'] as core.String;
    }
    if (_json.containsKey('invertRegex')) {
      invertRegex = _json['invertRegex'] as core.bool;
    }
    if (_json.containsKey('tag')) {
      tag = _json['tag'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (branch != null) {
      _json['branch'] = branch;
    }
    if (invertRegex != null) {
      _json['invertRegex'] = invertRegex;
    }
    if (tag != null) {
      _json['tag'] = tag;
    }
    return _json;
  }
}

/// Location of the source in a Google Cloud Source Repository.
class RepoSource {
  /// Regex matching branches to build. The syntax of the regular expressions
  /// accepted is the syntax accepted by RE2 and described at
  /// https://github.com/google/re2/wiki/Syntax
  core.String branchName;

  /// Explicit commit SHA to build.
  core.String commitSha;

  /// Directory, relative to the source root, in which to run the build. This
  /// must be a relative path. If a step's `dir` is specified and is an absolute
  /// path, this value is ignored for that step's execution.
  core.String dir;

  /// Only trigger a build if the revision regex does NOT match the revision
  /// regex.
  core.bool invertRegex;

  /// ID of the project that owns the Cloud Source Repository. If omitted, the
  /// project ID requesting the build is assumed.
  core.String projectId;

  /// Required. Name of the Cloud Source Repository.
  core.String repoName;

  /// Substitutions to use in a triggered build. Should only be used with
  /// RunBuildTrigger
  core.Map<core.String, core.String> substitutions;

  /// Regex matching tags to build. The syntax of the regular expressions
  /// accepted is the syntax accepted by RE2 and described at
  /// https://github.com/google/re2/wiki/Syntax
  core.String tagName;

  RepoSource();

  RepoSource.fromJson(core.Map _json) {
    if (_json.containsKey('branchName')) {
      branchName = _json['branchName'] as core.String;
    }
    if (_json.containsKey('commitSha')) {
      commitSha = _json['commitSha'] as core.String;
    }
    if (_json.containsKey('dir')) {
      dir = _json['dir'] as core.String;
    }
    if (_json.containsKey('invertRegex')) {
      invertRegex = _json['invertRegex'] as core.bool;
    }
    if (_json.containsKey('projectId')) {
      projectId = _json['projectId'] as core.String;
    }
    if (_json.containsKey('repoName')) {
      repoName = _json['repoName'] as core.String;
    }
    if (_json.containsKey('substitutions')) {
      substitutions = (_json['substitutions'] as core.Map)
          .cast<core.String, core.String>()
          .map(
            (key, item) => core.MapEntry(
              key,
              item as core.String,
            ),
          );
    }
    if (_json.containsKey('tagName')) {
      tagName = _json['tagName'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (branchName != null) {
      _json['branchName'] = branchName;
    }
    if (commitSha != null) {
      _json['commitSha'] = commitSha;
    }
    if (dir != null) {
      _json['dir'] = dir;
    }
    if (invertRegex != null) {
      _json['invertRegex'] = invertRegex;
    }
    if (projectId != null) {
      _json['projectId'] = projectId;
    }
    if (repoName != null) {
      _json['repoName'] = repoName;
    }
    if (substitutions != null) {
      _json['substitutions'] = substitutions;
    }
    if (tagName != null) {
      _json['tagName'] = tagName;
    }
    return _json;
  }
}

/// Artifacts created by the build pipeline.
class Results {
  /// Path to the artifact manifest. Only populated when artifacts are uploaded.
  core.String artifactManifest;

  /// Time to push all non-container artifacts.
  TimeSpan artifactTiming;

  /// List of build step digests, in the order corresponding to build step
  /// indices.
  core.List<core.String> buildStepImages;

  /// List of build step outputs, produced by builder images, in the order
  /// corresponding to build step indices. [Cloud
  /// Builders](https://cloud.google.com/cloud-build/docs/cloud-builders) can
  /// produce this output by writing to `$BUILDER_OUTPUT/output`. Only the first
  /// 4KB of data is stored.
  core.List<core.String> buildStepOutputs;

  /// Container images that were built as a part of the build.
  core.List<BuiltImage> images;

  /// Number of artifacts uploaded. Only populated when artifacts are uploaded.
  core.String numArtifacts;

  Results();

  Results.fromJson(core.Map _json) {
    if (_json.containsKey('artifactManifest')) {
      artifactManifest = _json['artifactManifest'] as core.String;
    }
    if (_json.containsKey('artifactTiming')) {
      artifactTiming = TimeSpan.fromJson(
          _json['artifactTiming'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('buildStepImages')) {
      buildStepImages = (_json['buildStepImages'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
    if (_json.containsKey('buildStepOutputs')) {
      buildStepOutputs = (_json['buildStepOutputs'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
    if (_json.containsKey('images')) {
      images = (_json['images'] as core.List)
          .map<BuiltImage>((value) =>
              BuiltImage.fromJson(value as core.Map<core.String, core.dynamic>))
          .toList();
    }
    if (_json.containsKey('numArtifacts')) {
      numArtifacts = _json['numArtifacts'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (artifactManifest != null) {
      _json['artifactManifest'] = artifactManifest;
    }
    if (artifactTiming != null) {
      _json['artifactTiming'] = artifactTiming.toJson();
    }
    if (buildStepImages != null) {
      _json['buildStepImages'] = buildStepImages;
    }
    if (buildStepOutputs != null) {
      _json['buildStepOutputs'] = buildStepOutputs;
    }
    if (images != null) {
      _json['images'] = images.map((value) => value.toJson()).toList();
    }
    if (numArtifacts != null) {
      _json['numArtifacts'] = numArtifacts;
    }
    return _json;
  }
}

/// Specifies a build to retry.
class RetryBuildRequest {
  /// Required. Build ID of the original build.
  core.String id;

  /// The name of the `Build` to retry. Format:
  /// `projects/{project}/locations/{location}/builds/{build}`
  core.String name;

  /// Required. ID of the project.
  core.String projectId;

  RetryBuildRequest();

  RetryBuildRequest.fromJson(core.Map _json) {
    if (_json.containsKey('id')) {
      id = _json['id'] as core.String;
    }
    if (_json.containsKey('name')) {
      name = _json['name'] as core.String;
    }
    if (_json.containsKey('projectId')) {
      projectId = _json['projectId'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (id != null) {
      _json['id'] = id;
    }
    if (name != null) {
      _json['name'] = name;
    }
    if (projectId != null) {
      _json['projectId'] = projectId;
    }
    return _json;
  }
}

/// SMTPDelivery is the delivery configuration for an SMTP (email) notification.
class SMTPDelivery {
  /// This is the SMTP account/email that appears in the `From:` of the email.
  /// If empty, it is assumed to be sender.
  core.String fromAddress;

  /// The SMTP sender's password.
  NotifierSecretRef password;

  /// The SMTP port of the server.
  core.String port;

  /// This is the list of addresses to which we send the email (i.e. in the
  /// `To:` of the email).
  core.List<core.String> recipientAddresses;

  /// This is the SMTP account/email that is used to send the message.
  core.String senderAddress;

  /// The address of the SMTP server.
  core.String server;

  SMTPDelivery();

  SMTPDelivery.fromJson(core.Map _json) {
    if (_json.containsKey('fromAddress')) {
      fromAddress = _json['fromAddress'] as core.String;
    }
    if (_json.containsKey('password')) {
      password = NotifierSecretRef.fromJson(
          _json['password'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('port')) {
      port = _json['port'] as core.String;
    }
    if (_json.containsKey('recipientAddresses')) {
      recipientAddresses = (_json['recipientAddresses'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
    if (_json.containsKey('senderAddress')) {
      senderAddress = _json['senderAddress'] as core.String;
    }
    if (_json.containsKey('server')) {
      server = _json['server'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (fromAddress != null) {
      _json['fromAddress'] = fromAddress;
    }
    if (password != null) {
      _json['password'] = password.toJson();
    }
    if (port != null) {
      _json['port'] = port;
    }
    if (recipientAddresses != null) {
      _json['recipientAddresses'] = recipientAddresses;
    }
    if (senderAddress != null) {
      _json['senderAddress'] = senderAddress;
    }
    if (server != null) {
      _json['server'] = server;
    }
    return _json;
  }
}

/// Pairs a set of secret environment variables containing encrypted values with
/// the Cloud KMS key to use to decrypt the value.
class Secret {
  /// Cloud KMS key name to use to decrypt these envs.
  core.String kmsKeyName;

  /// Map of environment variable name to its encrypted value. Secret
  /// environment variables must be unique across all of a build's secrets, and
  /// must be used by at least one build step. Values can be at most 64 KB in
  /// size. There can be at most 100 secret values across all of a build's
  /// secrets.
  core.Map<core.String, core.String> secretEnv;

  Secret();

  Secret.fromJson(core.Map _json) {
    if (_json.containsKey('kmsKeyName')) {
      kmsKeyName = _json['kmsKeyName'] as core.String;
    }
    if (_json.containsKey('secretEnv')) {
      secretEnv =
          (_json['secretEnv'] as core.Map).cast<core.String, core.String>().map(
                (key, item) => core.MapEntry(
                  key,
                  item as core.String,
                ),
              );
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (kmsKeyName != null) {
      _json['kmsKeyName'] = kmsKeyName;
    }
    if (secretEnv != null) {
      _json['secretEnv'] = secretEnv;
    }
    return _json;
  }
}

/// SlackDelivery is the delivery configuration for delivering Slack messages
/// via webhooks. See Slack webhook documentation at:
/// https://api.slack.com/messaging/webhooks.
class SlackDelivery {
  /// The secret reference for the Slack webhook URI for sending messages to a
  /// channel.
  NotifierSecretRef webhookUri;

  SlackDelivery();

  SlackDelivery.fromJson(core.Map _json) {
    if (_json.containsKey('webhookUri')) {
      webhookUri = NotifierSecretRef.fromJson(
          _json['webhookUri'] as core.Map<core.String, core.dynamic>);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (webhookUri != null) {
      _json['webhookUri'] = webhookUri.toJson();
    }
    return _json;
  }
}

/// Location of the source in a supported storage service.
class Source {
  /// If provided, get the source from this location in a Cloud Source
  /// Repository.
  RepoSource repoSource;

  /// If provided, get the source from this location in Google Cloud Storage.
  StorageSource storageSource;

  Source();

  Source.fromJson(core.Map _json) {
    if (_json.containsKey('repoSource')) {
      repoSource = RepoSource.fromJson(
          _json['repoSource'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('storageSource')) {
      storageSource = StorageSource.fromJson(
          _json['storageSource'] as core.Map<core.String, core.dynamic>);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (repoSource != null) {
      _json['repoSource'] = repoSource.toJson();
    }
    if (storageSource != null) {
      _json['storageSource'] = storageSource.toJson();
    }
    return _json;
  }
}

/// Provenance of the source. Ways to find the original source, or verify that
/// some source was used for this build.
class SourceProvenance {
  /// Output only. Hash(es) of the build source, which can be used to verify
  /// that the original source integrity was maintained in the build. Note that
  /// `FileHashes` will only be populated if `BuildOptions` has requested a
  /// `SourceProvenanceHash`. The keys to this map are file paths used as build
  /// source and the values contain the hash values for those files. If the
  /// build source came in a single package such as a gzipped tarfile
  /// (`.tar.gz`), the `FileHash` will be for the single path to that file.
  core.Map<core.String, FileHashes> fileHashes;

  /// A copy of the build's `source.repo_source`, if exists, with any revisions
  /// resolved.
  RepoSource resolvedRepoSource;

  /// A copy of the build's `source.storage_source`, if exists, with any
  /// generations resolved.
  StorageSource resolvedStorageSource;

  SourceProvenance();

  SourceProvenance.fromJson(core.Map _json) {
    if (_json.containsKey('fileHashes')) {
      fileHashes = (_json['fileHashes'] as core.Map)
          .cast<core.String, core.Map>()
          .map(
            (key, item) => core.MapEntry(
              key,
              FileHashes.fromJson(item as core.Map<core.String, core.dynamic>),
            ),
          );
    }
    if (_json.containsKey('resolvedRepoSource')) {
      resolvedRepoSource = RepoSource.fromJson(
          _json['resolvedRepoSource'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('resolvedStorageSource')) {
      resolvedStorageSource = StorageSource.fromJson(
          _json['resolvedStorageSource']
              as core.Map<core.String, core.dynamic>);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (fileHashes != null) {
      _json['fileHashes'] =
          fileHashes.map((key, item) => core.MapEntry(key, item.toJson()));
    }
    if (resolvedRepoSource != null) {
      _json['resolvedRepoSource'] = resolvedRepoSource.toJson();
    }
    if (resolvedStorageSource != null) {
      _json['resolvedStorageSource'] = resolvedStorageSource.toJson();
    }
    return _json;
  }
}

/// The `Status` type defines a logical error model that is suitable for
/// different programming environments, including REST APIs and RPC APIs. It is
/// used by [gRPC](https://github.com/grpc). Each `Status` message contains
/// three pieces of data: error code, error message, and error details. You can
/// find out more about this error model and how to work with it in the [API
/// Design Guide](https://cloud.google.com/apis/design/errors).
class Status {
  /// The status code, which should be an enum value of google.rpc.Code.
  core.int code;

  /// A list of messages that carry the error details. There is a common set of
  /// message types for APIs to use.
  ///
  /// The values for Object must be JSON objects. It can consist of `num`,
  /// `String`, `bool` and `null` as well as `Map` and `List` values.
  core.List<core.Map<core.String, core.Object>> details;

  /// A developer-facing error message, which should be in English. Any
  /// user-facing error message should be localized and sent in the
  /// google.rpc.Status.details field, or localized by the client.
  core.String message;

  Status();

  Status.fromJson(core.Map _json) {
    if (_json.containsKey('code')) {
      code = _json['code'] as core.int;
    }
    if (_json.containsKey('details')) {
      details = (_json['details'] as core.List)
          .map<core.Map<core.String, core.Object>>((value) =>
              (value as core.Map).cast<core.String, core.Object>().map(
                    (key, item) => core.MapEntry(
                      key,
                      item as core.Object,
                    ),
                  ))
          .toList();
    }
    if (_json.containsKey('message')) {
      message = _json['message'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (code != null) {
      _json['code'] = code;
    }
    if (details != null) {
      _json['details'] = details;
    }
    if (message != null) {
      _json['message'] = message;
    }
    return _json;
  }
}

/// Location of the source in an archive file in Google Cloud Storage.
class StorageSource {
  /// Google Cloud Storage bucket containing the source (see [Bucket Name
  /// Requirements](https://cloud.google.com/storage/docs/bucket-naming#requirements)).
  core.String bucket;

  /// Google Cloud Storage generation for the object. If the generation is
  /// omitted, the latest generation will be used.
  core.String generation;

  /// Google Cloud Storage object containing the source. This object must be a
  /// gzipped archive file (`.tar.gz`) containing source to build.
  core.String object;

  StorageSource();

  StorageSource.fromJson(core.Map _json) {
    if (_json.containsKey('bucket')) {
      bucket = _json['bucket'] as core.String;
    }
    if (_json.containsKey('generation')) {
      generation = _json['generation'] as core.String;
    }
    if (_json.containsKey('object')) {
      object = _json['object'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (bucket != null) {
      _json['bucket'] = bucket;
    }
    if (generation != null) {
      _json['generation'] = generation;
    }
    if (object != null) {
      _json['object'] = object;
    }
    return _json;
  }
}

/// Start and end times for a build execution phase.
class TimeSpan {
  /// End of time span.
  core.String endTime;

  /// Start of time span.
  core.String startTime;

  TimeSpan();

  TimeSpan.fromJson(core.Map _json) {
    if (_json.containsKey('endTime')) {
      endTime = _json['endTime'] as core.String;
    }
    if (_json.containsKey('startTime')) {
      startTime = _json['startTime'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (endTime != null) {
      _json['endTime'] = endTime;
    }
    if (startTime != null) {
      _json['startTime'] = startTime;
    }
    return _json;
  }
}

/// Volume describes a Docker container volume which is mounted into build steps
/// in order to persist files across build step execution.
class Volume {
  /// Name of the volume to mount. Volume names must be unique per build step
  /// and must be valid names for Docker volumes. Each named volume must be used
  /// by at least two build steps.
  core.String name;

  /// Path at which to mount the volume. Paths must be absolute and cannot
  /// conflict with other volume paths on the same build step or with certain
  /// reserved volume paths.
  core.String path;

  Volume();

  Volume.fromJson(core.Map _json) {
    if (_json.containsKey('name')) {
      name = _json['name'] as core.String;
    }
    if (_json.containsKey('path')) {
      path = _json['path'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (name != null) {
      _json['name'] = name;
    }
    if (path != null) {
      _json['path'] = path;
    }
    return _json;
  }
}
