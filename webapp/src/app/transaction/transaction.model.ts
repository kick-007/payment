export class Transaction{
  id: number;
  amount: number;
  toAcc: any;
  fromAcc: any;
  currency: string;
  date: string;
  bic: any;
  status: string;
}

export interface DisplayData {
  id: number;
  amount: number;
  toAcc: string;
  fromAcc: string;
  currency: string;
  date: string;
  bic: string;
  status: string;
}

