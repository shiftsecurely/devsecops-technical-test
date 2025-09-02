import json, os

def lambda_handler(event, context):
    name = (event.get("queryStringParameters") or {}).get("name", "there")
    body = {"app": os.environ.get("APP_NAME", "hello-api"), "message": f"Hello, {name}! from private Lambda"}
    return {"statusCode": 200, "body": json.dumps(body)}
