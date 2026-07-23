# ConfirmEmail Controller API Documentation

Base URL: `http://doublemapi-001-site1.ktempurl.com`

## [GET] /confirm-email

**Requires Authorization:** No

### Parameters
| Name | In | Required | Type | Description |
|---|---|---|---|---|
| userId | query | No | string |  |
| code | query | No | string |  |
| redirectUrl | query | No | string |  |

### Responses
| Status | Description | Schema |
|---|---|---|
| 200 | OK |  |

### Example Request
```bash
curl -X GET "http://doublemapi-001-site1.ktempurl.com/confirm-email"
```
---

