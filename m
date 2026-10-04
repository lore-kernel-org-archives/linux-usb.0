Received: from aib29aea146.syd1.oracleemaildelivery.com (aib29aea146.syd1.oracleemaildelivery.com [192.29.151.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1719B3B14B7
	for <linux-usb@vger.kernel.org>; Sun,  4 Oct 2026 01:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.29.151.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791077275; cv=none; b=sVuJMn+fSN6gIuRR8cPCgfK8mpbXKpquNlCdKt1E+BH+OXIkJ68AQF8oRAu0xLsbI5gZNzbSDIHwUMS1pH+sUAi6Vgh6TlXgC1GFACqmpn4tTMgQK6DL4Ne/Skpr8oSh0MV3KxA6q/G6Bk2TbeyImxXWu+geHF35GRvSScoRZcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791077275; c=relaxed/simple;
	bh=YHwjaGEXhooScUMhN4sjKblUiQTTIR+wIjD3ycbLnbQ=;
	h=Message-id:Date:MIME-version:Subject:To:Cc:References:From:
	 In-reply-to:Content-type; b=R6N4/JztJWFJKQGZ4gJCMOCbt4Xq3FX9ZVSdU/0runuU+sSXp2kKjc6vLV15JzfSfaFCB6ODLbLDpSTuqTFzAYr6OzOA1sGmge3z2r9T4qFQB8PwdnneRGE5ceF9IbG63F/HpT6lpTNnkoPkJe5YizHbZ550ZG4iHCLk+He3kpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=stevetech.au; spf=pass smtp.mailfrom=syd1.rp.oracleemaildelivery.com; dkim=pass (2048-bit key) header.d=stevetech.au header.i=@stevetech.au header.b=X7qdKG6M; dkim=pass (2048-bit key) header.d=syd1.rp.oracleemaildelivery.com header.i=@syd1.rp.oracleemaildelivery.com header.b=Qdcd3Fwc; arc=none smtp.client-ip=192.29.151.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=stevetech.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=syd1.rp.oracleemaildelivery.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stevetech.au header.i=@stevetech.au header.b="X7qdKG6M";
	dkim=pass (2048-bit key) header.d=syd1.rp.oracleemaildelivery.com header.i=@syd1.rp.oracleemaildelivery.com header.b="Qdcd3Fwc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oracle-2026;
 d=stevetech.au;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=kpjG6rYXPTe/tizbo7cfjo5Jk+SyMjAmc1fPSNDuai4=;
 b=X7qdKG6Mypjcp+mMkxenbH5+iyTrrnJXH0/rHiRDcPZhX6Ed+He5MgNT9toa7ZGxxYzzXIg4M9/w
   kCt/HCr1v9cpRXw0CyMG+mwlKU54L1iRmBxD6TWvdj1LkPqzcny04H/PDK9UUwZ3RRCl+C92nGKZ
   uffPu0cJO656THkw6A4f1eI6HmO+TP0PnI/UHn3OQQglS/TNfxHwvuUkzTNy+9Qv5/2/CSVT6XW0
   NvjVpgIUh4TlkZy2+PQGUX8LD1QnWIjM8c7ooKe6iwt9h0GcnQTVd3EP1Nv9X1zi3UaQH0kLy3Nd
   3kaJd8Bba6z7qSDe8Ne3BDDDn2QLlleMjG1ffA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-syd-20200122;
 d=syd1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=kpjG6rYXPTe/tizbo7cfjo5Jk+SyMjAmc1fPSNDuai4=;
 b=Qdcd3FwcRT64hTgqo+62kSn84jyv6jOpR5qsROpA6aZwcX1NyhikAKY7IyKXhmatdHqLmm6Y5sgq
   KvqxXxGxMuiSzgMO2Zqj+s8sJmqQOSAkCVqZyIfUGk4WPFRO3psJhojMxN3fcNtHspmWpkXqQsVO
   dytxnJXDFqs4sO0ldEo+pX6F2qkYmq1ynnFedPG860NrIJdQcL1sriJPj5z0GmDxT7btPH1CZqk9
   Na/cVHZPIUYpJcSZJUsBtz9/wBqLV9MGGu7howe8QuNTQS6VesPdWMQBV+W839Lw2Jl/SG/bTN3i
   1syuDC9AbMvjeWRGwziSSHso6cdOZR6SS8jkdQ==
Received: by omta-ad1-fd1-1402-ap-sydney-1.omtaad1.vcndpsyd.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20260817 64bit (built Aug 17
 2026))
 with ESMTPS id <0TMD1XHOM02GE4B0@omta-ad1-fd1-1402-ap-sydney-1.omtaad1.vcndpsyd.oraclevcn.com> for
 linux-usb@vger.kernel.org; Sun, 04 Oct 2026 01:27:52 +0000 (GMT)
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Message-id: <736f095c-d7d3-4023-a2c0-0b5fbb1baa78@stevetech.au>
Date: Sun, 4 Oct 2026 11:27:49 +1000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: xhci-pci: Add AMD 600 series to xhci-pci-prom21
To: Mirko Jechow <mirko.jechow@gmx.de>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Jihong Min <hurryman2212@gmail.com>
References: <20261004002731.49927-1-mirko.jechow@gmx.de>
From: Stephen Horvath <linux@stevetech.au>
Content-language: en-AU, en-US, en-GB
In-reply-to: <20261004002731.49927-1-mirko.jechow@gmx.de>
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 7bit
Reporting-Meta:
 AAHV7gL8JXoT6sfqXyJYFrulzXJdLpnzbDVduAssYr0JF2y5vo/IUbz12dA/L56G
 IrlTQ/k3MADBWKY+uIyCVcindxxYfs1QOPQMF+Vpz9z7M6m8WAD03gFri8HW+5x1
 0mh25z6uMUlBNzzl1mfgBxqweF29sSw+PZ4zVeuPkU+JBckzCnBAjNh95Oks4Vg3
 eb4qWLbCz+Jzy6wU8D9mGwl63DmKXDhhFqV8aoMneqjcSdw30OjKcEsN1sLltiQL
 qvHcKVozgJK6DJgdkuS/6l3PY2FP4QVU7mz/Rh5tqwdLAidSEO1QmDcD4SwOL/uE
 GFmS7pPEKHEqzSmLOInfjvUK3Y9tdPCm1kj63Q2Ji617NPgslPvIe2q7UeVkUrmN
 9pw131nEsX+wXDJz2CaK8kMnhu8CCy6Qg9WW/9KOBfMPh5Zycxx1abRRL81YEg==

Hi Mirko.

On 4/10/26 10:27, Mirko Jechow wrote:
> From: Stephen Horvath <linux@stevetech.au>
> 
> It seems the xhci-pci-prom21 module only has IDs for the 800 series
> chipsets. However, the 600 series chipsets also have Promontory 21
> chips, so we should add their IDs to the list as well.
> 
> I have tested this on my X670 board featuring DID `0x43f7`.
> 
> `1022:43f7` also appears on the PCI ID database
> (https://pci-ids.ucw.cz/read/PC/1022/43f7).
> Device IDs `0x43f9` (B665) & `0x43fa` (A620) were suggested by Shyam.
> 
> Also list the new IDs in Documentation/hwmon/prom21-xhci.rst.
> 
> Cc: stable@vger.kernel.org # 7.2.x
> Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Cc: Jihong Min <hurryman2212@gmail.com>
> Signed-off-by: Stephen Horvath <linux@stevetech.au>
> Tested-by: Mirko Jechow <mirko.jechow@gmx.de>
> [mirko.jechow@gmx.de: add new IDs to prom21-xhci.rst]
> Signed-off-by: Mirko Jechow <mirko.jechow@gmx.de>
> ---
> Changes in v3:
> - List the new IDs on the PCI IDs line of Documentation/hwmon/prom21-xhci.rst
>   (requested by Jihong Min)
> - Picked up from Stephen; v2 had no follow-up since 2026-08-23

Thanks for picking this up! Sorry I've been busy and forgot about this.

> - Link to v2: https://patch.msgid.link/20260820-xhci-pci-prom21-v2-1-638e5958fbbf@stevetech.au
> ---
>  Documentation/hwmon/prom21-xhci.rst | 2 +-
>  drivers/usb/host/xhci-pci-prom21.c  | 3 +++
>  drivers/usb/host/xhci-pci.c         | 3 +++
>  drivers/usb/host/xhci-pci.h         | 3 +++
>  4 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/prom21-xhci.rst b/Documentation/hwmon/prom21-xhci.rst
> index 7984fb187bd8a..6c0b6e7368921 100644
> --- a/Documentation/hwmon/prom21-xhci.rst
> +++ b/Documentation/hwmon/prom21-xhci.rst
> @@ -9,7 +9,7 @@ Supported chips:
>  
>      Prefix: 'prom21_xhci'
>  
> -    PCI IDs: 1022:43fc, 1022:43fd
> +    PCI IDs: 1022:43f7, 1022:43f9, 1022:43fa, 1022:43fc, 1022:43fd
>  
>  Author:
>  

Looks good to me!

Thanks,
Steve
