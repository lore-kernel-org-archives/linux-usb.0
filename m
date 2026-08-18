Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CE1375F76;
	Tue, 18 Aug 2026 04:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787027670; cv=none; b=Fz9wrxjmV1rwXiAhaIRAi3FnDcrcUXKOjzNphQNOH5xicmSbbbgPpCrlkXKMvNDHU9pcbrr5VgG/Im+jLZUGzsPAcAV0ppNQPd5JIHMkfpnLQNDlGZGmJsKY5Puklwc6SMml3lS8Xlj0ieui4CcbFZTs1mg1pq13PHnMQZK6Mgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787027670; c=relaxed/simple;
	bh=A2R9TteVGvP4GJ5xmFiaiKseQnLYxH/5xPsuz0ECdfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n17SQTvv2BgySugIbtYOicfdV/1xyH3AhcUKl5axDk2+0WHyAXtNIsBguSuRzMamJx403HVbtWpFKX3PCEGIMUrrg08I9lTRKK97LzAPFszICzdqjLhhix5++txjC3Eu8JE59awASVGWnjenraPFES7+I7tj8kufi7XzzMpal4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iCpCtDrG; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iCpCtDrG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787027668; x=1818563668;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A2R9TteVGvP4GJ5xmFiaiKseQnLYxH/5xPsuz0ECdfc=;
  b=iCpCtDrG9g94rOVIzYfPFdR8NcNXu9xVGjLub61zJ7i+JlS6om+zKwq0
   4p/L6SVGo2YQfNFGiDUbtazQF2V5gL1GptSa8gHj38q3oXuvqYCTG7T/z
   fZvGi6/zN5Wf19Lswt9e6f2DiwM15owFRA0Tj1XYYpgJ/q1EFUk23yZuF
   V30wXnaidZbFt7DcE0BNwqkiO57TMBlM/+qS8mmvAc0+oMALqGL7W+8+H
   9+pMrd3ZbnPljMP05YKmuySm8AD04HcS38lPlogs+qZ9zppqk9JPpDv5Y
   w4do7PsiJQ8mC/tsoY8UaztQVSh0S09QrG1d0XLKvs5LwqgrwYArCx2TT
   w==;
X-CSE-ConnectionGUID: QtsYUaWVRWCJlzYd1YY7CA==
X-CSE-MsgGUID: dz4+hoXtQDmKhtKmERQS5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="113050586"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="113050586"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 21:34:27 -0700
X-CSE-ConnectionGUID: KUoqlbgARcyL7i16uL4J0g==
X-CSE-MsgGUID: 5JfaMVDmQMiMI6sESfZ2Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="264670816"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 17 Aug 2026 21:34:25 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id BC03399; Tue, 18 Aug 2026 06:34:24 +0200 (CEST)
Date: Tue, 18 Aug 2026 06:34:24 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/3] thunderbolt: Shift tb_apple_add_links to pci.c
Message-ID: <20260818043424.GQ893316@black.igk.intel.com>
References: <20260817101329.1517-1-atharvatiwarilinuxdev@gmail.com>
 <20260817101329.1517-2-atharvatiwarilinuxdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260817101329.1517-2-atharvatiwarilinuxdev@gmail.com>

On Mon, Aug 17, 2026 at 06:13:22AM -0400, Atharva Tiwari wrote:
> Shift tb_apple_add_links to pci.c as tb_apple_add_links calls
> pci functions.
> 
> Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
> ---
>  drivers/thunderbolt/pci.c | 73 +++++++++++++++++++++++++++++++++++++++
>  drivers/thunderbolt/tb.c  | 72 +-------------------------------------
>  drivers/thunderbolt/tb.h  |  1 +
>  3 files changed, 75 insertions(+), 71 deletions(-)
> 
> diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
> index bbd186c29..c3d5a36ab 100644
> --- a/drivers/thunderbolt/pci.c
> +++ b/drivers/thunderbolt/pci.c
> @@ -18,6 +18,7 @@
>  #include <linux/property.h>
>  #include <linux/string_helpers.h>
>  #include <linux/suspend.h>
> +#include <linux/platform_data/x86/apple.h>
>  
>  #include "nhi.h"
>  #include "nhi_regs.h"
> @@ -261,6 +262,53 @@ static const struct tb_nhi_ops pci_nhi_default_ops = {
>  	.init_interrupts = nhi_pci_init_msi,
>  };
>  
> +static bool tb_pci_add_links_discrete(struct pci_dev *nhi_pdev)
> +{
> +	struct pci_dev *pdev, *upstream = pci_upstream_bridge(nhi_pdev);
> +	bool ret = false;
> +
> +	while (upstream) {
> +		if (!pci_is_pcie(upstream))
> +			return false;
> +		if (pci_pcie_type(upstream) == PCI_EXP_TYPE_UPSTREAM)
> +			break;
> +		upstream = pci_upstream_bridge(upstream);
> +	}
> +
> +	if (!upstream)
> +		return false;
> +
> +	/*
> +	 * For each hotplug downstream port, create add device link
> +	 * back to NHI so that PCIe tunnels can be re-established after
> +	 * sleep.
> +	 */
> +	pci_lock_rescan_remove();

Is this really needed? We are not running any of the PCI rescan or removal
functionality, I would expect it is enough to hold the references during
this.

If this turns out to be needed please add a line to the commit message
explaining why it is needed.

> +	for_each_pci_bridge(pdev, upstream->subordinate) {
> +		const struct device_link *link;
> +
> +		if (!pci_is_pcie(pdev))
> +			continue;
> +		if (pci_pcie_type(pdev) != PCI_EXP_TYPE_DOWNSTREAM ||
> +		    !pdev->is_pciehp)
> +			continue;
> +
> +		link = device_link_add(&pdev->dev, &nhi_pdev->dev,
> +				       DL_FLAG_AUTOREMOVE_SUPPLIER |
> +				       DL_FLAG_PM_RUNTIME);
> +		if (link) {
> +			dev_dbg(&nhi_pdev->dev, "created link from %s\n",
> +				dev_name(&pdev->dev));
> +			ret = true;
> +		} else {
> +			dev_warn(&nhi_pdev->dev, "device link creation from %s failed\n",
> +				 dev_name(&pdev->dev));
> +		}
> +	}
> +	pci_unlock_rescan_remove();
> +
> +	return ret;
> +}
>  /* Ice Lake specific NHI operations */
>  
>  #define ICL_LC_MAILBOX_TIMEOUT	500 /* ms */
> @@ -444,6 +492,31 @@ static const struct tb_nhi_ops icl_nhi_ops = {
>  	.init_interrupts = nhi_pci_init_msi,
>  };
>  
> +/*
> + * During suspend the Thunderbolt controller is reset and all PCIe
> + * tunnels are lost. The NHI driver will try to reestablish all tunnels
> + * during resume. This adds device links between the tunneled PCIe
> + * downstream ports and the NHI so that the device core will make sure
> + * NHI is resumed first before the rest.
> + */
> +bool tb_pci_add_links(struct tb_nhi *nhi)
> +{
> +	struct pci_dev *nhi_pdev = to_pci_dev(nhi->dev);
> +
> +	if (!x86_apple_machine)
> +		return false;
> +
> +	switch (nhi_pdev->device) {
> +	case PCI_DEVICE_ID_INTEL_LIGHT_RIDGE:
> +	case PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C:
> +	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_NHI:
> +	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI:
> +		return tb_pci_add_links_discrete(nhi_pdev);
> +	default:
> +		return false;
> +	}
> +}
> +
>  static int nhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  {
>  	struct device *dev = &pdev->dev;
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index f43f2d952..9c2fc7ff1 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -10,7 +10,6 @@
>  #include <linux/errno.h>
>  #include <linux/delay.h>
>  #include <linux/pm_runtime.h>
> -#include <linux/platform_data/x86/apple.h>
>  
>  #include "tb.h"
>  #include "tb_regs.h"
> @@ -3302,75 +3301,6 @@ static const struct tb_cm_ops tb_cm_ops = {
>  	.disconnect_xdomain_paths = tb_disconnect_xdomain_paths,
>  };
>  
> -/*
> - * During suspend the Thunderbolt controller is reset and all PCIe
> - * tunnels are lost. The NHI driver will try to reestablish all tunnels
> - * during resume. This adds device links between the tunneled PCIe
> - * downstream ports and the NHI so that the device core will make sure
> - * NHI is resumed first before the rest.
> - */
> -static bool tb_apple_add_links(struct tb_nhi *nhi)
> -{
> -	struct pci_dev *nhi_pdev = to_pci_dev(nhi->dev);
> -	struct pci_dev *upstream, *pdev;
> -	bool ret;
> -
> -	if (!x86_apple_machine)
> -		return false;
> -
> -	switch (nhi_pdev->device) {
> -	case PCI_DEVICE_ID_INTEL_LIGHT_RIDGE:
> -	case PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C:
> -	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_NHI:
> -	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI:
> -		break;
> -	default:
> -		return false;
> -	}
> -
> -	upstream = pci_upstream_bridge(nhi_pdev);
> -	while (upstream) {
> -		if (!pci_is_pcie(upstream))
> -			return false;
> -		if (pci_pcie_type(upstream) == PCI_EXP_TYPE_UPSTREAM)
> -			break;
> -		upstream = pci_upstream_bridge(upstream);
> -	}
> -
> -	if (!upstream)
> -		return false;
> -
> -	/*
> -	 * For each hotplug downstream port, create add device link
> -	 * back to NHI so that PCIe tunnels can be re-established after
> -	 * sleep.
> -	 */
> -	ret = false;
> -	for_each_pci_bridge(pdev, upstream->subordinate) {
> -		const struct device_link *link;
> -
> -		if (!pci_is_pcie(pdev))
> -			continue;
> -		if (pci_pcie_type(pdev) != PCI_EXP_TYPE_DOWNSTREAM ||
> -		    !pdev->is_pciehp)
> -			continue;
> -
> -		link = device_link_add(&pdev->dev, nhi->dev,
> -				       DL_FLAG_AUTOREMOVE_SUPPLIER |
> -				       DL_FLAG_PM_RUNTIME);
> -		if (link) {
> -			dev_dbg(nhi->dev, "created link from %s\n",
> -				dev_name(&pdev->dev));
> -			ret = true;
> -		} else {
> -			dev_warn(nhi->dev, "device link creation from %s failed\n",
> -				 dev_name(&pdev->dev));
> -		}
> -	}
> -
> -	return ret;
> -}
> -
>  struct tb *tb_probe(struct tb_nhi *nhi)
>  {
>  	struct tb_cm *tcm;
> @@ -3400,7 +3330,7 @@ struct tb *tb_probe(struct tb_nhi *nhi)
>  	 * before the PCIe/USB stack is resumed so complain here if we
>  	 * found them missing.
>  	 */
> -	if (!tb_apple_add_links(nhi) && !tb_acpi_add_links(nhi))
> +	if (!tb_pci_add_links(nhi) && !tb_acpi_add_links(nhi))
>  		tb_warn(tb, "device links to tunneled native ports are missing!\n");
>  
>  	return tb;
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index ec9192b61..6a285fe7f 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -1506,6 +1506,7 @@ static inline bool usb4_port_device_is_offline(const struct usb4_port *usb4)
>  }
>  
>  void tb_check_quirks(struct tb_switch *sw);
> +bool tb_pci_add_links(struct tb_nhi *nhi);
>  
>  #ifdef CONFIG_ACPI
>  bool tb_acpi_add_links(struct tb_nhi *nhi);
> -- 
> 2.43.0
