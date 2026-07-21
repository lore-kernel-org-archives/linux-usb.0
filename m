Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA5D47A0A7;
	Tue, 21 Jul 2026 10:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629886; cv=none; b=PPK+lu4m7oPX6FixgE1ZF+oGU23N4POISUOObaKqLrGwRFAOQBWi+g+j9/fk1h+/50DrxiKzWDL1ClCIHf4wDvRFO8YHQjqB30Nqyibn6vfGqO+oqiq6zrGRO/MXwIH/jfskQuDkxQf/zwM6YsufGGRp75mM+WIJOaJ4hVZgLpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629886; c=relaxed/simple;
	bh=it2z8vVLbrMTJSVxZm2FSmQ7gTChaBemoS1y1Qindjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NgRA1ur1TUFk4LFp7DinvQRO0FOoxTnGMquprLZefTzjdcu2cgjKOW0+mmZdwSC1sfB6YsYrkaUqoh0c6jSs4p6biF05eeiOTowbnlsLjT/93k55e1TzeMybiJhJnye+f6m7fnJ2Z8uZF8UOGG9l9Q5fliOzzAw0s1LImVLgttE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mmlPn0bn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mmlPn0bn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784629884; x=1816165884;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=it2z8vVLbrMTJSVxZm2FSmQ7gTChaBemoS1y1Qindjo=;
  b=mmlPn0bn9+k5Q5YZW3O4REfzvAs6jeZwRTte+AifGWiqPgBzUs5pRbgV
   e3+fDV5UfF1mDRZCxSPeLPv9wgso08HbQxTUSrhhE1EHT1s4CBjjTjata
   oemBp5wpAuacS9tDuwwNGdeMUPOzsZABwSiXwnGtsnoFk40k0Lqi51Tyh
   s8ykadOa8gYbiBqnx7hA9nQ/ONEWPDGmcG46WZTdA4f0uEQNgKsHiEhcr
   1cJ4DTytBLqDb7Y2y2kCQvPNQo5ynYsv2kt2Fqdt1lihflAwdHUGTYXJO
   vbEzyq693qwmUb4EFJD5tsveoM8fOL5etVn4z3UtobNrRTcEzoP5pYc4U
   w==;
X-CSE-ConnectionGUID: 5jn6iR0zSiCZjPO0QizADA==
X-CSE-MsgGUID: XaBSrfTDRqC1bN23O8evlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="72761667"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="72761667"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 03:31:23 -0700
X-CSE-ConnectionGUID: MnCYKw73QQ2lEJvbhOSNSQ==
X-CSE-MsgGUID: EWLrEdjoQUWzTZYsIdDHsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="282224712"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 21 Jul 2026 03:31:21 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 85A0E95; Tue, 21 Jul 2026 12:31:20 +0200 (CEST)
Date: Tue, 21 Jul 2026 13:31:18 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	usb4-upstream@oss.qualcomm.com,
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>
Subject: Re: [PATCH] usb: typec: ucsi: Unregister lockdep key only after last
 lock use
Message-ID: <al9KdsRvLhq3sE23@kuha>
References: <20260720-topic-ucsi_lockdep-v1-1-6c1b5f9d1f3e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-topic-ucsi_lockdep-v1-1-6c1b5f9d1f3e@oss.qualcomm.com>

On Mon, Jul 20, 2026 at 04:24:27PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> ucsi_unregister_port() starts off with taking con->lock. Fix the
> ucsi_init() teardown path to avoid unregistering the lockdep key
> associated with it right before its use.

There's already a fix for this one:
https://lore.kernel.org/linux-usb/20260717104614.325250-1-akuchynski@chromium.org/

> Fixes: 7aa7d4bf9d3f ("usb: typec: ucsi: Fix race condition and ordering in port unregistration")
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> To: Andrei Kuchynski <akuchynski@chromium.org>
> To: Benson Leung <bleung@chromium.org>
> Cc: linux-usb@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: usb4-upstream@oss.qualcomm.com
> Cc: Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index d221ca9bc88e..67c75e6bdfae 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -2142,11 +2142,12 @@ static int ucsi_init(struct ucsi *ucsi)
>  	return 0;
>  
>  err_unregister:
> +	for (con = connector; con->port; con++)
> +		ucsi_unregister_port(con);
> +
>  	for (i = 0; i < ucsi->cap.num_connectors; i++)
>  		lockdep_unregister_key(&connector[i].lock_key);
>  
> -	for (con = connector; con->port; con++)
> -		ucsi_unregister_port(con);
>  	kfree(connector);
>  err_reset:
>  	memset(&ucsi->cap, 0, sizeof(ucsi->cap));

Thanks,

-- 
heikki
