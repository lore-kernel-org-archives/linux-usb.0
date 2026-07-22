Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAEA4749C6;
	Wed, 22 Jul 2026 16:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784736154; cv=none; b=ZbpuEPfd01wSJ1rbiw86wU0Rt2I4Z7BO6rc94W4mzMUqf+tGtWq4jFYR3ssdGdhWAy0XJcMVbVFS5uQtc5o/O5zDn0+tI3Dbo/YJfJXtKONQ1KTWaMAql2IFE+yjqVRSFTto+/VlcYZRb/1bHcnzJzkL2P8kCHUCz5aC1cHH8AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784736154; c=relaxed/simple;
	bh=gFPogyiES5hHGAcYy78tQAGv1pz20XnH2qEAWOjvMs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IovowaAZ3OeWWGPDGt0EW5QtjV9eH3k23C0ugYqz5KaRX6E0Y/eEIUQmwyjCduQxtyUzc5UaxZKiJpBUg6DpbInLr5CRNoGuJtp2QwGCI8AWWAD+EFOTsKonMaF0a+9sobK0vM1q1sMfiIp6gkb4ClufQGCczvnyBFX8ubSC1EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fKTsbV5W; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fKTsbV5W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784736153; x=1816272153;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gFPogyiES5hHGAcYy78tQAGv1pz20XnH2qEAWOjvMs0=;
  b=fKTsbV5W3cRHTroEnMaugFHZLLksa0IiiQJzCzyL4yTvaHisknqpkFCC
   U+ISB1FNyV+Pbj40ANlIDekqhg4XgA/P/iwYvP1aEBjql/o7xDuabQc4b
   5L4N+M0opatBNB0v2kqx8nE8kJlV8jKMEZmarAhhzeD0li/Ctm/k1R6sr
   SBXuOVCvM2k4MErtn9Yx3EI3w5luMFtLTGlZj8Su8gRfTq7AxdCrsJtrS
   ttoz13o6Jc81MT6PgXLcxCx0aJUAdymWr6GxKBNHGJC+k4R9DwcoDHljX
   LkVJ7rjAZvpZsNjXUzKqRdLTXqNSZrdoBHNtpJYEFn/WxxYQDqLc77mRA
   A==;
X-CSE-ConnectionGUID: hPNPJdK3TZ24UFm6zqi+eQ==
X-CSE-MsgGUID: 8ypoQ1NFR5+U6952lc67dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="108165699"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="108165699"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 09:02:33 -0700
X-CSE-ConnectionGUID: 0LZMj6S+QxG46jGfyUszPw==
X-CSE-MsgGUID: Nt7DjENgQNOoPXmdLeO8aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="261673506"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 22 Jul 2026 09:02:31 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id C30A398; Wed, 22 Jul 2026 18:02:29 +0200 (CEST)
Date: Wed, 22 Jul 2026 19:02:28 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Marco Tormento <mtormento80@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: core: deattach child device from typec connector on
 port unbind
Message-ID: <amDplMXaf1JpxE0v@kuha>
References: <20260721202201.27442-1-mtormento80@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721202201.27442-1-mtormento80@gmail.com>

On Tue, Jul 21, 2026 at 10:22:01PM +0200, Marco Tormento wrote:
> connector_bind() tells the Type-C connector about a port's already
> attached child via typec_attach(), but connector_unbind() has no
> mirror image: it drops port_dev->connector without deattaching a
> still-present child first. When that happens, port->usb2_dev (or
> usb3_dev) in the Type-C port is left pointing at a device that is
> about to be torn down, and typec_partner_deattach() never runs for
> it.
> 
> This shows up on hardware where a single Type-C connector's component
> aggregate spans ports on more than one USB root hub sharing an xHCI
> controller (e.g. a Thunderbolt-attached hub exposing both a USB-2 and
> a USB-3 root-hub port through the same connector). Unbinding the
> connector from one root hub's ports also unbinds it for the other's,
> even though the other root hub's child device is still attached and
> gets disconnected later, by which point the connector is already
> gone. The result is a "kernfs: can not remove 'typec', no directory"
> warning the first time, "sysfs: cannot create duplicate filename"
> the next time the device is reattached, and eventually a general
> protection fault in typec_unregister_partner() when it dereferences
> port->usb2_dev/usb3_dev after the device it points to has been freed.
> 
> Fix connector_unbind() to mirror connector_bind(): deattach the
> child from the connector before dropping the reference to it. This
> closes the race regardless of which order the parent USB controllers
> happen to be torn down in.
> 
> Reported on a Lenovo Thinkpad T480s (BenQ EX3501R monitor with an
> integrated USB hub, connected via the Thunderbolt-capable Type-C
> port, alongside a USB-C power delivery brick on the other Type-C
> port). Ran the reported plug/unplug sequence multiple times on that
> hardware with this patch applied and could not reproduce the failure;
> the same kernel build without the patch reproduced it on the first
> attempt. Supersedes an earlier attempt that reordered
> typec_deattach() in usb_disconnect() instead; that approach worked
> around the same race but only for one ordering of controller teardown,
> and inverted the normal teardown-mirrors-setup convention.
> 
> The original investigation, including the v1 patch and the hardware
> reproduction that led to identifying this bug, is my own work. The
> connector_unbind() fix approach below was proposed by Claude (Anthropic,
> Sonnet 5) during code review of the v1 patch. Hardware reproduction and
> validation of this fix were carried out by me, on the same hardware, per
> the note above.
> 
> Link: https://lore.kernel.org/r/20250720210847.30998-1-mtormento80@gmail.com
> 
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Marco Tormento <mtormento80@gmail.com>

There is already a fix for this:
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-linus&id=e0b291fe117964037e0ba382eff4bb365d531c3a

Thanks,

> ---
>  drivers/usb/core/port.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index b1364f0c384c..3b258246bb3f 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -738,6 +738,14 @@ static void connector_unbind(struct device *dev, struct device *connector, void
>  {
>  	struct usb_port *port_dev = to_usb_port(dev);
>  
> +	/*
> +	 * If a USB device is still connected to the port, let the
> +	 * Type-C connector know it's going away before we drop our
> +	 * reference to it.
> +	 */
> +	if (port_dev->child)
> +		typec_deattach(data, &port_dev->child->dev);
> +
>  	sysfs_remove_link(&connector->kobj, dev_name(dev));
>  	sysfs_remove_link(&dev->kobj, "connector");
>  	port_dev->connector = NULL;
> -- 
> 2.55.0

-- 
heikki
