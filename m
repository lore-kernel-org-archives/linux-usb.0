Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795176012;
	b=ZYQcRkvb23HtZlpBObuGyKZ6uW+tCgG+kuh5+AL2+5MZwgUM/tHK+YoWMJWCoEIHz+e4
	 9GwpHbxPL2WILxmwG5LvpHvfM7Y/VSTf0/R12V7kGJqnwrQuSPZHut45Yo0Gf/DsQM646
	 zGdZfYexz5XwLOMC1wb9sOFnd0Ws8pHvjEPH9kA7g9CXMD8eENYRz0GG5HNQKnu94uER/
	 UGvEA2K2H4VcwVsTooBGmIxukI3hhFEvgbBk0mVi6ADBm5wr3WJO11xu+vk9JyF+Np1or
	 Bov0euNxrQ1RvFrmRFX7HNPPUd/8sO9ZwTDySfPgIJlwKP/WR60R/aTq8zfm/8pt8lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176012;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 Cc:Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:
	 X-CPGSPASS:X-Hop-Count:X-CMS-RootMailID:References;
	bh=qhuDN5r7dNlGv1DkcyJ7dXHBVH8J2xd2PMjal/DJB5s=;
	b=LQYjIFqrpUE9F9/7CJ9GR1Xr56XVN4BX3Ae8WPthUuhONydFRylboY+3/JR309xq5D7W
	 dzu0EDykFQFf4XztAqgXTnyAfZRiDbR0qLipIVEtQLTXQ/T41m+O0LaRAIQVAkUkX2/pV
	 YJKHEmRQPWwCB4oKz8Ow1JCFAhcWmgwM82wi+MfUfiMxsfWRbdTVI0K9XIgJyUh26kDPa
	 pyNz2heFcUTBlG87PrLhkwlcY6c5XSP9fU6WRWBKeh8K2H86dPeRgyuvBJYpdADoRCf8K
	 mr9rjUPlF3X9HQTEuHzLv4e0yIyqxtP+U7q27adKqcW6McMMCkAzw+Ijqr/ZOgoPxNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=JvKJ+JSZ;
	arc=none smtp.remote-ip=203.254.224.33
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E7E60A3802
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 12:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6E7E60A3802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=JvKJ+JSZ
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261120120003epoutp03e85d709a617b67430e863f1ec171af83~pvxBWB_f60309803098epoutp03a
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 12:00:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261120120003epoutp03e85d709a617b67430e863f1ec171af83~pvxBWB_f60309803098epoutp03a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795176003;
	bh=qhuDN5r7dNlGv1DkcyJ7dXHBVH8J2xd2PMjal/DJB5s=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=JvKJ+JSZAHNaO5CsA5Cu+OMMsoFad3gIZDFeaSqLAhLNOv0v5uO8U2fc2LW7qxiJl
	 pEaEdiR96bK7Wd2sdCcn0eTxkEiBbH7HQbYhViVJthQ9fVtNJH1H+n9VM60gfRjRbB
	 or6+XP6aTvZYR7/sW5cxWiQs6ripIweZNi3PO/tA=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20261120120003epcas5p3ac2e0d6836c0e3b29139ba0d281d044c~pvxBB8W2N1601216012epcas5p3B;
	Fri, 20 Nov 2026 12:00:02 +0000 (GMT)
Received: from epcpadp1new (unknown [182.195.40.141]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4jWDRQ6JFxz2SSKY; Fri, 20 Nov
	2026 12:00:02 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20261120104705epcas5p18cca7658f79ab1d7d341ef37cddd2a66~puxUh1u4F2462124621epcas5p1F;
	Fri, 20 Nov 2026 10:47:05 +0000 (GMT)
Received: from [107.122.5.186] (unknown [107.122.5.186]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261120104704epsmtip1bf0ac8b22dedf66b52d104cf251d9f9b~puxTbOJpv3161731617epsmtip1U;
	Fri, 20 Nov 2026 10:47:04 +0000 (GMT)
Message-ID: <360067785.01795176002867.JavaMail.epsvc@epcpadp1new>
Date: Fri, 20 Nov 2026 16:17:04 +0530
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
Subject: Re: [[RFT PATCH v2] 0/2] xhci: sideband: fix use-after-free of
 stale virt device pointer
To: Mathias Nyman <mathias.nyman@linux.intel.com>, quic_wcheng@quicinc.com,
	hulianqin@vivo.com, selvarasu.g@samsung.com
Cc: linux-usb@vger.kernel.org, cpgs@samsung.com, "alim.akhtar@samsung.com"
	<alim.akhtar@samsung.com>
Content-Language: en-US
From: Akash M/Akash M <akash.m5@samsung.com>
In-Reply-To: <20261119214841.1552318-1-mathias.nyman@linux.intel.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261120104705epcas5p18cca7658f79ab1d7d341ef37cddd2a66
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20261119214904epcas5p432ec8c5d6c3219c9434d64f210bca445
References: <CGME20261119214904epcas5p432ec8c5d6c3219c9434d64f210bca445@epcas5p4.samsung.com>
	<20261119214841.1552318-1-mathias.nyman@linux.intel.com>


On 11/20/2026 3:18 AM, Mathias Nyman wrote:
> Hi
>
> Second attempt.
> These two patches attempt to improve the disappearing vdev issue
> while sideband stays active.
>
> I don't have real harware to test this on so all review comments and
> feedback from testing is welcome.
Hi Mathias,

We tested USB Audio offload Playback and Capture, recursive 
Connect/Disconnect on Exynos Mobile platforms and its working fine. 
However its hard to reproduce the actual issue scenario where some 
Control Transfers fail and xHC is reset and so we didn't test the issue 
scenario.
Please feel free to add "Tested-by: Akash M <akash.m5@samsung.com>"

Regards,
Akash M
>
> There are still some gaps in how xhci driver uses locks when
> disabling slots and freeing vdev that is not part of this series
>
> changes since v1:
>
> - add missing sideband_to_vdev() check to xhci_sideband_create_interrupter()
> - fix ENOMEM return case in sideband_stop_endpoint_sync()
> - always clear sb->eps[ep_index] when removing an endpoint.
> - other minor changes
>
> Thanks
> Mathias
>
>
> Mathias Nyman (2):
>    xhci: sideband: avoid use-after-free of stale virt device pointer
>    xhci: sideband: check virt device under xhci lock when stopping
>      endpoints
>
>   drivers/usb/host/xhci-sideband.c  | 151 ++++++++++++++++++++++--------
>   drivers/usb/host/xhci.c           |  55 -----------
>   drivers/usb/host/xhci.h           |   2 -
>   include/linux/usb/xhci-sideband.h |   4 +-
>   4 files changed, 113 insertions(+), 99 deletions(-)
>

