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

/// AdSense Host API - v4.1
///
/// Generates performance reports, generates ad codes, and provides publisher
/// management capabilities for AdSense Hosts.
///
/// For more information, see <https://developers.google.com/adsense/host/>
///
/// Create an instance of [AdSenseHostApi] to access these resources:
///
/// - [AccountsResourceApi]
///   - [AccountsAdclientsResourceApi]
///   - [AccountsAdunitsResourceApi]
///   - [AccountsReportsResourceApi]
/// - [AdclientsResourceApi]
/// - [AssociationsessionsResourceApi]
/// - [CustomchannelsResourceApi]
/// - [ReportsResourceApi]
/// - [UrlchannelsResourceApi]
library adsensehost.v4_1;

import 'dart:async' as async;
import 'dart:convert' as convert;
import 'dart:core' as core;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:http/http.dart' as http;

import '../src/user_agent.dart';

export 'package:_discoveryapis_commons/_discoveryapis_commons.dart'
    show ApiRequestError, DetailedApiRequestError;

/// Generates performance reports, generates ad codes, and provides publisher
/// management capabilities for AdSense Hosts.
class AdSenseHostApi {
  /// View and manage your AdSense host data and associated accounts
  static const adsensehostScope = 'https://www.googleapis.com/auth/adsensehost';

  final commons.ApiRequester _requester;

  AccountsResourceApi get accounts => AccountsResourceApi(_requester);
  AdclientsResourceApi get adclients => AdclientsResourceApi(_requester);
  AssociationsessionsResourceApi get associationsessions =>
      AssociationsessionsResourceApi(_requester);
  CustomchannelsResourceApi get customchannels =>
      CustomchannelsResourceApi(_requester);
  ReportsResourceApi get reports => ReportsResourceApi(_requester);
  UrlchannelsResourceApi get urlchannels => UrlchannelsResourceApi(_requester);

  AdSenseHostApi(http.Client client,
      {core.String rootUrl = 'https://www.googleapis.com/',
      core.String servicePath = 'adsensehost/v4.1/'})
      : _requester =
            commons.ApiRequester(client, rootUrl, servicePath, userAgent);
}

class AccountsResourceApi {
  final commons.ApiRequester _requester;

  AccountsAdclientsResourceApi get adclients =>
      AccountsAdclientsResourceApi(_requester);
  AccountsAdunitsResourceApi get adunits =>
      AccountsAdunitsResourceApi(_requester);
  AccountsReportsResourceApi get reports =>
      AccountsReportsResourceApi(_requester);

  AccountsResourceApi(commons.ApiRequester client) : _requester = client;

  /// Get information about the selected associated AdSense account.
  ///
  /// Request parameters:
  ///
  /// [accountId] - Account to get information about.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Account].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Account> get(
    core.String accountId, {
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (accountId == null) {
      throw core.ArgumentError('Parameter accountId is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'accounts/' + commons.Escaper.ecapeVariable('$accountId');

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
      (data) => Account.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }

  /// List hosted accounts associated with this AdSense account by ad client id.
  ///
  /// Request parameters:
  ///
  /// [filterAdClientId] - Ad clients to list accounts for.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Accounts].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Accounts> list(
    core.List<core.String> filterAdClientId, {
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (filterAdClientId == null || filterAdClientId.isEmpty) {
      throw core.ArgumentError('Parameter filterAdClientId is required.');
    }
    _queryParams['filterAdClientId'] = filterAdClientId;
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'accounts';

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
      (data) => Accounts.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }
}

class AccountsAdclientsResourceApi {
  final commons.ApiRequester _requester;

  AccountsAdclientsResourceApi(commons.ApiRequester client)
      : _requester = client;

  /// Get information about one of the ad clients in the specified publisher's
  /// AdSense account.
  ///
  /// Request parameters:
  ///
  /// [accountId] - Account which contains the ad client.
  ///
  /// [adClientId] - Ad client to get.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [AdClient].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<AdClient> get(
    core.String accountId,
    core.String adClientId, {
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (accountId == null) {
      throw core.ArgumentError('Parameter accountId is required.');
    }
    if (adClientId == null) {
      throw core.ArgumentError('Parameter adClientId is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'accounts/' +
        commons.Escaper.ecapeVariable('$accountId') +
        '/adclients/' +
        commons.Escaper.ecapeVariable('$adClientId');

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
      (data) => AdClient.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }

  /// List all hosted ad clients in the specified hosted account.
  ///
  /// Request parameters:
  ///
  /// [accountId] - Account for which to list ad clients.
  ///
  /// [maxResults] - The maximum number of ad clients to include in the
  /// response, used for paging.
  /// Value must be between "0" and "10000".
  ///
  /// [pageToken] - A continuation token, used to page through ad clients. To
  /// retrieve the next page, set this parameter to the value of "nextPageToken"
  /// from the previous response.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [AdClients].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<AdClients> list(
    core.String accountId, {
    core.int maxResults,
    core.String pageToken,
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (accountId == null) {
      throw core.ArgumentError('Parameter accountId is required.');
    }
    if (maxResults != null) {
      _queryParams['maxResults'] = ['${maxResults}'];
    }
    if (pageToken != null) {
      _queryParams['pageToken'] = [pageToken];
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'accounts/' +
        commons.Escaper.ecapeVariable('$accountId') +
        '/adclients';

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
      (data) => AdClients.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }
}

class AccountsAdunitsResourceApi {
  final commons.ApiRequester _requester;

  AccountsAdunitsResourceApi(commons.ApiRequester client) : _requester = client;

  /// Delete the specified ad unit from the specified publisher AdSense account.
  ///
  /// Request parameters:
  ///
  /// [accountId] - Account which contains the ad unit.
  ///
  /// [adClientId] - Ad client for which to get ad unit.
  ///
  /// [adUnitId] - Ad unit to delete.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [AdUnit].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<AdUnit> delete(
    core.String accountId,
    core.String adClientId,
    core.String adUnitId, {
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (accountId == null) {
      throw core.ArgumentError('Parameter accountId is required.');
    }
    if (adClientId == null) {
      throw core.ArgumentError('Parameter adClientId is required.');
    }
    if (adUnitId == null) {
      throw core.ArgumentError('Parameter adUnitId is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'accounts/' +
        commons.Escaper.ecapeVariable('$accountId') +
        '/adclients/' +
        commons.Escaper.ecapeVariable('$adClientId') +
        '/adunits/' +
        commons.Escaper.ecapeVariable('$adUnitId');

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
      (data) => AdUnit.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }

  /// Get the specified host ad unit in this AdSense account.
  ///
  /// Request parameters:
  ///
  /// [accountId] - Account which contains the ad unit.
  ///
  /// [adClientId] - Ad client for which to get ad unit.
  ///
  /// [adUnitId] - Ad unit to get.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [AdUnit].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<AdUnit> get(
    core.String accountId,
    core.String adClientId,
    core.String adUnitId, {
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (accountId == null) {
      throw core.ArgumentError('Parameter accountId is required.');
    }
    if (adClientId == null) {
      throw core.ArgumentError('Parameter adClientId is required.');
    }
    if (adUnitId == null) {
      throw core.ArgumentError('Parameter adUnitId is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'accounts/' +
        commons.Escaper.ecapeVariable('$accountId') +
        '/adclients/' +
        commons.Escaper.ecapeVariable('$adClientId') +
        '/adunits/' +
        commons.Escaper.ecapeVariable('$adUnitId');

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
      (data) => AdUnit.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }

  /// Get ad code for the specified ad unit, attaching the specified host custom
  /// channels.
  ///
  /// Request parameters:
  ///
  /// [accountId] - Account which contains the ad client.
  ///
  /// [adClientId] - Ad client with contains the ad unit.
  ///
  /// [adUnitId] - Ad unit to get the code for.
  ///
  /// [hostCustomChannelId] - Host custom channel to attach to the ad code.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [AdCode].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<AdCode> getAdCode(
    core.String accountId,
    core.String adClientId,
    core.String adUnitId, {
    core.List<core.String> hostCustomChannelId,
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (accountId == null) {
      throw core.ArgumentError('Parameter accountId is required.');
    }
    if (adClientId == null) {
      throw core.ArgumentError('Parameter adClientId is required.');
    }
    if (adUnitId == null) {
      throw core.ArgumentError('Parameter adUnitId is required.');
    }
    if (hostCustomChannelId != null) {
      _queryParams['hostCustomChannelId'] = hostCustomChannelId;
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'accounts/' +
        commons.Escaper.ecapeVariable('$accountId') +
        '/adclients/' +
        commons.Escaper.ecapeVariable('$adClientId') +
        '/adunits/' +
        commons.Escaper.ecapeVariable('$adUnitId') +
        '/adcode';

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
      (data) => AdCode.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }

  /// Insert the supplied ad unit into the specified publisher AdSense account.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [accountId] - Account which will contain the ad unit.
  ///
  /// [adClientId] - Ad client into which to insert the ad unit.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [AdUnit].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<AdUnit> insert(
    AdUnit request,
    core.String accountId,
    core.String adClientId, {
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
    if (accountId == null) {
      throw core.ArgumentError('Parameter accountId is required.');
    }
    if (adClientId == null) {
      throw core.ArgumentError('Parameter adClientId is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'accounts/' +
        commons.Escaper.ecapeVariable('$accountId') +
        '/adclients/' +
        commons.Escaper.ecapeVariable('$adClientId') +
        '/adunits';

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
      (data) => AdUnit.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }

  /// List all ad units in the specified publisher's AdSense account.
  ///
  /// Request parameters:
  ///
  /// [accountId] - Account which contains the ad client.
  ///
  /// [adClientId] - Ad client for which to list ad units.
  ///
  /// [includeInactive] - Whether to include inactive ad units. Default: true.
  ///
  /// [maxResults] - The maximum number of ad units to include in the response,
  /// used for paging.
  /// Value must be between "0" and "10000".
  ///
  /// [pageToken] - A continuation token, used to page through ad units. To
  /// retrieve the next page, set this parameter to the value of "nextPageToken"
  /// from the previous response.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [AdUnits].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<AdUnits> list(
    core.String accountId,
    core.String adClientId, {
    core.bool includeInactive,
    core.int maxResults,
    core.String pageToken,
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (accountId == null) {
      throw core.ArgumentError('Parameter accountId is required.');
    }
    if (adClientId == null) {
      throw core.ArgumentError('Parameter adClientId is required.');
    }
    if (includeInactive != null) {
      _queryParams['includeInactive'] = ['${includeInactive}'];
    }
    if (maxResults != null) {
      _queryParams['maxResults'] = ['${maxResults}'];
    }
    if (pageToken != null) {
      _queryParams['pageToken'] = [pageToken];
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'accounts/' +
        commons.Escaper.ecapeVariable('$accountId') +
        '/adclients/' +
        commons.Escaper.ecapeVariable('$adClientId') +
        '/adunits';

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
      (data) => AdUnits.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }

  /// Update the supplied ad unit in the specified publisher AdSense account.
  /// This method supports patch semantics.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [accountId] - Account which contains the ad client.
  ///
  /// [adClientId] - Ad client which contains the ad unit.
  ///
  /// [adUnitId] - Ad unit to get.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [AdUnit].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<AdUnit> patch(
    AdUnit request,
    core.String accountId,
    core.String adClientId,
    core.String adUnitId, {
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
    if (accountId == null) {
      throw core.ArgumentError('Parameter accountId is required.');
    }
    if (adClientId == null) {
      throw core.ArgumentError('Parameter adClientId is required.');
    }
    if (adUnitId == null) {
      throw core.ArgumentError('Parameter adUnitId is required.');
    }
    _queryParams['adUnitId'] = [adUnitId];
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'accounts/' +
        commons.Escaper.ecapeVariable('$accountId') +
        '/adclients/' +
        commons.Escaper.ecapeVariable('$adClientId') +
        '/adunits';

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
      (data) => AdUnit.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }

  /// Update the supplied ad unit in the specified publisher AdSense account.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [accountId] - Account which contains the ad client.
  ///
  /// [adClientId] - Ad client which contains the ad unit.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [AdUnit].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<AdUnit> update(
    AdUnit request,
    core.String accountId,
    core.String adClientId, {
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
    if (accountId == null) {
      throw core.ArgumentError('Parameter accountId is required.');
    }
    if (adClientId == null) {
      throw core.ArgumentError('Parameter adClientId is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'accounts/' +
        commons.Escaper.ecapeVariable('$accountId') +
        '/adclients/' +
        commons.Escaper.ecapeVariable('$adClientId') +
        '/adunits';

    final _response = _requester.request(
      _url,
      'PUT',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
      downloadOptions: _downloadOptions,
    );
    return _response.then(
      (data) => AdUnit.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }
}

class AccountsReportsResourceApi {
  final commons.ApiRequester _requester;

  AccountsReportsResourceApi(commons.ApiRequester client) : _requester = client;

  /// Generate an AdSense report based on the report request sent in the query
  /// parameters. Returns the result as JSON; to retrieve output in CSV format
  /// specify "alt=csv" as a query parameter.
  ///
  /// Request parameters:
  ///
  /// [accountId] - Hosted account upon which to report.
  ///
  /// [startDate] - Start of the date range to report on in "YYYY-MM-DD" format,
  /// inclusive.
  /// Value must have pattern
  /// "\d{4}-\d{2}-\d{2}|(today|startOfMonth|startOfYear)(([\-\+]\d+[dwmy]){0,3}?)".
  ///
  /// [endDate] - End of the date range to report on in "YYYY-MM-DD" format,
  /// inclusive.
  /// Value must have pattern
  /// "\d{4}-\d{2}-\d{2}|(today|startOfMonth|startOfYear)(([\-\+]\d+[dwmy]){0,3}?)".
  ///
  /// [dimension] - Dimensions to base the report on.
  /// Value must have pattern "[a-zA-Z_]+".
  ///
  /// [filter] - Filters to be run on the report.
  /// Value must have pattern "[a-zA-Z_]+(==|=@).+".
  ///
  /// [locale] - Optional locale to use for translating report output to a local
  /// language. Defaults to "en_US" if not specified.
  /// Value must have pattern "[a-zA-Z_]+".
  ///
  /// [maxResults] - The maximum number of rows of report data to return.
  /// Value must be between "0" and "50000".
  ///
  /// [metric] - Numeric columns to include in the report.
  /// Value must have pattern "[a-zA-Z_]+".
  ///
  /// [sort] - The name of a dimension or metric to sort the resulting report
  /// on, optionally prefixed with "+" to sort ascending or "-" to sort
  /// descending. If no prefix is specified, the column is sorted ascending.
  /// Value must have pattern "(\+|-)?[a-zA-Z_]+".
  ///
  /// [startIndex] - Index of the first row of report data to return.
  /// Value must be between "0" and "5000".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Report].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Report> generate(
    core.String accountId,
    core.String startDate,
    core.String endDate, {
    core.List<core.String> dimension,
    core.List<core.String> filter,
    core.String locale,
    core.int maxResults,
    core.List<core.String> metric,
    core.List<core.String> sort,
    core.int startIndex,
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (accountId == null) {
      throw core.ArgumentError('Parameter accountId is required.');
    }
    if (startDate == null) {
      throw core.ArgumentError('Parameter startDate is required.');
    }
    _queryParams['startDate'] = [startDate];
    if (endDate == null) {
      throw core.ArgumentError('Parameter endDate is required.');
    }
    _queryParams['endDate'] = [endDate];
    if (dimension != null) {
      _queryParams['dimension'] = dimension;
    }
    if (filter != null) {
      _queryParams['filter'] = filter;
    }
    if (locale != null) {
      _queryParams['locale'] = [locale];
    }
    if (maxResults != null) {
      _queryParams['maxResults'] = ['${maxResults}'];
    }
    if (metric != null) {
      _queryParams['metric'] = metric;
    }
    if (sort != null) {
      _queryParams['sort'] = sort;
    }
    if (startIndex != null) {
      _queryParams['startIndex'] = ['${startIndex}'];
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url =
        'accounts/' + commons.Escaper.ecapeVariable('$accountId') + '/reports';

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
      (data) => Report.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }
}

class AdclientsResourceApi {
  final commons.ApiRequester _requester;

  AdclientsResourceApi(commons.ApiRequester client) : _requester = client;

  /// Get information about one of the ad clients in the Host AdSense account.
  ///
  /// Request parameters:
  ///
  /// [adClientId] - Ad client to get.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [AdClient].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<AdClient> get(
    core.String adClientId, {
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (adClientId == null) {
      throw core.ArgumentError('Parameter adClientId is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'adclients/' + commons.Escaper.ecapeVariable('$adClientId');

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
      (data) => AdClient.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }

  /// List all host ad clients in this AdSense account.
  ///
  /// Request parameters:
  ///
  /// [maxResults] - The maximum number of ad clients to include in the
  /// response, used for paging.
  /// Value must be between "0" and "10000".
  ///
  /// [pageToken] - A continuation token, used to page through ad clients. To
  /// retrieve the next page, set this parameter to the value of "nextPageToken"
  /// from the previous response.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [AdClients].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<AdClients> list({
    core.int maxResults,
    core.String pageToken,
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (maxResults != null) {
      _queryParams['maxResults'] = ['${maxResults}'];
    }
    if (pageToken != null) {
      _queryParams['pageToken'] = [pageToken];
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'adclients';

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
      (data) => AdClients.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }
}

class AssociationsessionsResourceApi {
  final commons.ApiRequester _requester;

  AssociationsessionsResourceApi(commons.ApiRequester client)
      : _requester = client;

  /// Create an association session for initiating an association with an
  /// AdSense user.
  ///
  /// Request parameters:
  ///
  /// [productCode] - Products to associate with the user.
  ///
  /// [websiteUrl] - The URL of the user's hosted website.
  ///
  /// [callbackUrl] - The URL to redirect the user to once association is
  /// completed. It receives a token parameter that can then be used to retrieve
  /// the associated account.
  ///
  /// [userLocale] - The preferred locale of the user.
  ///
  /// [websiteLocale] - The locale of the user's hosted website.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [AssociationSession].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<AssociationSession> start(
    core.List<core.String> productCode,
    core.String websiteUrl, {
    core.String callbackUrl,
    core.String userLocale,
    core.String websiteLocale,
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (productCode == null || productCode.isEmpty) {
      throw core.ArgumentError('Parameter productCode is required.');
    }
    _queryParams['productCode'] = productCode;
    if (websiteUrl == null) {
      throw core.ArgumentError('Parameter websiteUrl is required.');
    }
    _queryParams['websiteUrl'] = [websiteUrl];
    if (callbackUrl != null) {
      _queryParams['callbackUrl'] = [callbackUrl];
    }
    if (userLocale != null) {
      _queryParams['userLocale'] = [userLocale];
    }
    if (websiteLocale != null) {
      _queryParams['websiteLocale'] = [websiteLocale];
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'associationsessions/start';

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
      (data) => AssociationSession.fromJson(
          data as core.Map<core.String, core.dynamic>),
    );
  }

  /// Verify an association session after the association callback returns from
  /// AdSense signup.
  ///
  /// Request parameters:
  ///
  /// [token] - The token returned to the association callback URL.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [AssociationSession].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<AssociationSession> verify(
    core.String token, {
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (token == null) {
      throw core.ArgumentError('Parameter token is required.');
    }
    _queryParams['token'] = [token];
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'associationsessions/verify';

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
      (data) => AssociationSession.fromJson(
          data as core.Map<core.String, core.dynamic>),
    );
  }
}

class CustomchannelsResourceApi {
  final commons.ApiRequester _requester;

  CustomchannelsResourceApi(commons.ApiRequester client) : _requester = client;

  /// Delete a specific custom channel from the host AdSense account.
  ///
  /// Request parameters:
  ///
  /// [adClientId] - Ad client from which to delete the custom channel.
  ///
  /// [customChannelId] - Custom channel to delete.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [CustomChannel].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<CustomChannel> delete(
    core.String adClientId,
    core.String customChannelId, {
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (adClientId == null) {
      throw core.ArgumentError('Parameter adClientId is required.');
    }
    if (customChannelId == null) {
      throw core.ArgumentError('Parameter customChannelId is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'adclients/' +
        commons.Escaper.ecapeVariable('$adClientId') +
        '/customchannels/' +
        commons.Escaper.ecapeVariable('$customChannelId');

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
      (data) =>
          CustomChannel.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }

  /// Get a specific custom channel from the host AdSense account.
  ///
  /// Request parameters:
  ///
  /// [adClientId] - Ad client from which to get the custom channel.
  ///
  /// [customChannelId] - Custom channel to get.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [CustomChannel].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<CustomChannel> get(
    core.String adClientId,
    core.String customChannelId, {
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (adClientId == null) {
      throw core.ArgumentError('Parameter adClientId is required.');
    }
    if (customChannelId == null) {
      throw core.ArgumentError('Parameter customChannelId is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'adclients/' +
        commons.Escaper.ecapeVariable('$adClientId') +
        '/customchannels/' +
        commons.Escaper.ecapeVariable('$customChannelId');

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
          CustomChannel.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }

  /// Add a new custom channel to the host AdSense account.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [adClientId] - Ad client to which the new custom channel will be added.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [CustomChannel].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<CustomChannel> insert(
    CustomChannel request,
    core.String adClientId, {
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
    if (adClientId == null) {
      throw core.ArgumentError('Parameter adClientId is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'adclients/' +
        commons.Escaper.ecapeVariable('$adClientId') +
        '/customchannels';

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
          CustomChannel.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }

  /// List all host custom channels in this AdSense account.
  ///
  /// Request parameters:
  ///
  /// [adClientId] - Ad client for which to list custom channels.
  ///
  /// [maxResults] - The maximum number of custom channels to include in the
  /// response, used for paging.
  /// Value must be between "0" and "10000".
  ///
  /// [pageToken] - A continuation token, used to page through custom channels.
  /// To retrieve the next page, set this parameter to the value of
  /// "nextPageToken" from the previous response.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [CustomChannels].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<CustomChannels> list(
    core.String adClientId, {
    core.int maxResults,
    core.String pageToken,
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (adClientId == null) {
      throw core.ArgumentError('Parameter adClientId is required.');
    }
    if (maxResults != null) {
      _queryParams['maxResults'] = ['${maxResults}'];
    }
    if (pageToken != null) {
      _queryParams['pageToken'] = [pageToken];
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'adclients/' +
        commons.Escaper.ecapeVariable('$adClientId') +
        '/customchannels';

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
          CustomChannels.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }

  /// Update a custom channel in the host AdSense account. This method supports
  /// patch semantics.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [adClientId] - Ad client in which the custom channel will be updated.
  ///
  /// [customChannelId] - Custom channel to get.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [CustomChannel].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<CustomChannel> patch(
    CustomChannel request,
    core.String adClientId,
    core.String customChannelId, {
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
    if (adClientId == null) {
      throw core.ArgumentError('Parameter adClientId is required.');
    }
    if (customChannelId == null) {
      throw core.ArgumentError('Parameter customChannelId is required.');
    }
    _queryParams['customChannelId'] = [customChannelId];
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'adclients/' +
        commons.Escaper.ecapeVariable('$adClientId') +
        '/customchannels';

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
          CustomChannel.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }

  /// Update a custom channel in the host AdSense account.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [adClientId] - Ad client in which the custom channel will be updated.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [CustomChannel].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<CustomChannel> update(
    CustomChannel request,
    core.String adClientId, {
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
    if (adClientId == null) {
      throw core.ArgumentError('Parameter adClientId is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'adclients/' +
        commons.Escaper.ecapeVariable('$adClientId') +
        '/customchannels';

    final _response = _requester.request(
      _url,
      'PUT',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
      downloadOptions: _downloadOptions,
    );
    return _response.then(
      (data) =>
          CustomChannel.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }
}

class ReportsResourceApi {
  final commons.ApiRequester _requester;

  ReportsResourceApi(commons.ApiRequester client) : _requester = client;

  /// Generate an AdSense report based on the report request sent in the query
  /// parameters. Returns the result as JSON; to retrieve output in CSV format
  /// specify "alt=csv" as a query parameter.
  ///
  /// Request parameters:
  ///
  /// [startDate] - Start of the date range to report on in "YYYY-MM-DD" format,
  /// inclusive.
  /// Value must have pattern
  /// "\d{4}-\d{2}-\d{2}|(today|startOfMonth|startOfYear)(([\-\+]\d+[dwmy]){0,3}?)".
  ///
  /// [endDate] - End of the date range to report on in "YYYY-MM-DD" format,
  /// inclusive.
  /// Value must have pattern
  /// "\d{4}-\d{2}-\d{2}|(today|startOfMonth|startOfYear)(([\-\+]\d+[dwmy]){0,3}?)".
  ///
  /// [dimension] - Dimensions to base the report on.
  /// Value must have pattern "[a-zA-Z_]+".
  ///
  /// [filter] - Filters to be run on the report.
  /// Value must have pattern "[a-zA-Z_]+(==|=@).+".
  ///
  /// [locale] - Optional locale to use for translating report output to a local
  /// language. Defaults to "en_US" if not specified.
  /// Value must have pattern "[a-zA-Z_]+".
  ///
  /// [maxResults] - The maximum number of rows of report data to return.
  /// Value must be between "0" and "50000".
  ///
  /// [metric] - Numeric columns to include in the report.
  /// Value must have pattern "[a-zA-Z_]+".
  ///
  /// [sort] - The name of a dimension or metric to sort the resulting report
  /// on, optionally prefixed with "+" to sort ascending or "-" to sort
  /// descending. If no prefix is specified, the column is sorted ascending.
  /// Value must have pattern "(\+|-)?[a-zA-Z_]+".
  ///
  /// [startIndex] - Index of the first row of report data to return.
  /// Value must be between "0" and "5000".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Report].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Report> generate(
    core.String startDate,
    core.String endDate, {
    core.List<core.String> dimension,
    core.List<core.String> filter,
    core.String locale,
    core.int maxResults,
    core.List<core.String> metric,
    core.List<core.String> sort,
    core.int startIndex,
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (startDate == null) {
      throw core.ArgumentError('Parameter startDate is required.');
    }
    _queryParams['startDate'] = [startDate];
    if (endDate == null) {
      throw core.ArgumentError('Parameter endDate is required.');
    }
    _queryParams['endDate'] = [endDate];
    if (dimension != null) {
      _queryParams['dimension'] = dimension;
    }
    if (filter != null) {
      _queryParams['filter'] = filter;
    }
    if (locale != null) {
      _queryParams['locale'] = [locale];
    }
    if (maxResults != null) {
      _queryParams['maxResults'] = ['${maxResults}'];
    }
    if (metric != null) {
      _queryParams['metric'] = metric;
    }
    if (sort != null) {
      _queryParams['sort'] = sort;
    }
    if (startIndex != null) {
      _queryParams['startIndex'] = ['${startIndex}'];
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'reports';

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
      (data) => Report.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }
}

class UrlchannelsResourceApi {
  final commons.ApiRequester _requester;

  UrlchannelsResourceApi(commons.ApiRequester client) : _requester = client;

  /// Delete a URL channel from the host AdSense account.
  ///
  /// Request parameters:
  ///
  /// [adClientId] - Ad client from which to delete the URL channel.
  ///
  /// [urlChannelId] - URL channel to delete.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [UrlChannel].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<UrlChannel> delete(
    core.String adClientId,
    core.String urlChannelId, {
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (adClientId == null) {
      throw core.ArgumentError('Parameter adClientId is required.');
    }
    if (urlChannelId == null) {
      throw core.ArgumentError('Parameter urlChannelId is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'adclients/' +
        commons.Escaper.ecapeVariable('$adClientId') +
        '/urlchannels/' +
        commons.Escaper.ecapeVariable('$urlChannelId');

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
      (data) =>
          UrlChannel.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }

  /// Add a new URL channel to the host AdSense account.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [adClientId] - Ad client to which the new URL channel will be added.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [UrlChannel].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<UrlChannel> insert(
    UrlChannel request,
    core.String adClientId, {
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
    if (adClientId == null) {
      throw core.ArgumentError('Parameter adClientId is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'adclients/' +
        commons.Escaper.ecapeVariable('$adClientId') +
        '/urlchannels';

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
          UrlChannel.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }

  /// List all host URL channels in the host AdSense account.
  ///
  /// Request parameters:
  ///
  /// [adClientId] - Ad client for which to list URL channels.
  ///
  /// [maxResults] - The maximum number of URL channels to include in the
  /// response, used for paging.
  /// Value must be between "0" and "10000".
  ///
  /// [pageToken] - A continuation token, used to page through URL channels. To
  /// retrieve the next page, set this parameter to the value of "nextPageToken"
  /// from the previous response.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [UrlChannels].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<UrlChannels> list(
    core.String adClientId, {
    core.int maxResults,
    core.String pageToken,
    core.String $fields,
  }) {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    core.String _body;

    if (adClientId == null) {
      throw core.ArgumentError('Parameter adClientId is required.');
    }
    if (maxResults != null) {
      _queryParams['maxResults'] = ['${maxResults}'];
    }
    if (pageToken != null) {
      _queryParams['pageToken'] = [pageToken];
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'adclients/' +
        commons.Escaper.ecapeVariable('$adClientId') +
        '/urlchannels';

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
          UrlChannels.fromJson(data as core.Map<core.String, core.dynamic>),
    );
  }
}

class Account {
  /// Unique identifier of this account.
  core.String id;

  /// Kind of resource this is, in this case adsensehost#account.
  core.String kind;

  /// Name of this account.
  core.String name;

  /// Approval status of this account. One of: PENDING, APPROVED, DISABLED.
  core.String status;

  Account();

  Account.fromJson(core.Map _json) {
    if (_json.containsKey('id')) {
      id = _json['id'] as core.String;
    }
    if (_json.containsKey('kind')) {
      kind = _json['kind'] as core.String;
    }
    if (_json.containsKey('name')) {
      name = _json['name'] as core.String;
    }
    if (_json.containsKey('status')) {
      status = _json['status'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (id != null) {
      _json['id'] = id;
    }
    if (kind != null) {
      _json['kind'] = kind;
    }
    if (name != null) {
      _json['name'] = name;
    }
    if (status != null) {
      _json['status'] = status;
    }
    return _json;
  }
}

class Accounts {
  /// ETag of this response for caching purposes.
  core.String etag;

  /// The accounts returned in this list response.
  core.List<Account> items;

  /// Kind of list this is, in this case adsensehost#accounts.
  core.String kind;

  Accounts();

  Accounts.fromJson(core.Map _json) {
    if (_json.containsKey('etag')) {
      etag = _json['etag'] as core.String;
    }
    if (_json.containsKey('items')) {
      items = (_json['items'] as core.List)
          .map<Account>((value) =>
              Account.fromJson(value as core.Map<core.String, core.dynamic>))
          .toList();
    }
    if (_json.containsKey('kind')) {
      kind = _json['kind'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (etag != null) {
      _json['etag'] = etag;
    }
    if (items != null) {
      _json['items'] = items.map((value) => value.toJson()).toList();
    }
    if (kind != null) {
      _json['kind'] = kind;
    }
    return _json;
  }
}

class AdClient {
  /// Whether this ad client is opted in to ARC.
  core.bool arcOptIn;

  /// Unique identifier of this ad client.
  core.String id;

  /// Kind of resource this is, in this case adsensehost#adClient.
  core.String kind;

  /// This ad client's product code, which corresponds to the PRODUCT_CODE
  /// report dimension.
  core.String productCode;

  /// Whether this ad client supports being reported on.
  core.bool supportsReporting;

  AdClient();

  AdClient.fromJson(core.Map _json) {
    if (_json.containsKey('arcOptIn')) {
      arcOptIn = _json['arcOptIn'] as core.bool;
    }
    if (_json.containsKey('id')) {
      id = _json['id'] as core.String;
    }
    if (_json.containsKey('kind')) {
      kind = _json['kind'] as core.String;
    }
    if (_json.containsKey('productCode')) {
      productCode = _json['productCode'] as core.String;
    }
    if (_json.containsKey('supportsReporting')) {
      supportsReporting = _json['supportsReporting'] as core.bool;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (arcOptIn != null) {
      _json['arcOptIn'] = arcOptIn;
    }
    if (id != null) {
      _json['id'] = id;
    }
    if (kind != null) {
      _json['kind'] = kind;
    }
    if (productCode != null) {
      _json['productCode'] = productCode;
    }
    if (supportsReporting != null) {
      _json['supportsReporting'] = supportsReporting;
    }
    return _json;
  }
}

class AdClients {
  /// ETag of this response for caching purposes.
  core.String etag;

  /// The ad clients returned in this list response.
  core.List<AdClient> items;

  /// Kind of list this is, in this case adsensehost#adClients.
  core.String kind;

  /// Continuation token used to page through ad clients. To retrieve the next
  /// page of results, set the next request's "pageToken" value to this.
  core.String nextPageToken;

  AdClients();

  AdClients.fromJson(core.Map _json) {
    if (_json.containsKey('etag')) {
      etag = _json['etag'] as core.String;
    }
    if (_json.containsKey('items')) {
      items = (_json['items'] as core.List)
          .map<AdClient>((value) =>
              AdClient.fromJson(value as core.Map<core.String, core.dynamic>))
          .toList();
    }
    if (_json.containsKey('kind')) {
      kind = _json['kind'] as core.String;
    }
    if (_json.containsKey('nextPageToken')) {
      nextPageToken = _json['nextPageToken'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (etag != null) {
      _json['etag'] = etag;
    }
    if (items != null) {
      _json['items'] = items.map((value) => value.toJson()).toList();
    }
    if (kind != null) {
      _json['kind'] = kind;
    }
    if (nextPageToken != null) {
      _json['nextPageToken'] = nextPageToken;
    }
    return _json;
  }
}

class AdCode {
  /// The ad code snippet.
  core.String adCode;

  /// Kind this is, in this case adsensehost#adCode.
  core.String kind;

  AdCode();

  AdCode.fromJson(core.Map _json) {
    if (_json.containsKey('adCode')) {
      adCode = _json['adCode'] as core.String;
    }
    if (_json.containsKey('kind')) {
      kind = _json['kind'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (adCode != null) {
      _json['adCode'] = adCode;
    }
    if (kind != null) {
      _json['kind'] = kind;
    }
    return _json;
  }
}

/// The colors included in the style. These are represented as six hexadecimal
/// characters, similar to HTML color codes, but without the leading hash.
class AdStyleColors {
  /// The color of the ad background.
  core.String background;

  /// The color of the ad border.
  core.String border;

  /// The color of the ad text.
  core.String text;

  /// The color of the ad title.
  core.String title;

  /// The color of the ad url.
  core.String url;

  AdStyleColors();

  AdStyleColors.fromJson(core.Map _json) {
    if (_json.containsKey('background')) {
      background = _json['background'] as core.String;
    }
    if (_json.containsKey('border')) {
      border = _json['border'] as core.String;
    }
    if (_json.containsKey('text')) {
      text = _json['text'] as core.String;
    }
    if (_json.containsKey('title')) {
      title = _json['title'] as core.String;
    }
    if (_json.containsKey('url')) {
      url = _json['url'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (background != null) {
      _json['background'] = background;
    }
    if (border != null) {
      _json['border'] = border;
    }
    if (text != null) {
      _json['text'] = text;
    }
    if (title != null) {
      _json['title'] = title;
    }
    if (url != null) {
      _json['url'] = url;
    }
    return _json;
  }
}

/// The font which is included in the style.
class AdStyleFont {
  /// The family of the font. Possible values are: ACCOUNT_DEFAULT_FAMILY,
  /// ADSENSE_DEFAULT_FAMILY, ARIAL, TIMES and VERDANA.
  core.String family;

  /// The size of the font. Possible values are: ACCOUNT_DEFAULT_SIZE,
  /// ADSENSE_DEFAULT_SIZE, SMALL, MEDIUM and LARGE.
  core.String size;

  AdStyleFont();

  AdStyleFont.fromJson(core.Map _json) {
    if (_json.containsKey('family')) {
      family = _json['family'] as core.String;
    }
    if (_json.containsKey('size')) {
      size = _json['size'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (family != null) {
      _json['family'] = family;
    }
    if (size != null) {
      _json['size'] = size;
    }
    return _json;
  }
}

class AdStyle {
  /// The colors included in the style. These are represented as six hexadecimal
  /// characters, similar to HTML color codes, but without the leading hash.
  AdStyleColors colors;

  /// The style of the corners in the ad (deprecated: never populated, ignored).
  core.String corners;

  /// The font which is included in the style.
  AdStyleFont font;

  /// Kind this is, in this case adsensehost#adStyle.
  core.String kind;

  AdStyle();

  AdStyle.fromJson(core.Map _json) {
    if (_json.containsKey('colors')) {
      colors = AdStyleColors.fromJson(
          _json['colors'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('corners')) {
      corners = _json['corners'] as core.String;
    }
    if (_json.containsKey('font')) {
      font = AdStyleFont.fromJson(
          _json['font'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('kind')) {
      kind = _json['kind'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (colors != null) {
      _json['colors'] = colors.toJson();
    }
    if (corners != null) {
      _json['corners'] = corners;
    }
    if (font != null) {
      _json['font'] = font.toJson();
    }
    if (kind != null) {
      _json['kind'] = kind;
    }
    return _json;
  }
}

/// The backup option to be used in instances where no ad is available.
class AdUnitContentAdsSettingsBackupOption {
  /// Color to use when type is set to COLOR. These are represented as six
  /// hexadecimal characters, similar to HTML color codes, but without the
  /// leading hash.
  core.String color;

  /// Type of the backup option. Possible values are BLANK, COLOR and URL.
  core.String type;

  /// URL to use when type is set to URL.
  core.String url;

  AdUnitContentAdsSettingsBackupOption();

  AdUnitContentAdsSettingsBackupOption.fromJson(core.Map _json) {
    if (_json.containsKey('color')) {
      color = _json['color'] as core.String;
    }
    if (_json.containsKey('type')) {
      type = _json['type'] as core.String;
    }
    if (_json.containsKey('url')) {
      url = _json['url'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (color != null) {
      _json['color'] = color;
    }
    if (type != null) {
      _json['type'] = type;
    }
    if (url != null) {
      _json['url'] = url;
    }
    return _json;
  }
}

/// Settings specific to content ads (AFC) and highend mobile content ads (AFMC
/// - deprecated).
class AdUnitContentAdsSettings {
  /// The backup option to be used in instances where no ad is available.
  AdUnitContentAdsSettingsBackupOption backupOption;

  /// Size of this ad unit. Size values are in the form SIZE_{width}_{height}.
  core.String size;

  /// Type of this ad unit. Possible values are TEXT, TEXT_IMAGE, IMAGE and
  /// LINK.
  core.String type;

  AdUnitContentAdsSettings();

  AdUnitContentAdsSettings.fromJson(core.Map _json) {
    if (_json.containsKey('backupOption')) {
      backupOption = AdUnitContentAdsSettingsBackupOption.fromJson(
          _json['backupOption'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('size')) {
      size = _json['size'] as core.String;
    }
    if (_json.containsKey('type')) {
      type = _json['type'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (backupOption != null) {
      _json['backupOption'] = backupOption.toJson();
    }
    if (size != null) {
      _json['size'] = size;
    }
    if (type != null) {
      _json['type'] = type;
    }
    return _json;
  }
}

/// Settings specific to WAP mobile content ads (AFMC - deprecated).
class AdUnitMobileContentAdsSettings {
  /// The markup language to use for this ad unit.
  core.String markupLanguage;

  /// The scripting language to use for this ad unit.
  core.String scriptingLanguage;

  /// Size of this ad unit.
  core.String size;

  /// Type of this ad unit.
  core.String type;

  AdUnitMobileContentAdsSettings();

  AdUnitMobileContentAdsSettings.fromJson(core.Map _json) {
    if (_json.containsKey('markupLanguage')) {
      markupLanguage = _json['markupLanguage'] as core.String;
    }
    if (_json.containsKey('scriptingLanguage')) {
      scriptingLanguage = _json['scriptingLanguage'] as core.String;
    }
    if (_json.containsKey('size')) {
      size = _json['size'] as core.String;
    }
    if (_json.containsKey('type')) {
      type = _json['type'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (markupLanguage != null) {
      _json['markupLanguage'] = markupLanguage;
    }
    if (scriptingLanguage != null) {
      _json['scriptingLanguage'] = scriptingLanguage;
    }
    if (size != null) {
      _json['size'] = size;
    }
    if (type != null) {
      _json['type'] = type;
    }
    return _json;
  }
}

class AdUnit {
  /// Identity code of this ad unit, not necessarily unique across ad clients.
  core.String code;

  /// Settings specific to content ads (AFC) and highend mobile content ads
  /// (AFMC - deprecated).
  AdUnitContentAdsSettings contentAdsSettings;

  /// Custom style information specific to this ad unit.
  AdStyle customStyle;

  /// Unique identifier of this ad unit. This should be considered an opaque
  /// identifier; it is not safe to rely on it being in any particular format.
  core.String id;

  /// Kind of resource this is, in this case adsensehost#adUnit.
  core.String kind;

  /// Settings specific to WAP mobile content ads (AFMC - deprecated).
  AdUnitMobileContentAdsSettings mobileContentAdsSettings;

  /// Name of this ad unit.
  core.String name;

  /// Status of this ad unit. Possible values are:
  /// NEW: Indicates that the ad unit was created within the last seven days and
  /// does not yet have any activity associated with it.
  ///
  /// ACTIVE: Indicates that there has been activity on this ad unit in the last
  /// seven days.
  ///
  /// INACTIVE: Indicates that there has been no activity on this ad unit in the
  /// last seven days.
  core.String status;

  AdUnit();

  AdUnit.fromJson(core.Map _json) {
    if (_json.containsKey('code')) {
      code = _json['code'] as core.String;
    }
    if (_json.containsKey('contentAdsSettings')) {
      contentAdsSettings = AdUnitContentAdsSettings.fromJson(
          _json['contentAdsSettings'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('customStyle')) {
      customStyle = AdStyle.fromJson(
          _json['customStyle'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('id')) {
      id = _json['id'] as core.String;
    }
    if (_json.containsKey('kind')) {
      kind = _json['kind'] as core.String;
    }
    if (_json.containsKey('mobileContentAdsSettings')) {
      mobileContentAdsSettings = AdUnitMobileContentAdsSettings.fromJson(
          _json['mobileContentAdsSettings']
              as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('name')) {
      name = _json['name'] as core.String;
    }
    if (_json.containsKey('status')) {
      status = _json['status'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (code != null) {
      _json['code'] = code;
    }
    if (contentAdsSettings != null) {
      _json['contentAdsSettings'] = contentAdsSettings.toJson();
    }
    if (customStyle != null) {
      _json['customStyle'] = customStyle.toJson();
    }
    if (id != null) {
      _json['id'] = id;
    }
    if (kind != null) {
      _json['kind'] = kind;
    }
    if (mobileContentAdsSettings != null) {
      _json['mobileContentAdsSettings'] = mobileContentAdsSettings.toJson();
    }
    if (name != null) {
      _json['name'] = name;
    }
    if (status != null) {
      _json['status'] = status;
    }
    return _json;
  }
}

class AdUnits {
  /// ETag of this response for caching purposes.
  core.String etag;

  /// The ad units returned in this list response.
  core.List<AdUnit> items;

  /// Kind of list this is, in this case adsensehost#adUnits.
  core.String kind;

  /// Continuation token used to page through ad units. To retrieve the next
  /// page of results, set the next request's "pageToken" value to this.
  core.String nextPageToken;

  AdUnits();

  AdUnits.fromJson(core.Map _json) {
    if (_json.containsKey('etag')) {
      etag = _json['etag'] as core.String;
    }
    if (_json.containsKey('items')) {
      items = (_json['items'] as core.List)
          .map<AdUnit>((value) =>
              AdUnit.fromJson(value as core.Map<core.String, core.dynamic>))
          .toList();
    }
    if (_json.containsKey('kind')) {
      kind = _json['kind'] as core.String;
    }
    if (_json.containsKey('nextPageToken')) {
      nextPageToken = _json['nextPageToken'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (etag != null) {
      _json['etag'] = etag;
    }
    if (items != null) {
      _json['items'] = items.map((value) => value.toJson()).toList();
    }
    if (kind != null) {
      _json['kind'] = kind;
    }
    if (nextPageToken != null) {
      _json['nextPageToken'] = nextPageToken;
    }
    return _json;
  }
}

class AssociationSession {
  /// Hosted account id of the associated publisher after association. Present
  /// if status is ACCEPTED.
  core.String accountId;

  /// Unique identifier of this association session.
  core.String id;

  /// Kind of resource this is, in this case adsensehost#associationSession.
  core.String kind;

  /// The products to associate with the user. Options: AFC, AFG, AFV, AFS
  /// (deprecated), AFMC (deprecated)
  core.List<core.String> productCodes;

  /// Redirect URL of this association session. Used to redirect users into the
  /// AdSense association flow.
  core.String redirectUrl;

  /// Status of the completed association, available once the association
  /// callback token has been verified. One of ACCEPTED, REJECTED, or ERROR.
  core.String status;

  /// The preferred locale of the user themselves when going through the AdSense
  /// association flow.
  core.String userLocale;

  /// The locale of the user's hosted website.
  core.String websiteLocale;

  /// The URL of the user's hosted website.
  core.String websiteUrl;

  AssociationSession();

  AssociationSession.fromJson(core.Map _json) {
    if (_json.containsKey('accountId')) {
      accountId = _json['accountId'] as core.String;
    }
    if (_json.containsKey('id')) {
      id = _json['id'] as core.String;
    }
    if (_json.containsKey('kind')) {
      kind = _json['kind'] as core.String;
    }
    if (_json.containsKey('productCodes')) {
      productCodes = (_json['productCodes'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
    if (_json.containsKey('redirectUrl')) {
      redirectUrl = _json['redirectUrl'] as core.String;
    }
    if (_json.containsKey('status')) {
      status = _json['status'] as core.String;
    }
    if (_json.containsKey('userLocale')) {
      userLocale = _json['userLocale'] as core.String;
    }
    if (_json.containsKey('websiteLocale')) {
      websiteLocale = _json['websiteLocale'] as core.String;
    }
    if (_json.containsKey('websiteUrl')) {
      websiteUrl = _json['websiteUrl'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (accountId != null) {
      _json['accountId'] = accountId;
    }
    if (id != null) {
      _json['id'] = id;
    }
    if (kind != null) {
      _json['kind'] = kind;
    }
    if (productCodes != null) {
      _json['productCodes'] = productCodes;
    }
    if (redirectUrl != null) {
      _json['redirectUrl'] = redirectUrl;
    }
    if (status != null) {
      _json['status'] = status;
    }
    if (userLocale != null) {
      _json['userLocale'] = userLocale;
    }
    if (websiteLocale != null) {
      _json['websiteLocale'] = websiteLocale;
    }
    if (websiteUrl != null) {
      _json['websiteUrl'] = websiteUrl;
    }
    return _json;
  }
}

class CustomChannel {
  /// Code of this custom channel, not necessarily unique across ad clients.
  core.String code;

  /// Unique identifier of this custom channel. This should be considered an
  /// opaque identifier; it is not safe to rely on it being in any particular
  /// format.
  core.String id;

  /// Kind of resource this is, in this case adsensehost#customChannel.
  core.String kind;

  /// Name of this custom channel.
  core.String name;

  CustomChannel();

  CustomChannel.fromJson(core.Map _json) {
    if (_json.containsKey('code')) {
      code = _json['code'] as core.String;
    }
    if (_json.containsKey('id')) {
      id = _json['id'] as core.String;
    }
    if (_json.containsKey('kind')) {
      kind = _json['kind'] as core.String;
    }
    if (_json.containsKey('name')) {
      name = _json['name'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (code != null) {
      _json['code'] = code;
    }
    if (id != null) {
      _json['id'] = id;
    }
    if (kind != null) {
      _json['kind'] = kind;
    }
    if (name != null) {
      _json['name'] = name;
    }
    return _json;
  }
}

class CustomChannels {
  /// ETag of this response for caching purposes.
  core.String etag;

  /// The custom channels returned in this list response.
  core.List<CustomChannel> items;

  /// Kind of list this is, in this case adsensehost#customChannels.
  core.String kind;

  /// Continuation token used to page through custom channels. To retrieve the
  /// next page of results, set the next request's "pageToken" value to this.
  core.String nextPageToken;

  CustomChannels();

  CustomChannels.fromJson(core.Map _json) {
    if (_json.containsKey('etag')) {
      etag = _json['etag'] as core.String;
    }
    if (_json.containsKey('items')) {
      items = (_json['items'] as core.List)
          .map<CustomChannel>((value) => CustomChannel.fromJson(
              value as core.Map<core.String, core.dynamic>))
          .toList();
    }
    if (_json.containsKey('kind')) {
      kind = _json['kind'] as core.String;
    }
    if (_json.containsKey('nextPageToken')) {
      nextPageToken = _json['nextPageToken'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (etag != null) {
      _json['etag'] = etag;
    }
    if (items != null) {
      _json['items'] = items.map((value) => value.toJson()).toList();
    }
    if (kind != null) {
      _json['kind'] = kind;
    }
    if (nextPageToken != null) {
      _json['nextPageToken'] = nextPageToken;
    }
    return _json;
  }
}

class ReportHeaders {
  /// The currency of this column. Only present if the header type is
  /// METRIC_CURRENCY.
  core.String currency;

  /// The name of the header.
  core.String name;

  /// The type of the header; one of DIMENSION, METRIC_TALLY, METRIC_RATIO, or
  /// METRIC_CURRENCY.
  core.String type;

  ReportHeaders();

  ReportHeaders.fromJson(core.Map _json) {
    if (_json.containsKey('currency')) {
      currency = _json['currency'] as core.String;
    }
    if (_json.containsKey('name')) {
      name = _json['name'] as core.String;
    }
    if (_json.containsKey('type')) {
      type = _json['type'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (currency != null) {
      _json['currency'] = currency;
    }
    if (name != null) {
      _json['name'] = name;
    }
    if (type != null) {
      _json['type'] = type;
    }
    return _json;
  }
}

class Report {
  /// The averages of the report. This is the same length as any other row in
  /// the report; cells corresponding to dimension columns are empty.
  core.List<core.String> averages;

  /// The header information of the columns requested in the report. This is a
  /// list of headers; one for each dimension in the request, followed by one
  /// for each metric in the request.
  core.List<ReportHeaders> headers;

  /// Kind this is, in this case adsensehost#report.
  core.String kind;

  /// The output rows of the report. Each row is a list of cells; one for each
  /// dimension in the request, followed by one for each metric in the request.
  /// The dimension cells contain strings, and the metric cells contain numbers.
  core.List<core.List<core.String>> rows;

  /// The total number of rows matched by the report request. Fewer rows may be
  /// returned in the response due to being limited by the row count requested
  /// or the report row limit.
  core.String totalMatchedRows;

  /// The totals of the report. This is the same length as any other row in the
  /// report; cells corresponding to dimension columns are empty.
  core.List<core.String> totals;

  /// Any warnings associated with generation of the report.
  core.List<core.String> warnings;

  Report();

  Report.fromJson(core.Map _json) {
    if (_json.containsKey('averages')) {
      averages = (_json['averages'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
    if (_json.containsKey('headers')) {
      headers = (_json['headers'] as core.List)
          .map<ReportHeaders>((value) => ReportHeaders.fromJson(
              value as core.Map<core.String, core.dynamic>))
          .toList();
    }
    if (_json.containsKey('kind')) {
      kind = _json['kind'] as core.String;
    }
    if (_json.containsKey('rows')) {
      rows = (_json['rows'] as core.List)
          .map<core.List<core.String>>((value) => (value as core.List)
              .map<core.String>((value) => value as core.String)
              .toList())
          .toList();
    }
    if (_json.containsKey('totalMatchedRows')) {
      totalMatchedRows = _json['totalMatchedRows'] as core.String;
    }
    if (_json.containsKey('totals')) {
      totals = (_json['totals'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
    if (_json.containsKey('warnings')) {
      warnings = (_json['warnings'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (averages != null) {
      _json['averages'] = averages;
    }
    if (headers != null) {
      _json['headers'] = headers.map((value) => value.toJson()).toList();
    }
    if (kind != null) {
      _json['kind'] = kind;
    }
    if (rows != null) {
      _json['rows'] = rows;
    }
    if (totalMatchedRows != null) {
      _json['totalMatchedRows'] = totalMatchedRows;
    }
    if (totals != null) {
      _json['totals'] = totals;
    }
    if (warnings != null) {
      _json['warnings'] = warnings;
    }
    return _json;
  }
}

class UrlChannel {
  /// Unique identifier of this URL channel. This should be considered an opaque
  /// identifier; it is not safe to rely on it being in any particular format.
  core.String id;

  /// Kind of resource this is, in this case adsensehost#urlChannel.
  core.String kind;

  /// URL Pattern of this URL channel. Does not include "http://" or "https://".
  /// Example: www.example.com/home
  core.String urlPattern;

  UrlChannel();

  UrlChannel.fromJson(core.Map _json) {
    if (_json.containsKey('id')) {
      id = _json['id'] as core.String;
    }
    if (_json.containsKey('kind')) {
      kind = _json['kind'] as core.String;
    }
    if (_json.containsKey('urlPattern')) {
      urlPattern = _json['urlPattern'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (id != null) {
      _json['id'] = id;
    }
    if (kind != null) {
      _json['kind'] = kind;
    }
    if (urlPattern != null) {
      _json['urlPattern'] = urlPattern;
    }
    return _json;
  }
}

class UrlChannels {
  /// ETag of this response for caching purposes.
  core.String etag;

  /// The URL channels returned in this list response.
  core.List<UrlChannel> items;

  /// Kind of list this is, in this case adsensehost#urlChannels.
  core.String kind;

  /// Continuation token used to page through URL channels. To retrieve the next
  /// page of results, set the next request's "pageToken" value to this.
  core.String nextPageToken;

  UrlChannels();

  UrlChannels.fromJson(core.Map _json) {
    if (_json.containsKey('etag')) {
      etag = _json['etag'] as core.String;
    }
    if (_json.containsKey('items')) {
      items = (_json['items'] as core.List)
          .map<UrlChannel>((value) =>
              UrlChannel.fromJson(value as core.Map<core.String, core.dynamic>))
          .toList();
    }
    if (_json.containsKey('kind')) {
      kind = _json['kind'] as core.String;
    }
    if (_json.containsKey('nextPageToken')) {
      nextPageToken = _json['nextPageToken'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (etag != null) {
      _json['etag'] = etag;
    }
    if (items != null) {
      _json['items'] = items.map((value) => value.toJson()).toList();
    }
    if (kind != null) {
      _json['kind'] = kind;
    }
    if (nextPageToken != null) {
      _json['nextPageToken'] = nextPageToken;
    }
    return _json;
  }
}
