Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1912BB13
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 04:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786510002; cv=none; b=u6ZAmkkxytUx/nJ2sH47Iej2Wt4U5YZx9mP8Kd/wSpeRyVrCvHxaAUPa97AmhLt3eNonetXXS7gCbnmX6/Jia7UhxM5k9rksLC30FH7jYueOgrE0C24XCxPov3cGzbAPB2oW8kFrZ9cDTXgF8cvnDRpyTjFI217nZoFbR8FRvGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786510002; c=relaxed/simple;
	bh=zHowPcYJxFHDx384BNnqBiWzOSfxmu9was63TdV4hOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UfWyxDJ0PPuA2TfN/bMizv6Q5SIrQnx62C0mbQ8Cv0V0SBmSwMsCDBBkQtZJl/8IWegj4z6dU37k5mw9Nt1tbplfY6l1UemfnzchJbjTnpAt6FRREmVe1ig6QaG5wpLd1kE96O4jvvq2qk77VCDBDIGnLOBAszV6c+AOjENlqUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d9RrJxWr; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d9RrJxWr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786509999; x=1818045999;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zHowPcYJxFHDx384BNnqBiWzOSfxmu9was63TdV4hOw=;
  b=d9RrJxWrFtmoXHPvJ0XyjHIxEXSE6hLNdDa/6HFESx44I6yWAHohrjog
   Lbw+Dgw4OemLiK7V7ZR7jYW//RHjwjQj1H3SWjwfBBBB8Ajyk5C99Z64G
   ayHT2sCFGIbcstSYkEgIL1ToTV6AL5BEK4pkhWGg6nlw1BROetpEXZPWl
   g2crPRSuev8JiljREnPk4rLIJf4Jhk4Lp4FnzmQqVnvBaB8uIRAysJcps
   JvAeJJVmdAr/1txxcrg837x65FuDg1NcOG3DoroYEmqA+0ve4uTeWlaOF
   u1I5w4XFjMMCOnFWhd73rZSxqEP17BrMZ3wv9oC23Ril1ZIzH+R7WSd6v
   w==;
X-CSE-ConnectionGUID: qIoHiXbqSD2+IWbRNQRrTw==
X-CSE-MsgGUID: VUtXmgQXTTiMIKU3YS2kLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87266291"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="87266291"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 21:46:39 -0700
X-CSE-ConnectionGUID: Va+KQzgJR8COSLaCpPYlBw==
X-CSE-MsgGUID: UskWFhggQC2syQ/mQtXEUQ==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 11 Aug 2026 21:46:37 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 9EC8B99; Wed, 12 Aug 2026 06:46:36 +0200 (CEST)
Date: Wed, 12 Aug 2026 06:46:36 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: fy15309206903@gmail.com
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] thunderbolt: Stop waiting on a path pending bit that
 never clears
Message-ID: <20260812044636.GL893316@black.igk.intel.com>
References: <20260812-b4-tb-pending-v2-v2-1-0667ee84c2d4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260812-b4-tb-pending-v2-v2-1-0667ee84c2d4@gmail.com>

Hi,

On Wed, Aug 12, 2026 at 01:21:52AM +0000, Fan Ye via B4 Relay wrote:
> From: Fan Ye <fy15309206903@gmail.com>
> 
> __tb_path_deactivate_hop() waits up to 500 ms for a hop's pending bit to
> read back clear. On an ASMedia ASM4242 host router the host interface
> adapter latches it once enough frames have gone through the DMA ring and
> never clears it again: the teardown finds it already set, seconds after
> the last frame and with the path still up. USB4 v2 table 8-23 has the
> field read only and zero unless packets belonging to the path are waiting
> to be dequeued, so the wait is right and this adapter is not.
> 
> Quirk those routers by hardware id and let a quirked adapter that has
> timed out once answer -ETIMEDOUT immediately from then on. Bringing the
> interface down then took 8 ms across 200 cycles, where unpatched it took
> 508 ms in 161 of 162, at an unchanged failure rate of about one per
> cycle.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Fan Ye <fy15309206903@gmail.com>
> ---
> Measured on two ASM4242 hosts wired to each other, hw_vendor_id 0x174c,
> hw_device_id 0x2428, NVM 200011.250708, on a base that already carries
> 68bf02b6b4ad.

I suppose there is not errata about this?

> Read before the teardown writes anything, path still up and the ring idle
> for seconds: at 200 frames it is clear in 5 of 5 rounds and the hop drains
> on the first read, at 260 it is set in 5 of 5 and the wait runs out. So it
> is set before the teardown starts rather than by it, and the clear case is
> why the flag is learned rather than taken from the quirk alone.
> 
> 5.4.1 has a connection manager wait tTeardown after the router sets the
> bit to 0b before making the path valid again. On an adapter where it
> never reads 0b there is no such point, patched or not.
> 
> v2:
> - Add the Assisted-by tag.
> - Answer the spec question from USB4 v2 table 8-23.
> - Return -ETIMEDOUT instead of 0; gate the flag on a 0x174c/0x2428 quirk.
> - Drop the ring-wrap claim.
> - Cut the text down.
> 
> v1: https://lore.kernel.org/linux-usb/20260809-b4-tb-teardown-v1-2-c88bbfe5c127@gmail.com/
> ---
>  drivers/thunderbolt/path.c   | 8 ++++++++
>  drivers/thunderbolt/quirks.c | 8 ++++++++
>  drivers/thunderbolt/tb.h     | 4 ++++
>  3 files changed, 20 insertions(+)
> 
> diff --git a/drivers/thunderbolt/path.c b/drivers/thunderbolt/path.c
> index b2c322e76b8a..5cf87b8af2b2 100644
> --- a/drivers/thunderbolt/path.c
> +++ b/drivers/thunderbolt/path.c
> @@ -397,6 +397,10 @@ static int __tb_path_deactivate_hop(struct tb_port *port, int hop_index,
>  	if (ret)
>  		return ret;
>  
> +	/* It never clears on this adapter, so the wait would time out again. */
> +	if (port->pending_stuck)
> +		return -ETIMEDOUT;

Instead of this, let's do it so that you introduce port->pp_timeout_msec
that gets initialized with 500. In the quirk_stuck_pending() you check for
the NHI adapter and then set that to 0. Here you just check that field and
if it is 0 then skip the wait.

I think that would be more "future" proof in case there will be other
issues like this on various vendor's adapters.

> +
>  	/* Wait until it is drained */
>  	timeout = ktime_add_ms(ktime_get(), 500);
>  	do {
> @@ -430,6 +434,10 @@ static int __tb_path_deactivate_hop(struct tb_port *port, int hop_index,
>  		usleep_range(10, 20);
>  	} while (ktime_before(ktime_get(), timeout));
>  
> +	/* Remember it only on an adapter known to latch it. */
> +	if (tb_port_is_nhi(port) && (port->sw->quirks & QUIRK_STUCK_PENDING))
> +		port->pending_stuck = true;
> +
>  	return -ETIMEDOUT;
>  }
>  
> diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c
> index 9f7914ac2f48..6ec90a85bbaf 100644
> --- a/drivers/thunderbolt/quirks.c
> +++ b/drivers/thunderbolt/quirks.c
> @@ -52,6 +52,12 @@ static void quirk_block_rpm_in_redrive(struct tb_switch *sw)
>  	tb_sw_dbg(sw, "preventing runtime PM in DP redrive mode\n");
>  }
>  
> +static void quirk_stuck_pending(struct tb_switch *sw)
> +{
> +	sw->quirks |= QUIRK_STUCK_PENDING;
> +	tb_sw_dbg(sw, "host interface adapter pending bit does not clear\n");
> +}
> +
>  struct tb_quirk {
>  	u16 hw_vendor_id;
>  	u16 hw_device_id;
> @@ -114,6 +120,8 @@ static const struct tb_quirk tb_quirks[] = {
>  	{ 0x0438, 0x0209, 0x0000, 0x0000, quirk_clx_disable },
>  	{ 0x0438, 0x020a, 0x0000, 0x0000, quirk_clx_disable },
>  	{ 0x0438, 0x020b, 0x0000, 0x0000, quirk_clx_disable },
> +	/* ASM4242 never clears the Pending Packets bit of its NHI adapter */
> +	{ 0x174c, 0x2428, 0x0000, 0x0000, quirk_stuck_pending },
>  };
>  
>  /**
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index ec9192b61bc0..00eb8d85755a 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -26,6 +26,8 @@
>  #define QUIRK_NO_CLX					BIT(1)
>  /* Need to keep power on while USB4 port is in redrive mode */
>  #define QUIRK_KEEP_POWER_IN_DP_REDRIVE			BIT(2)
> +/* Pending Packets bit of the host interface adapter never clears */
> +#define QUIRK_STUCK_PENDING				BIT(3)
>  
>  /**
>   * struct tb_nvm - Structure holding NVM information
> @@ -273,6 +275,7 @@ struct tb_bandwidth_group {
>   * @max_bw: Maximum possible bandwidth through this adapter if set to
>   *	    non-zero.
>   * @redrive: For DP IN, if true the adapter is in redrive mode.
> + * @pending_stuck: Pending bit did not clear, so it is not waited on again
>   *
>   * In USB4 terminology this structure represents an adapter (protocol or
>   * lane adapter).
> @@ -302,6 +305,7 @@ struct tb_port {
>  	struct list_head group_list;
>  	unsigned int max_bw;
>  	bool redrive;
> +	bool pending_stuck;
>  };
>  
>  /**
> 
> ---
> base-commit: f5bbbfec59b4e2fb7520a91de3df8a6174325d6a
> change-id: 20260812-b4-tb-pending-v2-78ebc7bb0f58
> 
> Best regards,
> --  
> Fan Ye <fy15309206903@gmail.com>
> 
