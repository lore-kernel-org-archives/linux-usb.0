Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628223B14B9
	for <linux-usb@vger.kernel.org>; Fri,  5 Jun 2026 13:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780664627; cv=none; b=lYE9oniWD1+0ize/A45At3j0aOIGhDJKv10nMkrXsg2Gf1KBJya1d2oLYU0GMMW0L2z956SvlcAdpdq807cA6c1kXF44yCNf1kc/nZlq4hGaADBNDHP8DVt/QtxysX92qqzRa/Shua2WWB/MGQYbxpl05f76czs6acYvhI0X/7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780664627; c=relaxed/simple;
	bh=2uGDs0VeipFIjN1XnUvD3WI5dVbdsaBEgaZFClXHVJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tb9j/oEF4aR25U5Xi9g6JAlEuqP5ixlaJjIArvIS8i0EmjedZaltgEDQhVcrDPCJtCE6OpNnjJnMAx9qXqL/Q1AfPzQ7glu1YSKb132G3tDmb5cqkefrLbRYhTi6/E4aL3aw+tsOwPTw4KCIvaeJqmyeCLcrw8XFHZnXxidYHxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5Rz1KeQ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5Rz1KeQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780664626; x=1812200626;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2uGDs0VeipFIjN1XnUvD3WI5dVbdsaBEgaZFClXHVJg=;
  b=H5Rz1KeQBo8hTa+UrbH3bIIMQATMLEx6CD3vY47vTBqtFKw9Zdb9wxBQ
   M65bmNc1AVuZg1600+AXyQ3tcU+RbTrnPnWDtPZ6Wpsxv/Y3TMYvxI1Qw
   9ZZrsmLf2wzGLUjsxhC0rayhdqzlrtJADGuP9a53wNw0bmp2cLPgVC/vP
   03cEczX+TNvj4y4kwG0Ii4X8HVFLVP/Rh7NEY9/7jfVUD6ztfncDGEXhE
   qjsfIoDPs8xoZ5fISsPNv44YMjz1EQ/PQDoNRqI8qiIRj+jWWR+/VBUt5
   EWlpkAUZ/Fh9katXX08/qJ7TcD9b9FwSDRfJkhB7U0rRr3nNR1agQB1tW
   g==;
X-CSE-ConnectionGUID: vfTQAPe3TH+dY/DNK5D6/A==
X-CSE-MsgGUID: AXoNsnIIRG+FM4SvoL+1dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81529000"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="81529000"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 06:03:45 -0700
X-CSE-ConnectionGUID: Xdq/UP8VTAWpBatrgE7bMg==
X-CSE-MsgGUID: YDvlsNvMRWmJAu+fF3Kg+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="246669179"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 05 Jun 2026 06:03:43 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 55F4995; Fri, 05 Jun 2026 15:03:42 +0200 (CEST)
Date: Fri, 5 Jun 2026 16:03:38 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: lucas_tsai@richtek.com
Cc: badhri@google.com, cy_huang@richtek.com, gregkh@linuxfoundation.org,
	kevin_hung@richtek.com, linux-usb@vger.kernel.org,
	ren_chen@richtek.com
Subject: Re: [PATCH 3/3] usb: typec: tcpci_rt1711h: add low power mode support
Message-ID: <aiLJKjtKMmjxdyyI@kuha>
References: <ah2Kwlm6Gm0rMvKt@kuha>
 <20260603031827.3692374-1-lucas_tsai@richtek.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603031827.3692374-1-lucas_tsai@richtek.com>

On Wed, Jun 03, 2026 at 11:18:27AM +0800, lucas_tsai@richtek.com wrote:
> On Mon, Jun 01, 2026 at 04:36:02PM +0300, Heikki Krogerus wrote:
> > Hi,
> > 
> > I'm sorry to keep you waiting.
> > 
> > On Mon, May 18, 2026 at 05:15:14PM +0800, cy_huang@richtek.com wrote:
> > > From: Lucas Tsai <lucas_tsai@richtek.com>
> > > 
> > > Add low power mode support,
> > > add the op to enter and exit low power mode,
> > > this mode reduce RT1711H/RT1715 VDD Iq to 1 of 10,
> > 
> > What is VDD Iq?
> > 
> 
> VDD pin is RT1715's power input,
> and Iq is the quiescent current,
> so the low power mode reduces the baseline power used by RT1715.

Got it, thanks. Please add that explanation to the commit message.

> > > while disabling VBUS detection and PD BMC
> > > but keeping CC detection and not affecting DRP toggling.
> > > 
> > > Signed-off-by: Lucas Tsai <lucas_tsai@richtek.com>
> > > ---
> > >  drivers/usb/typec/tcpm/tcpci_rt1711h.c | 14 ++++++++++++++
> > >  1 file changed, 14 insertions(+)
> > > 
> > > diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> > > index 4b3e4e22a82e..48d6a6823ab9 100644
> > > --- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> > > +++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> > > @@ -20,6 +20,7 @@
> > >  
> > >  #define RT1711H_PHYCTRL1	0x80
> > >  #define RT1711H_PHYCTRL2	0x81
> > > +#define RT1711H_BMCCTRL		0x90
> > >  
> > >  #define RT1711H_RTCTRL4		0x93
> > >  /* rx threshold of rd/rp: 1b0 for level 0.4V/0.7V, 1b1 for 0.35V/0.75V */
> > > @@ -254,6 +255,18 @@ static int rt1711h_start_drp_toggling(struct tcpci *tcpci,
> > >  	return 0;
> > >  }
> > >  
> > > +static void rt1711h_set_low_power_mode(struct tcpci *tcpci,
> > > +				       struct tcpci_data *tdata, bool enable)
> > > +{
> > > +	int ret;
> > > +	struct rt1711h_chip *chip = tdata_to_rt1711h(tdata);
> > > +
> > > +	ret = rt1711h_write8(chip, RT1711H_BMCCTRL, enable ? 0x08 : 0x07);
> > > +	if (ret < 0)
> > > +		dev_err(chip->dev, "%s lpm fail(%d)\n",
> > > +			enable ? "enter" : "exit", ret);
> > > +}
> > 
> > Why couldn't this just be done in the PM suspend and resume
> > callbacks for this driver?
> 
> Entering low power mode or not relates directly to the status of USB-C port:
> enter low power mode when USB-C port attached nothing (unattached),
> and exit low power mode when attached with cable or device.
> 
> In the other word, it is possible to have system suspended and USB-C
> port attached at the same time, so it is not suitable to bind the flow
> of low power mode to the PM suspend and resume.

You don't have to do that in the system suspend callback, but you
still should do this in the runtime suspend callback, no?

This is not a major thing, but mctp.c is a bit bloated, I want to make
sure that adding this kind of callbacks is really necessary.

Badhri, do you have time to check this series?

thanks,

-- 
heikki
