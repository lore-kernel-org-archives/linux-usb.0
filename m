Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795628015;
	b=UlHPoQKaHq9/z1bJOSdFfLo78fhYKeE9qkROoJbmY3r15pvnVleZmOg3e1rJE+upa2Wl
	 HugFXtuEjxSDLKvD2OPDGTO5WwefwAfYLhi/YCyaTSiiuKee1lBj1CZ+6TLkpo2Qct7KM
	 S61Dpae3vsLkOzLLUxwnOptEsmcT+bJSYfvRsHYB5SBrfYT5yF+qGDbdICuKWaxW0tjW2
	 PSJvOuQpF69A2kQ47TdTZRcz2UMdEAtiXDW1w5hucrDUMS88OQfUb/YvCIAW/bHK8sni5
	 MhF4F5F1jE+PlHjAH8fVFjGscMVy3rZP+dWyPkMIjhN2qK+GByqZKWS4/DxxLdndT7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628015;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=OiBn0Wt6m6tAQNkzVvaWdoUEd5R9/hTIpoZfFDJYAOw=;
	b=Uwmgy7TMGi+FK/VLhqIE4OmafsVoZmCN9xkyTJsIo3XUZDas7MY+MV7hxNejCpmEl3JC
	 1+ff3uOdWEM2OEE0lqRBZoJn2We/A89gNExZrs6AgiTGsJMMFANdrwb5aoectVrPYJ0JY
	 hw/9E6FQIth35U386NIbBDIV8jZuWcRc8y6lAktFeTdXBMFtni8KPnE5Hice/xWIobPiP
	 rgvURjOHEsI5pEayHJ0JP4exT/Qqp1YNlmagPxNad4JvQn9KLqDamtGo3/Xa2DxlEJiIu
	 z2KTA4JFOvAUaa7XaRQRRigHUtvFfWNrAmkXsnAOtAMUzUPLytmiITl4UBC27V7cOJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jKQysUPD;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628FF606A31E
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 17:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 628FF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jKQysUPD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795628014; x=1827164014;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=YKIPf4YuVXZCQJcEMBVu9zMzaV3dU7V+ZdlTVlOjFmQ=;
  b=jKQysUPD2fiIEQ2LYJ0uZAMa9YPGzdQgY/gKiS4FVoTRQ2IeIngw9gkZ
   GzPKoHHPxp29uXHJBNRMsSHyzWILa/76nI5V7TQhML00DrQLG4cYiNzQx
   A0zO+KMlZjIt7X4lLdQ8tGZTzXLKyKf+lvtbLkGaWy+VlHhFQDkeFNHJs
   KNi7qBZyayc0aF06/rA3K06uD3ZofG7rhXMYPc4bXKK0Mn4qear5mL08+
   EYVqlMt/EH0dPwtRYSchLz/8c6UYRSL+ZuMMVWSYxO2nKFDHnjT33G8jy
   3Zrjj4GdBOOeQOiobw9hSuFgUN+Ij/x+dj+LKIqoimej/u4hxX4EnMtrd
   w==;
X-CSE-ConnectionGUID: b+QZGjyfRCqIR/ZwSH11ow==
X-CSE-MsgGUID: YcNfrDIARE67tJ67aUF3xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4421647"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4421647"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 09:20:52 -0800
X-CSE-ConnectionGUID: GS/w4yj0RJa7fZZVdB09XA==
X-CSE-MsgGUID: HRb1ZsoxRjSrttSf4kfCVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="13954369"
Received: from inaky-mobl1.amr.corp.intel.com (HELO [10.245.244.80]) ([10.245.244.80])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 09:20:52 -0800
Message-ID: <d44c44a5-71ff-4b8d-bbd0-01b9b0a2226a@linux.intel.com>
Date: Wed, 25 Nov 2026 19:20:49 +0200
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/12] usb: xhci: tegra: Fix missing semi-colon
To: linux-usb@vger.kernel.org
References: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
 <20261116-tegra-usb-v2-5-42efc03a9700@nvidia.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20261116-tegra-usb-v2-5-42efc03a9700@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/16/26 17:24, Jon Hunter wrote:
> Commit 6d45e9556d4a ("usb: xhci: standardize multi bit-field macros")
> updated the Tegra XHCI driver replacing the HC_LENGTH() macro with the
> FIELD_GET() macro, but in doing so dropped the trailing semi-colon. This
> still compiled because the comma operator joined the assignment with the
> following polling expression. Replace the comma with a semicolon to make
> them separate statements.
> 
> Fixes: 6d45e9556d4a ("usb: xhci: standardize multi bit-field macros")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>   drivers/usb/host/xhci-tegra.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index 1a14aea58b0b..5fbb09d2a1ae 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -995,7 +995,7 @@ static int tegra_xusb_wait_for_falcon(struct tegra_xusb *tegra)
>   	u32 value;
>   
>   	cap_regs = tegra->regs;
> -	op_regs = tegra->regs + FIELD_GET(HC_LENGTH, readl(&cap_regs->hc_capbase)),
> +	op_regs = tegra->regs + FIELD_GET(HC_LENGTH, readl(&cap_regs->hc_capbase));
>   
>   	ret = readl_poll_timeout(&op_regs->status, value, !(value & STS_CNR), 1000, 200000);
>   
> 

I'm cherry picking this as a separate fix for usb-linus

Thanks
Mathias
