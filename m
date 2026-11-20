Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186792;
	b=gj/UmYNSUfUXRnad+cAGyMg8M3bWeSF47PLzVr6tK1jlpqyb3iUIzBfwpcXrRM0GS5UL
	 wvF0XyYQ8LU0OEJYRD6qmo3lxMxg8kKGqACifFhFOFuCbPoLjJb1WgpJ6SRb3kmHAV2eU
	 1u5pGAFk9m5FLJtr+VUY888SEFyquDU32ftyM2cqFYh7ziFVfVsafWfCufWS4geRoQ0ED
	 nTwS5jiMzsxi7wCLiHPuTU7nurfkfBLHUyE/vJfDc2MB2bXPdPt7+FPgc7KpAQXWAGxcV
	 hE4PGl+GmE3JVIpsC69RhYphX0/SzuxxoCO8y52sCEW+t7/vWbDZf1NufAJ3pLHaOIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186792;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=1+Y2RqMyHfV+Y464nXtx3Gk0xMOqrlhhnkfM59Bt/9U=;
	b=nx83NEjGHG48268ouzVscsbu4ynpmobdVON/+2Zia/VoR6y7RehCHic083YR9MmK4CF7
	 KGKAI3vkHI65zc1OJFdAWifNdNxjYFPfO0D8g5BJQ4N5brfXv6QfKqpT6i29LozX9nz+N
	 l/ecGmBZ507F+8p1B0K7l9AYpQk6apg9GBajRva+co9VPxOJCnaN33CacHiU6x7UWC8PX
	 4mjJ7liE+Fn47XJWfQAcKuFTT10ANlGA+rmUb50i5mdTsazQG42E1M2nE90g2T7oriECC
	 tXMYODGrearfB6mANclxXoUp5lcmok020c2h/DrchWnCF93srCf6XN6Q32PTcXNmWHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F9iI9qSL;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A98D6074D1B;
	Fri, 20 Nov 2026 14:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A98D6074D1B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F9iI9qSL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795186793; x=1826722793;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kd5881KlhwrfFt8b0/HVBwSv0ExhQB7vWOA8txUFcrM=;
  b=F9iI9qSLRKq/liu+CHNJu9BdkZztswXFAxSovUyJPpwV8pnwuAnyvX2O
   SmuMpPQYQwhOa3rIjr4uSf9hPKLGARbAqddsTB81tAtMGJ22BjWZSzfJY
   KgKGs1pVhEgTZDtTDp4PTJEW5GxCVSgg72C5mpQoPri884giWSUL2VuVx
   Wc6oOufBgniyIIYjwjhjlebalLULCnvW2/0xtAISanziFDLe0iUOkuCRP
   hzduuPLoVVj/FsRfZ1IAQKsvnnahQHyfsH5eLDa6fecxpDHqRejcsXXp8
   XFDhQlbk4X//y7RWGQA78HaLNy3M6s81SGDdY4FY+BQ6mtpyiyFxgUYPh
   g==;
X-CSE-ConnectionGUID: CIfDhNfrQc+31dt6BeKbOw==
X-CSE-MsgGUID: WawpMSr6Rc6BR91pQWo8MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3981059"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3981059"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 06:59:52 -0800
X-CSE-ConnectionGUID: btLCLG5jSmGTtynr+gFEPQ==
X-CSE-MsgGUID: K1PHVpi3Qf6+zZHZiNkdxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10531428"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 20 Nov 2026 06:59:50 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 8D8BF99; Fri, 20 Nov 2026 15:59:49 +0100 (CET)
Date: Fri, 20 Nov 2026 15:59:49 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: contact@blakejalexander.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: log invalid UCSI version of 0
Message-ID: <awBgZXbIEu-DNHAS@black.igk.intel.com>
References: <20261119-log-ucsi-firmware-quirk-v1-1-6d42d70a6158@blakejalexander.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119-log-ucsi-firmware-quirk-v1-1-6d42d70a6158@blakejalexander.com>

On Thu, Nov 19, 2026 at 04:56:59AM +0100, Blake Alexander via B4 Relay wrote:
> From: Blake Alexander <contact@blakejalexander.com>
> 
> Some devices ship bugged firmware which sets the version of the UCSI
> mailbox to zero. In such cases the ucsi_register() will return -ENODEV
> and the driver will silently fail to bind. There is otherwise no
> indication as to the cause of the probe failure.
> 
> While existing (and future) machine-specific workarounds may resolve
> this issue by assuming a known-good UCSI version, future devices or
> older firmware revisions with this issue will still silently fail.
> Both users and developers will benefit from a clear diagnostic message
> when troubleshooting this particular bug.
> 
> Add a dev_err() log message when a UCSI version of 0 is reported during
> ucsi_register() hinting towards a potential firmware bug.
> 
> Signed-off-by: Blake Alexander <contact@blakejalexander.com>
> ---
> Hi,
> 
> I have a ThinkPad T14 Gen 2a which is failing to negotiate a DisplayPort
> Alt-Mode connection to a monitor-hub with a USB-C cable.
> 
> I spent quite some time troubleshooting the issue and identified the
> root-cause only to find that a patch which fixes this issue was already
> submitted:
> - "[PATCH v2 0/2] usb: typec: acpi: Zero version quirk for Lenovo ThinkPad T14 Gen 2a" <20261103-ucsi-lenovo-t14g2a-v2-0-e85c659b56a2@resetko.pl>
> 
> Similar issues with other laptops have also been recently submitted:
> - "[PATCH] usb: typec: ucsi: acpi: Add quirk for ASUS ROG Zephyrus Duo 16 GX650PI" <20261009-usb-next-v1-1-95a2288ad9b2@gmail.com>
> 
> And existing quirks are also already handled in mainline:
> - Acer Nitro ANV15-41: commit 8c51ea651d04 ("usb: typec: ucsi: acpi:
>   Assume UCSI 1.2 on Acer Nitro ANV15-41")
> 
> In the hope of saving future developer's time, this patch adds a
> dev_err() log message when the UCSI version register reads zero. The
> log message hints towards a potential firmware bug and gives an 
> explicit cause of the driver's probe failure.
> 
> Tested on ThinkPad BIOS R1MET65W (1.35), EC R1MHT65W without the
> relevant quirk patches.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 9e453d216c16..fa79ba6dec02 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -2396,8 +2396,13 @@ int ucsi_register(struct ucsi *ucsi)
>  	if (ret)
>  		return ret;
>  
> -	if (!ucsi->version)
> +	/* Version of 0 is not valid but some vendors may report it due to bugged
> +	 * FW and there may not already be a workaround quirk to correct it.
> +	 */
> +	if (!ucsi->version) {
> +		dev_err(ucsi->dev, "UCSI interface reported version 0.0.0: possible firmware bug.");
>  		return -ENODEV;
> +	}
>  
>  	/*
>  	 * Version format is JJ.M.N (JJ = Major version, M = Minor version,
> 
> ---
> base-commit: f11fe7603df07fbb9fa02b0d385c1696c87a6dab
> change-id: 20261119-log-ucsi-firmware-quirk-8ffc87c7d42f
> 
> Best regards,
> --  
> Blake Alexander <contact@blakejalexander.com>
> 

-- 
heikki
