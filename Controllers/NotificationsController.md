# Notifications Controller API Documentation

Base URL: `http://doublemapi-001-site1.ktempurl.com`

## [GET] /api/Notifications/my-notifications

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| PageNumber | query | No | integer |  |
| PageSize | query | No | integer |  |
| SortBy | query | No | string |  |
| SortDescending | query | No | boolean |  |
| SearchTerm | query | No | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/Notifications/my-notifications"
```
---

## [GET] /api/Notifications/unread-count

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/Notifications/unread-count"
```
---

## [POST] /api/Notifications/{notificationId}/mark-read

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| notificationId | path | Yes | integer |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/Notifications/{notificationId}/mark-read"
```
---

## [POST] /api/Notifications/mark-all-read

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X POST "http://doublemapi-001-site1.ktempurl.com/api/Notifications/mark-all-read"
```
---

## [DELETE] /api/Notifications/{notificationId}

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| notificationId | path | Yes | integer |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X DELETE "http://doublemapi-001-site1.ktempurl.com/api/Notifications/{notificationId}"
```
---

