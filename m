Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A44D3B71DC;
	Mon, 29 Jun 2026 09:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.40.148.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727187; cv=none; b=XOQKvoT68J5VZzzkbPk34b4C3eLx9EKPMgAtagoKseV8LXzipfGUDPjCmF5y4ZkOHfH+Xtblmkk0JAJJgNva5kGT9CPJgYDoKCw6oJVr5FsTTcVl5heO7BoKPGRZ+b2TZEGJEiYUO4oXyqyAaQqBThFkVZ/L+CVASJS8mzB6zEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727187; c=relaxed/simple;
	bh=KkY/rLkhTEqQA3RX9rQX5SoOmyin1QM2p6Z8KFfYKko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bRDST7XdDa2VLlNZQQ5J1x4WlBSYxoBx2dZhcq7MQuejkLFQDgnhc0OzuK46/dm4PN/T8YS8aIJqDyuBvmOGS4oXMMP3v4+Dl+Kv+lzHi0kFaWKvfKo174op9aXajNfxUj5LAIldp5YbKz2f5ls/K7I0uI3AXM6l9i5qGOtZEXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=W2rtbNL1; arc=none smtp.client-ip=78.40.148.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="W2rtbNL1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To; bh=XSyrZwnIUINkxJQhWfVF+GsCCk7A38r6IJGBNYDXDwo=; b=W2rtbNL1Tp9P7tDv
	lv82SQ2xDrYZ9iJaROYjoz03ApOhVOAciJH112q1K7bkPl6C5F54jCXLDBJVPMzh8WW6EWM4/S+B0
	qI709+WCFsdo7cYFw0LKgj+QKtL8q+CV9mNrgGe8IdRmN0mGB2zIIR2ldSe3aSjfaH8puv3/Czjsn
	z+SrDpwO4ghn4pMfqW/n493UDtK/vxLq5gF3RNboLcczYdqcxiljaHidoRgUEnhxiLXZnIppMrcJF
	3kd+o/Ty4hZv1LFM0F2YEy03x0PP4bjnP3QFGw6GWQ2YlVRPEU96RNjtg+W6/aYNozrHpPhbBw76t
	kwvv5LgexOvqKyc81g==;
Received: from [167.98.27.226] (helo=[10.35.6.194])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1we8m5-000BYi-39; Mon, 29 Jun 2026 10:59:33 +0100
Message-ID: <1c0f84bf-267c-4dc2-a756-1997cf3871d2@codethink.co.uk>
Date: Mon, 29 Jun 2026 10:59:32 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: dwc3: imx8mp: make dwc3_imx_glue_ops static and
 rename to imx8mp
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260623101043.748359-1-ben.dooks@codethink.co.uk>
 <aj792C105VmmZ_nF@vbox>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <aj792C105VmmZ_nF@vbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: ben.dooks@codethink.co.uk

On 26/06/2026 23:32, Thinh Nguyen wrote:
> On Tue, Jun 23, 2026, Ben Dooks wrote:
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
>>   drivers/usb/dwc3/dwc3-imx8mp.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
>> index 1cf96540b66e..de8c17bc940d 100644
>> --- a/drivers/usb/dwc3/dwc3-imx8mp.c
>> +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
>> @@ -158,7 +158,7 @@ static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx)
>>   	return IRQ_HANDLED;
>>   }
>>   
>> -static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
>> +static void dwc3_imx8mp_pre_set_role(struct dwc3 *dwc, enum usb_role role)
>>   {
>>   	if (role == USB_ROLE_HOST)
>>   		/*
>> @@ -173,8 +173,8 @@ static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
>>   		pm_runtime_use_autosuspend(dwc->dev);
>>   }
>>   
>> -struct dwc3_glue_ops dwc3_imx_glue_ops = {
>> -	.pre_set_role   = dwc3_imx_pre_set_role,
>> +static struct dwc3_glue_ops dwc3_imx8mp_glue_ops = {
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
>> -- 
>> 2.37.2.352.g3c44437643
>>
> 
> Please add Fixes and Cc stable tags and backport this change also.

Hi, I thought fixes was only for bugs not warnings and stable is
only for serious bugs?


> Thanks,
> Thinh


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
