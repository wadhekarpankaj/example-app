from fastapi import FastAPI, Request, HTTPException
import httpx
from dotenv import load_dotenv
import os
from pydantic import BaseModel


callback_data = {}
load_dotenv('.env.prod')
CALLME_SERVICE_URL = os.getenv("CALLME_SERVICE_URL", "http://127.0.0.1:8000/callme")

app = FastAPI()

class CallMeRequestModel(BaseModel):
    url: str

@app.post("/start")
async def start_query(callme_request: CallMeRequestModel):
    try:
        payload = {"url": callme_request.url}
        async with httpx.AsyncClient() as client:
            response = await client.post(CALLME_SERVICE_URL, json=payload)
        response.raise_for_status()
        return {"message": f"Request to {CALLME_SERVICE_URL} service was successful."}
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"An error occurred while requesting {CALLME_SERVICE_URL}: {e}")

@app.post("/hello")
async def receive_callback(request: Request):
    data = await request.json()
    callback_data["Message from CallMe"] = data.get("hello")
    return {"status": "Callback received"}

@app.get("/callback_data")
async def get_callback_data():
    return callback_data

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
