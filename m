Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C791E30D407
	for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 13:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787490739; cv=none; b=tkckaMCf+PLCpBvkdTRh9PCZfRJUHjzv2ufiMZ2IyZcrL0LMqqz02C0634a5kZcD/ZM7njltX6lFLaotD66OUvFqWh1AUdiwaUKKbeGC9dGyra7D0ngwNSXwzS5ZdFuxGe2/pKgYL/bhzrXeIsIxByPrK6tlQYmohSTenB41AZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787490739; c=relaxed/simple;
	bh=gsviZq20+kf5tWIGLv7BxDOr13J19VDYijouA64YKcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xi6eh/nGT5v7xXzok+93iKTs2jA8oB2OmXY8zVNMw7gKjgHAU9DiXfP4JvZ/Z/Jbyeu7BDxARvSPp4n8jEm27vi7pxpzSvEJTNwmpMGYINAzA+tJC1CoNKwe/9pbferaom5FYZ4D1dsrHnb38VQxfKbhK977qUQzmlPLGdURU3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dcWzHaFO; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dcWzHaFO"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e58034d05so2062092a91.2
        for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 06:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787490737; x=1788095537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfySqh1+WE9+RdX6KTzV0NkuYxOahrnOFEQjXCz6KZU=;
        b=dcWzHaFOM9C8gJhIWNgdSfQU4C4tEpEdJQ9wFojb3+xgSHxBRPROFO/lXXNz+tIzQf
         Ik1WnLZ7ICWlGlrM1gUvZ6LprdIO7ilJwN7PQfef5Y2j2TdJ86jaAjyj1GZ+LMYsvpFM
         gtqsP8Pm/QlUqVP+kMP8+g3GzK7XAbHgwQl9HWTDcpx0cfpbsTtLbGFzFZRxC5dkeyY1
         Tyf7AT7GE/bUDxZkTX0GT78rHzLMpblDMB/LYUlb6LdPxDPR8NxcdOE/TAeCe6u+e9N3
         3AR/8bfciMQ6xjmvJcwfPHBvg0G3UIGOHzaviWqh4p0HpTsfdRi+gTnW5sM7rG+wVMnP
         hbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787490737; x=1788095537;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfySqh1+WE9+RdX6KTzV0NkuYxOahrnOFEQjXCz6KZU=;
        b=OjPJzwzPLSBPV351WoqTfjR0QQXziB1Q7hgukYbp18+5EWLTML8NHaJfhXb3ruc561
         xe6e1+6PKGA5AONMk0ltRECDcedOrMeXJGpLCIilVQR4LmekJp6ZaPhjqfCuNel7PhOj
         TCtZpJcPUjyr7dpNvGh7EDQ7W7U41/HUDpxvy4V7PR2TOCoTguHa3PXPOfGpq3lFWKdn
         1UFuZixY+fqXYl6y214ibZFaAb8xUGjFEMYDz4+kgy51X+qB235oPQ+5uU7o95k7CZff
         yzCvuko0bp1/SSM/l7PSsXhf4lHyzb2NAMaV7UvuV7jt4fH89OTvpVNzPVNuYyeeKKy5
         zCKQ==
X-Forwarded-Encrypted: i=1; AHgh+RpZzO2aXhK94MNRlmgyxvcbk2KHvCNx+Q/iaESBEpNnUKFLDdIBADUQduMmi8eIJ7yqrtF2rKuFY64=@vger.kernel.org
X-Gm-Message-State: AFuF++nHUwX2MWouaMkevu18XazJbjCQV748tBz+FVlqpTzkmyCqAl5g
	ljxtjHrNLoO29scBG3At6UKFGltC85QH4+sg2U4bs2NVucdK1BqaeFS9
X-Gm-Gg: AR+sD10qCx3HmFy/5Cy9sOTw5P+tXS6NlBv/yVDGNDdlPOn0xIyvoG1ggJqB9i5NeKb
	GEDV7RH7oUGdylLUU+8UOgqgMPoXhdLE9Jd3/8GmcOWADA4YfJq6jxpCbYyra9+RhzgbK4eN9LG
	H8IzdxmNWuuP4JHG8nXhV6kUEL3d8wmfyYlt1POXKwld196ErPTRVCcU9J0HwQotqCQaVyYp1We
	vVooeKzVoE5fAEAQ9+1banhEU6Kbv+/m5+BmZnLb8DcFBmay2jQD0YK1OdfHqpwlcVpaygtNpMa
	qys1CfX2PocnkdGA8eod22+8KD4Egjv9cqqgyCQ1/Tm3sXeivF9o2qF8tcsAFLeehHfGSGsrfTn
	1skSROv3EL2ZEXdECaM3XVP/puelmL/yrOBYUSufB1/j5EWNE142t1t5PRq04SBdI0lTtLe8q2d
	lnZDUTDFu05VldOPqUM0kHNdMbkRgV3XSzsQ2tCQI66W0BwgnT1q1i1UeGHu9R24HZitvo0OtWx
	1AISQIX
X-Received: by 2002:a17:90b:53d0:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-395c359a74bmr33908102a91.12.1787490737275;
        Sun, 23 Aug 2026 06:12:17 -0700 (PDT)
Received: from [192.168.90.3] ([175.235.236.90])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4a4ddfbsm6260032a91.17.2026.08.23.06.12.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 06:12:16 -0700 (PDT)
Message-ID: <496d1dee-e34d-4b47-8cd0-829d695e8147@gmail.com>
Date: Sun, 23 Aug 2026 22:12:14 +0900
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: xhci-pci: Add AMD 600 series to xhci-pci-prom21
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Stephen Horvath <linux@stevetech.au>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
References: <20260820-xhci-pci-prom21-v2-1-638e5958fbbf@stevetech.au>
 <391eb22c-e893-4c0d-a4ae-d603d568b12b@gmail.com>
 <2026082304-ebook-expel-d0b7@gregkh>
Content-Language: en-US
From: Jihong Min <hurryman2212@gmail.com>
In-Reply-To: <2026082304-ebook-expel-d0b7@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/23/26 21:25, Greg Kroah-Hartman wrote:
> On Sun, Aug 23, 2026 at 09:23:42PM +0900, Jihong Min wrote:
>> Hi,
>>
>> On 8/20/26 21:59, Stephen Horvath wrote:
>>> It seems the xhci-pci-prom21 module only has IDs for the 800 series
>>> chipsets. However, the 600 series chipsets also have Promontory 21
>>> chips, so we should add their IDs to the list as well.
>>>
>>> I have tested this on my X670 board featuring DID `0x43f7`.
>>>
>>> `1022:43f7` also appears on the PCI ID database
>>> (https://pci-ids.ucw.cz/read/PC/1022/43f7).
>>> Device IDs `0x43f9` (B665) & `0x43fa` (A620) were suggested by Shyam.
>>
>> It would be nice to update all the newly added device IDs to the kernel
>> documentation as well.
> 
> Documentation where exactly?

Initially, `Documentation/hwmon/prom21-xhci.rst` has added the following
line:

PCI IDs: 1022:43fc, 1022:43fd

It would be more appropriate to add these new IDs into the same line, or
just drop the deprecated document line.

> 
> thanks,
> 
> greg k-h

Sincerely,
Jihong Min
