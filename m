Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282882;
	b=E9orHHYC7QGPyKXs9roXTaAQfw3/f8uVfQfTU20YInGKD6tGNZREDrmZH4IL4v1gIKX1
	 ZPx3PgU05wbC+bfzjP4kppE37gdyUR1bck1ec7HNymDOjlN6kRkQbI/Prh6kAAxFckcVA
	 DTeDxx5vel9sQb4G6lcSdLjyeRCZ3MLaD7hyoWOI7etLykSgyp5z/Vcm764k6xd5OBitF
	 KXPqmmEu/8VIYLVbfiDd+ttq+4yvLwEGvU1T4MbOBwN2ubyqSJIGLlwHjL1WXOcYwXBFG
	 eH4sfaiJvT2gMWJ0pzgW03Y/Wk5/YzBaYm9ocuhi32ytA+ayh4nT/qfiaxnrVUw6fwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282882;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=C330faUMVQYWDsmJ7Xs/DHKfTAQZ6LHZarNknK5QYyA=;
	b=cgzsqKe+XdJi1qtLa6Mox9el7hQf2zVmEmOqVcz8C6ouzjXXViI8GD2qnDYQYi45YSGY
	 2SU4uh5SNtf+U6S4N3nH50BQrypF7o3hpdEDcEJ/H1nb0SDN8MVjsDVP71xpVXJUhH7QL
	 FFjtCvTHwslXgrmmrJ9ejbjoLctx+I8rsPNCWXw9j7khUo83cS391gS0i9YFhNoq4ChcX
	 BljN4ipwDE4smFwYkWfMdE9XW8nwzjznONtcYDQjm04nR10B7PvZD3W2ucgvRPJhs8o5S
	 2x1MJTnjMXVa2S6GA8qdYRAHmkrwGm+VfHIhm+v7ibGVWllje4XGYPJpAutB9G4fAUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b6eR0MYs;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8323D606A322
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 14:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8323D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b6eR0MYs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793282882; x=1824818882;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/gqe+sm+TBrqyhK9J782q/IEenkXHaGv93TeDfQK5hc=;
  b=b6eR0MYsBeZTfZK1YMSSilV20LBxXxQ6Ef3DdB2yxdHMBZYNSs7hI3Ne
   rv2cL7i6HO++kY8AMx6cqVK6hX4kjoGviYSs9cZeTq0x5bc5x+Mxr0gwU
   6saAPLOSvyoaX4hsGO2C4G/QP18+bUcAQhizhDK0srfsLsTtAr3Fu7cal
   65VwEfWEPocQ+l2E2/i3m8aN3PKozsV66PGykt6+Lq1ov28IfJverob/7
   hWctUluR5mnrN/ApqKFwonGKQV45UCVzFfLmruV5GdoiMeu6FJQY3JOSq
   7vIjDaUUiiArbXaOatxs1j1cJysRywxet8NPxE5Jh+pigyCd7nfQuI8ib
   g==;
X-CSE-ConnectionGUID: 4nX1bKzhR1C1y+YUeTR5/w==
X-CSE-MsgGUID: P1isr2n6TMS8Z1r53u8tkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2043098"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2043098"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 07:07:56 -0700
X-CSE-ConnectionGUID: NdwFWgNqRp+Qbujq2OFopA==
X-CSE-MsgGUID: 2HTsb7JsTrun9ClvMZzYUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5087999"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.245.98]) ([10.245.245.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 07:07:53 -0700
Message-ID: <93b6fb27-1300-4dcb-971e-0ec33b58539a@linux.intel.com>
Date: Thu, 29 Oct 2026 16:07:51 +0200
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
Subject: Re: [RFT PATCH 0/2] xhci: clean up endpoint rings after disconnect
 detect
To: Dennis Wissel <dennis@dsine.de>, yiyu@yiyuzhou.io
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev,
 diogochaves@me.com, michal.pecio@gmail.com, raoxu@uniontech.com,
 gregkh@linuxfoundation.org
References: <20261027184117.2461065-1-yiyu@yiyuzhou.io>
 <20261027192128.386082-1-mathias.nyman@linux.intel.com>
 <oKoY8F_0Rv-eBKI0YHyHcQ@dsine.de>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <oKoY8F_0Rv-eBKI0YHyHcQ@dsine.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> 
> In neither boot are there "not part of TD" messages or any stall (with
> 1f36cc9fa949 alone, hub_wq stalled from 4.97 s to 16 s). initrd takes
> 2.9-3.0 s, the same as v7.2.11.
> 
> One observation, probably not xhci related: in boot 2, interfaces 2
> and 3 failed their probe before the reset ("reading report descriptor
> failed") and stay unbound after the in-place reset, until the mouse is
> replugged. On v7.2 the device was re-enumerated instead, so all four
> interfaces ended up bound.
> 
> Tested-by: Dennis Wissel <dennis@dsine.de>
> 

Thanks for testing.

-Mathias


