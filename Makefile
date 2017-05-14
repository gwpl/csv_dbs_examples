.PHONY: all clean

OUTPUTS=csv_outputs/Joined_CDs_Artists_Locations.csv csv_outputs/Joined_CDs_Artists_Locations.txt
CSV_CDS_DB=csv_inputs/CDs.csv csv_inputs/Artists.csv csv_inputs/Locations.csv 

all: $(OUTPUTS)

clean: $(OUTPUTS)
	rm $(OUTPUTS)

# csvsql used from: http://csvkit.readthedocs.io/en/0.9.1/scripts/csvsql.html
csv_outputs/Joined_CDs_Artists_Locations.csv: $(CSV_CDS_DB)
	csvsql --query 'SELECT CDTitle,Location,Artist FROM CDs JOIN Artists ON CDs.ArtistID=Artists.ArtistID JOIN Locations ON CDs.LocID = Locations.LocID' $(CSV_CDS_DB) > "$@"

# csvlook used from: http://csvkit.readthedocs.io/en/0.9.1/scripts/csvlook.html?highlight=csvlook
csv_outputs/Joined_CDs_Artists_Locations.txt: $(CSV_CDS_DB)
	csvsql --query 'SELECT CDTitle,Location,Artist FROM CDs JOIN Artists ON CDs.ArtistID=Artists.ArtistID JOIN Locations ON CDs.LocID = Locations.LocID' $(CSV_CDS_DB) | csvlook > "$@"
