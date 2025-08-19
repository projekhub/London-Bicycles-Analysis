#Mengetahui Jam Paling Sibuk
SELECT
  EXTRACT(HOUR FROM start_date) AS hour,      #ambil jam dari tanggal mulai
  COUNT(*) AS total_rides                     #hitung jumlah sewa per jam
FROM `bigquery-public-data.london_bicycles.cycle_hire`
GROUP BY hour
ORDER BY total_rides DESC;                    #urutkan dari yang terbanyak

#Mengetahui Stasiun Awal Terpopuler
SELECT
  start_station_name,                         #nama stasiun awal
  COUNT(*) AS total_rides                     #jumlah penyewaan dari stasiun tsb
FROM `bigquery-public-data.london_bicycles.cycle_hire`
WHERE start_station_name IS NOT NULL          #pastikan bukan data kosong
GROUP BY start_station_name
ORDER BY total_rides DESC
LIMIT 10;                                     #ambil 10 terpopuler
