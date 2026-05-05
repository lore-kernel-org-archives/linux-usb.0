Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF1E325491
	for <linux-usb@vger.kernel.org>; Tue,  5 May 2026 09:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777974839; cv=none; b=dBW1iN0oru3XtCwELgK3Mv0BIYWUDmHMoAY7sZnDDsd3F7yI+ULZ8S0c+B4zTlg9UzvqeLVKgSJaNs+6kNfeSQ+QMbPALDtXSDxxirfT0+xl+58xp1SdRZwd2xRExqEI++o8FdNQrF+pmU9ODTWtZjXlJ1+8CWJtfQj2mBji8bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777974839; c=relaxed/simple;
	bh=MC0wKJONXh2CnkofYYgvL/37beSQ/DGcd4wSx1sGyAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K8EcstmXgI0gBOmUj7eUDTY3uEwcJ1uWy2Ql5z4HwSCFecS9VSAjhGJuMg7NBUNOa7czZdHhB9nc2luEH39HW8Fs4Ijast8EneRhL+JZmC7CmJtbDBKt+MMxco6lYHugCzouiLJlhQbpgsR/o1tLX3skolriyxGS/ozuCLsevTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X2RWe8CZ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X2RWe8CZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777974839; x=1809510839;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MC0wKJONXh2CnkofYYgvL/37beSQ/DGcd4wSx1sGyAc=;
  b=X2RWe8CZB/HrWm/FdOIsSAubjPGE+aWkCciWEw7Ln1gPZseAbK8sZeEh
   IGY20N4xLfNjU6xggnKEmlguhK3c+q9Pla2xgHaKjiHP5RIfnfpOqNMNd
   nm+NKGiKS7O9dM0YxbSPh0s2Z8azloNWJtkfmR9FaLFNB8OpgkhpwGnie
   T/ao+DM/3eIWdg3Li3TnPukORhFpI5uD5uXquU3rC8wWXP5Cl91WW+TX9
   TKhVVicueZg583+HsicnuCQTRDDUStiI0WFcBoRcFHsWa/SfqEE4RCWPU
   KeN3Uu6l37VruS3zwFleONEyG00NJtMQyUG1SLLi/q+Uu09kCBJ2hoYKl
   g==;
X-CSE-ConnectionGUID: ZzGg17a7Sn+K+AxPxBu15g==
X-CSE-MsgGUID: +tSlgMVvS0SQTy6WkHLOuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="96268189"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="96268189"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 02:53:58 -0700
X-CSE-ConnectionGUID: BzHoU+0bS5iaS9KQ5XzEfw==
X-CSE-MsgGUID: WNAMf2cHQEKeTVbkP/A2OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="273918299"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.246.22.148]) ([10.246.22.148])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 02:53:56 -0700
Message-ID: <131c6e0f-59bc-4d41-9314-3539681f88e0@linux.intel.com>
Date: Tue, 5 May 2026 12:53:48 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] usb: xhci-pci: use the interrupter entry as MSI
 dev_id
To: raoxu <raoxu@uniontech.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 mathias.nyman@linux.intel.com, michal.pecio@gmail.com
References: <30A1A28C68CF9D88+20260430063849.1721157-1-raoxu@uniontech.com>
 <85CC13362072C2B0+20260430064208.1725201-1-raoxu@uniontech.com>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <85CC13362072C2B0+20260430064208.1725201-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 30/04/2026 9.42, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> After routing xhci_msi_irq() through xhci_interrupter, PCI
> MSI setup still registers the primary vector with usb_hcd as
> the request_irq() dev_id.
> 
> Use &xhci->interrupters[0] instead, pass the same dev_id to
> free_irq(), and release the IRQ before xhci_stop() tears
> down the interrupter array.
> 
...
> 
> @@ -225,10 +225,10 @@ static void xhci_pci_stop(struct usb_hcd *hcd)
>  {
>  	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
> 
> -	xhci_stop(hcd);
> -
>  	if (usb_hcd_is_primary_hcd(hcd))
>  		xhci_cleanup_msix(xhci);
> +
> +	xhci_stop(hcd);

Won't this now free the MSI-X interrupt before it has been disabled?

Best Regards,
Niklas

>  }
> 
>  /* called after powerup, by probe or system-pm "wakeup" */
> --
> 2.50.1
> 

