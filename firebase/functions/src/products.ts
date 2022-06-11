export interface ProductData {
  productId: string;
  type: "SUBSCRIPTION" | "NON_SUBSCRIPTION";
}

export const productDataMap: { [productId: string]: ProductData } = {
  "upgrade": {
    productId: "upgrade",
    type: "NON_SUBSCRIPTION",
  },
  "upgrade2": {
    productId: "upgrade2",
    type: "NON_SUBSCRIPTION",
  },
  "dash_subscription_doubler": {
    productId: "dash_subscription_doubler",
    type: "SUBSCRIPTION",
  },
};
