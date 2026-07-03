Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA433D091C;
	Fri,  3 Jul 2026 13:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783084453; cv=none; b=k01YhSHYR0JKjxYI5fCk8QL+oNRBrdbUfYDLOjGm6KrbOH0otMXpDlhugqHdKjewkj/FYgCQbTXtqzcGMlDo0z1L5pA7ze2UVvKoaLHNqliRy0L8R2+U+Rrs60V+BrX1wSEgwzxOrVMaRrxe45zmkkV4CQ4z3tFwMcGoHZZkycw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783084453; c=relaxed/simple;
	bh=cq5WOUm2x52bSri9HN9+Y25xTT2/5ZU2Yhhoab8NpJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTRf2Nbso0i4dmeWWp4+yfX0IeoV/zj/rlHo2v0F5x2yOlj86RyGXoB73V/u/PZzr+SZlmTShYrsUB7NkS63nRFVV1v7JsHni0rgmPlvfNDCrpDR+2znaaol+4Hbaf0L92Ktq8YiHVxZI/5kVxWr6OIws6c+eH2CFjXSbYhaivM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ebJnMO2y; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebJnMO2y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783084452; x=1814620452;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=cq5WOUm2x52bSri9HN9+Y25xTT2/5ZU2Yhhoab8NpJg=;
  b=ebJnMO2yFApidSD29t7OtBUNfXnFpfp/19E1PWUYI+g1Dmx1maeX+fTw
   kco7zITV8PiBBRoHrJ9NfvAzS7oX/ufuFHXSzp0czNyDQotamiLu2+8Bm
   rczsOKivFSkqwPWFk61pVTHkNU8BUS8S12O9u/spXUgZ4ZuPD8WgXU8Dz
   u2zBXh8nafA0NXBUc6+weo6Hk8NHj4IFgsxDZERPIMD7dKPRNVCF8TyXs
   JakdsvLeh5IcENGV5ULbDfYqnNZ55cU7ZK941IR7xB2C5dFx875dZAV+5
   dzZh0BXRqRAyB33ZkLdJ0UWYp4N2OSBiannOWNrpw+Frrn+DBfPcci7wX
   A==;
X-CSE-ConnectionGUID: 7LTSz7MESn+hRSff2fpHZA==
X-CSE-MsgGUID: AScV/3+VR9mmZdUh2hFMmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="109384353"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="109384353"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 06:14:11 -0700
X-CSE-ConnectionGUID: +Wtz5a92ThWHD2GSv/DeWw==
X-CSE-MsgGUID: rFtoWbmPSQyV0neMyEBtAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="255029742"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 03 Jul 2026 06:14:09 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 6FF4495; Fri, 03 Jul 2026 15:14:08 +0200 (CEST)
Date: Fri, 3 Jul 2026 16:14:06 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: class: do not pin the alt mode driver
 module
Message-ID: <ake1nru1TZS_lQ2O@kuha>
References: <20260701102831.34954-2-pmenzel@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260701102831.34954-2-pmenzel@molgen.mpg.de>

Hi Paul,

On Wed, Jul 01, 2026 at 12:28:26PM +0200, Paul Menzel wrote:
> Plugging or unplugging a USB-C dock on a Dell XPS 13 9370 running v7.1.1
> triggers a WARN splat and, on unplug, a module refcount underflow:
> 
>     WARNING: drivers/usb/typec/class.c:311 at typec_altmode_update_active+0x100/0x110 [typec]
>     Workqueue: USBC000:00-con3 ucsi_poll_worker [typec_ucsi]
>     Call Trace:
>      ucsi_altmode_update_active+0x101/0x1a0 [typec_ucsi]
>      ucsi_check_altmodes+0x92/0xd0 [typec_ucsi]
>      ucsi_poll_worker+0x3a/0x110 [typec_ucsi]
>   
>     WARNING: kernel/module/main.c:957 at module_put+0x96/0xa0
>     Workqueue: events ucsi_handle_connector_change [typec_ucsi]
>     Call Trace:
>      typec_altmode_update_active+0x6f/0x110 [typec]
>      typec_remove+0x85/0x90 [typec]
>      device_release_driver_internal+0x19e/0x200
>      ucsi_unregister_altmodes+0x49/0xb0 [typec_ucsi]
>      ucsi_unregister_partner+0x9e/0x160 [typec_ucsi]
>      ucsi_handle_connector_change+0x386/0x420 [typec_ucsi]
> 
> For a partner or plug alt mode, typec_altmode_update_active() takes a
> reference on the bound alt mode driver's module when the mode is entered
> and drops it when the mode is exited, to keep the driver from being
> unloaded while a mode is active.
> 
> That reference counting is unbalanced.  The get and put are keyed on
> adev->dev.driver, but the alt mode driver bind/unbind runs asynchronously
> and is not serialised against the active state changes issued by the UCSI
> poll and connector-change workers.  If the mode is reported active before
> the driver has bound, no reference is taken but adev->active is set, and
> the module_put() on unbind then underflows the refcount.  try_module_get()
> can also fail when the module is already going away.  These are the splats
> above, seen for years via Fedora ABRT on several Dell laptops.
> 
> The pin is not needed.  When the alt mode driver is unbound—including
> on module unload, which unbinds first—typec_remove() puts the mode back
> into TYPEC_STATE_SAFE, clears adev->active and adev->ops, and the driver's
> own remove callback drains its work (cancel_work_sync() in
> dp_altmode_remove()).  The mode is torn down cleanly without the extra
> module reference; all it ever bought was making rmmod of an alt mode
> driver fail with -EBUSY while a mode happened to be active.
> 
> Drop the module get/put instead of trying to balance it.

It looks like there is a bug in the UCSI driver. Before we go anywhere
with this one, please provide a fix for the UCSI driver where you make
sure that the reference count always gets balanced. Let's not hide
that issue with this patch before that.

As a side note, and as background, almost all Dell laptops seem to
have issues with EC firmware not generating all the UCSI events that
it should. That's why the "poll worker" was added to the UCSI driver
in the first place. The Dell laptops just don't report all the
connector state changes, especially related to alternate modes.

Dell should have been informed about the issue, but especially with
the older laptop's, I guess they are not willing to make any changes
anymore.

thanks,

> Fixes: 8a37d87d72f0 ("usb: typec: Bus type for alternate modes")
> Link: https://retrace.fedoraproject.org/faf/reports/542503/
> Link: https://retrace.fedoraproject.org/faf/reports/1278469/
> Assisted-by: Claude:claude-opus-4-8 [Claude Code]
> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
> ---
> Changes in v2 (addressing review from Greg Kroah-Hartman and the
> Sashiko automated review):
> - Drop the alt mode driver module reference counting entirely instead
>   of balancing it with a tracking flag; the unbind path already tears
>   the mode down safely, so the pin is unnecessary (Greg).
> - Drop the WARN_ON(), which could reboot panic_on_warn systems (Greg).
> - Drop the large explanatory comment (Greg).
> - No new struct altmode flag, so the unlocked-flag, wrong-module and
>   double-put concerns from the Sashiko review no longer apply.
> 
> v1: https://lore.kernel.org/linux-usb/20260701062417.15314-2-pmenzel@molgen.mpg.de/
> sashiko: https://sashiko.dev/#/patchset/20260701062417.15314-2-pmenzel%40molgen.mpg.de
>  drivers/usb/typec/class.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 0977581ad1b6e..ca19eb2a3c645 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -304,13 +304,6 @@ void typec_altmode_update_active(struct typec_altmode *adev, bool active)
>  	if (adev->active == active)
>  		return;
>  
> -	if (!is_typec_port(adev->dev.parent) && adev->dev.driver) {
> -		if (!active)
> -			module_put(adev->dev.driver->owner);
> -		else
> -			WARN_ON(!try_module_get(adev->dev.driver->owner));
> -	}
> -
>  	adev->active = active;
>  	snprintf(dir, sizeof(dir), "mode%d", adev->mode);
>  	sysfs_notify(&adev->dev.kobj, dir, "active");
> -- 
> 2.54.0

-- 
heikki
