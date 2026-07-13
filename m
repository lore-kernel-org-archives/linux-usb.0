Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391483B95E3;
	Mon, 13 Jul 2026 08:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783931924; cv=none; b=Wu4By6c8gx6TNGA/4zb1gr0R1tHXq4+f6JUQrorRXrX0uN0c4bLKhCvQ7WDaevpHIOdN7WJ+DYH9agTc2ro80zZ2KPjR26Y1k+gi19bNkgVCff0vOqwPLep2G0cwR+WFs5cwqXGnKxds8toVsYzGn4+VTIdWb2Tt6ZvN/LOnojo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783931924; c=relaxed/simple;
	bh=7cG6S9MhJ9zpLCdtXLh+U+02pOf6Oc0GG7FGEZS8UsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p1gZKmWfvNeh5rrh4Jdi8WOBB1NXxfENCWeGzS9CzC4ia5cVOKWQP6Z06BINv2sZIyy1O4t1YOXJZTaCjI+DqFxrV02yXsJVqzqENDHfqZ/tPKq6bv97sdLOc7eohlopnUYTTSoMOIC7a8fu9DefIMOqVVwStcEKK8GPHStj64I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dc0FA8+i; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dc0FA8+i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783931921; x=1815467921;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7cG6S9MhJ9zpLCdtXLh+U+02pOf6Oc0GG7FGEZS8UsQ=;
  b=dc0FA8+i75mos2nVBzr0Pvigx85aSnIBPY4IV5ScHmbK0gcWOvRSTOi9
   7vFgwvcN04TyjnOSl30/Ad9osXWWnyIkpLEQbVIxtYReMTcLH2W+OElHm
   CGj0K5MlfPPzlV3eJdWTwuFiQRJelCMYx+0EoMCk0/6J6/uuGO+Nv8tMw
   rYCnYh4e79FGH7hbo6kjxq+q1iWsDJ/5c5Mc6Y2f5p2Z2aBTcIwSrOi5j
   d0r9+SJF1na3idCUnxV41iqiUGK2SlYws6zM1mAJTRLxTvYyDtVaNnXLz
   GBaewYPj7+u+9BenLD0/ClL2sBrWwran49YZDBci8PqrUZIgtFoTGga6Q
   g==;
X-CSE-ConnectionGUID: u01NKof1Si2LemS9TuKRWQ==
X-CSE-MsgGUID: Fk4iecAGQ2qHokt55LPfIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84553774"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84553774"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 01:38:38 -0700
X-CSE-ConnectionGUID: EpACcAe2TPKYJlezxOimTw==
X-CSE-MsgGUID: bmWZIMFjSl6luiVI2oJmqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="285579055"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 13 Jul 2026 01:38:37 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 3CD9195; Mon, 13 Jul 2026 10:38:35 +0200 (CEST)
Date: Mon, 13 Jul 2026 11:38:33 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xu Yang <xu.yang_2@nxp.com>, Sean Rhodes <sean@starlabs.systems>,
	Kees Cook <kees@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: core: port: Deattach Type-C connector on component
 unbind
Message-ID: <alSkCazrPX8U_9t4@kuha>
References: <20260611071201.1235545-1-acelan.kao@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611071201.1235545-1-acelan.kao@canonical.com>

On Thu, Jun 11, 2026 at 03:12:01PM +0800, Chia-Lin Kao (AceLan) wrote:
> connector_unbind() is the mirror of connector_bind(), but it is missing
> the symmetric call to typec_deattach() that connector_bind() makes via:
> 
>     if (port_dev->child)
>         typec_attach(port_dev->connector, &port_dev->child->dev);
> 
> When a Thunderbolt dock is unplugged, two teardown paths race:
> 
> 1. The component framework calls connector_unbind() first, which sets
>    port_dev->connector = NULL without calling typec_deattach().  This
>    leaves port->usb2_dev/port->usb3_dev in struct typec_port pointing at
>    the USB device that is about to be freed.
> 
> 2. usb_disconnect() then calls typec_deattach(port_dev->connector, ...),
>    but port_dev->connector is already NULL, so the call is a no-op and
>    port->usb2_dev is never cleared.
> 
> 3. Concurrently, UCSI detects a PD partner-disconnect event and calls
>    typec_unregister_partner(), which reads port->usb2_dev (now a dangling
>    pointer to freed memory) and passes it to typec_partner_unlink_device()
>    -> sysfs_remove_link() -> dev_name() on the freed device, corrupting
>    the typec/UCSI partner state.
> 
> This corruption leaves the Thunderbolt tunnel in an inconsistent state on
> the next dock hot-plug.  On affected hardware the dock's I225/igc NIC fails
> to enumerate: AER fires a slot reset while the igc driver is still
> initialising ("PCIe link lost"), and the subsequent igc_reset attempt hits
> igc_rd32 on an already-detached device:
> 
>     igc 0000:2e:00.0 eth0: PCIe link lost, device now detached
>     igc: Failed to read reg 0x0!
>     WARNING: CPU: 9 PID: 129 at drivers/net/ethernet/intel/igc/igc_main.c:7005
>              igc_rd32+0xa4/0xc0 [igc]
>     Call Trace:
>      igc_disable_pcie_master+0x16/0xa0 [igc]
>      igc_reset_hw_base+0x14/0x170 [igc]
>      igc_reset+0x63/0x110 [igc]
>      igc_io_slot_reset+0x9e/0xd0 [igc]
>      report_slot_reset+0x5d/0xc0
>      pcie_do_recovery+0x209/0x400
>      aer_isr_one_error_type+0x235/0x430
>      aer_isr+0x4e/0x80
>      irq_thread+0xf4/0x1f0
> 
> 4. UCSI later handles the PD partner-disconnect and calls
>    typec_unregister_partner(), which still sees the stale port->usb2_dev
>    and tries to remove its sysfs link a second time:
> 
>    kernfs: can not remove 'typec', no directory
>    WARNING: CPU: 6 PID: 55 at fs/kernfs/dir.c:1706 kernfs_remove_by_name_ns+0xe9/0xf0
>    Workqueue: events ucsi_handle_connector_change [typec_ucsi]
>    Call Trace:
>     sysfs_remove_link+0x19/0x50
>     typec_unregister_partner+0x6e/0x120 [typec]
>     ucsi_unregister_partner+0x107/0x150 [typec_ucsi]
>     ucsi_handle_connector_change+0x3ec/0x490 [typec_ucsi]
>     process_one_work+0x18e/0x3e0
>     worker_thread+0x2e3/0x420
>     kthread+0x10a/0x230
>     ret_from_fork+0x121/0x140
>     ret_from_fork_asm+0x1a/0x30
> 
>    With worse timing the same stale pointer is dereferenced after the
>    backing memory is freed, turning the warning into a use-after-free.
> 
> Fix the asymmetry: call typec_deattach() before clearing
> port_dev->connector, matching what connector_bind() does on the bind side.
> typec_partner_deattach() is already protected by port->partner_link_lock,
> so it serialises safely with the concurrent typec_unregister_partner() path.
> 
> Fixes: 11110783f5ea ("usb: Inform the USB Type-C class about enumerated devices")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>

FWIW:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/core/port.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index b1364f0c384ce..b4452b665f591 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -740,6 +740,8 @@ static void connector_unbind(struct device *dev, struct device *connector, void
>  
>  	sysfs_remove_link(&connector->kobj, dev_name(dev));
>  	sysfs_remove_link(&dev->kobj, "connector");
> +	if (port_dev->child)
> +		typec_deattach(port_dev->connector, &port_dev->child->dev);
>  	port_dev->connector = NULL;
>  }
>  
> -- 
> 2.53.0
> 

-- 
heikki
