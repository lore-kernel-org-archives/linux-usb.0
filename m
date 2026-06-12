Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B3F390CB2;
	Fri, 12 Jun 2026 15:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781276884; cv=none; b=XpQW1dpvbDWpfaKg10JexI5L4IckEKi5C8Enu5ZWXPlmaqU9bd58I8ECVZyZ83UGkf7574hSi0mRe/X7tBt24l5ps8Nuo2dOdloPuZMxYRPz5/z4jkZCxgHIjlYO3aymXQvSV05++iGfMfnL+aT1FhOkam7Ag/GoJseeZUl8TZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781276884; c=relaxed/simple;
	bh=QlMFAxvpsTDRN12jhXMio0N/ZzuqymHcsNmjTcXjmUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RLC/fXbjY+g0Zz+cZyJXewL43vUEGmWykuVypesS/2JyP6RGouYylqWug7Gn622tEiXrIa0KPZAbv5tTNLIz2qsZR/il4UO86/8AYczxi/HcUYBVClJA7+gQK9FHyHZ47bZ/qk+kYtuwNc/yuj1X0hyGQDWYh8OZ87YJND4vAUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HuTMWuJW; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HuTMWuJW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781276881; x=1812812881;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QlMFAxvpsTDRN12jhXMio0N/ZzuqymHcsNmjTcXjmUw=;
  b=HuTMWuJWvbjJdFdQg+scpv8595qdYoYBZPBnz3s9UOscRM/Eb72M8s13
   7RW/abo1oE++n2hMGGpBEwAbmab7ALEbIO3LYIBprJO2bOarmmElujtrU
   Gtcq73v0qWMDF8ouEFiWi4+YsLBVX5juJLIWTNdQzjJdwTyAuwHfBUKyg
   /1CQl4+sFHgPy2kF7kKILZHs6aAUiRQEld+2mo7NKAJjG071rRzscmy3o
   ntU4XX/rJW91HQ3iYI++QnCYrLGko8L5xktRmzQZS5MurO/YOT0uoNHcV
   beSbZKWIvkixZQle3LFIRlQE++zPvn7n6CzNkcFoGFw9n5q0uCUBoCbOB
   A==;
X-CSE-ConnectionGUID: 3+rrNDe4RRSyLQshBIueBg==
X-CSE-MsgGUID: 4ab1NPoiSUat739nanb6vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="84676915"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="84676915"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 08:07:59 -0700
X-CSE-ConnectionGUID: MdETiqxXSSOsgAJJNWIjRA==
X-CSE-MsgGUID: W8JkBSTJScWlgs2kdGEsyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="246870070"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.103]) ([10.245.245.103])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 08:07:59 -0700
Message-ID: <b414b7dc-8069-47a4-846d-a759d19a4d4a@linux.intel.com>
Date: Fri, 12 Jun 2026 18:07:56 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: xhci: Fix sleep in atomic context in
 xhci_free_streams()
To: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michal Pecio <michal.pecio@gmail.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <TYUPR06MB621752A5E7444AC7818D9F71D2182@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <TYUPR06MB621752A5E7444AC7818D9F71D2182@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/12/26 09:29, 胡连勤 wrote:
> When a USB device with active stream endpoints is disconnected,
> xhci_free_streams() is called from the hub_event workqueue to
> free the stream resources.  It calls xhci_free_stream_info()
> while holding xhci->lock with irqs disabled.
> 
> xhci_free_stream_info() invokes xhci_free_stream_ctx(), which
> calls dma_free_coherent() for large stream context arrays.
> 
> dma_free_coherent() can sleep (e.g. via vunmap), triggering
> a BUG when called from atomic context.
> 
> Call trace:
>   dma_free_attrs+0x174/0x220
>   xhci_free_stream_info+0xd0/0x11c
>   xhci_free_streams+0x278/0x37c
>   usb_free_streams+0x98/0xc0
>   usb_unbind_interface+0x1b8/0x2f8
>   device_release_driver_internal+0x1d4/0x2cc
>   device_release_driver+0x18/0x28
>   bus_remove_device+0x160/0x1a4
>   device_del+0x1ec/0x350
>   usb_disable_device+0x98/0x214
>   usb_disconnect+0xf0/0x35c
>   hub_event+0xab4/0x19ec
>   process_one_work+0x278/0x63c
> 
> Fix this by saving the stream_info pointers and clearing the
> ep references under the lock, then calling xhci_free_stream_info()
> outside the lock where sleeping is allowed.
> 
> Fixes: 8df75f42f8e6 ("USB: xhci: Add memory allocation for USB3 bulk streams.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>


Applied, needed some manual work

Line endings (CR/CRLF) of this patch got mangled somewhere on the way (mail client?).

Checkpatch also complained about "From" and "Signed-off-by" mismatch.
胡连勤 != Lianqin Hu according to script, But this can probably be ignored

Thanks
Mathias

