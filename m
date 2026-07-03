Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565AF414DFC;
	Fri,  3 Jul 2026 15:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092159; cv=none; b=ciu1JNmophnfkh2Mu/JsW3EDbVi07sRy+cagxYXCG7Z29PXtCo6AAh82cwSEox3cG/vtEUp1IjH+kYjbdXG9odWtWmdVs1g9M3mHns0AJRnkWjoeiMPu+V+qW/HzRSuFGbBQC6qrW0PYaWRLEX6TF3iXeEtgv46G1CxCuPoDmss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092159; c=relaxed/simple;
	bh=mifQ3knrrweCevy9ZqJFU7cSpzv74aCJ+gfDtNVLkXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCLxsv0/uRVMBZs/+YxrKLridf7BJN9Z1bSEESboU7S2CDDv5FzKjAnyasVhSdywD1KfDqG3UiX7Xrn80aWZ/iWkFctGYhCrLjz+FDs0AnOBKcffXwhpVAjOInARaVt+oE/lSFIEg9W4mTElQwkfGei/oH1HrJIvfrxbbMYhE58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PvAznwn1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PvAznwn1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092157; x=1814628157;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mifQ3knrrweCevy9ZqJFU7cSpzv74aCJ+gfDtNVLkXw=;
  b=PvAznwn1mlO42ql8ZlY1NOMZ8XnIS5OGgve7fdEmKwWtrzFz8bbJosnO
   DOgAWD//OmxaZl9sVVr1PJ9tQjF/bSSdA2AeDXiJlIVj0ZEyZ47tAi/GQ
   FH3/UCbq08bRtsudJbCUFskQiMX6sVucYF1BKzucAASre4H5d2HWd1xfH
   EnOokvbUtPWCrTZa8DneVbzBzQcld5D8f6Lsbgo0a1IvNDZJ7oGJfNHgn
   tRquKUMDrH0WmdYuoMGXZGXKTT6juDNFQA6EwIJeJ2S0Su8hWUgwKsaHr
   TeUlFgIqyfC64mipLyEr+hA3IDeTy5LfAXFIi9RE1OKF/yMHJvPVVUPXW
   w==;
X-CSE-ConnectionGUID: iNbsLkf4R36MwqT8Iu/tzg==
X-CSE-MsgGUID: mHjaaM/VTJCqmkCNj7+f/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="95223492"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="95223492"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:22:37 -0700
X-CSE-ConnectionGUID: ABi+YekxSQa7s20I2V+aKw==
X-CSE-MsgGUID: xY7vJOa4RYKcOjXiM6znZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="291284177"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 03 Jul 2026 08:22:36 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id EE9FF95; Fri, 03 Jul 2026 17:22:33 +0200 (CEST)
Date: Fri, 3 Jul 2026 18:22:32 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: cancel pending work on system suspend
Message-ID: <akfTuNd4laqsMW6g@kuha>
References: <20260703110738.8457-2-pmenzel@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703110738.8457-2-pmenzel@molgen.mpg.de>

On Fri, Jul 03, 2026 at 01:07:37PM +0200, Paul Menzel wrote:
> On a Dell XPS 13 9360 (BIOS 2.21.0), entering system suspend (deep/S3)
> races a pending UCSI connector-change worker against the ACPI EC teardown.
> The worker evaluates the UCSI _DSM (GET_CONNECTOR_STATUS), whose AML
> accesses the Embedded Controller. By that point the ACPI EC has already
> been stopped for suspend, so the EC address space handler rejects the
> access with AE_BAD_PARAMETER, aborting the AML and failing the connector
> query:
> 
>     [22314.689495] ACPI: EC: interrupt blocked
>     [22314.711981] ACPI: PM: Preparing to enter system sleep state S3
>     [22314.743260] ACPI: EC: event blocked
>     [22314.743265] ACPI: EC: EC stopped
>     [22314.743267] ACPI: PM: Saving platform NVS memory
>     [22314.744241] ACPI Error: AE_BAD_PARAMETER, Returned by Handler for [EmbeddedControl] (20260408/evregion-303)
>     [22314.744432] ACPI Error: Aborting method \_SB.PCI0.LPCB.ECDV.ECW1 due to previous error (AE_BAD_PARAMETER) (20260408/psparse-543)
>     [22314.744673] ACPI Error: Aborting method \ECWB due to previous error (AE_BAD_PARAMETER) (20260408/psparse-543)
>     [22314.745201] ACPI Error: Aborting method \_SB.UBTC._DSM due to previous error (AE_BAD_PARAMETER) (20260408/psparse-543)
>     [22314.745394] ACPI: \_SB_.UBTC: failed to evaluate _DSM c298836f-a47c-e411-ad36-631042b5008f rev:1 func:1 (0x1001)
>     [22314.745414] ucsi_acpi USBC000:00: ucsi_acpi_dsm: failed to evaluate _DSM 1
>     [22314.745424] ucsi_acpi USBC000:00: ucsi_handle_connector_change: GET_CONNECTOR_STATUS failed (-5)
> 
> ucsi_acpi implements a resume callback but no suspend callback, so nothing
> cancels the connector-change work before the firmware/EC is torn down.
> 
> Add a `ucsi_suspend()` core helper that cancels the pending init and
> connector-change work, and wire it into ucsi_acpi's PM ops. The connector
> state is re-read on resume by `ucsi_resume()`, so cancelling the work loses
> nothing.
> 
> Fixes: 4e3a50293c2b ("usb: typec: ucsi: acpi: Implement resume callback")
> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Assisted-by: Claude Opus 4.8

No Cc stable? Otherwise this is okay by me:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Thanks,

> ---
>  drivers/usb/typec/ucsi/ucsi.c      | 20 ++++++++++++++++++++
>  drivers/usb/typec/ucsi/ucsi.h      |  1 +
>  drivers/usb/typec/ucsi/ucsi_acpi.c | 10 +++++++++-
>  3 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 92166a3725b16..6a6723e8fb127 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -2017,6 +2017,26 @@ static void ucsi_resume_work(struct work_struct *work)
>  	}
>  }
>  
> +int ucsi_suspend(struct ucsi *ucsi)
> +{
> +	int i;
> +
> +	/*
> +	 * Cancel pending work so it cannot access the firmware after the ACPI
> +	 * EC is stopped for suspend; state is re-read on resume.
> +	 */
> +	cancel_delayed_work_sync(&ucsi->work);
> +
> +	if (!ucsi->connector)
> +		return 0;
> +
> +	for (i = 0; i < ucsi->cap.num_connectors; i++)
> +		cancel_work_sync(&ucsi->connector[i].work);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(ucsi_suspend);
> +
>  int ucsi_resume(struct ucsi *ucsi)
>  {
>  	if (ucsi->connector)
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index 325ed1e5ca804..6e1608d88ec3d 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -582,6 +582,7 @@ int ucsi_write_message_out_command(struct ucsi *ucsi, u64 command,
>  				   void *msg_out, size_t msg_out_size);
>  
>  void ucsi_altmode_update_active(struct ucsi_connector *con);
> +int ucsi_suspend(struct ucsi *ucsi);
>  int ucsi_resume(struct ucsi *ucsi);
>  
>  void ucsi_notify_common(struct ucsi *ucsi, u32 cci);
> diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
> index 60b12961e1a47..18286d3e9cc59 100644
> --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> @@ -263,6 +263,13 @@ static void ucsi_acpi_remove(struct platform_device *pdev)
>  				   ucsi_acpi_notify);
>  }
>  
> +static int ucsi_acpi_suspend(struct device *dev)
> +{
> +	struct ucsi_acpi *ua = dev_get_drvdata(dev);
> +
> +	return ucsi_suspend(ua->ucsi);
> +}
> +
>  static int ucsi_acpi_resume(struct device *dev)
>  {
>  	struct ucsi_acpi *ua = dev_get_drvdata(dev);
> @@ -270,7 +277,8 @@ static int ucsi_acpi_resume(struct device *dev)
>  	return ucsi_resume(ua->ucsi);
>  }
>  
> -static DEFINE_SIMPLE_DEV_PM_OPS(ucsi_acpi_pm_ops, NULL, ucsi_acpi_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(ucsi_acpi_pm_ops, ucsi_acpi_suspend,
> +				ucsi_acpi_resume);
>  
>  static const struct acpi_device_id ucsi_acpi_match[] = {
>  	{ "PNP0CA0", 0 },
> -- 
> 2.54.0

-- 
heikki
