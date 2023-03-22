SELECT * FROM soie.sign_up;

use soie;

create table sign_up (
Username varchar(20) not null,
_password varchar(50) not null,
First_name varchar(20),
Last_name varchar (20),
Phone_number int,
usertype varchar(20)
);

ALTER TABLE sign_up 
ADD CONSTRAINT PK_user PRIMARY KEY (Username, _password);




CREATE TABLE LogIn(
    Username varchar(20) not null,
    _password varchar(50) not null,
     usertype varchar(20),
    PRIMARY KEY (Username),
    FOREIGN KEY (Username, _password) REFERENCES sign_up(Username, _password)
);


 \\ if you face any issues:
 ALTER TABLE login 
Drop FOREIGN KEY Username;



create table Movie_ava ( 
M_id int Not null AUTO_INCREMENT ,
Movie_name varchar(50),
Movie_type varchar(50),
PRIMARY KEY (M_id)
);

ALTER TABLE Movie_ava AUTO_INCREMENT=10;

INSERT INTO Movie_ava (Movie_name,Movie_type)
VALUES ('The conjuring','Horror');

INSERT INTO  Movie_ava (Movie_name,Movie_type)
VALUES ('Luca','Fantasy, Advanture');


INSERT INTO Movie_ava (Movie_name,Movie_type)
VALUES ('Your Name','Romance, Anime');

INSERT INTO Movie_ava (Movie_name,Movie_type)
VALUES ('The conjuring 2','Horror');


INSERT INTO Movie_ava (Movie_name,Movie_type)
VALUES ('Little Women','Romance, Drama');


create table Movie ( 
Movie_id int Not null AUTO_INCREMENT ,
username varchar(20) not null,
Movie_name varchar(50),
Movie_lang char(50),
Movie_type varchar(50),
Movie_time varchar(50),
PRIMARY KEY (Movie_id)
);



ALTER TABLE Movie AUTO_INCREMENT=10;

INSERT INTO Movie (username ,Movie_name,Movie_lang, Movie_type, Movie_time)
VALUES ('Fatima2001', 'The conjuring','English', 'Horror' , '8pm-10pm');

INSERT INTO Movie (username ,Movie_name,Movie_lang, Movie_type, Movie_time)
VALUES ('Shahad88', 'Luca' ,'English', 'Fantasy, Advanture' , '12pm-2pm');

INSERT INTO Movie (username ,Movie_name,Movie_lang, Movie_type, Movie_time)
VALUES ('Gof13xxx','Your Name','Arabic', 'Romance, Anime' , '12pm-2pm');

INSERT INTO Movie (username ,Movie_name,Movie_lang, Movie_type, Movie_time)
VALUES ('Moha674','Your Name','English', 'Romance, Anime' , '8pm-10pm');

INSERT INTO Movie (username ,Movie_name,Movie_lang, Movie_type, Movie_time)
VALUES ('Fatima2001','Little Women','French', 'Romance, Drama' , '4pm-6pm');

ALTER TABLE Movie
ADD FOREIGN KEY (username) REFERENCES login(Username);

ALTER TABLE Movie
ADD FOREIGN KEY (Movie_name) REFERENCES Movie_ava(Movie_name);

ALTER TABLE Movie
ADD FOREIGN KEY (Movie_type) REFERENCES Movie_ava(Movie_type);

INSERT INTO Movie (Movie_name,Movie_lang, Movie_type, Movie_time)
VALUES ('The conjuring 2','English', 'Horror' , '4pm-6pm');




DELETE FROM sign_up
where  Username= 'lama890';


ALTER TABLE Movie ADD PRIMARY KEY (Movie_id);

create table Food ( 
Meal_id int NOT NULL AUTO_INCREMENT,
Meal_size varchar(50) NOT NULL,
Meal_price INT,
PRIMARY KEY (Meal_id),
unique (Meal_size)
);

create table Food ( 
Meal_id int NOT NULL AUTO_INCREMENT,
Meal_size ENUM('Small', 'Medium', 'Large') NOT NULL,
Meal_price INT,
PRIMARY KEY (Meal_id),
unique (Meal_size)
);


ALTER TABLE Food AUTO_INCREMENT=11;


INSERT INTO Food (Meal_size ,Meal_price)
VALUES ('Small', 10);


INSERT INTO Food (Meal_size ,Meal_price)
VALUES ('Medium', 20);

INSERT INTO Food (Meal_size ,Meal_price)
VALUES ('Large', 30);


INSERT INTO Movie (Meal_size ,Meal_price)
VALUES ('Small', 10);


ALTER TABLE Food ADD PRIMARY KEY (Meal_id);

create table Ticket ( 
Ticket_num int NOT NULL AUTO_INCREMENT,
Ticket_price INT,
Movie_name varchar(50),
Seat_num int,
Booking_date date,
C_username varchar(20),
Meal_size ENUM('Small', 'Medium', 'Large') NOT NULL,
PRIMARY KEY (Ticket_num)
);

ALTER TABLE Ticket AUTO_INCREMENT=1;


ALTER TABLE Ticket
ADD FOREIGN KEY (Movie_name) REFERENCES Movie(Movie_name);

ALTER TABLE Ticket
ADD FOREIGN KEY (C_username) REFERENCES LogIn(Username);

ALTER TABLE Ticket
ADD FOREIGN KEY (Meal_size) REFERENCES Food(Meal_size);



INSERT INTO Ticket (Ticket_price ,Movie_name, Seat_num, Booking_date, C_username , Meal_size)
VALUES (60, 'The conjuring', '3', '2022-05-2', 'Fatima2001','Small' );

INSERT INTO Ticket (Ticket_price ,Movie_name, Seat_num, Booking_date, C_username , Meal_size)
VALUES (80, 'Luca', '1', '2022-06-14', 'Shahad88','Medium' );

INSERT INTO Ticket (Ticket_price ,Movie_name, Seat_num, Booking_date, C_username , Meal_size)
VALUES (60, 'Your Name', '7', '2022-06-10', 'Gof13xxx','Large' );

INSERT INTO Ticket (Ticket_price ,Movie_name, Seat_num, Booking_date, C_username , Meal_size)
VALUES (40, 'Your Name', '2', '2022-06-10', 'Moha674','Small' );

INSERT INTO Ticket (Ticket_price ,Movie_name, Seat_num, Booking_date, C_username , Meal_size)
VALUES (90, 'Little Women', '1', '2022-06-22', 'Fatima2001','Large' );


INSERT INTO Ticket (Ticket_price ,Movie_id, Seat_num, Booking_date, C_username)
VALUES (60, '15', '1', '2022-06-22', 'Fatima2001'); \\small



17:17:41	INSERT INTO Ticket (Ticket_price ,Movie_id, Seat_num, Booking_date, C_username) VALUES (60, '15', '6', '2022-06-22', 'Jmwee71')	Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`soie`.`ticket`, CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`Movie_id`) REFERENCES `movie` (`Movie_id`) ON DELETE SET NULL ON UPDATE CASCADE)	0.016 sec



create table Bill ( 
b_num int NOT NULL,
Ticket_number int NOT NULL,
Username varchar(20),
T_price double,
b_date date
);

ALTER TABLE Bill
ADD FOREIGN KEY (Ticket_number) REFERENCES Ticket(Ticket_num);

ALTER TABLE Bill
ADD FOREIGN KEY (Username) REFERENCES LogIn(Username);

ALTER TABLE Bill ADD PRIMARY KEY (b_num);


INSERT INTO Bill (b_num ,Ticket_number, Username, T_price, b_date)
VALUES (2, '3', 'Gof13xxx', '62.5', '2022-06-6' );

INSERT INTO Bill (b_num ,Ticket_number, Username, T_price, b_date)
VALUES (1, '1', 'Fatima2001', '62.5', '2022-04-24' );

INSERT INTO Bill (b_num ,Ticket_number, Username, T_price, b_date)
VALUES (3, '5', 'Fatima2001', '92.5', '2022-06-14' );

INSERT INTO Bill (b_num ,Ticket_number, Username, T_price, b_date)
VALUES (4, '4', 'Moha674', '42.5', '2022-06-10' );

INSERT INTO Bill (b_num ,Ticket_number, Username, T_price, b_date)
VALUES (5, '2', 'Shahad88', '82.5', '2022-06-10' );


create table Payment ( 
b_num int NOT NULL,
Total_price double,
Card_name varchar(20) NOT NULL,
Card_number bigint NOT NULL,
Cvv_num int,
Card_type char(20)
);

ALTER TABLE Payment 
   ADD CONSTRAINT PK_CUSTID PRIMARY KEY (b_num, Card_number);

ALTER TABLE Payment
ADD FOREIGN KEY (Total_price) REFERENCES Bill(T_price);


ALTER TABLE Payment
ADD FOREIGN KEY (b_num) REFERENCES Bill(b_num);

DROP TABLE  sign_up;










12:31:36	ALTER TABLE Movie ADD FOREIGN KEY (username) REFERENCES login(Username)	Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`soie`.`#sql-1664_101`, CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`username`) REFERENCES `login` (`Username`))	0.062 sec







0	124	14:00:51	ALTER TABLE Payment
 ADD FOREIGN KEY (Total_price) REFERENCES Bill(T_price)	Error Code: 1822. Failed to add the foreign key constraint. Missing index for constraint 'payment_ibfk_1' in the referenced table 'bill'	0.000 sec

        
        
        try {
         
     String insertSt="INSERT INTO payment ( Card_type ,Card_name, Card_number, Cvv_num, Total_price) VALUES (?,?,?,?,?)" ;
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/soie?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "Fatima.100"); 
     pst= (PreparedStatement) con.prepareStatement(insertSt);
     pst.setString(1, String.valueOf(cardtype.getSelectedItem()));
     pst.setString(2,jTextField1.getText());
     pst.setString(3,jTextField3.getText());
     pst.setString(4,jTextField2.getText());
     pst.setString(5,jLabel9.getText());
     pst.executeUpdate();
     }catch(Exception ex){
        JOptionPane.showMessageDialog(this, ex.getMessage());
     }
    
	
	
	} 
	
	
	1234567890987654
	
	
	
	create table sign_up (
Username varchar(20) not null,
_password varchar(50) not null,
First_name varchar(20),
Last_name varchar (20),
Phone_number int,
usertype varchar(20),
 PRIMARY KEY (Username,_password )
);