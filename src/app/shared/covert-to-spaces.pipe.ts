
import { Pipe, PipeTransform } from '@angular/core';


@Pipe({

    name:'converToSpaces'

})


export class ConvertToSpacesPipes implements PipeTransform {

    transform(value: string, character: string): string {
    //  value=   value.replace(character, " ");
      return value;
      }
}