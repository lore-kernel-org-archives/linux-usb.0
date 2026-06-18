Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3875F3AE1A9;
	Thu, 18 Jun 2026 06:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781765784; cv=none; b=cGp/Oa2m8sULGQIu2lt6MD+baS2cdC+sW5aQkEtaLlezXoBTZ0egfA02CVUSN3FOIzA9rTFCKh9mr3QBK0eAO60eetVoSzOMPFAGmzJZ4c0W6G88yMTFzU6A87cwS19gDG5wpNEKYUaJ8X9cVinLo7F+pAd5734sSvJrvWsNEVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781765784; c=relaxed/simple;
	bh=eOkwncWRJZvV/pVYoxwzciXIbEsYagcDbAFTfTdeE7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P4lp4kF2u4bMaZVF8iHiNeEFkUnv8yFmHrZfH60V3LRjvXtQ5gi7uJLFNfV6R3M2ileTyYi9h/6zl9IG1mcbzIouvwDr+LrJQcpF9NjtV1rO2NKioFYEeEbFEEmZQTrHWhySUHPqv/C96ChJcB/t0ttmtgkLp4lK0BVwuGRgluk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EJ7Qy7lN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJ7Qy7lN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781765784; x=1813301784;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eOkwncWRJZvV/pVYoxwzciXIbEsYagcDbAFTfTdeE7M=;
  b=EJ7Qy7lNeQPyrJYxW9a3dUOj/0tb1njnTYS2mR2KS11EkxhfKUNcqt6a
   pWwhozd2TPqiQMxKvS7wLn3ojVyhoiuKLGKVYSC3RRI0Y9rUK3Xx41P5O
   1AcZlv85dAd5I5OGINEoSnHFyaMJpFw5ZFRii0OQmR8SmMyNrQkDKAc3n
   2D9Uv4Cf1026wl4tPL1B5bazTiVcZAPF/YNrmvNk7pfUbItT+EkcsKTaY
   KZwhIDMBjHaiQRXH7g7xmyYx31pyPExyZwBNejpU/BDjHaejXxF/SCSzH
   dUYujm6AgrnskPm01gy1JmCwSLrr0NiptcgeJ82TQ2IgD31n+PNYziHEM
   w==;
X-CSE-ConnectionGUID: VY3YLYa2Rlas8MUgEQSZKg==
X-CSE-MsgGUID: d+Kb1AyhS/uhciO5FQ2GYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="86505888"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="86505888"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 23:56:23 -0700
X-CSE-ConnectionGUID: XNI88FMVTc2bagX9GEi3Kw==
X-CSE-MsgGUID: Rk4WAd7tQYmdLGoRdMevjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="248373683"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.24])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 23:56:21 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9965011FAA5;
	Thu, 18 Jun 2026 09:56:20 +0300 (EEST)
Date: Thu, 18 Jun 2026 09:56:20 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Lixu Zhang <lixu.zhang@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: ljca: bound bank_num in ljca_enumerate_gpio()
Message-ID: <ajOWlN0RbjosG_Me@kekkonen.localdomain>
References: <178176358875.3352358.6059116660356914900@maoyixie.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178176358875.3352358.6059116660356914900@maoyixie.com>

Hi Maoyi,

Thanks for the patch.

On Thu, Jun 18, 2026 at 02:19:48PM +0800, Maoyi Xie wrote:
> ljca_enumerate_gpio() reads desc->bank_num from the device and loops
> valid_pin[i] = get_unaligned_le32(...) for i < bank_num. valid_pin[]
> holds only LJCA_MAX_GPIO_NUM / 32 = 2 entries.
> 
> Two checks run before the loop. The reply length must match
> struct_size(desc, bank_desc, bank_num). The product
> pins_per_bank * bank_num must not exceed LJCA_MAX_GPIO_NUM. Neither one
> bounds bank_num against the size of valid_pin[]. The reply is capped at
> LJCA_MAX_PAYLOAD_SIZE (60) bytes, so the struct_size check limits
> bank_num to 9. A device that reports bank_num 9 with pins_per_bank 7
> still passes both checks. gpio_num is 63 and the reply is 56 bytes. The
> loop then writes nine u32 into the two entry array and overruns
> valid_pin[] on the stack.
> 
> A broken or malicious LJCA device can therefore overflow the stack.
> Reject a bank_num that does not fit valid_pin[].
> 
> Fixes: acd6199f195d ("usb: Add support for Intel LJCA device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
> ---
>  drivers/usb/misc/usb-ljca.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
> index c60121faa3da..a1876c05b7c2 100644
> --- a/drivers/usb/misc/usb-ljca.c
> +++ b/drivers/usb/misc/usb-ljca.c
> @@ -596,6 +596,9 @@ static int ljca_enumerate_gpio(struct ljca_adapter *adap)
>  	if (gpio_num > LJCA_MAX_GPIO_NUM)
>  		return -EINVAL;
>  
> +	if (desc->bank_num > ARRAY_SIZE(valid_pin))
> +		return -EINVAL;
> +

This certainly does fix the problem but it looks like the code somehow
appears to assume desc->pins_per_bank is always 32. I guess that's ok as
it's been working in the past.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

>  	/* construct platform data */
>  	gpio_info = kzalloc_obj(*gpio_info);
>  	if (!gpio_info)

-- 
Kind regards,

Sakari Ailus
