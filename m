Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A187A336EDA;
	Wed, 12 Aug 2026 08:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786524284; cv=none; b=F6PBUnqbRMxCHVoYsvx0WiLrf9AW6Ym+o/MZDdOsX3BoORCbmKHuKzzq50kMYivDRoSQR6NaK5Ki9QAqpJX1vp+ZdU4B6ZuWA8Cmbb9l0J8EBtdHV6WdpfjFXCHAA6jlfrNJ6hoNYZEl2MmPY8BRepqDK0WQTUKNfP93+K6U+4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786524284; c=relaxed/simple;
	bh=pbRARv5fwRHkVws/8N8wPVrGhv1Uve2ca/8gaBODuv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=itbsiOX5Gz1nTDzkt0OPpzelMMBPtqCUglUyCsbJLbkXtITV+s6YrCMXGaczz/KXYYAsl68WB+QlfzwZZsuYLMcXfD/yxnjcKpQe47YR7EKK/770pzdEb4RDAaCvjoOXNt2lUN7gdxS5XHqVMOGV6mL6aPrsqdJY5H6i2TcOhnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b32vscw/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b32vscw/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786524283; x=1818060283;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pbRARv5fwRHkVws/8N8wPVrGhv1Uve2ca/8gaBODuv4=;
  b=b32vscw/7XyP+D/V29tEltCYSY/Emld56fOOoiujpjLDqw1salc3LARv
   HS5Zrl5/J76oYVzZYaD5h0kIaBgahPAghNq2r26p/Thz1emoIFsq9xNmJ
   l1UMOZyjkoz0Yi51voSgeb1EkbjB7M43NwIBxkfXGC7DPD7L6Je+8SSv5
   RRj2adEoC0ThAH1AQyWB/y0gIe31E2rCEbxlH2fTNMbQ/43InjxaC2BIA
   IjejlFVKKVA+dhkHyouM560RC1Y+zJwJwtxhjbW617AEswxRRftWhXftH
   oXDIc3E2Ve4ayXpRdakoiVCzWYFxrJWGFaBpodj0FOSyDU4P23rYhQZPB
   g==;
X-CSE-ConnectionGUID: KA5fDtDLQsqQ97iUIIuhIA==
X-CSE-MsgGUID: MH1ZprV/Sz60fo00Ig8+Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="90947677"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="90947677"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 01:44:37 -0700
X-CSE-ConnectionGUID: ZrnFbWPUTtGlr2fNYJXZYw==
X-CSE-MsgGUID: xqySs9/cQyyUduktfFLY1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="287010546"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 12 Aug 2026 01:44:34 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id E04CA99; Wed, 12 Aug 2026 10:44:32 +0200 (CEST)
Date: Wed, 12 Aug 2026 10:44:32 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: badhri@google.com, gregkh@linuxfoundation.org, xu.yang_2@nxp.com,
	18255117159@163.com, krzysztof.kozlowski@oss.qualcomm.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH] usb: typec: tcpci: add alert.fault handling
Message-ID: <anwycNkYyY0N8A2F@black.igk.intel.com>
References: <20260731083529.2659924-1-m.felsch@pengutronix.de>
 <anMpvRaTmV0qY65v@black.igk.intel.com>
 <ucjnu5ybx7kcxtfagyxxjjkzwcqbhfip7zxdlndu3lnggvscwp@27w6h2kbxs3v>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ucjnu5ybx7kcxtfagyxxjjkzwcqbhfip7zxdlndu3lnggvscwp@27w6h2kbxs3v>

On Wed, Aug 05, 2026 at 03:45:20PM +0200, Marco Felsch wrote:
> On 26-08-05, Heikki Krogerus wrote:
> > On Fri, Jul 31, 2026 at 10:34:59AM +0200, Marco Felsch wrote:
> > > Add minimal handling to clear the ALERT.Fault bit which may be set in
> > > case of an over-current or over-voltage detection. At the moment only
> > > the IRQ clear support is added since the TCPC Spec mentions that the
> > > handling of such events is vendor specific.
> > > 
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > ---
> > >  drivers/usb/typec/tcpm/tcpci.c | 16 +++++++++++++++-
> > >  1 file changed, 15 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> > > index a56e31b20c21..d2d5bf7ca618 100644
> > > --- a/drivers/usb/typec/tcpm/tcpci.c
> > > +++ b/drivers/usb/typec/tcpm/tcpci.c
> > > @@ -692,7 +692,8 @@ static int tcpci_init(struct tcpc_dev *tcpc)
> > >  
> > >  	reg = TCPC_ALERT_TX_SUCCESS | TCPC_ALERT_TX_FAILED |
> > >  		TCPC_ALERT_TX_DISCARDED | TCPC_ALERT_RX_STATUS |
> > > -		TCPC_ALERT_RX_HARD_RST | TCPC_ALERT_CC_STATUS;
> > > +		TCPC_ALERT_RX_HARD_RST | TCPC_ALERT_CC_STATUS |
> > > +		TCPC_ALERT_FAULT;
> > >  	if (tcpci->controls_vbus)
> > >  		reg |= TCPC_ALERT_POWER_STATUS;
> > >  	/* Enable VSAFE0V status interrupt when detecting VSAFE0V is supported */
> > > @@ -720,6 +721,19 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
> > >  	irq_ret = status & tcpci->alert_mask;
> > >  
> > >  process_status:
> > > +	/*
> > > +	 * Handle nested fault before clearing the alert status to not
> > > +	 * re-trigger a fault alert immediately again.
> > > +	 */
> > 
> > Shouldn't that explanation in the comment be also in the commit
> > message? That sounds like the "why" part to me.
> 
> I don't think so, it's just a comment for $dev that this ordering is
> important. The commit message clearly states that an over-current or
> over-voltage may trigger this.

Fair enough. Let's wait for Badhri, but FWIW:

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

-- 
heikki
