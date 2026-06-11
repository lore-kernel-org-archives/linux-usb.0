Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223492E8DFC;
	Thu, 11 Jun 2026 13:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781186151; cv=none; b=bZ4f/ziv5a5jEv0okOK0+vFB0QGBgXKmIsbOC84rNnkIAuNpWVwLCCuEsyVz8+3K0YO239wtB7JXSZspOIFnIEgmr1ZR/m376XRgauKvxUsC2smmyn+K57YVrBrvjP/1sSiXNdcEWom0VhABqvr5FFckJqttVVfI88vO/qmKDmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781186151; c=relaxed/simple;
	bh=EnxDrq4p8ENTBpj36ABul0ldpJoa2X1u1aQtG/mA8gY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DK97Oct7j7RmuXGzcv7DNV1kr/xPiVfI0ObsBusEkdPYVzv0eAcWvI9M6zSkD3arbHG+Gn3FljpUEebWrUxjZjwFCewtK0csiqARoaCBbuxjkio+zuS12SyRbvlWT3qShxIzQC1L1yzaPN/biyeLXxuJ5PwSCksl0y+jTwgzPgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DpMF+uKQ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DpMF+uKQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781186149; x=1812722149;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EnxDrq4p8ENTBpj36ABul0ldpJoa2X1u1aQtG/mA8gY=;
  b=DpMF+uKQuvzoU17XWKyKJtN/YAiJQ9uYedWaPYshOEbvbqwxBTWsPz4n
   J9Ce/2Q8uu2QOIo/bzsoR5MnDmOX9Fm2STLwkDRH5ybSZ08GdzSWAhPpx
   kOqbV69fW2J64W4SkSthSfCvWQanYRBQLA42p7U8iW8+iyx9WruF9y5Al
   9tBW2CRNKWf2UgLtTq4Fnh4HduKvKAApEK52i6OhS8SxW1Q7Ix1p6a2qv
   IBJ7A6ktaXO68wF+WrfOMhpapx9e6xQTrwC9jvFUUdZWlYF6HSMv2zd7C
   PYmuI5tLV3fdN4zUAyLYNS5JShAyj5HAKFzK/GJDJWpcYPK4LpHdPgxUT
   Q==;
X-CSE-ConnectionGUID: zWqtyDZlRxesMGb+kvyI2Q==
X-CSE-MsgGUID: oFNu+0IQS3+tNj5aquaf9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85837729"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="85837729"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 06:55:47 -0700
X-CSE-ConnectionGUID: I+LDsFVYTxiwKvNRgMqewg==
X-CSE-MsgGUID: v8eP9DMdS3CiGpKjfc/Mpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="244041199"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.244.163]) ([10.245.244.163])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 06:55:45 -0700
Message-ID: <6162a0c6-9621-471b-b425-2f821cec6594@linux.intel.com>
Date: Thu, 11 Jun 2026 16:55:43 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] xhci: sideband: fix ring sg table pages leak
To: raoxu <raoxu@uniontech.com>, mathias.nyman@intel.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <37074E2036AAAC12+20260610093857.1427999-1-raoxu@uniontech.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <37074E2036AAAC12+20260610093857.1427999-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/10/26 12:38, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> xhci_ring_to_sgtable() allocates a temporary pages array and
> uses it to build the returned sg_table with
> sg_alloc_table_from_pages().
> 
> The error paths free the pages array, but the success path
> returns the sg_table without freeing it. This leaks the temporary
> array every time a sideband client gets an endpoint or event ring
> buffer.
> 
> Free the pages array after sg_alloc_table_from_pages() succeeds.
> The returned sg_table has its own scatterlist entries and does not
> depend on the temporary array after construction.
> 
> Fixes: de66754e9f80 ("xhci: sideband: add initial api to register a secondary interrupter entity")
> 
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> ---
>   drivers/usb/host/xhci-sideband.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
> index 23153e136d4b..a5deeee4d5dc 100644
> --- a/drivers/usb/host/xhci-sideband.c
> +++ b/drivers/usb/host/xhci-sideband.c
> @@ -58,6 +58,8 @@ xhci_ring_to_sgtable(struct xhci_sideband *sb, struct xhci_ring *ring)
>   	if (sg_alloc_table_from_pages(sgt, pages, n_pages, 0, sz, GFP_KERNEL))
>   		goto err;
> 
> +	kvfree(pages);
> +
>   	/*
>   	 * Save first segment dma address to sg dma_address field for the sideband
>   	 * client to have access to the IOVA of the ring.
> --
> 2.50.1
> 

Thanks

Adding to queue,
will send forward after 7.2-rc1

-Mathias

