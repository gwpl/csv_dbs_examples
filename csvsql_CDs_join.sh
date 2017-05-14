#!/bin/bash
csvsql --query 'SELECT CDTitle,Location,Artist FROM CDs JOIN Artists ON CDs.ArtistID=Artists.ArtistID JOIN Locations ON CDs.LocID = Locations.LocID' "$@"
