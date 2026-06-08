Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63090339863
	for <linux-usb@vger.kernel.org>; Mon,  8 Jun 2026 04:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780892236; cv=none; b=BArfFmPh94VE8jRS503EkfBDDCVukie/OvZfzECfYYCEhSjQjfHan6U93PHHh11vVxLYX0imMQGOOInnIhHLQVfCgNx+6hyrMlrZaylB0n5PWuvrDvZbTy5vdA5siO/W+dBsHSeddO91mEPkhSMgvtIun7AjzmUA7Ubjjfd8V0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780892236; c=relaxed/simple;
	bh=MCyy496XYtX5oLhUtOVtEEf6pTt1e4mwKJmQv0ZoNOU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OleXz3j0VQX1IbX5sVLOvUTDloYRkVjuBSac+Q49n9djWZUvqiyUVkTtD5WCMqYlPF6aIdZd2/hf3MW1PUM4YsXrwsqrbVKf6smy3R2w4SfqGDe4jKSnR5CfproFHX0BRF+MHTxtCKJtNdpQ9GDQdj49Uf1JfLT8wEcNghmIuHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=b0YygoYG; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="b0YygoYG"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1780892230;
	bh=6Fij1rtES1m1UzCt6ZT6pB+0EU4IBTWStEV3ubpEVfs=; l=4738;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=b0YygoYGNROkCB8U0RE52eOFdU+ihLfR+uZr+N4X1XJ2mBL8TfvGEmRMgQQI3vMsV
	 3qfkjEBMjVBaLpwH2xDEadtG4AB/WLBwr16zK7/MQtulSpxYlxXNuGNgJL2dOnKpKQ
	 wDVHHMCUVIM93F5ydb3NH4DA36mjcds2+VrV1NOKZ5xL+QI9GYry+MsplBTnGnIhDH
	 NyfptgGh5AslonxeaBN0pKRMvi8UYzM4OkLXlAR1PRfGi68HBnWQX2SNGyVcHGb9a9
	 mPuZvoLJ8gH9JyHJzPCWeHs8THKAtRYXCctAkZAgqiCICHrR5NQFa0V7WdGGgSHAY9
	 TGibQOxqa60vQ==
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(1227024:0:AUTH_RELAY)
	(envelope-from <lucas_tsai@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Mon, 08 Jun 2026 12:16:58 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Mon, 8 Jun
 2026 12:16:58 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26 via Frontend
 Transport; Mon, 8 Jun 2026 12:16:58 +0800
Date: Mon, 8 Jun 2026 12:16:52 +0800
From: Lucas Tsai <lucas_tsai@richtek.com>
To: Badhri Jagan Sridharan <badhri@google.com>
CC: Heikki Krogerus <heikki.krogerus@linux.intel.com>, <cy_huang@richtek.com>,
	<gregkh@linuxfoundation.org>, <kevin_hung@richtek.com>,
	<linux-usb@vger.kernel.org>, <ren_chen@richtek.com>,
	<lucas_tsai@richtek.com>, <alan_lan@richtek.com>
Subject: Re: [PATCH 3/3] usb: typec: tcpci_rt1711h: add low power mode support
Message-ID: <aiZCNKB23o//xIMn@git-send.richtek.com>
References: <ah2Kwlm6Gm0rMvKt@kuha>
 <20260603031827.3692374-1-lucas_tsai@richtek.com>
 <aiLJKjtKMmjxdyyI@kuha>
 <CAPTae5Kpee+E2d0fwssEz=8dmGOmM09DmSma4nrSUJk5ygWbsg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPTae5Kpee+E2d0fwssEz=8dmGOmM09DmSma4nrSUJk5ygWbsg@mail.gmail.com>

On Sat, Jun 06, 2026 at 09:20:34AM -0700, Badhri Jagan Sridharan wrote:
> On Fri, Jun 5, 2026 at 6:03 AM Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > On Wed, Jun 03, 2026 at 11:18:27AM +0800, lucas_tsai@richtek.com wrote:
> > > On Mon, Jun 01, 2026 at 04:36:02PM +0300, Heikki Krogerus wrote:
> > > > Hi,
> > > >
> > > > I'm sorry to keep you waiting.
> > > >
> > > > On Mon, May 18, 2026 at 05:15:14PM +0800, cy_huang@richtek.com wrote:
> > > > > From: Lucas Tsai <lucas_tsai@richtek.com>
> > > > >
> > > > > Add low power mode support,
> > > > > add the op to enter and exit low power mode,
> > > > > this mode reduce RT1711H/RT1715 VDD Iq to 1 of 10,
> > > >
> > > > What is VDD Iq?
> > > >
> > >
> > > VDD pin is RT1715's power input,
> > > and Iq is the quiescent current,
> > > so the low power mode reduces the baseline power used by RT1715.
> >
> > Got it, thanks. Please add that explanation to the commit message.
> >
> > > > > while disabling VBUS detection and PD BMC
> > > > > but keeping CC detection and not affecting DRP toggling.
> > > > >
> > > > > Signed-off-by: Lucas Tsai <lucas_tsai@richtek.com>
> > > > > ---
> > > > >  drivers/usb/typec/tcpm/tcpci_rt1711h.c | 14 ++++++++++++++
> > > > >  1 file changed, 14 insertions(+)
> > > > >
> > > > > diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> > > > > index 4b3e4e22a82e..48d6a6823ab9 100644
> > > > > --- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> > > > > +++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> > > > > @@ -20,6 +20,7 @@
> > > > >
> > > > >  #define RT1711H_PHYCTRL1 0x80
> > > > >  #define RT1711H_PHYCTRL2 0x81
> > > > > +#define RT1711H_BMCCTRL          0x90
> > > > >
> > > > >  #define RT1711H_RTCTRL4          0x93
> > > > >  /* rx threshold of rd/rp: 1b0 for level 0.4V/0.7V, 1b1 for 0.35V/0.75V */
> > > > > @@ -254,6 +255,18 @@ static int rt1711h_start_drp_toggling(struct tcpci *tcpci,
> > > > >   return 0;
> > > > >  }
> > > > >
> > > > > +static void rt1711h_set_low_power_mode(struct tcpci *tcpci,
> > > > > +                                struct tcpci_data *tdata, bool enable)
> > > > > +{
> > > > > + int ret;
> > > > > + struct rt1711h_chip *chip = tdata_to_rt1711h(tdata);
> > > > > +
> > > > > + ret = rt1711h_write8(chip, RT1711H_BMCCTRL, enable ? 0x08 : 0x07);
> > > > > + if (ret < 0)
> > > > > +         dev_err(chip->dev, "%s lpm fail(%d)\n",
> > > > > +                 enable ? "enter" : "exit", ret);
> > > > > +}
> 
> Any reason why cant rt1711h_set_low_power_mode() be called from
> rt1711h_init_cc_params() and rt1711h_start_drp_toggling() ?
> rt1711h_start_drp_toggling() can enable low power mode.

rt1711h_start_drp_toggling() will not be called for 
non-DRP ports, e.g.: sink only or source only ports,
because the flow in tcpci.c blocks such conditions:
static int tcpci_start_toggling(...)
{
	...
	if (port_type != TYPEC_PORT_DRP)
		return -EOPNOTSUPP;
	...
}

> rt1711h_init_cc_params(), which is already aware of CC status, can
> disable low power mode when a source or sink is detected.
> This approach would avoid adding a new callback in tcpci.c.

Since rt1711h_start_drp_toggling() approach have the limitations,
a new callback seems like being inevitable,
so putting the logic of disabling low power mode in the new callback.

> 
> If the above works, you could optionally rely on runtime pm callbacks
> to call rt1711h_set_low_power_mode() and increment/decrement the usage
> count in  rt1711h_init_cc_params() and rt1711h_start_drp_toggling().
> 

The power mode of TCPC IC does not relate to system/runtime pm,
but to the USB-C port status (Attached vs. Unattached).

> > > >
> > > > Why couldn't this just be done in the PM suspend and resume
> > > > callbacks for this driver?
> > >
> > > Entering low power mode or not relates directly to the status of USB-C port:
> > > enter low power mode when USB-C port attached nothing (unattached),
> > > and exit low power mode when attached with cable or device.
> > >
> > > In the other word, it is possible to have system suspended and USB-C
> > > port attached at the same time, so it is not suitable to bind the flow
> > > of low power mode to the PM suspend and resume.
> >
> > You don't have to do that in the system suspend callback, but you
> > still should do this in the runtime suspend callback, no?
> >
> > This is not a major thing, but mctp.c is a bit bloated, I want to make
> 
> I believe Heikki was referring to tcpci.c here.
> 

Thanks for your clarifying.

> > sure that adding this kind of callbacks is really necessary.
> >
> > Badhri, do you have time to check this series?
> >
> > thanks,
> >
> > --
> > heikki

Thanks.
--
Lucas Tsai
