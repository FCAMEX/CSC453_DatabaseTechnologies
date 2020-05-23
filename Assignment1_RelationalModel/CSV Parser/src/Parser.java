import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;



public class Parser {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String csvFile = "/Users/ArticunoMX/Documents/Loan.csv";
		BufferedReader br = null;
		String line = "";
		int counter = 0;
		
		try {
			
			br = new BufferedReader(new FileReader(csvFile));
			while((line = br.readLine()) != null) {
				
				if(counter != 0) {
				String[] contentArray = line.split(","); 
				
				String[] dateArray = contentArray[1].split("/");
				
				String date = dateArray[2] + "-" + dateArray[0] + "-" + dateArray[1];
				
				
				
				
				System.out.println("Insert into Loan Values(" + contentArray[0] + ", " + "date '" + date + "', '" + 
				contentArray[2] + "', " + contentArray[3] + ", " + contentArray[4] + ", " + contentArray[5] + ", '" + 
						contentArray[6] + "', " + contentArray[7] + ", " + contentArray[8] + ");");
				}
				
				counter++;
				
			}
			
			br.close();
			
		}catch(Error e) {
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
