Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2488841D637;
	Thu, 16 Jul 2026 11:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784202795; cv=none; b=nL2oKqxwLXjgSEGR2JU9hf5HAhAykqU6x1zVVFGF2tr9CAjj7C2iPH+fgjQgwOWms4WohwtS6tQk9gYRNo4bmyYwHq0aQHmb5vkIA2rDoOOeCn/akJyhFHuf9kco+sVwyeMvnp1wwQt/3gDmpy6vQzJIWUe1LU7kAxsSR+bjMgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784202795; c=relaxed/simple;
	bh=p65yDdtv6Yk973D8TjJVk5h60ZOWGqzgaafBviFaUXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EPi8Mn0MSjdgrGmtxywxllorl1PJHG65RGiWX4xC60SkLmue+i+z/GVaKcMgz+zjKrzzff8imXDb1RQFhbld326n0rcS01mNJ35Wq26qtnqZqus4pO08+06OoxqpIcP8/Yiaw+hp1oee3JCeclbtZ0lyjz6dJvfqQUYajU3pnTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jxIEcaq6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jxIEcaq6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784202793; x=1815738793;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p65yDdtv6Yk973D8TjJVk5h60ZOWGqzgaafBviFaUXA=;
  b=jxIEcaq6KXNe6CFejj3p5J32FyB6p2+LM7xakFB1oUANXmT0K8avOnI0
   gxCNTgj3wHU+VadNdWuobcss9GwGqFKYCEYfHyMbmrK8UxfthtZ0iSq0m
   M0ocg5+NUbr2G5v7bT8FfvCetkRQvaNjpsntx1wPLaDeL0x7gdxl3wZqj
   chFufeUpZtygTjpZEsOpjo36E1vmnI1kjZotHUGS9sX4fWIdPLS9eZo3M
   exKwOv0A+8oU2f8LJpwbpuMUFLUEQV5NEF+BEcZ5SWzOjH7u2+06UEzb8
   kBtK0yQjR4sksKl6FyCj2E92Xyej5yiLSaZ0GvEDKGwSXEzv3Jc9v4NlS
   g==;
X-CSE-ConnectionGUID: DoAGBCgFS1qNeeX5jidLJA==
X-CSE-MsgGUID: TxH7WDPAQhqIG7cWfUFsgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="83979929"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="83979929"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 04:53:12 -0700
X-CSE-ConnectionGUID: lCDVaTV1SOmGQjat6fCONg==
X-CSE-MsgGUID: boxJoJ/pTcSt1dpbM9R+/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="294711339"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 16 Jul 2026 04:53:11 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id F20A395; Thu, 16 Jul 2026 13:53:09 +0200 (CEST)
Date: Thu, 16 Jul 2026 14:53:08 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Julian Braha <julianbraha@gmail.com>,
	Xu Yang <xu.yang_2@oss.nxp.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usb: typec: altmodes: select DRM_AUX_HPD_BRIDGE for
 TYPEC_DP_ALTMODE
Message-ID: <aljGJDpKm69EXq-I@kuha>
References: <20260709062147.240-1-kernel@airkyi.com>
 <alSxX055MoxkdahQ@kuha>
 <04a68703-14e9-48f8-8e5d-471bb54887f6@rock-chips.com>
 <aliZ-nRG55rfmaui@kuha>
 <b2c3f187-92f1-4583-997b-64568d2a02c7@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2c3f187-92f1-4583-997b-64568d2a02c7@rock-chips.com>

On Thu, Jul 16, 2026 at 06:31:45PM +0800, Chaoyi Chen wrote:
> On 7/16/2026 4:44 PM, Heikki Krogerus wrote:
> > On Wed, Jul 15, 2026 at 09:19:24AM +0800, Chaoyi Chen wrote:
> >> Hi Heikki,
> >>
> >> On 7/13/2026 5:35 PM, Heikki Krogerus wrote:
> >>> On Thu, Jul 09, 2026 at 02:21:47PM +0800, Chaoyi Chen wrote:
> >>>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> >>>>
> >>>> When TYPEC_DP_ALTMODE is enabled, DRM_AUX_HPD_BRIDGE is most likely
> >>>> also needed for embedded platforms. Select it when available.
> >>>>
> >>>> Suggested-by: Xu Yang <xu.yang_2@oss.nxp.com>
> >>>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> >>>> ---
> >>>> Changes in v3:
> >>>> - Link to v2: https://lore.kernel.org/all/20260705065832.184-1-kernel@airkyi.com/
> >>>> - Use the same "select" as v1 to make things simple. 
> >>>>
> >>>> Changes in v2:
> >>>> - Link to v1: https://lore.kernel.org/all/20260702022036.44-1-kernel@airkyi.com/
> >>>> - Change "select" to "imply".
> >>>> ---
> >>>>
> >>>>  drivers/usb/typec/altmodes/Kconfig | 1 +
> >>>>  1 file changed, 1 insertion(+)
> >>>>
> >>>> diff --git a/drivers/usb/typec/altmodes/Kconfig b/drivers/usb/typec/altmodes/Kconfig
> >>>> index 7867fa7c405d..b054c0b6a8d4 100644
> >>>> --- a/drivers/usb/typec/altmodes/Kconfig
> >>>> +++ b/drivers/usb/typec/altmodes/Kconfig
> >>>> @@ -5,6 +5,7 @@ menu "USB Type-C Alternate Mode drivers"
> >>>>  config TYPEC_DP_ALTMODE
> >>>>  	tristate "DisplayPort Alternate Mode driver"
> >>>>  	depends on DRM
> >>>> +	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
> >>>
> >>> Is there really no way of making this into a dependency?
> >>> Doesn't this, or something like it not work:
> >>>
> >>>         depends on (DRM_AUX_HPD_BRIDGE && DRM_BRIDGE && OF) || !DRM_AUX_HPD_BRIDGE
> >>>
> >>
> >> I think Xu originally wanted to select this item directly, since it
> >> wasn't visible in the menu and there was nowhere to select it on some platforms.
> > 
> > But now it is user selectable, no?
> 
> No, currently it needs to be explicitly selected in Kconfig, 
> and it is not visible to the user.

Okay, yet another Kconfig option with dependencies that's not user
selectable. Meaning, everything that selects that option has to carry
the same dependencies, and hope that if those dependencies ever change
they are updated everywhere. :(

I still don't like this at all, but let's go with it for now.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Thanks,

-- 
heikki
