Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CF0472798;
	Wed,  5 Aug 2026 13:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937527; cv=none; b=oimabLmyoPYJhg2ZNwr8iv8OW9mpw6i52RPQenxALBcCWrsSAvUM2q0fmT/2xyHF8gPDcJ4yjRhGQfPf7mvOXV5d3bjHVw39p/OjvNK2yWG17Zpbu12ly0UdqM0sq765x5pQ+uDJaBVhPIXTbZ9/pNCBHmK6ptVL3+EMgY5vK68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937527; c=relaxed/simple;
	bh=LoohxNysBPr0AgYIL7WP/BAageI879VZyP6fORbJ7v0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s57yAMDZg9iUGejpsxTgA1hMe18uItDkbVnHYoNablUXPbFakgfohe6yadP6AyATOEXr9Uh9zPBJwMAReP4LTuKGbbMfL+10d/f0u4WbHJx2aykKKdWIMyRwM2XwfoR48biHOEwjsNDTb3xK1448y0V28A45iF3vmN6IZMUcqH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 09E7A20194D;
	Wed, 05 Aug 2026 15:45:21 +0200 (CEST)
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1wrbvs-0037F4-35;
	Wed, 05 Aug 2026 15:45:20 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1wrbvs-0000000D9mS-3Y8P;
	Wed, 05 Aug 2026 15:45:20 +0200
Date: Wed, 5 Aug 2026 15:45:20 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: badhri@google.com, gregkh@linuxfoundation.org, xu.yang_2@nxp.com, 
	18255117159@163.com, krzysztof.kozlowski@oss.qualcomm.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] usb: typec: tcpci: add alert.fault handling
Message-ID: <ucjnu5ybx7kcxtfagyxxjjkzwcqbhfip7zxdlndu3lnggvscwp@27w6h2kbxs3v>
References: <20260731083529.2659924-1-m.felsch@pengutronix.de>
 <anMpvRaTmV0qY65v@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anMpvRaTmV0qY65v@black.igk.intel.com>

On 26-08-05, Heikki Krogerus wrote:
> On Fri, Jul 31, 2026 at 10:34:59AM +0200, Marco Felsch wrote:
> > Add minimal handling to clear the ALERT.Fault bit which may be set in
> > case of an over-current or over-voltage detection. At the moment only
> > the IRQ clear support is added since the TCPC Spec mentions that the
> > handling of such events is vendor specific.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  drivers/usb/typec/tcpm/tcpci.c | 16 +++++++++++++++-
> >  1 file changed, 15 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> > index a56e31b20c21..d2d5bf7ca618 100644
> > --- a/drivers/usb/typec/tcpm/tcpci.c
> > +++ b/drivers/usb/typec/tcpm/tcpci.c
> > @@ -692,7 +692,8 @@ static int tcpci_init(struct tcpc_dev *tcpc)
> >  
> >  	reg = TCPC_ALERT_TX_SUCCESS | TCPC_ALERT_TX_FAILED |
> >  		TCPC_ALERT_TX_DISCARDED | TCPC_ALERT_RX_STATUS |
> > -		TCPC_ALERT_RX_HARD_RST | TCPC_ALERT_CC_STATUS;
> > +		TCPC_ALERT_RX_HARD_RST | TCPC_ALERT_CC_STATUS |
> > +		TCPC_ALERT_FAULT;
> >  	if (tcpci->controls_vbus)
> >  		reg |= TCPC_ALERT_POWER_STATUS;
> >  	/* Enable VSAFE0V status interrupt when detecting VSAFE0V is supported */
> > @@ -720,6 +721,19 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
> >  	irq_ret = status & tcpci->alert_mask;
> >  
> >  process_status:
> > +	/*
> > +	 * Handle nested fault before clearing the alert status to not
> > +	 * re-trigger a fault alert immediately again.
> > +	 */
> 
> Shouldn't that explanation in the comment be also in the commit
> message? That sounds like the "why" part to me.

I don't think so, it's just a comment for $dev that this ordering is
important. The commit message clearly states that an over-current or
over-voltage may trigger this.

Regards,
  Marco

> > +	if (status & TCPC_ALERT_FAULT) {
> > +		unsigned int fault;
> > +
> > +		/* TODO: Add a proper over-current and over-voltage handling */
> > +		ret = regmap_read(tcpci->regmap, TCPC_FAULT_STATUS, &fault);
> > +		if (!ret)
> > +			regmap_write(tcpci->regmap, TCPC_FAULT_STATUS, fault);
> > +	}
> > +
> >  	/*
> >  	 * Clear alert status for everything except RX_STATUS, which shouldn't
> >  	 * be cleared until we have successfully retrieved message.
> > -- 
> > 2.47.3
> 
> -- 
> heikki
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
