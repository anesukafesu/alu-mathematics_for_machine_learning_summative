from fastapi import FastAPI
from pydantic import BaseModel
from joblib import load


class PredictionRequestBody(BaseModel):
    marketing_budget: float


app = FastAPI()

random_forest_model = load('random_forest_model.pkl')

@app.get('/')
async def root():
    return { 'message': 'Hello, Mundo!' }


@app.post('/predict')
async def predict(predict_request_body: PredictionRequestBody):
    # Extract features from request body
    features = [[predict_request_body.marketing_budget]]

    # Use model to make prediction
    prediction = random_forest_model.predict(features)

    # Return the predicted value
    return {'prediction': prediction[0]}
