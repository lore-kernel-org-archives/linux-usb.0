Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4D8377AB6
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 18:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784054934; cv=none; b=l39XtSm7BlhH9y/VembyvnZZxVNsL7tTJdUSDsQxu/Nmm5Q5aHxq5rGCmhja0+WUwlC8sqfE7S6+Y0VatVZcoseUY/8PpF6mkkSIebbPCrKMDt1ddxyeXefa+Ev1hJAxxQXPFnuGpGptbhRHc/Qxv1VBXf0WfBnRYrgm/rcD40Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784054934; c=relaxed/simple;
	bh=gPFPIei4CDkO7J1lxwRZh0QQzWYIn252zXFk5L8y0Ns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OWM4okqIDSNzNghDyrQ6XMNq2KuBhqRwXP85SWmWHzV7gYDxIrWOeSNlHi7EqKKG6viZz2QmkxO+dwfowxmDaAdz9gbHB1JfYtd+nqFOeMz86Vr0/1MvieEE0RtyHBDSaKartqbrujsbMB3ffrDk6kLjO8D0aolO3rxdUCDpJkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LwaOq9mV; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LwaOq9mV"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47d70879764so3061407f8f.2
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 11:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784054928; x=1784659728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9g9uFKnNctGU0FYMhigLvskzpkcJ4V8ymJ1XdxHN22E=;
        b=LwaOq9mVhTu9fXTOgZv+K5w+yF8DWN6ZW3sQ6InXBHNCCdEdZ63D3YBPbXJVSf0NrB
         exTOAiTo7FwVMAUdbIFa5ToyTSBQRpXflCL7iH6kop2w0IxvQYy2HjENkQIbHZJjFvib
         GfcZWVl70P6Z93tzpcx7MzDHRf4OdPVZSIWHc8slfYfUdu4Pump5kYPvHHcHHmtdRX7K
         fyx+HTLPJxtE/WBW4yZ+oUbUJwh++hNhn14Ai9n9XYLFJ8DbMyBZI5b3kZnNBfy75LUl
         xmY2s0zMCN8IMVmym++yKwl44UDfwDtyvTpgbWFgSKudq5HzygnCYuM3k1AwhCd7AVtA
         4H6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784054928; x=1784659728;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9g9uFKnNctGU0FYMhigLvskzpkcJ4V8ymJ1XdxHN22E=;
        b=UzLKJUYueWyiNj3M6It3HgUbYl7IQzJZwfvc2R1y7cdYAEvdFnji3fHgP0KxhbbHeM
         A01dqmrA8/VdEO1yIFO3G/+mOK6P+o+4s0+kmyABnwNBGImGnSP/+KIsKvgLYnTLwH8Z
         y6NVNIkxmpsANu9Bl/F3m5SnnmEDAaL6vBAUPUFezETR+VQiudI4u2qaJsqWDIdsXTad
         cyYiLeFSFAGIUERfA0HYQP1FimYRx0k8htTJuJPBdXdxhrH7QGw+CW/a90wMEuz4XQDb
         yu7L8107JliBYk7tO5INcoVKOuJkiJX/ZasoE1MJw5XG687Kg6/MfznckkPB1MyVXTFC
         sM7A==
X-Forwarded-Encrypted: i=1; AHgh+Rqk5XYvBuWsFvaA6IYSgFCa/UWaxl6POYyjKaEMJ1N2QwupBfA7lH2ePMjrDITpLZApFGFTlv0SlEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXb8IOXk2i8ZEj4tQel2pqxf1/AtC6hwH8AvX1Otp2rSftsT0q
	8cBnHIwJCmkzFOMibryp1/Yo6s1N3KALXYjsWJ4o1qJhz54unAQLCeEpH8L1gkCPHko=
X-Gm-Gg: AfdE7clSBKO7utYZmBWEozv0Ilk/Y78ftLikF0AmMY9p0vAEViTChitBUVFnW8lHhru
	DreItU19+2E8aCiYWv6B6F97ns+o2IoMvZmjulXH0dZw0ZtTMry9CMUsm4jewbvZF4WHXgtUD5B
	AnvMf+r0VEIlCs7/n34voksWZt4QwFuRbjDKlaBbbt0x8bySDWmlKVFkbeALwJA/v0e1+xUxmjN
	REe5JzK4zl4nI9k8ASbXC8KiVmXbBVdRL51zxbnbsMV2elK+oy70m0Rr+SMDvxLI314vTF0sC9v
	vdJOhHG/HGaeKj3iTT1t7+c+5umL44f5p3wJmwTXeIU/Bo+aa6dY4XU9pC2t0U+XTAz+A34GjDL
	JPN2dTGIe01cfFkX4zFCzWWSzQzYDMPhrkH/kZfwLIEzKYNnt8GGPiZf+zDZW/yFmBvQ2Dkt6hE
	rlVo9tZ/ipQInzM508lzdNRYXMLYU8vvw4bMS3zG4ZObjSS1gcqcCWDMs=
X-Received: by 2002:a05:6000:3c6:b0:47d:f023:b4b3 with SMTP id ffacd0b85a97d-47f2dce9728mr18256050f8f.34.1784054928423;
        Tue, 14 Jul 2026 11:48:48 -0700 (PDT)
Received: from ?IPV6:2001:a61:13c3:1c01:3157:c849:4aaa:fa65? ([2001:a61:13c3:1c01:3157:c849:4aaa:fa65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c4320sm9826293f8f.32.2026.07.14.11.48.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 11:48:48 -0700 (PDT)
Message-ID: <018687f9-a7ba-4e30-bb3c-25ea6b8f172b@suse.com>
Date: Tue, 14 Jul 2026 20:48:46 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] rust: usb: add usb host interface and endpoint
 abstractions
To: Danilo Krummrich <dakr@kernel.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oneukum@suse.com>, Colin Braun <colinbrauncl@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-media@vger.kernel.org, Colin Braun <colin.braun.cl@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, driver-core@lists.linux.dev
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-2-9fa011634ead@gmail.com>
 <DJXH4JLX4CES.11S3IZ1V2FTHF@kernel.org> <alVEUR0JrF1ga3S8@pendragon>
 <DJXPS0HY54SU.3JEDTA04V8HJ0@kernel.org>
 <7e6ebb5b-8ce0-4114-85d6-98cd11a3ad81@suse.com>
 <DJYBDUMUQ43T.3Q4ZG0FL76QH3@kernel.org>
 <fe12ec76-0f2a-48bd-8fd5-9b94b2600718@rowland.harvard.edu>
 <DJYHI6W0VJ73.NP4QFGU57J50@kernel.org>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <DJYHI6W0VJ73.NP4QFGU57J50@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.07.26 19:53, Danilo Krummrich wrote:

> Many APIs rely on this, as in they only guarantee valid behavior when called
> from a scope where the device is guaranteed to be bound to a driver, or IOW
> where a driver can prove that it actually operates the device.
> 
> Drivers must only acquire device resources when they are actually bound to the
> corresponding device, and must hand them back before the device is unbound. The
> devres API, for instance, exists for this fundamental reason.
> 
> For instance, we can't have drivers manage IRQs, mess with I/O memory, program
> IOMMU page tables (e.g. through DMA APIs), etc. for devices they are not bound
> to and hence are not allowed to operate (anymore).
> 
> Those device resources all have a lifetime that is tied to the lifetime of the
> device being bound to a driver.

Understood. Unfortunately this does not map straightforwardly to the USB API.
Usbcore tells a driver via corresponding opeations when IO has to cease
(and other operations should be performed) and when it is allowed again.

Being probed and unbound is merely one of them. Nor does this really
tell you anything about the device driver.

	Regards
		Oliver

