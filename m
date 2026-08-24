Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2C740B10E;
	Mon, 24 Aug 2026 11:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787569892; cv=none; b=PDde/s5WIaeK+8Xmw/tnBap5u6vSmSqnoGtRkUPhvLFJvM4oJH+Zb9O0pmROpsapm5ywq+0wp93oTJNUFdtMVY6z1IDS3dXF4EPjcSC5Ux4Jfkt6Xv8GJIFO53JS2UqYZo9EerZMIlXIjV6Q4tGh6OUldEJkd41fPKsQ7qKRFqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787569892; c=relaxed/simple;
	bh=+tG4pu31H5xVvb6jM4fQ7Ch7Jv2e11Wy7ZfO3PfnW6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PXXRRziTkXyyqXNMyvqXi/IEVxRf9vdsO4v/4wPDApY9Uabu85Z09ZclkhjMXYklAaQEFdaRwGBpjjkGBCTWTOUsKt+9Md1zr93flfGmxmwJOSQzVGhux/Uv5UtTECnMUuZb60Fz+nTn0j+Nzp4FZJVSBVmv1+l1mkfD2KGAfag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gpzd4FxY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gpzd4FxY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787569890; x=1819105890;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+tG4pu31H5xVvb6jM4fQ7Ch7Jv2e11Wy7ZfO3PfnW6E=;
  b=gpzd4FxYqdqF6zZjT/qp58yoBsZSWzse1IdaYt5WSZc8uvxKVd4NY+9G
   43JJard5wvkabjbSWEmTbFuTkt0QSv+OqBAoz1zW91FunukZLGMoLSelH
   4SWUweeHJEJa9155K/nPL8Yl5/hKFNQBMiVegyjp1XrYvW+Wfri0XnXII
   7A0kDLoULI7+Zh5gtzp0EwULOD1tWHqziOliRA6nsTW2RI0ul5412pI9p
   EVTxT2DqFCcSwWD0oTZ0FdD1pm6XlVyx/iLsYehAGRbvcaW50GVhzZe7+
   RqZll64IzsuSMhPoDoJ2NCRkqHHpmTcY3ZAPU5+OnC+qU4i9X4JwRWlQE
   Q==;
X-CSE-ConnectionGUID: wkMyaOjVRAimaC1gjHVfiA==
X-CSE-MsgGUID: SQuSN6AnRy2+N+G1VMhDIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="87877711"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="87877711"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 04:11:30 -0700
X-CSE-ConnectionGUID: XbRj2YKRRi63mty0OVNtZA==
X-CSE-MsgGUID: MnPCSsbfSsWDscbIEDVv2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="296870508"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 24 Aug 2026 04:11:27 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id D24A599; Mon, 24 Aug 2026 13:11:25 +0200 (CEST)
Date: Mon, 24 Aug 2026 13:11:25 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sven Peter <sven@kernel.org>
Cc: Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tbt: Correct swapped TBT adapter type values
Message-ID: <aowm3TvXYnUv78FM@black.igk.intel.com>
References: <20260818-b4-tbt-legacy-fix-v1-1-797831e3df3f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818-b4-tbt-legacy-fix-v1-1-797831e3df3f@kernel.org>

On Tue, Aug 18, 2026 at 06:20:03PM +0200, Sven Peter wrote:
> Table F-10 of the USB Type-C Cable and Connector Specification R2.5 on
> page 412 defines bit 16 of the TBT3 Device Discover Mode VDO as 0 = TBT3
> Adapter and 1 = TBT2 Legacy Adapter. Linux has those two swapped since
> their original introduction in commit ca469c292edc ("usb: typec: Add
> definitions for Thunderbolt 3 Alternate Mode").
> 
> ChromiumOS EC's include/usb_pd_tbt.h has them the correct way around
> and references the USB Type-C ECN "Thunderbolt 3 Compatibility Updates"
> as fixing an error where they were originally swapped which is presumably
> where the wrong order originally came from.
> 
> I've also confirmed the correct mapping with an Apple Thunderbolt 3
> to Thunderbolt 2 adapter which does set bit 16 in that VDO.
> 
> Swap the two values and update all users. Also rename the old defines
> so that no user accidentally ends up with an inverted value.
> No functional change.
> 
> Link: https://usb.org/document-library/usb-type-cr-cable-and-connector-specification-release-25
> Link: https://chromium.googlesource.com/chromiumos/platform/ec/+/db93814b6e73c8545d23714fe0674c10814d901a/include/usb_pd_tbt.h#90
> Signed-off-by: Sven Peter <sven@kernel.org>

Shouldn't this be marked as a fix?

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> I ran into this when bringing up thunderbolt for Apple Silicon SoCs and
> was very confused why the condition for "tbt2 adapter" vs "tbt3 adapter"
> seemed to be backwards.
> I think the qcom pmic_glink_altmode.c actually has a bug there that was
> hidden and/or caused by the wrong values: It used to always set
> TBT_ADAPTER_TBT3 which sounds plausible but actually claims to be a
> legacy TBT2 adapter on the wire. I don't have the hardware or know the
> intention there though.
> The other users look correct to me since they just pass the value
> through.
> ---
>  drivers/platform/chrome/cros_ec_typec.c | 2 +-
>  drivers/soc/qcom/pmic_glink_altmode.c   | 2 +-
>  drivers/usb/typec/mux/intel_pmc_mux.c   | 2 +-
>  include/linux/usb/typec_tbt.h           | 4 ++--
>  4 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index c0806c562bb9..79968edc16ed 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -586,7 +586,7 @@ static int cros_typec_enable_tbt(struct cros_typec_data *typec,
>  	data.device_mode = TBT_MODE;
>  
>  	if (pd_ctrl->control_flags & USB_PD_CTRL_TBT_LEGACY_ADAPTER)
> -		data.device_mode = TBT_SET_ADAPTER(TBT_ADAPTER_TBT3);
> +		data.device_mode = TBT_SET_ADAPTER(TBT_ADAPTER_TYPE_TBT2_LEGACY);
>  
>  	/* Cable Discover Mode VDO */
>  	data.cable_mode = TBT_MODE;
> diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
> index 619bad2c27ee..8d4f54c160c5 100644
> --- a/drivers/soc/qcom/pmic_glink_altmode.c
> +++ b/drivers/soc/qcom/pmic_glink_altmode.c
> @@ -215,7 +215,7 @@ static void pmic_glink_altmode_enable_tbt(struct pmic_glink_altmode *altmode,
>  
>  	/* Device Discover Mode VDO */
>  	tbt_data.device_mode = TBT_MODE;
> -	tbt_data.device_mode |= TBT_SET_ADAPTER(TBT_ADAPTER_TBT3);
> +	tbt_data.device_mode |= TBT_SET_ADAPTER(TBT_ADAPTER_TYPE_TBT2_LEGACY);
>  
>  	/* Cable Discover Mode VDO */
>  	tbt_data.cable_mode = TBT_MODE;
> diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
> index 219a32da1348..b63114575a78 100644
> --- a/drivers/usb/typec/mux/intel_pmc_mux.c
> +++ b/drivers/usb/typec/mux/intel_pmc_mux.c
> @@ -346,7 +346,7 @@ pmc_usb_mux_tbt(struct pmc_usb_port *port, struct typec_mux_state *state)
>  	req.mode_data = (port->orientation - 1) << PMC_USB_ALTMODE_ORI_SHIFT;
>  	req.mode_data |= (port->role - 1) << PMC_USB_ALTMODE_UFP_SHIFT;
>  
> -	if (TBT_ADAPTER(data->device_mode) == TBT_ADAPTER_TBT3)
> +	if (TBT_ADAPTER(data->device_mode) == TBT_ADAPTER_TYPE_TBT2_LEGACY)
>  		req.mode_data |= PMC_USB_ALTMODE_TBT_TYPE;
>  
>  	if (data->cable_mode & TBT_CABLE_OPTICAL)
> diff --git a/include/linux/usb/typec_tbt.h b/include/linux/usb/typec_tbt.h
> index 0b570f1b8bc8..7bdf3795ae50 100644
> --- a/include/linux/usb/typec_tbt.h
> +++ b/include/linux/usb/typec_tbt.h
> @@ -27,8 +27,8 @@ struct typec_thunderbolt_data {
>  /* TBT3 Device Discover Mode VDO bits */
>  #define TBT_MODE			BIT(0)
>  #define TBT_ADAPTER(_vdo_)		FIELD_GET(BIT(16), _vdo_)
> -#define   TBT_ADAPTER_LEGACY		0
> -#define   TBT_ADAPTER_TBT3		1
> +#define   TBT_ADAPTER_TYPE_TBT3		0
> +#define   TBT_ADAPTER_TYPE_TBT2_LEGACY	1
>  #define TBT_INTEL_SPECIFIC_B0		BIT(26)
>  #define TBT_VENDOR_SPECIFIC_B0		BIT(30)
>  #define TBT_VENDOR_SPECIFIC_B1		BIT(31)
> 
> ---
> base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
> change-id: 20260818-b4-tbt-legacy-fix-d6e71ac4bb6a
> 
> Best regards,
> --  
> Sven Peter <sven@kernel.org>
> 

-- 
heikki
