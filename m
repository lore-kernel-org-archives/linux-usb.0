Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C2F30569D
	for <linux-usb@vger.kernel.org>; Mon,  8 Jun 2026 03:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780887957; cv=none; b=YvEDwdAFTNZ/NJp32sU5+Xnmbfx7m23rHx40bUmrjZglfLkQXKOB1qYTqO9Iv/hvg3OTpIkMnKiPFtyFL3DxA86gY8QMwrfL2vdHv1JQVPc3ZvbqacM9SuMXY8HMsOUm+/WgdXELPnHN6i5gplXzT230bRn2DAqPxzmgpdCmEqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780887957; c=relaxed/simple;
	bh=KI1eepTR0BwqCoiXBtWWibwfDGXxYF1Al+S0Kmwn0+k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C/Y5SJ/srB3uCF0RA/ihz7yRr3hXrEeOCXxSMAYYmrHeuTmQALcjvcVP4OaQ6FrBLSkL4hmSBvb7dpGAUGHd98bZPYVHD3RaHT+NgvjXc1aww2n38InAA8ecy2ZhPjA1W0tzraHHPe/N8ioNSSknD1Uj9AMu9SLS+BF/rijdB6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=0EYzUbAW; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="0EYzUbAW"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1780887946;
	bh=VFgs9skjJm1cHrltD1MNjzhX0WhpD4/42dWWYfjSJoQ=; l=3362;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=0EYzUbAWnRHkiVXYng6OHq1k1neh5HN1eoV8h/gv//6srdKqnXmiW9V164LDYU+oG
	 zm1/JLgfqMR4hevYJVLnZeEe12WEbzuQ6WAk1aeCUY7hwFnALbc5rtCSWF0JhZtUhV
	 7o4k2BfcETO1hdECCSxt786U/Uhc8evD3FKfPTurt9wRxGFjY5LWoCKlHhw4yJO8Yc
	 P8XWtzWSPcK8kD4YVw6jEjHqHbY8nJTpIkL2xfQDrxV1CDxqe6gqwE2/Ha8/+5Wv2u
	 pMFMPvKrSVl1QDEYwF0/WCFz8SuNBeE7oHkrq4d4Gw9/RM8C6SrURiHCILTrAZD2Yc
	 cBDtS1ZRfg3Iw==
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(1227028:0:AUTH_RELAY)
	(envelope-from <lucas_tsai@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Mon, 08 Jun 2026 11:05:31 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Mon, 8 Jun
 2026 11:05:31 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1748.26 via Frontend
 Transport; Mon, 8 Jun 2026 11:05:31 +0800
From: <lucas_tsai@richtek.com>
To: <heikki.krogerus@linux.intel.com>
CC: <badhri@google.com>, <cy_huang@richtek.com>, <gregkh@linuxfoundation.org>,
	<kevin_hung@richtek.com>, <linux-usb@vger.kernel.org>,
	<lucas_tsai@richtek.com>, <ren_chen@richtek.com>, <alan_lan@richtek.com>
Subject: Re: [PATCH 3/3] usb: typec: tcpci_rt1711h: add low power mode support
Date: Mon, 8 Jun 2026 11:05:30 +0800
Message-ID: <20260608030530.3853620-1-lucas_tsai@richtek.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <aiLJKjtKMmjxdyyI@kuha>
References: <aiLJKjtKMmjxdyyI@kuha>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

On Fri, Jun 05, 2026 at 04:03:38PM +0300, Heikki Krogerus wrote:
> On Wed, Jun 03, 2026 at 11:18:27AM +0800, lucas_tsai@richtek.com wrote:
> > On Mon, Jun 01, 2026 at 04:36:02PM +0300, Heikki Krogerus wrote:
> > > Hi,
> > > 
> > > I'm sorry to keep you waiting.
> > > 
> > > On Mon, May 18, 2026 at 05:15:14PM +0800, cy_huang@richtek.com wrote:
> > > > From: Lucas Tsai <lucas_tsai@richtek.com>
> > > > 
> > > > Add low power mode support,
> > > > add the op to enter and exit low power mode,
> > > > this mode reduce RT1711H/RT1715 VDD Iq to 1 of 10,
> > > 
> > > What is VDD Iq?
> > > 
> > 
> > VDD pin is RT1715's power input,
> > and Iq is the quiescent current,
> > so the low power mode reduces the baseline power used by RT1715.
> 
> Got it, thanks. Please add that explanation to the commit message.
> 

No problem, I will include the explanation to the commit message of next
version.

> > > > while disabling VBUS detection and PD BMC
> > > > but keeping CC detection and not affecting DRP toggling.
> > > > 
> > > > Signed-off-by: Lucas Tsai <lucas_tsai@richtek.com>
> > > > ---
> > > >  drivers/usb/typec/tcpm/tcpci_rt1711h.c | 14 ++++++++++++++
> > > >  1 file changed, 14 insertions(+)
> > > > 
> > > > diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> > > > index 4b3e4e22a82e..48d6a6823ab9 100644
> > > > --- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> > > > +++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> > > > @@ -20,6 +20,7 @@
> > > >  
> > > >  #define RT1711H_PHYCTRL1	0x80
> > > >  #define RT1711H_PHYCTRL2	0x81
> > > > +#define RT1711H_BMCCTRL		0x90
> > > >  
> > > >  #define RT1711H_RTCTRL4		0x93
> > > >  /* rx threshold of rd/rp: 1b0 for level 0.4V/0.7V, 1b1 for 0.35V/0.75V */
> > > > @@ -254,6 +255,18 @@ static int rt1711h_start_drp_toggling(struct tcpci *tcpci,
> > > >  	return 0;
> > > >  }
> > > >  
> > > > +static void rt1711h_set_low_power_mode(struct tcpci *tcpci,
> > > > +				       struct tcpci_data *tdata, bool enable)
> > > > +{
> > > > +	int ret;
> > > > +	struct rt1711h_chip *chip = tdata_to_rt1711h(tdata);
> > > > +
> > > > +	ret = rt1711h_write8(chip, RT1711H_BMCCTRL, enable ? 0x08 : 0x07);
> > > > +	if (ret < 0)
> > > > +		dev_err(chip->dev, "%s lpm fail(%d)\n",
> > > > +			enable ? "enter" : "exit", ret);
> > > > +}
> > > 
> > > Why couldn't this just be done in the PM suspend and resume
> > > callbacks for this driver?
> > 
> > Entering low power mode or not relates directly to the status of USB-C port:
> > enter low power mode when USB-C port attached nothing (unattached),
> > and exit low power mode when attached with cable or device.
> > 
> > In the other word, it is possible to have system suspended and USB-C
> > port attached at the same time, so it is not suitable to bind the flow
> > of low power mode to the PM suspend and resume.
> 
> You don't have to do that in the system suspend callback, but you
> still should do this in the runtime suspend callback, no?
> 

ya, and there is no suitable and existing callback chain to do so,
so I create a new one.

> This is not a major thing, but mctp.c is a bit bloated, I want to make
> sure that adding this kind of callbacks is really necessary.
> 
> Badhri, do you have time to check this series?
> 
> thanks,
> 
> -- 
> heikki

Thanks.
--
Lucas Tsai
