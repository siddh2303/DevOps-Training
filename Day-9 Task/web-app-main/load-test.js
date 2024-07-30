import http from 'k6/http';
import { check, sleep } from 'k6';

export let options = {
  stages: [
    { duration: '1m', target: 5 }, 
    { duration: '2m', target: 2 }, 
    { duration: '1m', target: 0 }, 
  ],
};

export default function () {
  const res = http.get('http://myapp.local'); 
  check(res, {
    'status is 200': (r) => r.status === 200,
    'response time is below 200ms': (r) => r.timings.duration < 200,
  });
  sleep(1);
}
