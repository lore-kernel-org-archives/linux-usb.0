Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64EB3D8132;
	Thu, 18 Jun 2026 13:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781788254; cv=none; b=dlrwvoqEm3fzL8TfRrDHfD4jxeDapIyp5WW04dhHLhK0jGAQlHxB62xm6mgVB2N+Nfs/gyGLRZnkXcHFdXe9mIGBfKvWzbHQB7oW5CZaPccNgTgIwyl2qHhFWi/kf12wxSZzJNn67CfqU/I0dGAIebPtldKn9B2L9ZWDeGnddo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781788254; c=relaxed/simple;
	bh=YkBVIg4bj1u/a2NkwKTjIxv+pBp+0lL/mAgwSRFTYAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jPoFkBleiQIGTVANNcr5f/R6FeCS/z35uEYY1UFybiKgDuW0dB9XpxiwplXM8diKJqSIdeJqQUNZhhve8Ww0ZtWSiuS2dBe1/VZFxS7WTDTa9JGgrYM9j1ziMLoz5OgrypC0P22PXEittMerkX5zMZ6pLwagntjfhcVPdL3zKbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L5ajYynu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L5ajYynu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781788253; x=1813324253;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YkBVIg4bj1u/a2NkwKTjIxv+pBp+0lL/mAgwSRFTYAk=;
  b=L5ajYynuh+MwuY8Wfr8QIv+EONEuhhSyPGPstKclDljR1a4J3/sUnpiP
   6RNi7ArR4dXywBq1qMWV4XwGDd6nO4xdBKTilcSp7P5aYUrOw0TGXgdDr
   j2RyAZ4moljuYNdKxdBED0YduALSOGa9fvboymB8zLzBcV/m5nJ/awvNj
   9mZZbtzwCGnjBVwoss6Myj+7JTb5f4xa0Rbj/YAh2eTEFloLxo3xH0IYt
   fk5IHHHwSV2Yi1wmVuXPIPjG0EGRYN+0FOLgtJVc3tcaouFcyMGAlIRKL
   dszfbX74fnZjR0JGz8z4xB1WXWuaWutE6Hm4vohj0I25XWzKXHj1Qh9xU
   A==;
X-CSE-ConnectionGUID: aWfbms1xTkS3ajS/dKoC1A==
X-CSE-MsgGUID: DsEerdcnSAqaeLTiXWDdVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="100033167"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="100033167"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 06:10:52 -0700
X-CSE-ConnectionGUID: uQFeuoEWQEWdWLV2NYWwmQ==
X-CSE-MsgGUID: lp648KhATfiheW2qATX2nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="245437495"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 18 Jun 2026 06:10:50 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id A7BF998; Thu, 18 Jun 2026 15:10:49 +0200 (CEST)
Date: Thu, 18 Jun 2026 16:10:48 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] usb: typec: thunderbolt: Check cable altmode
 support
Message-ID: <ajPuWJek7uaLSsRJ@kuha>
References: <20260611122146.262184-1-akuchynski@chromium.org>
 <20260611122146.262184-3-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611122146.262184-3-akuchynski@chromium.org>

On Thu, Jun 11, 2026 at 12:21:45PM +0000, Andrei Kuchynski wrote:
> Update the probe function to utilize the new
> typec_cable_altmode_unsupported() helper. If the cable doesn't support
> Thunderbolt altmode, don't initialize altmode_ops and prevent altmode
> from being activated.
> 
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/altmodes/thunderbolt.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/typec/altmodes/thunderbolt.c b/drivers/usb/typec/altmodes/thunderbolt.c
> index 32250b94262a9..2eccdddf1b1f4 100644
> --- a/drivers/usb/typec/altmodes/thunderbolt.c
> +++ b/drivers/usb/typec/altmodes/thunderbolt.c
> @@ -284,6 +284,10 @@ static int tbt_altmode_probe(struct typec_altmode *alt)
>  
>  	alt->desc = "Thunderbolt3";
>  	typec_altmode_set_drvdata(alt, tbt);
> +
> +	if (typec_cable_altmode_unsupported(alt))
> +		return 0;
> +
>  	typec_altmode_set_ops(alt, &tbt_altmode_ops);
>  
>  	if (!alt->mode_selection && tbt_ready(alt)) {
> -- 
> 2.54.0.1099.g489fc7bff1-goog

-- 
heikki
