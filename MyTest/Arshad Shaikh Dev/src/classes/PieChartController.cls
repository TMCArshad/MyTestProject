public class PieChartController {
    public List<PieWedgeData> getPieData() {
        List<PieWedgeData> data = new List<PieWedgeData>();
        data.add(new PieWedgeData('Jan', 30,'Mercedies', 30));
        data.add(new PieWedgeData('Feb', 15,'Volovo', 30));
        data.add(new PieWedgeData('Mar', 10,'BMW', 30));
        data.add(new PieWedgeData('Apr', 20,'Jaguar', 30));
        data.add(new PieWedgeData('May', 20,'TATA', 30));
        data.add(new PieWedgeData('Jun', 5,'Mahindra', 30));
        return data;
    }

    // Wrapper class
    public class PieWedgeData {

        public String name1 { get; set; }
        public Integer data1 { get; set; }
        
        public String name2 { get; set; }
        public Integer data2 { get; set; }
        
        public PieWedgeData(String name1, Integer data1,String name2, Integer data2) {
            this.name1 = name1;
            this.data1 = data1;
            this.name2 = name2;
            this.data2 = data2;
        }
    }
}