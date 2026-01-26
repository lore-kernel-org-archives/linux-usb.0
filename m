Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB1833DEC8
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 14:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769437613; cv=none; b=NQ9DfpkFf5rWfPk+e8e0AdkgTaMf/B0IStlGQjYanTIGW84BQuLDU3vCwNtPDAD9LN8vapegMHLsPMMVklsD4GasPm4iU8tKf/MhqW+bkNwYmqOM1TI2adJa35KmETc7YvXvAusTLke6F8FEW/7s1xd4QcXxJr7whIZQYrXgq9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769437613; c=relaxed/simple;
	bh=9+xNcMWkhfl/raooz8jz2dvW1j1N1Dsnvic0xN9/2Dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tg+/Kj4e6z88f73kWaZji8R2RdlMQDclxSsAbOipghF3E/pkEUdK2EVKV3mnKD3d+e8dW3J5rI5D9kvPR1UtA1l15st/t3UHsSnE4QtL/xu0fxOYUSXzA6ULcm4InbUn+h/me5kzHukE8ScpZiafD4r42rdBczWCGbGw+S+5PRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BnSNBu4H; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BnSNBu4H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769437612; x=1800973612;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9+xNcMWkhfl/raooz8jz2dvW1j1N1Dsnvic0xN9/2Dk=;
  b=BnSNBu4HUcE6ddNSJ/mxoFYgI4Yc3hr8pYBRrbEyw02UaBrWDhpPZ3A1
   sofU7tGJEkO/W+nN4oS82mWqHSY/YDgq0cvln4XkCbSgEGmynKOcCa7Dh
   H62eG++Jk5Hbuy/6yuap5yeeBEDz3fYqq1x3SJkIYE0dvlG/2AeWUR0ie
   KaLkNnie0zuJG+Z0uksa1tqrG6yphcCNFzDLIXbxkEDFIPLSyJBAfqyXT
   klytd8QNgeYfggl5/Fg1yyFdzrL5Q7u6AWZzDT/xeLc588gf1bvHGFpav
   U/8Ufj2uH5Og0ZWOoRWo9WJjalC3kln1bXR/aDwQIW2A9M5IsCJ85HeoM
   g==;
X-CSE-ConnectionGUID: Ttw/e0B1TqSSPTpNmZoIRg==
X-CSE-MsgGUID: RCOtYJ0ASh2yG7Vwhl5SmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="74457614"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="74457614"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:26:51 -0800
X-CSE-ConnectionGUID: sLs+c4pqRuyP9yz5KRbjWw==
X-CSE-MsgGUID: SYaHVaD5SbGs4iPkGus9WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="207747747"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO kuha) ([10.124.223.78])
  by orviesa007.jf.intel.com with SMTP; 26 Jan 2026 06:26:49 -0800
Received: by kuha (sSMTP sendmail emulation); Mon, 26 Jan 2026 16:26:22 +0200
Date: Mon, 26 Jan 2026 16:26:22 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andy Yan <andyshrk@163.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux@roeck-us.net, Badhri Jagan Sridharan <badhri@google.com>
Subject: Re: [PATCH 2/15] usb: typec: Add parameter for the VDO to
 typec_altmode_enter()
Message-ID: <aXd5jqDUg4cXdX7j@kuha>
References: <20191230142611.24921-3-heikki.krogerus@linux.intel.com>
 <20260125035457.354349-1-andyshrk@163.com>
 <aXd2ogJCAxTjvLDd@kuha>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXd2ogJCAxTjvLDd@kuha>

Hi Andy,

> Sun, Jan 25, 2026 at 11:54:22AM +0800, Andy Yan wrote:
> > > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> > > index 56fc356bc55c..f3087ef8265c 100644
> > > --- a/drivers/usb/typec/tcpm/tcpm.c
> > > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > > @@ -1475,16 +1475,16 @@ static int tcpm_validate_caps(struct tcpm_port *port, const u32 *pdo,
> > >  	return 0;
> > >  }
> > >  
> > > -static int tcpm_altmode_enter(struct typec_altmode *altmode)
> > > +static int tcpm_altmode_enter(struct typec_altmode *altmode, u32 *vdo)
> > >  {
> > >  	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
> > >  	u32 header;
> > >  
> > >  	mutex_lock(&port->lock);
> > > -	header = VDO(altmode->svid, 1, CMD_ENTER_MODE);
> > > +	header = VDO(altmode->svid, vdo ? 2 : 1, CMD_ENTER_MODE);
> > >  	header |= VDO_OPOS(altmode->mode);
> > 
> > Sorry to bother you. I happened to come across this piece of code and
> > I'm not quite clear about this part: vdo ? 2 : 1
> > 
> > According to the definition of the VDO macro(pd_vdo.h), the type here is
> > only 1 bit wide, located at bit 15. If the type value is set to 2 here,
> > wouldn’t that overwrite bit 16?
> 
> That looks like just an obvious bug to me.

Whoa, the thread and patch seem to be really old.

Please just prepare the fix. Let's discuss it there if there's
anything.

thanks,

-- 
heikki
