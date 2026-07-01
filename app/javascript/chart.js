document.addEventListener("turbo:load", () => {
  const chartContainer = document.getElementById("candlestick-chart");
  const candlesData = document.getElementById("candles-data");

  if (candlesData) {
    const candles = JSON.parse(candlesData.textContent);
    const chartCandles = candles.map((candle) => {
      return {
        time: Math.floor(new Date(candle.timestamp).getTime() / 1000),
        open: Number(candle.open),
        high: Number(candle.high),
        low: Number(candle.low),
        close: Number(candle.close),
      };
    });

    const chart = LightweightCharts.createChart(chartContainer, {
      width: candlesData.clientWidth,
      height: 500,

      timeScale: {
        timeVisible: true,
        seconVisible:false,
      },

      localization: {
        locale: "en-US",
      }
    });

    const candleSeries = chart.addSeries(LightweightCharts.CandlestickSeries);

    console.log(chartCandles.slice(0, 10));

    candleSeries.setData(chartCandles);
  }
});

// console.log("chart.js loaded");

// const candlesData = document.getElementById("candlestick-chart");
// console.log(candlesData);
