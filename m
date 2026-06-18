Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F40301474;
	Thu, 18 Jun 2026 13:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781788290; cv=none; b=lDyh8/hC9YdgFzIMF15mYxGVbdUlTUUMPGeOan737AvVkhmNR/+WljdBlOmmohJlLIU5HQ/I9hsE//8H4h5IcUzssHpclHaqN/uGUQVrTQ8xG1uR2gf5M+4OrEJDwKYmuVp6TXItOVbob9Guqro16cIfl822DhXwiYmPYUS8ofU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781788290; c=relaxed/simple;
	bh=w7v2czRpp1bCaI4uRK7qAHnd9aHwAv3m2t1B+eOgSVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H49y5hDgC//Yv+yOR91iZUPr/dHTqRN35B0/ArBU+7lG3/Xf1pF1y+IbsJ2UB/0/TWeU9ZIYqFAL7WfmHGGfVY2yIQlXp4CSxH3FFo9R8wKPwT1AN86hQl5KUeh+SL6UdxpkT8HtAiEL7wr5JMRumSOmOAeitj6FWRI/+OeeKuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lJAOhTVW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lJAOhTVW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781788290; x=1813324290;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w7v2czRpp1bCaI4uRK7qAHnd9aHwAv3m2t1B+eOgSVU=;
  b=lJAOhTVW9wsuOQfrznXyZFd6278pgljr5Or2FZOvrN/yCCtoCp2a96IU
   RWhc30mJmLK8CgGXWY0YgzFLYLlTbV20LZjSVSsb7dQXJT/naZ2x1RYof
   PYWgcUlWc9XRlpODICgGGfl3W0meo5feIMkAANbOOHfRg7KuvMfWRtc+z
   zOLHs3XEPWYEywDuyvi9cqBwL32vSIXRkfElcOocghF+072PhCckopwau
   /ex4rqc8lw8GpqwMH0fUomf3Wh1k8MuPEY6Z4/sVFqzoTSTeKsweELldy
   9sSWpKnQJ1g4i1pO4eY7Xzu2WReK5Ka+CdkNtqKm9jjBwUk5a0qG2xQM6
   A==;
X-CSE-ConnectionGUID: GWDMWZmsRWSU5GpVo6VyJw==
X-CSE-MsgGUID: SZS3yPAVQ5K037oynUfDrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82491761"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="82491761"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 06:11:28 -0700
X-CSE-ConnectionGUID: Gd57f3IwRgOdEAWj57oi/A==
X-CSE-MsgGUID: LRXE8lqUQpyNQqUO36J1xA==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 18 Jun 2026 06:11:26 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id ED5C898; Thu, 18 Jun 2026 15:11:24 +0200 (CEST)
Date: Thu, 18 Jun 2026 16:11:23 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] usb: typec: displayport: Check cable altmode
 support
Message-ID: <ajPue_yC33pnuPMI@kuha>
References: <20260611122146.262184-1-akuchynski@chromium.org>
 <20260611122146.262184-4-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611122146.262184-4-akuchynski@chromium.org>

On Thu, Jun 11, 2026 at 12:21:46PM +0000, Andrei Kuchynski wrote:
> Update the probe function to utilize the new
> typec_cable_altmode_unsupported() helper. If the cable doesn't support
> DisplayPort altmode, don't initialize altmode_ops and prevent altmode
> from being activated.
> A captive cable shouldn't be checked; it may not provide discoverable
> capability information, but it is inherently designed to support the
> device's requirements.
> 
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/altmodes/displayport.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index 263a89c5f3243..5ee33a69b9cf7 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -790,7 +790,6 @@ int dp_altmode_probe(struct typec_altmode *alt)
>  	dp->alt = alt;
>  
>  	alt->desc = "DisplayPort";
> -	typec_altmode_set_ops(alt, &dp_altmode_ops);
>  
>  	if (plug) {
>  		plug->desc = "Displayport";
> @@ -811,6 +810,10 @@ int dp_altmode_probe(struct typec_altmode *alt)
>  	if (plug)
>  		typec_altmode_set_drvdata(plug, dp);
>  
> +	if ((alt->vdo & DP_CAP_RECEPTACLE) && typec_cable_altmode_unsupported(alt))
> +		return 0;
> +
> +	typec_altmode_set_ops(alt, &dp_altmode_ops);
>  	if (!alt->mode_selection) {
>  		dp->state = plug ? DP_STATE_ENTER_PRIME : DP_STATE_ENTER;
>  		schedule_work(&dp->work);
> -- 
> 2.54.0.1099.g489fc7bff1-goog

-- 
heikki
