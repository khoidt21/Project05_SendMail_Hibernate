
package com.hibernate.been;

import java.util.Date;

public class TemporaryMessageMail {
	
    String Mailsubject, Mailfrom, Mailto, Mailcontent;
    Date date;
    int indexMail;
    
    public TemporaryMessageMail(String Mailsubject, String Mailfrom, String Mailto, String Mailcontent, Date date, int indexMail) {
        this.Mailsubject = Mailsubject;
        this.Mailfrom = Mailfrom;
        this.Mailto = Mailto;
        this.Mailcontent = Mailcontent;
        this.date = date;
        this.indexMail = indexMail;
    }
    
    public int getIndexMail() {
		return indexMail;
	}

    public String getMailsubject() {
		return Mailsubject;
	}

	public void setMailsubject(String mailsubject) {
		Mailsubject = mailsubject;
	}

	public String getMailfrom() {
		return Mailfrom;
	}

	public void setMailfrom(String mailfrom) {
		Mailfrom = mailfrom;
	}

	public String getMailto() {
		return Mailto;
	}

	public void setMailto(String mailto) {
		Mailto = mailto;
	}

	public String getMailcontent() {
		return Mailcontent;
	}

	public void setMailcontent(String mailcontent) {
		Mailcontent = mailcontent;
	}

	public void setIndexMail(int indexMail) {
		this.indexMail = indexMail;
	}

	public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
