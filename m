Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4245E3E1718
	for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2026 03:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780456795; cv=none; b=UwYGHgoEX35wdCQ+9JhlYbMVxe64dbHWJYeoD5FGkVGX+adOS+qz3WB6jqNKkd6pyoHEZFNtHNvcbl7gawGwCJpchu3voJqXmWRsSmdeOhrrSOwQyVrXpOr3CRIjjB49zHhifjYTuiFix8BdyOPOWT02hxmhoIVFJ/wc4s0iVJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780456795; c=relaxed/simple;
	bh=G4rDWw31Qb+BXewPGcHC551G+b0hcPkH8EQmldTNSv8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uxFyVBve2QHCcS2Tg1rowTgvhDzL+6Szr0zDrMqu/z7ZADWWjJgx2IzD2b3pvHar1se1KUS5EcYBPY0yTdYNKXFEp/BrqEbc1jkM5CMVnerSrGWEhvKRnJwJRqXLtjUYBFQ3iUrSDmUMzqqO+d6nYUUGJUi8L3aThB6TfhxpJeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=ESGfHnn9; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=pCOYTcmp; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="ESGfHnn9";
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="pCOYTcmp"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1780456788;
	bh=MQcvfqN61G72eiJMyviqz6E1pA+9ehEmbXSiVj//6DY=; l=2370;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ESGfHnn9DdSZoKda/UUJRf6+y2VnObkAz9B8Fg5u8a+TbwZYvn9kD1kiKYF8v8sdl
	 jYiaW+CJt+VCXsoK2VsZ7F/9Eo2Uc5j8hixg9tslS9ubQK6/zWBcw3MJ3hbj66uQiH
	 Rq6JL3MjCDJ5Nl8HI/isfOjOpE7vZeSTsdCzi8DDzfJxsyBLz8mvVCH7y6lcdKsbha
	 uvCVTepGeZ3xsCHMICq8i13QW0zA3UnIb2mSJ5AOF1piS2I36TEPZekqOuMRz9LRDh
	 23PImuWpnDEXtbgZ0oeSQ1dxzTQGodD1J+hpJq8U1/vVYEmOGJykv/ru/pXJW0HFoD
	 qZpDh1DJPXZEA==
Received: from 192.168.8.21
	by mg.richtek.com with MailGates ESMTP Server V3.0(1128086:0:AUTH_RELAY)
	(envelope-from <prvs=1611D03734=lucas_tsai@richtek.com>); Wed, 03 Jun 2026 11:19:46 +0800 (CST)
X-MailGates: (compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1780456786;
	bh=MQcvfqN61G72eiJMyviqz6E1pA+9ehEmbXSiVj//6DY=; l=2370;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=pCOYTcmpNYqpdyTaSY8QUwBBNOrpvGAPpNDVitQXmb73OjXRwuxD40d+//bUw2TC2
	 h7cw+hdRF8XOw0jNbDR9z7G5LDU3VJy1NVOAnxJb4/5JSshL3o8uW1/ixGpEEsPKgz
	 Y37XHIIH5a432l73n4o9e8hzqaJGO9Srh0FSLsiSaEV6Ov7SYAe9XIaGM1GEXWd0oI
	 eGKyc6SDeDieNod85mEry/hAq5WiyF36V7sJGxqqU2lPger2UQz6BIUjUWu8VBZSI+
	 QkTbgxoa0rFGDlZedxT3CBj8OTXMjyNGzalqJnr+c/12txeN340rpXeC5gZEDv7/uT
	 aL2EZOtdejm1w==
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(1227018:0:AUTH_RELAY)
	(envelope-from <lucas_tsai@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Wed, 03 Jun 2026 11:18:28 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Wed, 3 Jun
 2026 11:18:27 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1748.26 via Frontend
 Transport; Wed, 3 Jun 2026 11:18:27 +0800
From: <lucas_tsai@richtek.com>
To: <heikki.krogerus@linux.intel.com>
CC: <badhri@google.com>, <cy_huang@richtek.com>, <gregkh@linuxfoundation.org>,
	<kevin_hung@richtek.com>, <linux-usb@vger.kernel.org>,
	<lucas_tsai@richtek.com>, <ren_chen@richtek.com>
Subject: Re: [PATCH 3/3] usb: typec: tcpci_rt1711h: add low power mode support
Date: Wed, 3 Jun 2026 11:18:27 +0800
Message-ID: <20260603031827.3692374-1-lucas_tsai@richtek.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <ah2Kwlm6Gm0rMvKt@kuha>
References: <ah2Kwlm6Gm0rMvKt@kuha>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

On Mon, Jun 01, 2026 at 04:36:02PM +0300, Heikki Krogerus wrote:
> Hi,
> 
> I'm sorry to keep you waiting.
> 
> On Mon, May 18, 2026 at 05:15:14PM +0800, cy_huang@richtek.com wrote:
> > From: Lucas Tsai <lucas_tsai@richtek.com>
> > 
> > Add low power mode support,
> > add the op to enter and exit low power mode,
> > this mode reduce RT1711H/RT1715 VDD Iq to 1 of 10,
> 
> What is VDD Iq?
> 

VDD pin is RT1715's power input,
and Iq is the quiescent current,
so the low power mode reduces the baseline power used by RT1715.

> > while disabling VBUS detection and PD BMC
> > but keeping CC detection and not affecting DRP toggling.
> > 
> > Signed-off-by: Lucas Tsai <lucas_tsai@richtek.com>
> > ---
> >  drivers/usb/typec/tcpm/tcpci_rt1711h.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> > index 4b3e4e22a82e..48d6a6823ab9 100644
> > --- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> > +++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> > @@ -20,6 +20,7 @@
> >  
> >  #define RT1711H_PHYCTRL1	0x80
> >  #define RT1711H_PHYCTRL2	0x81
> > +#define RT1711H_BMCCTRL		0x90
> >  
> >  #define RT1711H_RTCTRL4		0x93
> >  /* rx threshold of rd/rp: 1b0 for level 0.4V/0.7V, 1b1 for 0.35V/0.75V */
> > @@ -254,6 +255,18 @@ static int rt1711h_start_drp_toggling(struct tcpci *tcpci,
> >  	return 0;
> >  }
> >  
> > +static void rt1711h_set_low_power_mode(struct tcpci *tcpci,
> > +				       struct tcpci_data *tdata, bool enable)
> > +{
> > +	int ret;
> > +	struct rt1711h_chip *chip = tdata_to_rt1711h(tdata);
> > +
> > +	ret = rt1711h_write8(chip, RT1711H_BMCCTRL, enable ? 0x08 : 0x07);
> > +	if (ret < 0)
> > +		dev_err(chip->dev, "%s lpm fail(%d)\n",
> > +			enable ? "enter" : "exit", ret);
> > +}
> 
> Why couldn't this just be done in the PM suspend and resume
> callbacks for this driver?

Entering low power mode or not relates directly to the status of USB-C port:
enter low power mode when USB-C port attached nothing (unattached),
and exit low power mode when attached with cable or device.

In the other word, it is possible to have system suspended and USB-C
port attached at the same time, so it is not suitable to bind the flow
of low power mode to the PM suspend and resume.

--
Lucas Tsai
> 
> Br,
> 
> -- 
> heikki
