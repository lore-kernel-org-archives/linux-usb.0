Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2C236EAB0;
	Tue, 23 Jun 2026 10:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.40.148.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209474; cv=none; b=uHFjglB/k9q+eY3gECsL+X4PgBPdhEmUxIYhP5wwO1Ty+ow+Z5JYwDgicmnPeuyNaRPGuOn+8YFHrV+smEVdpw6aW3+mfSuT+LwXBmrnIOrF7Al4LT6cl4wK6NAPcobiFmzKucViJDzZdQFEppb1j72xrBG4DYIJnwMcujYaem0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209474; c=relaxed/simple;
	bh=wgQcXLBTyu8jYAovjIjBfRi1aRzPqFGlSSFlGj0xWAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uBKdln2sBA8nHkPagLfUBfIWZ0db2qu7Ap36BgK84utPGTwYEOx5eB730ufJMSwmxsPs185J5YBH+P3rd7yHr0p3btJVF6m95zhURF5YpE6yHVexDlCLpz3/NdrKH5NLN3Txj0iy6AntUyP6OkQrO/jZRrwIqBcRrj9zjjo8oy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=sv46U1AS; arc=none smtp.client-ip=78.40.148.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="sv46U1AS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Cc; bh=nZjeWKb3b8+hJxS4LWG9E3xPxpm5++RRdvK7jEZmo7A=; b=sv46U1ASHpHBi/teycZX9h
	fapaPhEgVXraEfMCVqZSFtXlszfqJZIbf7UXnQR09ESsgrxdGGcQYVBNU7fZYZQU26kpvjTOyHP+u
	mmXKxu6wuXXx71oq7XYEZ6h7pHWFuYtUkXaKQqav6iSV+rEaLdXAzZxrMArlfLaNjZgEPtaEOKg28
	0lj6gZOSdv6Pepi6KczmKueQtlI9q6TJc6uUuK+uWeyGg6wcs1p2nKC0g3CTkz+9MFR4+WJXWpibz
	jLU4aAwbwnDa+f4vCTWClL/30LX/srdMg1L62UF3H51NdStuNDm014vkQEEZW5rKh9fdKhrxajgyn
	zT5fV8xBVGfA==;
Received: from [167.98.27.226] (helo=[10.35.6.194])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wby5x-006mb8-V6; Tue, 23 Jun 2026 11:11:05 +0100
Message-ID: <4cad4cde-516a-4e22-8498-e84b5221df23@codethink.co.uk>
Date: Tue, 23 Jun 2026 11:11:05 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: imx8mp: make dwc3_imx_glue_ops static and
 rename to imx8mp
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260623100554.735080-1-ben.dooks@codethink.co.uk>
 <39a5d53d-2eb9-4f72-aca9-95def11edf25@pengutronix.de>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <39a5d53d-2eb9-4f72-aca9-95def11edf25@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: ben.dooks@codethink.co.uk

On 23/06/2026 11:07, Ahmad Fatoum wrote:
> 
> 
> On 6/23/26 12:05 PM, Ben Dooks wrote:
>> The dwc3_imx_glue_ops is not used outside this file, and technically this
>> is the dwc3-imx8mp driver so whilst making this static to avoid the
>> following warning, rename it dwc3_imx8mp_glue_ops to distinguish it from
>> the other driver which also has dwc3_imx_glue_ops.
>>
>> Fixes:
>> drivers/usb/dwc3/dwc3-imx8mp.c:176:22: warning: symbol 'dwc3_imx_glue_ops' was not declared. Should it be static?
>>
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>>   drivers/usb/dwc3/dwc3-imx8mp.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
>> index 1cf96540b66e..bc61a89b66b1 100644
>> --- a/drivers/usb/dwc3/dwc3-imx8mp.c
>> +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
>> @@ -173,8 +173,8 @@ static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
>>   		pm_runtime_use_autosuspend(dwc->dev);
>>   }
>>   
>> -struct dwc3_glue_ops dwc3_imx_glue_ops = {
>> -	.pre_set_role   = dwc3_imx_pre_set_role,
>> +statc struct dwc3_glue_ops dwc3_imx8mp_glue_ops = {
> 
> Typo

Thanks, forgot to re-run check after this. Sent v2

> 
>> +	.pre_set_role   = dwc3_imx8mp_pre_set_role,
>>   };
>>   
>>   static int dwc3_imx8mp_probe(struct platform_device *pdev)
>> @@ -266,7 +266,7 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
>>   		goto put_dwc3;
>>   	}
>>   
>> -	dwc3->glue_ops = &dwc3_imx_glue_ops;
>> +	dwc3->glue_ops = &dwc3_imx8mp_glue_ops;
>>   
>>   	if (dwc3->dr_mode == USB_DR_MODE_HOST)
>>   		pm_runtime_dont_use_autosuspend(dwc3->dev);
> 


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
