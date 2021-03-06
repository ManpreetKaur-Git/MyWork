import { Component, OnInit } from '@angular/core';
import { IProduct } from 'src/app/product-list/product';


@Component({
  selector: 'app-product-list',
  templateUrl: './product-list.component.html',
  styleUrls: ['./product-list.component.css']
})
export class ProductListComponent implements OnInit {

  pageTitle: string="Product List";
  imageWidth:number=50;
  imageMargin:number=2;
  showImage: boolean=false;
  //filterlist:string="manpreet";

  _listFilter = '';
  get filterlist(): string {
    return this._listFilter;
  }
  set filterlist(value: string) {
    this._listFilter = value;
    //this.filteredProducts = this.listFilter ? this.performFilter(this.listFilter) : this.products;
  }

constructor(){
  this.filteredProducts=this.products;
  this.filterlist ='cart';
}

  filteredProducts: IProduct[] = [];
  //  products: any[]=[
    products:IProduct[]=[
    {
      "productId": 1,
      "productName": "Leaf Rake",
      "productCode": "GDN-0011",
      "releaseDate": "March 19, 2019",
      "description": "Leaf rake with 48-inch wooden handle.",
      "price": 19.95,
      "starRating": 3.2,
      "imageUrl": "assets/images/leaf_rake.png"
    },
    {
      "productId": 2,
      "productName": "Garden Cart",
      "productCode": "GDN-0023",
      "releaseDate": "March 18, 2019",
      "description": "15 gallon capacity rolling garden cart",
      "price": 32.99,
      "starRating": 4.2,
      "imageUrl": "assets/images/garden_cart.png"
    }
  ]
  // performFilter(filterBy: string): IProduct[] {
  //   filterBy = filterBy.toLocaleLowerCase();
  //   return this.products.filter((product: IProduct) =>
  //     product.productName.toLocaleLowerCase().indexOf(filterBy) !== -1);
  // }
  toggleImage(): void {
    this.showImage=!this.showImage;
  }
  ngOnInit():void{
    console.log("On init");
  }
}
