Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444C5318BA7
	for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2026 16:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783010096; cv=none; b=Q43Ci9YcTtje7/GT+8hs//3jNX0KQ+JvfJtggUwHQR0V7nwIx17WrWmnYRz+/mVLmO/AG9K42bNnyef91BpXwvc7c/wcRfBNjuOyZEyy72d96RAXzKpHSsoTg0kUny0z8Patlmh+yGCrM83nT6g80I/wNSWRauo+57Zo5tX+/PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783010096; c=relaxed/simple;
	bh=Vo9F9EIvLh+3M3TnCX3YLKisUPFs6vlEtUHrCqhT3qM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OmvO8Itp1wGm9rBQ44GEJUaBLXRCMW14MoN5KpAfl5KvG4giODjADUba6Ifopi4wSut3PrBloKyMP7ehyxW7DU41lB4bwuFlHETlV5lMU2MOaeETtLycR9qgs/UjqaKwyX+dQ7svO9oEYfc2+Jiv/Vbg9oWbsrr/XNflzMvRNCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=VJZHi0Jk; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="VJZHi0Jk"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4grjCX1R1tz9v0J;
	Thu,  2 Jul 2026 18:34:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783010088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tDsKjaHsLWNkHCpBGU2Yp8fOx9IGtHQiRXgsn+7Dk/4=;
	b=VJZHi0JkkfVFRoB1+AIgOWArqxZVEbOLm5uW7B9uiTxmv1IYzIvUpwfm/0FVj5riOL6Q/J
	yn0N9FAclJuXbDmP1S0kyBnKM8F7TSl8QRm4DMQUEVSAVR891UwxR8jBo0a+RgbBGEYR2g
	rGmO4WBUY8KGflg5IbXoSYn6Z/31Ac+pDLCzPBmVNtXwmU2c5knrDTyUbQBwDWT66+9S8m
	gYC56HttrFWBtC9b/7Y1Z5Hs9hSJOawDXXLywShiAvtA6dhn/G3PqycFb4oYvUUSVYzFTB
	4lEXFGT4q8QmEB2119ELFH2y3IPP/uc45lUKItyDJX2B1j7EzLe8ggtW7UW1WA==
Message-ID: <5885fa3b-4893-474f-9de7-c3693ce89504@mailbox.org>
Date: Thu, 2 Jul 2026 18:34:46 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: 7.1 regression bisected to "usb: core: Fix SuperSpeed root hub
 wMaxPacketSize"
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michal Pecio <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org
References: <cb287e3d-3066-4820-b464-6208b947974b@mailbox.org>
 <577c7ba6-c638-4e73-acac-fbf6c4fb4ccc@linux.intel.com>
 <20260702105152.415afeaa.michal.pecio@gmail.com>
 <80bdd3da-33c0-44b4-a1af-6aca44c1acd6@mailbox.org>
 <2026070255-rerun-unstable-a90a@gregkh>
 <ee889a90-6ef3-4546-a05c-227ed3e742a7@mailbox.org>
 <2026070243-retread-sensuous-aab2@gregkh>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: de-CH-frami, en-CA
In-Reply-To: <2026070243-retread-sensuous-aab2@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 757ee101be8c3312b78
X-MBO-RS-META: ydruw6hpxwq9gwfiu6gsh9azaai5tfk6

On 7/2/26 14:38, Greg Kroah-Hartman wrote:
> On Thu, Jul 02, 2026 at 02:25:04PM +0200, Michel Dänzer wrote:
>> On 7/2/26 14:22, Greg Kroah-Hartman wrote:
>>> On Thu, Jul 02, 2026 at 02:20:05PM +0200, Michel Dänzer wrote:
>>>> On 7/2/26 10:51, Michal Pecio wrote:
>>>>> On Thu, 2 Jul 2026 00:09:42 +0300, Mathias Nyman wrote:
>>>>>> On 7/1/26 19:02, Michel Dänzer wrote:
>>>>>>>
>>>>>>> The ethernet port of a Lenovo ThinkPad USB-C Dock Gen2 connected to
>>>>>>> a ThinkPad P14s Gen 5 AMD stopped working in 7.1.
>>>>>>>
>>>>>>>   ip addr show enx482ae347e7c3
>>>>>>>
>>>>>>> says the interface doesn't exist. The only thing about it in dmesg
>>>>>>> is:
>>>>>>>
>>>>>>>   r8152 8-1.1:1.0 enx482ae347e7c3: renamed from eth0
>>>>>>>
>>>>>>> In previous kernels, dmesg had more lines about it:
>>>>>>>
>>>>>>>   r8152 8-1.1:1.0 enx482ae347e7c3: renamed from eth0
>>>>>>>   r8152 8-1.1:1.0 enx482ae347e7c3: carrier on
>>>>>>>   r8152 8-1.1:1.0 enx482ae347e7c3: carrier off
>>>>>>>   r8152 8-1.1:1.0 enx482ae347e7c3: carrier on
>>>>>>>
>>>>>>>
>>>>>>> I bisected this to d1e280334b7f ("usb: core: Fix SuperSpeed root
>>>>>>> hub wMaxPacketSize"). Reverting that commit on top of 7.1.2 fixes
>>>>>>> the issue.
>>>>>
>>>>> Incredibly bizarre, I wonder if it's some userspace madness.
>>>>
>>>> That reminded me that I'm using (an older upstream version of) usbguard. Unfortunately its GUI notifications when it blocks a USB device aren't working reliably currently.
>>>>
>>>> Manually firing up its settings app revealed that it was indeed blocking the USB3 hub. Overriding it to be allowed fixed the issue with the bisected commit.
>>>>
>>>> Looks like a false alert after all, sorry for the noise, and thanks for the help.
>>>
>>> Thanks for letting us know, and this isn't the first time that usbguard
>>> has caused a problem recently.  Did we change something that broke it's
>>> functionality?
>>
>> My assumption is that this change results in usbguard considering the
>> USB3 hub a different device, so the persistent settings to allow it no
>> longer applied.
> 
> "different" in what way, because it is a different speed?  Why would
> usbguard be prohibiting hubs?

What I mean is that usbguard considers the hub two different devices with or without the bisected kernel commit. No idea what exactly makes the difference though.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
