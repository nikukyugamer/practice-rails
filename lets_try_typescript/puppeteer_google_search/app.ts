import * as puppeteer from 'puppeteer';

(async () => {
  const userAgent: string =
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.16 Safari/537.36';
  const targetUrl: string = 'https://www.google.co.jp/search?q=typescript';
  const screenshotFilename: string = 'google_search_typescript.png';

  const browser = await puppeteer.launch();
  const page = await browser.newPage();

  await page.setUserAgent(userAgent);
  await page.goto(targetUrl);
  await page.screenshot({
    path: screenshotFilename,
    fullPage: true,
  });

  await browser.close();
})();
