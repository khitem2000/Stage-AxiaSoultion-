class Project {
    String ?D_Code;
    String ?D_DateDebut;
    String ?D_DateFin;
    String ?D_Intitule;
    String ?EMP_Code;
    String ?PROT_User;

    Project({this.D_Code, this.D_DateDebut, this.D_DateFin, this.D_Intitule, this.EMP_Code, this.PROT_User});

    factory Project.fromJson(Map<String, dynamic> json) {
        return Project(
            D_Code: json['d_Code'],
            D_DateDebut: json['d_DateDebut'],
            D_DateFin: json['d_DateFin'],
            D_Intitule: json['d_Intitule'],
            EMP_Code: json['eMP_Code'],
            PROT_User: json['pROT_User'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['d_Code'] = this.D_Code;
        data['d_DateDebut'] = this.D_DateDebut;
        data['d_DateFin'] = this.D_DateFin;
        data['d_Intitule'] = this.D_Intitule;
        data['eMP_Code'] = this.EMP_Code;
        data['pROT_User'] = this.PROT_User;
        return data;
    }
}