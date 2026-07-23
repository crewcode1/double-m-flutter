# Admin Controller API Documentation

Base URL: `http://doublemapi-001-site1.ktempurl.com`

## [GET] /api/Admin/statistics

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/Admin/statistics"
```
---

## [GET] /api/Admin/courses/{courseId}/export-codes

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| courseId | path | Yes | integer |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/Admin/courses/{courseId}/export-codes"
```
---

## [POST] /api/Admin/codes/{code}/disable

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| code | path | Yes | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/Admin/codes/{code}/disable"
```
---

## [GET] /api/Admin/codes/{code}/stats

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| code | path | Yes | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK | CourseAccessCodeStatsDto |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/Admin/codes/{code}/stats"
```
---

## [POST] /api/Admin/users/{userId}/reset-device

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| userId | path | Yes | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/Admin/users/{userId}/reset-device"
```
---

