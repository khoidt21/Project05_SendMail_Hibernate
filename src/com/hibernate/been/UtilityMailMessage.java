
package com.hibernate.been;

public class UtilityMailMessage {

    private String Mailto;
    private String Mailcc;
    private String Mailsubject;
    private String Mailcontent;
    private String error;

    public UtilityMailMessage(String Mailto, String Mailcc, String Mailsubject, String Mailcontent) {
        this.Mailto = Mailto;
        this.Mailcc = Mailcc;
        this.Mailsubject = Mailsubject;
        this.Mailcontent = Mailcontent;
    }

    public UtilityMailMessage() {
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

	public String getMailto() {
		return Mailto;
	}

	public void setMailto(String mailto) {
		Mailto = mailto;
	}

	public String getMailcc() {
		return Mailcc;
	}

	public void setMailcc(String mailcc) {
		Mailcc = mailcc;
	}

	public String getMailsubject() {
		return Mailsubject;
	}

	public void setMailsubject(String mailsubject) {
		Mailsubject = mailsubject;
	}

	public String getMailcontent() {
		return Mailcontent;
	}

	public void setMailcontent(String mailcontent) {
		Mailcontent = mailcontent;
	}

    

}
