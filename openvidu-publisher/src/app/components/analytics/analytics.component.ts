import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-analytics',
  templateUrl: './analytics.component.html',
  styleUrls: ['./analytics.component.css']
})
export class AnalyticsComponent implements OnInit {
  title = 'app';
  public pieChartLabels: string[] = ['Pending', 'InProgress', 'OnHold', 'Complete', 'Cancelled'];
  public pieChartData: number[] = [21, 39, 10, 14, 16];
  public polarAreaChartType = 'polarArea';
  public pieChartType = 'pie';
  public barChartType = 'bar';
  public lineChartType = 'line';
  public radarChartType = 'radar';
  public doughnutChartType = 'doughnut';
  public pieChartOptions: any = {'backgroundColor': [
               '#FF6384',
            '#4BC0C0',
            '#FFCE56',
            '#E7E9ED',
            '#36A2EB'
            ]};
  // events on slice click
  public chartClicked(e: any): void {
    console.log(e);
  }
 // event on pie chart slice hover
  public chartHovered(e: any): void {
    console.log(e);
  }

  constructor() { }


  ngOnInit(): void {
  }

}
