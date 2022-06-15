export interface ProductData {
  productId: string;
  type: "SUBSCRIPTION" | "NON_SUBSCRIPTION";
}

export const productDataMap: { [productId: string]: ProductData } = {
  "upgrade": {
    productId: "upgrade",
    type: "NON_SUBSCRIPTION",
  },
  "1": {
    productId: "consumable2",
    type: "NON_SUBSCRIPTION",
  },
  "subscription": {
    productId: "subscription",
    type: "SUBSCRIPTION",
  },
};
