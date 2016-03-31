/*making our product predicate dynamic*/
:-dynamic product/6.

/*initialization of the products in the shop*/
product(1, 1, 'kimbo', 'salad', 20, 300).
product(2, 1, 'frimate', '1kgs' , 20, 300).
product(3, 1, 'freshfry', '2kgs' , 20, 300).
product(4, 1, 'rhinooil', '3kgs' , 20, 300).
product(5, 1, 'kimbooil', '10kgs', 5, 250).
product(6, 1, 'kiambuoil', '50kgs', 10, 3000).

product(7, 2, 'sunlight', 'salad', 20, 50).
product(8, 2, 'imperial', '1kgs' , 10, 90).
product(9, 2, 'ndume', '2kgs' , 20, 150).

product(9,  3, 'rice', '3kgs' , 1, 199).
product(10, 3, 'beans', '10kgs', 20, 2000).
product(11, 3, 'greengrams', '50kgs', 12, 5000).

product(12, 4, 'jogoo', '2kgs' , 10, 99).
product(13, 4, 'axe', '5kgs', 5, 460).
product(14, 4, 'Hostel', '2kgs', 20, 150).
/*end of predicates*/


/*MAIN SHOP ENTRY PROGRAM*/
myshop:-
	/*printing shop name, shop details and the products*/
	write('GEORGIA RETAIL SHOP'), nl,
	write('********************'), nl,
	write('This program helps in data management in the shop'), nl,
	write('The products the shop deal on are:'), nl,
	write('OILS \t SOAPS \t  GRAINS \t FLOUR'), nl,
	/*printing the commands used to interact with the progams*/
        write("Use the following commands to interact with the shop\n"),nl,
	write("To check on stocks-------->specific_stock. \n"),nl,
        write("To add product------------>add_product.\n"),nl,
	write("To delete product--------->delete_product.\n"),nl,
	write("To view all the stocks---->all_stock.\n"),nl,
	write("To view specific stocks--->specific_stock.\n"),nl,
	write("To update stock----------->update_product.\n").
/*end of the main shop program*/


 /*program for quering specific products in the shop*/
specific_stock:-
	/*showing the user the product categories*/
       write("which stock category do you want to see((2=soap,1=oil,3=grain,4=floor))?"),
       /*getting the product type from the user to query*/
       read(Type),nl,
       /*printing the result heading*/
       write('Number\tPRODUCT\t\tDESC\t\tQTY\t\tPRICE'),nl,
       product(N,Type,A, B, C, D), /*quering the knowledge base*/
       write(N),write('\t'),writef('%15l',[A]),write('\t'),writef('%15l',[B]),/*printing products for specific category*/
       write('\t'),writef('%15l',[C]),write('\t'),writef('%15l',[D]), nl,
       fail;
       true.
/*end of specific product query*/


/*program for quering all the products in the shop*/
all_stock:-
	    write('Number\tPRODUCT\t\tDESC\t\tQTY\t\tPRICE'),nl,  /*printing the results heading*/
	    product(N,M,A, B, C, D), /*quering all the products in the database*/
            write(N),write('\t'),write(A),write('\t\t'),write(B),/*printing the all the products*/
            write('\t\t'),write(C),write('\t\t'),write(D), nl,
            fail;
            true.
/*end of all products query*/



/*program for adding products to the shop */
add_product:-write("You are adding products"),nl,
	     /*prompting the user of the products attributes to input*/
	     /*and reading the inputs form the user */
	     write("Enter the next product number:"),
	     read(Number),
	     write("Enter the type of product(2=soap,1=oil,3=grain,4=floor):"),
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



/*deleting a product from the shops knowledge base*/
delete_product:-write("You are about to delete a product:"),nl,
	        write("Enter the number of the product you wish to delete:"),
		read(Number),nl,  /*reading the number of the product to delete from the user*/
		retract(product(Number, A, B, C, D, E)), /*deleting the product fom the knowldge base*/
		write("deleted successfully").
/*end of product deletion*/


/*updating a particular attribute of the product*/
update_product:-write("Product Update Module"),nl,
	        write("Enter the number of the product to update:"),
		read(Number),nl, /*reading the number of the product to be updated*/
		retract(product(Number, A, B,C,D,E)),nl,  /*deleting the product*/
		write("Use the same number of the product while updating,......"),
		write("Please proceed...."),
		add_product.  /*user enters the product a fresh to the knowledge base*/
/*end of product update*/


