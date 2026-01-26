Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677D933CE85
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 14:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769436865; cv=none; b=Eu1iYyz6SF3piJ2I5NJsA62AY/mrKfU8uUMLsqOQAX7TopCkVZWSP//Egxb9TflzNhz667iMtTkKwDB+7cq27msVVvaFQQseRClRFK82zZFxxcJnffpoLkEW29jWIE910HCC0SW+GVa4dYlRCyQ4HYi01mk0H0N0E8fMxEuarqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769436865; c=relaxed/simple;
	bh=UdKu8XlHK4M1QzA9zuWZ0ZcMgHSSmEmiln+PgEJtYQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oNDfyxSTNPd3N6SBTvWpryX4EF7BIFw0mCdczPAO695UbsjCfYrgK3Qsw5UKbQc2zfbNvprFV1+nHn6h8JDq7PAgchVgd4JUpqmDW/lXu0CYnIR77CEtWLlJdwtYkVQ1c8/5J3UE4PSSvQ9kTM60OCDgNV7lEnmaXitWJBJH4qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kq/G3Tka; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kq/G3Tka"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769436865; x=1800972865;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=UdKu8XlHK4M1QzA9zuWZ0ZcMgHSSmEmiln+PgEJtYQ4=;
  b=Kq/G3Tka02hGWKwlA+8BkefCrHSGxm/u3UsV2/d7CHDDE8v62bfwU0Mr
   UGh0FqZ0SY3x6+Faopg34/tb+v6g7EQhao7BKAGF9bXQ5QrCabaKB/HKN
   7X7+6JUTybDVYabzp9tNmws3Wa6ICGC2DpGHpCYjato1d2P99SOWMOipq
   BUZYd7pY+Rr+gsfos6MY1oGAcnmlLMnhZowRYp3zOOU8AoRRbbpWHcyD/
   4ExHGUZ2DSinS4YGnLs+uk0hK0bbawp/SOXmGwVH8uV/q+t0yCzytwKGE
   G6OwhMiLlQTa7axb+tadGxbPfCQhuQr3HQQWfUR1TZ7fi3QBht41FeZml
   g==;
X-CSE-ConnectionGUID: +B/uyDx6TNmIXSHMhu3j1w==
X-CSE-MsgGUID: CkuKsxTWQlGYqYbfj+RGqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70655752"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="70655752"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:14:24 -0800
X-CSE-ConnectionGUID: rd2X2bK/QOep4ntgEi0+zA==
X-CSE-MsgGUID: R4C97kNDRvKb5+hPT+eXbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="208035124"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO kuha) ([10.124.223.78])
  by fmviesa010.fm.intel.com with SMTP; 26 Jan 2026 06:14:21 -0800
Received: by kuha (sSMTP sendmail emulation); Mon, 26 Jan 2026 16:13:54 +0200
Date: Mon, 26 Jan 2026 16:13:54 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andy Yan <andyshrk@163.com>, Badhri Jagan Sridharan <badhri@google.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux@roeck-us.net
Subject: Re: [PATCH 2/15] usb: typec: Add parameter for the VDO to
 typec_altmode_enter()
Message-ID: <aXd2ogJCAxTjvLDd@kuha>
References: <20191230142611.24921-3-heikki.krogerus@linux.intel.com>
 <20260125035457.354349-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260125035457.354349-1-andyshrk@163.com>

+Badhri

Sun, Jan 25, 2026 at 11:54:22AM +0800, Andy Yan wrote:
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> > index 56fc356bc55c..f3087ef8265c 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -1475,16 +1475,16 @@ static int tcpm_validate_caps(struct tcpm_port *port, const u32 *pdo,
> >  	return 0;
> >  }
> >  
> > -static int tcpm_altmode_enter(struct typec_altmode *altmode)
> > +static int tcpm_altmode_enter(struct typec_altmode *altmode, u32 *vdo)
> >  {
> >  	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
> >  	u32 header;
> >  
> >  	mutex_lock(&port->lock);
> > -	header = VDO(altmode->svid, 1, CMD_ENTER_MODE);
> > +	header = VDO(altmode->svid, vdo ? 2 : 1, CMD_ENTER_MODE);
> >  	header |= VDO_OPOS(altmode->mode);
> 
> Sorry to bother you. I happened to come across this piece of code and
> I'm not quite clear about this part: vdo ? 2 : 1
> 
> According to the definition of the VDO macro(pd_vdo.h), the type here is
> only 1 bit wide, located at bit 15. If the type value is set to 2 here,
> wouldn’t that overwrite bit 16?

That looks like just an obvious bug to me.

thanks,

> /*
>  * VDM header
>  * ----------
>  * <31:16>  :: SVID
>  * <15>     :: VDM type ( 1b == structured, 0b == unstructured )
>  * <14:13>  :: Structured VDM version
>  * <12:11>  :: reserved
>  * <10:8>   :: object position (1-7 valid ... used for enter/exit mode only)
>  * <7:6>    :: command type (SVDM only?)
>  * <5>      :: reserved (SVDM), command type (UVDM)
>  * <4:0>    :: command
>  */
> #define VDO(vid, type, ver, custom)			\
> 	(((vid) << 16) |				\
> 	 ((type) << 15) |				\
> 	 ((ver) << 13) |				\
> 	 ((custom) & 0x7FFF))
> 
> 
> >-	tcpm_queue_vdm(port, header, NULL, 0);
> >+	tcpm_queue_vdm(port, header, vdo, vdo ? 1 : 0);
> > 	mod_delayed_work(port->wq, &port->vdm_state_machine, 0);

-- 
heikki
