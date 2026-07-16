Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807FC3E00A0;
	Thu, 16 Jul 2026 08:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784191495; cv=none; b=s/DDoX+ZgVkHrvHRCYJmPklMRFQPW0X9oiA5P6Vp/o/fhksMQ6nEcb2UOsnuhnJztF6tKI/zGTbJwZcyWhhVCoBisEQfL+M8v7MzF1O0VNg7iaTdULc4kk8JMzjv9SDJ6Cy4R1lbmT/9wcfO7fMZB9RjnF51R7zouN10tIlt2Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784191495; c=relaxed/simple;
	bh=MJbzkZ3Iz5nhulv6LKxuUITz8efOdzot5+f8bHfXYH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4LT3EsD0FN+9gmVcRsWlYXjiVH3SNgEukeeOlZdcWYz9mlrV3equyp/tfoSkpAZR/sxd3OxELrQcqliQt+IaubU5amgyr3wrcNzCS5OopANP+S7GErT2d+VxJppggfiWC7Yp4UCNy0oVUsuqUu9Ci/4RnxxhxWqtRKLkG4tH/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bMELUUlW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bMELUUlW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784191493; x=1815727493;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MJbzkZ3Iz5nhulv6LKxuUITz8efOdzot5+f8bHfXYH8=;
  b=bMELUUlWObFQCJHl7sXq+4zKieAQmztnok6vvKZhqiXMbMMtq94gGs5s
   xEcdvDchs0nEfidseByHUuOm3HQUgpMsGK4OgeKbNuWwD75Ax9ZQmccxG
   TNbGUtHEZBCqzByk8vJ+NnVypZW3gh/uPQa1hLFf3eLsh+8vQjH3f0U/t
   z0qJ3nPGzWWs5m6oaU/0MdotB9pRymDwekzYFzL/ieNjLJ7h+W2agJyV+
   7N93dnTenl6nwU4sYF9zNGVE8Ly4m2oqqKsR3/zG7aN4PYRZmJZjtmDmk
   yxBw90aQNQV5qgdwXvKlDv2L+r7wG00qN+8Qu77qmMa++9h9AcOxpM7/K
   g==;
X-CSE-ConnectionGUID: ekEGIGs+SUacXFwhtUnSKg==
X-CSE-MsgGUID: aLSPJnN4Sk+w/FQCxS+Fjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="83827349"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="83827349"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 01:44:47 -0700
X-CSE-ConnectionGUID: Jad67KM1Rga44sRpYOXq1A==
X-CSE-MsgGUID: TMNA+5ZsSgyRmkiZJZKqiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="250073357"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 16 Jul 2026 01:44:45 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 5C86595; Thu, 16 Jul 2026 10:44:44 +0200 (CEST)
Date: Thu, 16 Jul 2026 11:44:42 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Julian Braha <julianbraha@gmail.com>,
	Xu Yang <xu.yang_2@oss.nxp.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usb: typec: altmodes: select DRM_AUX_HPD_BRIDGE for
 TYPEC_DP_ALTMODE
Message-ID: <aliZ-nRG55rfmaui@kuha>
References: <20260709062147.240-1-kernel@airkyi.com>
 <alSxX055MoxkdahQ@kuha>
 <04a68703-14e9-48f8-8e5d-471bb54887f6@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04a68703-14e9-48f8-8e5d-471bb54887f6@rock-chips.com>

On Wed, Jul 15, 2026 at 09:19:24AM +0800, Chaoyi Chen wrote:
> Hi Heikki,
> 
> On 7/13/2026 5:35 PM, Heikki Krogerus wrote:
> > On Thu, Jul 09, 2026 at 02:21:47PM +0800, Chaoyi Chen wrote:
> >> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> >>
> >> When TYPEC_DP_ALTMODE is enabled, DRM_AUX_HPD_BRIDGE is most likely
> >> also needed for embedded platforms. Select it when available.
> >>
> >> Suggested-by: Xu Yang <xu.yang_2@oss.nxp.com>
> >> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> >> ---
> >> Changes in v3:
> >> - Link to v2: https://lore.kernel.org/all/20260705065832.184-1-kernel@airkyi.com/
> >> - Use the same "select" as v1 to make things simple. 
> >>
> >> Changes in v2:
> >> - Link to v1: https://lore.kernel.org/all/20260702022036.44-1-kernel@airkyi.com/
> >> - Change "select" to "imply".
> >> ---
> >>
> >>  drivers/usb/typec/altmodes/Kconfig | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/usb/typec/altmodes/Kconfig b/drivers/usb/typec/altmodes/Kconfig
> >> index 7867fa7c405d..b054c0b6a8d4 100644
> >> --- a/drivers/usb/typec/altmodes/Kconfig
> >> +++ b/drivers/usb/typec/altmodes/Kconfig
> >> @@ -5,6 +5,7 @@ menu "USB Type-C Alternate Mode drivers"
> >>  config TYPEC_DP_ALTMODE
> >>  	tristate "DisplayPort Alternate Mode driver"
> >>  	depends on DRM
> >> +	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
> > 
> > Is there really no way of making this into a dependency?
> > Doesn't this, or something like it not work:
> > 
> >         depends on (DRM_AUX_HPD_BRIDGE && DRM_BRIDGE && OF) || !DRM_AUX_HPD_BRIDGE
> >
> 
> I think Xu originally wanted to select this item directly, since it
> wasn't visible in the menu and there was nowhere to select it on some platforms.

But now it is user selectable, no?

Thanks,

-- 
heikki
