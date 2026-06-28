const chartContainer = document.getElementById("candlestick-chart")
const candlesData = document.getElementById("candles-data");

if (candlesData) {
  const candles = JSON.parse(candlesData.textContent);
  const chartCandles = candles.map((candle) => {
    return {
      time: candle.timestamp,
      open: Number(candle.open),
      high: Number(candle.high),
      low: Number(candle.low),
      close: Number(candle.close),
    };
  });

  const chart = LightweightCharts.createChart(candlesData, {
    width: candlesData.clientWidth,
    height: 500,
  });

  const candleSeries = chart.addSeries(LightweightCharts.CandlestickSeries);

  candleSeries.setData(chartCandles);
}

// console.log("chart.js loaded");

// const candlesData = document.getElementById("candlestick-chart");
// console.log(candlesData);
