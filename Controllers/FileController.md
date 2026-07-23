# File Controller API Documentation

Base URL: `http://doublemapi-001-site1.ktempurl.com`

## [DELETE] /api/File

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| url | query | No | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X DELETE "http://doublemapi-001-site1.ktempurl.com/api/File"
```
---

## [GET] /api/File/my-files

**Requires Authorization:** No

### Parameters
*No path or query parameters.*

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK | FileUploadDto[] |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/api/File/my-files"
```
---

