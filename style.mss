/*
Antimap or fake-satellite.
The idea is to generate "fake" satellite imagery from OSM data 
to use it in X-plane as photo scenery, instead of  BING.

Early development stage.
Rendering is based on pre-processed OSM data. 

basic zoom is z16. It seems that this exersise makes sence for zooms z13-z18
*/

@water: #151F34 ;// dark blue for all water: lake, rivers and streams.

Map {
  background-color: @water;
}

#countries {
  ::outline {
    line-color: #817955; 
    line-width: 0;
    line-join: round;
  }
  //polygon-fill: #817955;
  polygon-pattern-file: url('textures/ground_z16.png');
}
 
#osm {
  [natural='water']{
    polygon-fill: @water;
  }
  
  [natural='wood'],[amenity='park']{
    //polygon-fill: #2D5F33;
    [zoom>=17]{ polygon-pattern-file: url('textures/wood_leaftype_unknown_z17.png'); }  
    [zoom=16]{ polygon-pattern-file: url('textures/wood_leaftype_unknown_z16.png'); }  
    [zoom=15] { polygon-pattern-file: url('textures/wood_leaftype_unknown_z15.png'); }  
    [zoom=14] { polygon-pattern-file: url('textures/wood_leaftype_unknown_z14.png'); }  
    [zoom=13] { polygon-pattern-file: url('textures/wood_leaftype_unknown_z13.png'); }  
    [zoom<=12] { polygon-pattern-file: url('textures/wood_leaftype_unknown_z12.png'); }  
  } 
  
  //landuse=grass is transformed into natural=grass, becouse of it's usage.
  [natural='grass'],[natural='grassland']{
    polygon-pattern-file: url('textures/grass.jpg');
   // polygon-fill: #404E2D;
  }
  
  [landuse='allotments']{
    [zoom>=17] {polygon-pattern-file: url('textures/allotments2_z17.png');    }
    [zoom=16] {polygon-pattern-file: url('textures/allotments2_z16.png');    }
    [zoom=15]  {polygon-pattern-file: url('textures/allotments2_z15.png');    }
    [zoom=14]  {polygon-pattern-file: url('textures/allotments2_z14.png');    }
    [zoom=13]  {polygon-pattern-file: url('textures/allotments2_z13.png');    }
    [zoom=12]  {polygon-pattern-file: url('textures/allotments2_z12.png');    }
    [zoom<=11]{ polygon-fill: #787D6B; }   
  }
  
  [landuse='garages']{
    [zoom>=17]{polygon-pattern-file: url('textures/garages_z17.jpg');}
    [zoom=16]{polygon-pattern-file: url('textures/garages_z16.jpg');}
    [zoom=15]{polygon-pattern-file: url('textures/garages_z15.jpg');}
    [zoom=14]{polygon-pattern-file: url('textures/garages_z14.jpg');}
    [zoom=13]{polygon-pattern-file: url('textures/garages_z13.jpg');}
    [zoom<=12]{ polygon-fill: #787D6B; }   
  }
  [landuse='quarry']{ 
    //polygon-fill: #bea175;  
    [zoom>=16]{polygon-pattern-file: url('textures/quarry_z16.jpg');}
    [zoom=15]{polygon-pattern-file: url('textures/quarry_z15.jpg');}
    [zoom=14]{polygon-pattern-file: url('textures/quarry_z14.jpg');}
    [zoom=13]{polygon-pattern-file: url('textures/quarry_z13.jpg');}
    [zoom<=12]{polygon-pattern-file: url('textures/quarry_z12.jpg');}
  } 
  
} 

#barriers{ 
  [barrier='yes'],[barrier='fence'],[barrier='wall'],[barrier='city_wall']{ 
    //polygon-fill: #C4B395;
    [zoom=14],[zoom=15]{line-color: #313925; line-width: 1; line-opacity: 0.95;}
    [zoom>=16]{
      ::inside1{
        line-color: #918965; 
        line-width: 1;
        line-offset: -1;
      }  
      ::outside1{
        line-color: #313925; 
        line-width: 1;
        line-offset: 0;
      }
    }
  }
}  

#waterways[tunnel='']{
  [waterway='river']{
    [zoom=12]{ line-color: @water ; line-width: 0.5;}
    [zoom=13]{ line-color: @water ; line-width: 1;}
    [zoom=14]{ line-color: @water ; line-width: 2;}
    [zoom=15]{ line-color: @water ; line-width: 3;}
    [zoom=16]{ line-color: @water ; line-width: 4;}
    [zoom=17]{ line-color: @water ; line-width: 6;}
    [zoom>=18]{ line-color: @water ; line-width: 10;}
  }
  [waterway='stream']{
    [zoom=14]{ line-color: @water ; line-width: 0.5;}
    [zoom=15]{ line-color: @water ; line-width: 0.75;}
    [zoom=16]{ line-color: @water ; line-width: 1;}
    [zoom=17]{ line-color: @water ; line-width: 2;}
    [zoom>=18]{ line-color: @water ; line-width: 4;}    
  }
}  

@rail: #515A45;
  
#railways{
  [railway='rail']{
    [zoom=12]{ line-color: @rail ; line-width: 0.5;}
    [zoom=13]{ line-color: @rail ; line-width: 1;}
    [zoom=14]{ line-color: @rail ; line-width: 2;}
    [zoom=15]{ line-color: @rail ; line-width: 3;}
    [zoom=16]{ line-color: @rail ; line-width: 4;}
    [zoom=17]{ line-color: @rail ; line-width: 8;}
    [zoom>=18]{ line-color: @rail ; line-width: 16;}
  }
  
}  


#parkings{
    [zoom>=18]{ polygon-pattern-file: url('textures/parking_z18.jpg'); }
    [zoom=17]{ polygon-pattern-file: url('textures/parking_z17.jpg'); }
    [zoom=16]{ polygon-pattern-file: url('textures/parking_z16.jpg'); }
    [zoom=15]{ polygon-pattern-file: url('textures/parking_z15.jpg'); }
    [zoom=14]{ polygon-pattern-file: url('textures/parking_z14.jpg'); }
    [zoom<14]{ polygon-fill: #838077; }
}  

#roads [highway!='track']{
    polygon-fill:  #829A8C; // #728A7C; //#627A6C;
}

#roads [highway='track']{
  //polygon-fill:  #808080; 
  //polygon-pattern-file: url('textures/track.jpg');
  //polygon-pattern-opacity:0.8;
  //polygon-pattern-gamma:1;
  //polygon-pattern-comp-op: soft-light;
}
#roads2a{
    line-color: #829A8C; 
    
    //text-name: [highway]  + ' ' +  [surface];
    //text-face-name: 'Arial Black';
    [zoom>=18]{line-width: 9;}
    [zoom= 17]{line-width: 4.5;}
    [zoom= 16]{line-width: 2.25;}
    [zoom= 15]{line-width: 1.125;}
    [zoom= 14]{line-width: 0.5;}
    [zoom<=13]{line-width: 0;}
}


#roadsarea{
    polygon-pattern-file: url('textures/road.jpg');
    //polygon-fill: #728A7C; //#627A6C;
}
  
#buildings {
  [zoom<16]{
    polygon-fill: #B7B4AA; //#929A8C; 
  }  
  [zoom>=16]{
    //polygon-fill: #B7B4AA; //#929A8C;
    polygon-pattern-file: url('textures/roof_z16.jpg');
    //polygon-fill: [roof_colou];
    line-color: #656563;
    line-width: 2 ;
    //text-face-name: 'Arial Black';
    //text-name: [roof_colou];
  }  
  
   
}
