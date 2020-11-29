import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable()
export class TransactionService  {

  private resourceUrl = "http://localhost:8080/transactions/";
  private customResourceUrl = "http://localhost:8080/custom/transactions/";
  constructor(private http: HttpClient) { 
  }

  getTransactions(): Observable<any> {
    return this.http.get(this.resourceUrl);
  }

  addTransaction(transaction: any): Observable<any> {
    return this.http.post(this.customResourceUrl, transaction);
  }
}
