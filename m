Received: from out203-205-221-235.mail.qq.com (out203-205-221-235.mail.qq.com [203.205.221.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761363EB0F3;
	Wed, 26 Aug 2026 10:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787741408; cv=none; b=rHsm6RO6kyFHumBarce5o4eNoBKWkmzzp0PC5rS6pfgTiY9lOATduNq8H4FzV7NfAn9cTShES+uhYQN2ldU7h9K/5Bvw/Yz+W7+HIYobI9cb+kvNYq636J+hHYEx8tAtmiocL/WXXmfI5sl2SzIw8p45r4mu8B7z63yMU3MlBBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787741408; c=relaxed/simple;
	bh=9z2zkWsuAuKanUzbPAvqpovEWzEhdlO/dA+mIkH5d5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V0fc+OYPu2cq2sLOnc6y2l6Ux9i09U4GfkRTlq2kwrIa0NxdLjdsbDEh1v4nnjK95pwdd3PwSc30l8ULk1TABECfTp0O1twjqd71J/cy2cmIw3i3GqwNSJ4F7Dr9XugyTxsesA4mqoLhQGJLqAzVWWCQIqAYWxg56Ag4tnLeYTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=SRc/8n8c; arc=none smtp.client-ip=203.205.221.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="SRc/8n8c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1787741383;
	bh=jTEc/AoPDOnywj8iUCyxPPaWp9bRNRr7l05zNDCxh1w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=SRc/8n8c1MvKVp5qXfvTX8JSLZsajzXdBGEmQUSvJBbz0i5PAGWp+KgHW3kjkHpdg
	 tCGpWwg2tXP8Y86K5uwgnR5WncuBjbzmKA8/oTot7gVXlEN7rv4v3gHmPKKOSN0dha
	 J3SUBdff2CG6Re3y3AnM1d21Ofqfim+pNgESvKTU=
Received: from [198.18.0.1] ([58.206.203.238])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id C692CC4F; Wed, 26 Aug 2026 18:49:41 +0800
X-QQ-mid: xmsmtpt1787741381tobzcy4f3
Message-ID: <tencent_BF146C430745F413BB9A67220EEC6701B205@qq.com>
X-QQ-XMAILINFO: OVFdYp27KdlJ0/2ej69KZyKW7whX1PZhkKGC9DoiwWSILhqtGVmoHFXHKwGPAD
	 l+YlZ7Kses9LBMhBYv3odfSw9u/4I6ErYEBMhO6vR+TzWlhxnzAZzz4EZjfsFSatVSImsbK/bGPC
	 kTcC3JYlCP4EYfrXg/HgPFWxRyMNOaOgIkLWqTJj022faEiDSEn9yI2rXwbyNmqHTqwmxFnlJo4v
	 dihVTUzghNkAYki8gJP/1x/I3aJ6YXxqX4+IFC516xC+roMLvIM/nfjK9TmygQQNHhi/Un/pIRDj
	 Z2krEcBiTXZzTAOIoR/8tHt7uVdEPbKeg0Qj5O5UTY4pNTz486S48I+Ktjm+q6DHaR2E5PPz4ozd
	 2KgEVhZUDeuT/gJaPS+jq3VEHUN42YRxqmm44mq6tZcY7VBuBcArQ30DQIzIdKqrirurvieoMgYJ
	 7qfEgEQYtPGfUECi49CDY8n784MMtg8fuLP9JTy5ItsFIVRlpOO6l/YKJc8cYPyqph+jaqvbUBoR
	 JDzVk5CT/PFwgVM7qYamkaNqhWRnodnZxq/FqO62ENWZz1CrMVuHKlR0m23CTqZHfNvaYzDu7ziC
	 vjyVC+bjDEpmfYvgNl2jYFePyMyAqweJVDNIADM2yYdqYJueyT/Fu5o7E14o4i4HAmx0tP9CPlBs
	 aG5Z1NBN4gKLlJZ65KH4pdI7rSSXm2YVq25TGM5fbVwwyMTwFJRRzeG/ZP1OfVK3bqi1vKkfUOAo
	 0kEbqGaIefmDlWsYsusvsClsvE1IUu1dzgUiyR4u4xBii7DvjlYG1Munc5Yw9MHVgxqWn6I6cRBp
	 ej0+g023OOhBGWa8A0zDBgkaof+Rwsc8kNxoMwbv8dC1ovUPcWMf+78mY29D2tOaJt4Q+Itu0Kx8
	 ckIyZiTrvkWH4fSElKeVBs1A55n52Z2oufvftqaK91Te/OT3C8zS0yk7QvHLTT1XWamhgbtJ4KkL
	 c1H/6ozKlQXUCoNUJKcCXF5lueWAfwfuskNq66yIcW2tOWVoH+JQZMfMsWferIj9ZYGWv2vSBSN7
	 35usbOT7AaRMjKz5EPPupAU/6HPaMatPjN1PQoQ9O4AAYyRumu92QkLuZztrWTU9YR+H6sK+snQ/
	 //M2AHAj9EbSPTvYpfBAIU0/BYOw==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-OQ-MSGID: <715084c7-8e33-464a-be00-11c19f484f42@foxmail.com>
Date: Wed, 26 Aug 2026 18:49:39 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] usb: gadget: goku_udc: move debug output to
 debugfs
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, Felipe Balbi <balbi@kernel.org>,
 Peter Chen <peter.chen@nxp.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260826-b4-fix-usb-v3-0-b28366e817f3@foxmail.com>
 <tencent_D7673CCE71B03F2C90CD60873AB4A245D808@qq.com>
 <2026082625-stoneware-trailside-ff19@gregkh>
From: Cheng Lingfei <chenglingfei@foxmail.com>
In-Reply-To: <2026082625-stoneware-trailside-ff19@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/26/2026 5:25 PM, Greg Kroah-Hartman wrote:
> On Wed, Aug 26, 2026 at 05:15:06PM +0800, Cheng Lingfei wrote:
>> goku_udc exposes diagnostic state through /proc/driver/udc. The single
>> global proc entry collides when more than one controller is probed and
>> triggers a proc registration warning.
>>
>> The data is intended only for debugging and is not a userspace ABI. Move it
>> under the USB debugfs root and use the PCI device name for a per-device
>> directory. Create the file only after the UDC has been registered.
>>
>> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Link: https://lore.kernel.org/2026082616-glue-atlas-0cfd@gregkh
>> Assisted-by: Codex:gpt-5.6
>> Signed-off-by: Cheng Lingfei <chenglingfei@foxmail.com>
>> ---
>>   drivers/usb/gadget/udc/goku_udc.c | 47 +++++++++++++++++++++++++++------------
>>   drivers/usb/gadget/udc/goku_udc.h |  5 ++++-
>>   2 files changed, 37 insertions(+), 15 deletions(-)
> 
> Slow down please.  There's no rush here at all, and by flooding us with
> new revisions it doesn't actually allow anyone to review previous ones,
> AND it shows you are just pumping out LLM-generated stuff without all
> that much thought.
> 
> Please wait a few days at the very least before doing new versions of
> patch sets.
> 
> As pennance, please go and review some outstanding USB patches on the
> mailing list, to reduce our review load :)
> 
> thanks,
> 
> greg k-h

Understood, sorry for the noise and the rapid rerolls!

I will slow down, give everyone time to review, and take a look at other
patches on the list as well.

Thanks for the guidance!

-- 
Best regards,
Cheng Lingfei

