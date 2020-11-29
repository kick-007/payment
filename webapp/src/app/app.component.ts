import { Component } from '@angular/core';
import { DisplayData, Transaction } from './transaction/transaction.model';
import { TransactionService } from './transaction/transaction.service';
import { MatTableDataSource } from '@angular/material/table';
import { AddTransactionComponent } from './add-transaction/add-transaction.component';
import { MatDialog } from '@angular/material/dialog';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'webapp';
  transactions: DisplayData[];
  displayedColumns: string[] = ['id', 'amount', 'toAcc', 'fromAcc', 'currency', 'date', 'status'];
  dataSource: any;
  constructor(private transactionService:TransactionService, 
    private dialog: MatDialog) {
    this.loadAll();
  }

  loadAll() {
    this.transactions = [];
    this.transactionService.getTransactions().subscribe((res: any) => 
    {
      for (const element of res) {
        const data = {} as DisplayData;
          data.id = element.id;
          data.amount= element.amount;
          data.toAcc = element.toAcc.accNo;
          data.fromAcc = element.fromAcc.accNo;
          data.currency = element.currencyType;
          data.date = element.date;
          data.status = element.status;
          this.transactions.push(data);
      }
      this.dataSource = new MatTableDataSource<DisplayData>(this.transactions);
    });
  }

  onClick() {
    this.openDialog();
  }

  openDialog() {
    const dialogRef = this.dialog.open(AddTransactionComponent,{
      data:{
        message: 'Are you sure want to delete?',
        buttonText: {
          ok: 'Save',
          cancel: 'No'
        }
      }
    });

    dialogRef.afterClosed().subscribe((confirmed: boolean) => {
      if(confirmed) {
        this.loadAll();
      }
    });
  }
}

