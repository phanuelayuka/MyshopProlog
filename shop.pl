/*making our product predicate dynamic*/
:-dynamic product/6.

/*initialization of the products in the shop*/
product(1, 1, 'kimbo', 'salad', 20, 300).
product(2, 1, 'fry mate', '1kgs' , 20, 300).
product(3, 1, 'fresh fry', '2kgs' , 20, 300).
product(4, 1, 'rhino jelly', '3kgs' , 20, 300).
product(5, 1, 'kimbo', '10kgs', 5, 250).
product(6, 1, 'kiambu', '50kgs', 10, 3000).

product(7, 2, 'sunlight bar', 'salad', 20, 50).
product(8, 2, 'imperial', '1kgs' , 10, 90).
product(9, 2, 'ndume', '2kgs' , 20, 150).

product(9,  3, 'rice', '3kgs' , 1, 199).
product(10, 3, 'beans', '10kgs', 20, 2000).
product(11, 3, 'greengrams', '50kgs', 12, 5000).

product(12, 4, 'jogoo', '2kgs' , 10, 99).
product(13, 4, 'axe', '5kgs', 5, 460).
product(14, 4, 'Hostel', '2kgs', 20, 150).

product(15, 5,'Soda Fanta', '300ml',100, 35).
product(16, 5,'Soda Cocacola', '500ml',50, 55).

product(17, 6,'Fresh Milk', '250ml',20, 55).
product(18, 6,'Mala Milk', '500ml',2, 80).
product(19, 6,'Youghurt', '500ml',10, 75).

/*end of predicates*/

/*-----------------------main program-----------------------------------*/
/*MAIN SHOP ENTRY PROGRAM*/
myshop:-
	/*printing shop name, shop details and the products*/
	write('GEORGIA RETAIL SHOP'), nl,
	write('********************'), nl,
	write('This program helps in data management in the shop'), nl,
	write('The products the shop deal on are:'), nl,
	write('Cooking Oils,Soaps,Packed Grains, Flour, Soft Drinks, Dairy Products'), nl,
	/*printing the commands used to interact with the progams*/
        write("Use the following commands to interact with the shop\n"),nl,
	write("To check on stocks-------->specific_stock. \n"),nl,
        write("To add product------------>add_product.\n"),nl,
	write("To delete product--------->delete_product.\n"),nl,
	write("To view all the stocks---->all_stock.\n"),nl,
	write("To view specific stocks--->specific_stock.\n"),nl,
	write("To update stock----------->update_product.\n").
/*end of the main shop program*/


/*----------------------------specic product query-------------------------------*/
/*program for quering specific products in the shop*/
specific_stock:-
       /*initilaisation of the product name length,,,,helps in formated printing*/
       NameLength is 20,

       /*showing the user the product categories*/
       write("which stock category do you want to see"),nl,
       write("1-Cooking Oil, 2-Soap, 3-Grains, 4-flour, 5-Soft Drinks, 6-Dairy Products ?"),
       /*getting the product type from the user to query*/
       read(Type),nl,

       /*printing the result heading*/
       write('Number\tPRODUCT  \t\tDESC	  \tQTY\t\tPRICE'),nl,
       product(N,Type,A, B, C, D), /*quering the knowledge base*/

       /*formatted prining of the query results*/
       atom_length(A, LengthA),
       TabWidth is (NameLength - LengthA),
       write(N),write('\t'),writef('%1l',[A]),tab(TabWidth),writef('%15l',[B]),
       write('\t'),writef('%15l',[C]),write('\t'),writef('%15l',[D]), nl,
       fail;
       true.
/*end of specific product query*/


/*---------------------query for all stocks------------------------------------*/
/*program for quering all the products in the shop*/

all_stock:-
	    /*printing the results heading*/
	    write('Number\tPRODUCT\t\t   DESC \tQTY\tPRICE'),nl,

	   /*initilaisation of the product name length,,,,helps in formated printing*/
	    NameLength is 20,

	    /*quering all the products in the database*/
	    product(N,M,A, B, C, D),

	    /*formated printing of the results*/
	    atom_length(A, LengthA),
	    TabWidth is (NameLength - LengthA),
            write(N),write('\t'),writef('%2l',[A]),tab(TabWidth),writef('%2l',[B]),
            write('\t'),write(C),write('\t'),write(D), nl,
            fail;
            true.
/*end of all products query*/


/*-------------adding product in the shop--------------*/
/*program for adding products to the shop */
add_product:-
	     write("You are adding products"),nl,
	     /*prompting the user of the products attributes to input*/
	     /*and reading the inputs form the user */
	     write("Enter the next product number:"),
	     read(Number),
	     write("Enter the type of product(1-Cooking Oil, 2-Soap, 3-Grains, 4-flour, 5-Soft Drinks, 6-Dairy Products ):"),
	     read(Type),nl,
	     write('Enter the name of product:'),
	     read(Name),nl,
	     write('Enter the description of product:'),
	     read(Description),nl,
	     write('Enter the quantity of product:'),
	     read(Quantity),nl,
	     write('Enter the price of product:'),
	     read(Price),nl,
	     /*adding the product to the knowledge base*/
	     assert(product(Number,Type,Name,Description,Quantity,Price)),nl,
	     write("successfully added").
/*end of new product addition*/


/*----------------deleting a product----------------*/
/*deleting a product from the shops knowledge base*/
delete_product:-write("You are about to delete a product:"),nl,
	        write("Enter the number of the product you wish to delete:"),
		read(Number),nl,  /*reading the number of the product to delete from the user*/
		retract(product(Number, A, B, C, D, E)), /*deleting the product fom the knowldge base*/
		write("deleted successfully").
/*end of product deletion*/


/*-------------------updating a product----------------------*/
/*updating a particular attribute of the product*/
update_product:-
	     write("Product Update Module"),nl,
	     write("Enter the number of the product to update:"),
	     read(Number),nl, /*reading the number of the product to be updated*/
	     retract(product(Number, A, B,C,D,E)),nl,  /*deleting the product*/
	     write("Please proceed...."),nl,
	     write("Update the type of product(1-Cooking Oil, 2-Soap, 3-Grains, 4-flour, 5-Soft Drinks, 6-Dairy Products ):"),
	     read(Type),nl,
	     write('Update the name of product:'),
	     read(Name),nl,
	     write('Update the description of the product:'),
	     read(Description),nl,
	     write('Update the quantity of the product:'),
	     read(Quantity),nl,
	     write('Update the price of the product:'),
	     read(Price),nl,
	     /*adding the product to the knowledge base*/
	     assert(product(Number,Type,Name,Description,Quantity,Price)),nl,
	     write("successfully updated").

		/*user enters the product a fresh to the knowledge base*/
/*end of product update*/


