Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE5D1AF4E9;
	Tue, 18 Aug 2026 04:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787027738; cv=none; b=SA8zEIeW+hkTi1LxbUqKsvaK2ULA5LKdc9FQ8xaAPgJZ60IfJ5GZSlFgmVVhI/VWCooqiSpDSZQIhqVJwL9r0zUDvwgsNd/ZMqOjd6K5tmVor3OFoflE6h00skgiXwzLAoHShteeCj4gy3himMxBoijWTc4vzgzGSsVx0QMqwFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787027738; c=relaxed/simple;
	bh=XauUetGDKFv4yLLNBFhfPUSeow9K47/K4OpAq0DZUwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hmut4ah4Y35c+QwE/quc+dnvS4DjhYoa51OmnP42AaOc7x5X59UPTlO9MWdCg6NpvbSiTIz+oaqnncrDRzZZKvZlj+ywFC92D7tIzmzORuliKKuveR1RwjECk1L/r/EeXjasVnNftUezQ8LNl0hkYO6013d5vKkCXXLcyDlb30Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XpZU8JbJ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XpZU8JbJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787027737; x=1818563737;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XauUetGDKFv4yLLNBFhfPUSeow9K47/K4OpAq0DZUwU=;
  b=XpZU8JbJJkoIJD8PBMvLCTmqDI82jd0EYTAnHkqoNCyw9uLZSlMondqV
   NpdXOrXYmt8QDFumUnbLTp40zYsiMuNEFlZ41Od4BQThugo62XL/Laf6D
   L5z6HcQnGD4Gzhpq47a7YcMIga++272+J4+f5obYousOaGokVhV7NMymv
   9ZY22MNQTP/K+Z+zt4zsg5oYkKnkZZCy27sPuPbkUtT8PtIMq5tS8vCyV
   O4fx9VE0JRGZjmswI56+/UaAoviczpvue99VeOUy7LRShXwjOk0QQmmvL
   /+YYZtCzsnPC33CjbFRuQy+NLx4Zu/WKZFe6noArCOEB2ajfrLCajSFfI
   g==;
X-CSE-ConnectionGUID: 65kwOWnMTNKQ6mjw59L11g==
X-CSE-MsgGUID: MdqMTnZuRxC0JDEtuKKQ3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87365388"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87365388"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 21:35:36 -0700
X-CSE-ConnectionGUID: NKxsUKdGQ2G2wYcVvmMD+Q==
X-CSE-MsgGUID: KEnaKyAGRMeh+o3pPKCVyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="265728698"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 17 Aug 2026 21:35:31 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 9B4E699; Tue, 18 Aug 2026 06:35:29 +0200 (CEST)
Date: Tue, 18 Aug 2026 06:35:29 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: Alexander Fischer <alexander.fischer@kait2en.org>,
	Andre Eikmeyer <andre@negmaster.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 3/3] thunderbolt: Add device links for Apple systems
 with Icelake thunderbolt
Message-ID: <20260818043529.GR893316@black.igk.intel.com>
References: <20260817101329.1517-1-atharvatiwarilinuxdev@gmail.com>
 <20260817101329.1517-4-atharvatiwarilinuxdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260817101329.1517-4-atharvatiwarilinuxdev@gmail.com>

On Mon, Aug 17, 2026 at 06:13:24AM -0400, Atharva Tiwari wrote:
> Ice Lake Thunderbolt NHI That are on some Macs. The NHI and its
> associated PCIe Root Ports all sit directly on the Root Complex
> with no upstream port. Identify the tunneled PCIe Root Ports by
> their PCI IDs and create device links back to the NHI so that
> PCIe tunnels can be re-established after sleep.
> 
> Tested-by: Alexander Fischer <alexander.fischer@kait2en.org>
> 
> Co-developed-by: Andre Eikmeyer <andre@negmaster.com>
> Signed-off-by: Andre Eikmeyer <andre@negmaster.com>
> 
> Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
> ---
>  drivers/thunderbolt/pci.c | 44 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
> index af3a7a9ba..8c0e40fb9 100644
> --- a/drivers/thunderbolt/pci.c
> +++ b/drivers/thunderbolt/pci.c
> @@ -492,6 +492,47 @@ static const struct tb_nhi_ops icl_nhi_ops = {
>  	.init_interrupts = nhi_pci_init_msi,
>  };
>  
> +static bool tb_pci_add_links_icl(struct pci_dev *nhi_pdev)
> +{
> +	struct pci_dev *pdev;
> +	const struct device_link *link;
> +	bool ret = false;
> +
> +	pci_lock_rescan_remove();

Same comment here.

Otherwise this series looks good to me.

> +	for_each_pci_bridge(pdev, nhi_pdev->bus) {
> +		if (!pci_is_pcie(pdev) ||
> +		    pci_pcie_type(pdev) != PCI_EXP_TYPE_ROOT_PORT)
> +			continue;
> +
> +		switch (pdev->device) {
> +		/* Ice Lake Thunderbolt 3 PCIe Root Ports */
> +		case 0x8a1d:
> +		case 0x8a1f:
> +		case 0x8a21:
> +		case 0x8a23:
> +			break;
> +		default:
> +			continue;
> +		}
> +
> +		link = device_link_add(&pdev->dev, &nhi_pdev->dev,
> +				       DL_FLAG_AUTOREMOVE_SUPPLIER |
> +				       DL_FLAG_PM_RUNTIME);
> +		if (link) {
> +			dev_dbg(&nhi_pdev->dev, "created link from %s\n",
> +				dev_name(&pdev->dev));
> +			ret = true;
> +		} else {
> +			dev_warn(&nhi_pdev->dev,
> +				 "device link creation from %s failed\n",
> +				 dev_name(&pdev->dev));
> +		}
> +	}
> +	pci_unlock_rescan_remove();
> +
> +	return ret;
> +}
> +
>  /*
>   * During suspend the Thunderbolt controller is reset and all PCIe
>   * tunnels are lost. The NHI driver will try to reestablish all tunnels
> @@ -514,6 +555,9 @@ bool tb_pci_add_links(struct tb_nhi *nhi)
>  	case PCI_DEVICE_ID_INTEL_TITAN_RIDGE_2C_NHI:
>  	case PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_NHI:
>  		return tb_pci_add_links_discrete(nhi_pdev);
> +	case PCI_DEVICE_ID_INTEL_ICL_NHI0:
> +	case PCI_DEVICE_ID_INTEL_ICL_NHI1:
> +		return tb_pci_add_links_icl(nhi_pdev);
>  	default:
>  		return false;
>  	}
> -- 
> 2.43.0
