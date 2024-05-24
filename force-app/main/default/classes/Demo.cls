public class Demo {
    public static void printData(){
        List<string> nameList =new List<String>();
        nameList.add('Shiva');
        nameList.add('Aayush');
        nameList.add('Vishal');
        system.debug(nameList[0]);
        system.debug(nameList.size());
        
        Set<string> nameListt =new Set<String>();
        nameListt.add('Shiva');
        nameListt.add('Aayush');
        nameListt.add('Vishal');
        nameListt.add(' ');
        nameListt.add('  ');
        system.debug(nameListt);
        system.debug(nameListt.size());
        
        Map<integer,string> nameMap=new Map<integer,String>();
        nameMap.put(1,'Shiva');
        nameMap.put(2,'Aayush');
        if(nameMap.containsKey(1))
        {
            nameMap.put(1,'Mirketa');
        }
        system.debug(nameMap);
        
        double i=10;
        i=10/5.0;
        system.debug(i);
        
        for( string names : nameList)
        {
            system.debug(names);
        }
        
        
        
        
        
    }
}