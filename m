Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E052288D5;
	Tue, 23 Jun 2026 10:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.40.148.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209044; cv=none; b=Y8Qlowhjk4C8VOwdXvVhEgzgxxcMAkKoh2WMESflAZ6JO+kx7FKM3bJSKZaMuF2eKfYPP/BXXoiCkm7Shud/kuSpyd8UHzOl2XCE0UenY1kjFiux4k0H8E7wROyfiZ1MCeHw4VIRcFot8/i7F7Y3+UR3KglRu0wA7yIftDNHHR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209044; c=relaxed/simple;
	bh=1Rl17cJnNeSFgBH/9ul8gtNWPc1XvazerQHH/SR1xmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FiAriic0FGAjtAkz13b2e3egvDKaotNY19wLgyJBEoBCB+Huss3qGprVInLEw//YqT+I3pd+fQeoMMHG2pQLH/RKUuyNLFCqbgzX2yFodjziGKpCgHi2HQN+6O3eOyI+4rDfbvIYd6M0W8uSHle78eC6EQoSwZn+eeEsTAV3j8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=B8hxCClD; arc=none smtp.client-ip=78.40.148.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="B8hxCClD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Cc; bh=f4A7x140fpBgDwLRFiddIufn7pmucpGshrEbfbehZVo=; b=B8hxCClDLlmNmF9mcgFIxo
	L8geolH14B8wVdw9ulsmQ1AVtio5QvXKYBqxtoSJxc1rm+bfq9PAF75kVSUDAC+81lc9iY/3SkR0U
	33qH90GfrTF8dHE+uYgdfeATQaq9PzpPPo3Som4n3yvnY6RVnBFI3P88qye6N7IJvda+AYwHwfjNp
	whr3H1se1wA7LkJwxutGKBK5wI49u6ZGVU1o8lhoI56w7JEZvRlJFk5v3Q4lUpJl+9ztqTDxcmTcM
	aLBKy4NCP4vCwAeNZ/oj4n5Lzt1JBJp8o4sHmZWHBKVFc21LnHMxgpovrgMDDQHYYA7j3WglFVnDZ
	Atv7avEF0uDw==;
Received: from [167.98.27.226] (helo=[10.35.6.194])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wbxz5-006lI8-0O; Tue, 23 Jun 2026 11:03:59 +0100
Message-ID: <86c68fbc-e9b4-4a94-bb7a-122408b15273@codethink.co.uk>
Date: Tue, 23 Jun 2026 11:03:58 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: fix dwc3_readl() and dwc3_writel() calls in
 dwc3_ulpi_setup()
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260623095147.700020-1-ben.dooks@codethink.co.uk>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20260623095147.700020-1-ben.dooks@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: ben.dooks@codethink.co.uk

On 23/06/2026 10:51, Ben Dooks wrote:
> The dwc3_ulpi_setup() calls the register read and write calls with
> dwc3->regs when both these calls take the dwc3 structure directly.
> 
> Chnage these two calls to fix the following sparse warning, and
> possibly a nasty bug in the dwc3_ulpi_setup() code:
> 
> drivers/usb/dwc3/core.c:796:45: warning: incorrect type in argument 1 (different address spaces)
> drivers/usb/dwc3/core.c:796:45:    expected struct dwc3 *dwc
> drivers/usb/dwc3/core.c:796:45:    got void [noderef] __iomem *regs
> drivers/usb/dwc3/core.c:798:40: warning: incorrect type in argument 1 (different address spaces)
> drivers/usb/dwc3/core.c:798:40:    expected struct dwc3 *dwc
> drivers/usb/dwc3/core.c:798:40:    got void [noderef] __iomem *regs
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>   drivers/usb/dwc3/core.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 517aa7f1486d..f5e60fb1a5cc 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -789,9 +789,9 @@ static void dwc3_ulpi_setup(struct dwc3 *dwc)
>   
>   	if (dwc->enable_usb2_transceiver_delay) {
>   		for (index = 0; index < dwc->num_usb2_ports; index++) {
> -			reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(index));
> +			reg = dwc3_readl(dwcs, DWC3_GUSB2PHYCFG(index));

oops, failed to ammend the typo fix for this, will re-send

>   			reg |= DWC3_GUSB2PHYCFG_XCVRDLY;
> -			dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(index), reg);
> +			dwc3_writel(dwc, DWC3_GUSB2PHYCFG(index), reg);
>   		}
>   	}
>   }


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
