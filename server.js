const express = require('express');
const fs = require('fs');
const path = require('path');
const cors = require('cors');
const bodyParser = require('body-parser');

const app = express();
app.use(cors());
app.use(bodyParser.json({ limit: '1mb' }));

// Load sample data (copy of client dataList trimmed)
const DATA_PATH = path.join(__dirname, 'data', 'dataList.json');
let dataList = [];
try{
  dataList = JSON.parse(fs.readFileSync(DATA_PATH, 'utf8'));
}catch(e){
  console.warn('Could not load dataList.json, using empty list');
}

function normalizeText(t){ return (t||'').toLowerCase(); }

function computeScores(list, weights){
  // weights: { price:0.3, l:0.4, f:0.3 } expected sum to 1
  const wp = weights.price || 0.33;
  const wl = weights.l || 0.33;
  const wf = weights.f || 0.34;
  const maxP = Math.max(...list.map(d=>Number(d.pS||0)));
  const maxL = Math.max(...list.map(d=>Number(d.lS||0)));
  const maxF = Math.max(...list.map(d=>Number(d.fS||0)));
  return list.map(d=>{
    const np = maxP? (d.pS / maxP) : 0;
    const nl = maxL? (d.lS / maxL) : 0;
    const nf = maxF? (d.fS / maxF) : 0;
    const score01 = (np * wp) + (nl * wl) + (nf * wf);
    const score10 = +(Math.round(score01 * 10 * 100) / 100);
    return { ...d, score: score10 };
  }).sort((a,b)=>b.score - a.score);
}

// POST /api/report -> returns JSON with topN and a CSV string
app.post('/api/report', (req, res)=>{
  const { name, phone, email, weights, topN } = req.body || {};
  // basic validation
  if(!name || !phone){
    return res.status(400).json({ error: 'name and phone are required' });
  }
  const w = weights && (typeof weights === 'object') ? weights : { price:0.33, l:0.34, f:0.33 };
  const ranked = computeScores(dataList, w);
  const top = ranked.slice(0, (topN && Number(topN)) || 5);

  // build CSV
  const rows = [['id','name','area','price','score']];
  top.forEach(r => rows.push([r.id, r.name, r.area, r.price, r.score]));
  const csv = rows.map(r => r.map(c=> '"'+String(c).replace(/"/g,'""')+'"').join(',')).join('\n');

  // Respond with JSON and base64 CSV so client can create download link if needed
  const csvBase64 = Buffer.from(csv, 'utf8').toString('base64');
  res.json({
    generatedFor: { name, phone, email },
    timestamp: new Date().toISOString(),
    top,
    csvBase64
  });
});

// GET /api/top?n=5 -> returns top N recommendations (JSON)
app.get('/api/top', (req, res)=>{
  const n = parseInt(req.query.n || '5', 10);
  const weights = {
    price: parseFloat(req.query.wp) || 0.33,
    l: parseFloat(req.query.wl) || 0.34,
    f: parseFloat(req.query.wf) || 0.33
  };
  const ranked = computeScores(dataList, weights);
  res.json({ timestamp: new Date().toISOString(), count: ranked.length, top: ranked.slice(0,n) });
});

// Simple health
app.get('/api/health', (req,res)=> res.json({ ok:true, ts: new Date().toISOString() }));

const PORT = process.env.PORT || 3001;
app.listen(PORT, ()=> console.log(`AHP API server listening on http://localhost:${PORT}`));
