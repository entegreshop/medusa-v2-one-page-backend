const fetch = require("node-fetch");

const BASE_URL = "https://webpostman.interlineexpress.com/restapi/client";
const auth = "gvC8kSXzRBHMaW1UcnIs53N6KAZ0TFb7YGphm4QE";
const from = "modoskop@interlinekargo.com";

async function run() {
  const formData = new FormData();
  formData.append("customer", "Ahmet Yılmaz");
  formData.append("province_name", "Ankara");
  formData.append("county_name", "Çankaya");
  formData.append("address", "Test mahallesi test sokak no 1");
  formData.append("telephone", "05321112233");
  formData.append("branch_code", "582");
  formData.append("quantity", "1");
  formData.append("consignment_type_id", "2");
  formData.append("amount_type_id", "3");
  formData.append("distribution_type_id", "1");
  formData.append("order_number", "TEST-" + Math.floor(Math.random()*1000));
  formData.append("weight", "1");

  try {
    const response = await fetch(BASE_URL + "/consignment/add", {
      method: "POST",
      headers: {
        "Authorization": auth,
        "From": from
      },
      body: formData
    });
    const result = await response.text();
    console.log("Response:", result);
  } catch (err) {
    console.error("Error:", err);
  }
}
run();
