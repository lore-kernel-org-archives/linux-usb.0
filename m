Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903A836680C;
	Mon, 29 Jun 2026 11:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.40.148.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732979; cv=none; b=lh/8ksCIiCKLgCSL6OmRsXzOTPMgiRDZmoD5gPxQ2cGnVOSRhZa+q+i+xhIDiObt1hvs58fs62EuZt7WzeWa/V4gvlikHMY72Yt/I9qRZfvlFh6JDkCad/qNQsB6M8OjRxj271T9BEbEnKSjivENwj39yGR3ofV3SadK4oV28EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732979; c=relaxed/simple;
	bh=CcoSZY1UWNV9EzjNIVt708trzF9aAuVBWOyd22WG+Rg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cAGKR2xazEY3KkzdIaBjr2AJ5GXpFCJrh0EHl2Ksw0Y7LaA6wmfB8wK0dIDQtBs2XtSaKzfNZATcUMLIYLv6eTUCYJDHmIwh6+9yGw9C6j8do2x44WArznQcr5kbLdZOscgBd1dhShv2IJe9n8VB7ihaJX10UDTmU/fAyx6CkkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=kUMI/bOr; arc=none smtp.client-ip=78.40.148.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="kUMI/bOr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To; bh=IHmm10AZUyjZs0t8zcITYZeZ0GqyWzA5KzjBC/aoNss=; b=kUMI/bOrc3mr84ro
	eO7iRCngKmtFdMxlSg/Mpsz5Q8a0tgBw7/AJ5Ob3nzOQAwUCP37qQQ+2oDyw4725MQ4xJoftCBYBW
	FF4nJVgDU2fZMgxvVkRF+b0G07Ewqaju9GMqSR7q/fSBjaxHjKdnosnBQzWiegiCxI9C9eRIEotlD
	/U+MGOAD8oyro8gdDRgmZmFBcqZaNwIsXCdguyNG6iiRRic3RH4VWa8pQhESmKO3VzmfdbOqNiH8E
	YUuyMndvW3ivqilWzdN6wR8xjqaKNkzehtuItpDfD/zqGVYsLKvHDrYvVQl5S0Qn88GZC+qZln9qf
	mcChjcudYNq5FN50Uw==;
Received: from [167.98.27.226] (helo=[10.35.6.194])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1weAHe-000UDM-22; Mon, 29 Jun 2026 12:36:14 +0100
Message-ID: <1ac35409-be0d-478e-b6f3-0dd9b7b92304@codethink.co.uk>
Date: Mon, 29 Jun 2026 12:36:13 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: dwc3: fix dwc3_readl() and dwc3_writel() calls in
 dwc3_ulpi_setup()
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260623100801.738517-1-ben.dooks@codethink.co.uk>
 <aj77LIT5EiOHze1f@vbox>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <aj77LIT5EiOHze1f@vbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: ben.dooks@codethink.co.uk

On 26/06/2026 23:23, Thinh Nguyen wrote:
> On Tue, Jun 23, 2026, Ben Dooks wrote:
>> The dwc3_ulpi_setup() calls the register read and write calls with
>> dwc3->regs when both these calls take the dwc3 structure directly.
>>
>> Chnage these two calls to fix the following sparse warning, and
>> possibly a nasty bug in the dwc3_ulpi_setup() code:
>>
>> drivers/usb/dwc3/core.c:796:45: warning: incorrect type in argument 1 (different address spaces)
>> drivers/usb/dwc3/core.c:796:45:    expected struct dwc3 *dwc
>> drivers/usb/dwc3/core.c:796:45:    got void [noderef] __iomem *regs
>> drivers/usb/dwc3/core.c:798:40: warning: incorrect type in argument 1 (different address spaces)
>> drivers/usb/dwc3/core.c:798:40:    expected struct dwc3 *dwc
>> drivers/usb/dwc3/core.c:798:40:    got void [noderef] __iomem *regs
>>
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>>   drivers/usb/dwc3/core.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> index 517aa7f1486d..ceb49f2f8004 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -789,9 +789,9 @@ static void dwc3_ulpi_setup(struct dwc3 *dwc)
>>   
>>   	if (dwc->enable_usb2_transceiver_delay) {
>>   		for (index = 0; index < dwc->num_usb2_ports; index++) {
>> -			reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(index));
>> +			reg = dwc3_readl(dwc, DWC3_GUSB2PHYCFG(index));
>>   			reg |= DWC3_GUSB2PHYCFG_XCVRDLY;
>> -			dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(index), reg);
>> +			dwc3_writel(dwc, DWC3_GUSB2PHYCFG(index), reg);
>>   		}
>>   	}
>>   }
>> -- 
>> 2.37.2.352.g3c44437643
>>
> 
> Ah! How did we miss this. Thanks for the catch.

I think it is probably limited hardware as the commit it was introduced
in was: dcdc3f399e3b ("usb: dwc3: Support USB3340x ULPI PHY high-speed 
negotiation.")


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
