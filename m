Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305135;
	b=CLCDp8OLSwv9503NI6XmgSPm2Qd1TwUjacUzvHIv6LOSubrUR3IftTkXjnfZHkbnsmXO
	 MaRDaGhjRQnJMJiB/NriE2briANil0j8knZhv9bqH2ijycvZhE6RgE3tfzMyTqHaelYNs
	 cM4yArWyF+lN2pj4T5pfjfZE+2g6eUKNdljhG/zJVWhLBXhDdDcHWnY9cGELwG7bGpXBU
	 hd0eKd/K0umKwXJiz9/Vnr6CqEQ8FpBpropS5rFs6N2jbcJrR2WLZ7+TuVrI1aR9i13ql
	 yA4kZLjCLFGobN/mDGmq0QALFehT8lsl2SG8I+pVXmmKbvAnV2Y9Pld3Qv5vompsq5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305135;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=/MPk/IHLj9YUuRC4y/TkjBA3QoUZr7IKXlDhn/QLQgA=;
	b=zJ5U3kbyj2F9JlCohx5dHS4A11NKHsqyxpeWl8FMdjEOudj9RCAQGQeGqW6w3u+6H7S3
	 eOnJG0UX7PInZg76/ZmgsphaKMlvagMYojAgfJyu2d9xL9SF6XEqOsHnuyu4R2YCuQZ8i
	 ZwyxuHi1DNiHz2ripFZXErhC6AEJzYDQy+sZ5LeixXn21jlPUJgyXcdYFn+QqYhPcjHIn
	 8xghZKM6Zwi0w0yP2MCKr5T0oqNCu7fFgrBMY2lMIVPowsuOkt/v0AFFY0kwFwy69xtQX
	 AQ2YPPAABZqb4+Sf94w938ASfjT/WZxS+RknT3tIslHw2Raiq6K38ioQ0pzF1PluuQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dw3VblbS;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601D1606A320
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 20:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 601D1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dw3VblbS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793305134; x=1824841134;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=kbzIDika+tNPlSvqY6hD0ac4vh2Bg/KCRIJ4cCXeQdc=;
  b=Dw3VblbSiUe/Mc+9uZHkVdCLXl64OuDttbLYqqEFbYb3ZrXabzm8P9uK
   wcPqspec0kT/m//wkyw/MoecoiJ8Puf6wXWYe2a6OoQyTSlm/dRxTI97s
   VXbiDtHRKgv04Z7cdbc0TtZHUHc1h0J+gWyl9aZcI2XMe3RYnTCVuMDIc
   TQezwzACZo6ep9KJRIrAmMdAwIM1KNs7Imj/S/sgebugYq2eembKkGRKN
   E0nf1IddeNg6L5cz1L2c3I8l7orM21XnD0fq45b/CcpipIVAGoPZ07GZe
   XmbDbyN0BZE+K5lRSXw6KopLxb8t11jD/YVc7C0xwzVnMDEpREC9UWYYC
   Q==;
X-CSE-ConnectionGUID: dJs6udcnTSKkhuIeR3sXDw==
X-CSE-MsgGUID: fRMqVi8bSeqtIQqlKCFSMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1956274"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="1956274"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 13:18:53 -0700
X-CSE-ConnectionGUID: ThJ6ZrCqQYOW4z6lBjE5Vw==
X-CSE-MsgGUID: kZTfTnqjScKXkywneg6K9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5601607"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.245.98]) ([10.245.245.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 13:18:52 -0700
Message-ID: <91a88d42-b814-4dd5-8544-c7f7501c8bc5@linux.intel.com>
Date: Thu, 29 Oct 2026 22:18:42 +0200
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
Subject: Re: [PATCH] xhci: give back TDs and clean up ep0 after disconnect
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev,
 michal.pecio@gmail.com, Yiyu Zhou <yiyu@yiyuzhou.io>,
 Dennis Wissel <dennis@dsine.de>
References: <20261029153910.569577-1-mathias.nyman@linux.intel.com>
 <2026102940-nuptials-stowing-44ee@gregkh>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <2026102940-nuptials-stowing-44ee@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/26 18:18, Greg KH wrote:
> Doesn't apply here, what was this against:
> 
> checking file drivers/usb/host/xhci-ring.c
> Hunk #2 succeeded at 963 (offset 7 lines).
> Hunk #3 FAILED at 1005.
> Hunk #4 succeeded at 1039 (offset 7 lines).
> Hunk #5 succeeded at 1092 (offset 7 lines).
> 1 out of 5 hunks FAILED
> checking file drivers/usb/host/xhci.c
> 
> thanks,

Ah, right, was on top of a couple other patches in my for-usb-linus
branch intended to be sent after rc1.

I'll send v2
Thanks
Mathias

