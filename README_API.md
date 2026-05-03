AHP API (demo)

This small Express server provides simple endpoints to integrate with ManyChat or your frontend to generate a top-N AHP report and download a CSV.

Files added:
- server.js : Express server with /api/report and /api/top
- package.json : dependencies
- data/dataList.json : sample dataset (trimmed)

Endpoints
- GET /api/health
  - Returns { ok:true }

- GET /api/top?n=5&wp=0.33&wl=0.34&wf=0.33
  - Returns top N ranked results using provided weights (wp,wl,wf)
  - Response: { timestamp, count, top: [ {id,name,area,price,score}, ... ] }

- POST /api/report
  - Body: { name, phone, email?, weights?: { price, l, f }, topN?: number }
  - Returns JSON with generated top results and base64 CSV (csvBase64)

Run locally
1. Open a terminal in this folder.
2. Install dependencies:

   npm install

3. Start server:

   npm start

Example curl

curl "http://localhost:3001/api/top?n=3&wp=0.3&wl=0.4&wf=0.3"

curl -X POST http://localhost:3001/api/report -H "Content-Type: application/json" -d '{"name":"Nguyen A","phone":"0901234567","weights":{"price":0.3,"l":0.4,"f":0.3}}'

Integration notes
- ManyChat can call the /api/report endpoint to generate report data. The response contains a base64 CSV you can store and provide as file link.
- For production, implement authentication, rate-limiting, and persist generated reports.
