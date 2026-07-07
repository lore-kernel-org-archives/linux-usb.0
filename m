Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F503939D2
	for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2026 09:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416266; cv=none; b=XNQU5PevV0wnbHo+cpTvqfEgEOqojZtB7CBJXL0tfjFbYA2QOxcGBQWXmu3qDYoXiJy+pbLkYJEI9CsIgIum0eTqAN8ghNRbMxzlvWl3iKM9yuEOMW1ZOuV96UrV/VjCT/pQYqt6H68M8XFZrRYkBwarEntp45KrwO/M1pjw8uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416266; c=relaxed/simple;
	bh=ZVtJ4KbMUVJNK2/wadQxyFFqB6KL45hueHArSxTZRWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=coWcKqjIgUAlfx7Ssl4XPfJSNkVxCpzIc5HY0XS0AQuVzt6mXV0O/dzeghwy4j1TbmmvHjdBIDUbDUVNrER1KlUXJWdIL31jzA5HbBfjfqFs9lUYAC1VIEnrcvgyK2G13CLj9vSpfkUhdqqyszo1IRKpTDVF0EKplhcz2TctwTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+ny1llv; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+ny1llv"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc73e322dbso24008785ad.1
        for <linux-usb@vger.kernel.org>; Tue, 07 Jul 2026 02:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783416264; x=1784021064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LZMpYi0CMP8lLmjFdusnU2dVbBcxO0l5zFZNeINryrw=;
        b=P+ny1llvoYyxdUFjKvkZ1HXoQp4xSO9ECacYFXdJJUaZyJ6KErctwuwJ4oY5dsgDrg
         l3RjSYxat6Kpl62IfQEygI53XfzsQc/ixF06Sw4GTokUw700FkNAcgSfz1CJV4+rj7yy
         d1IWkXHSwJtIGwe+vSvXLxNThyKtPmTqOBel/0nGVfzm4/6lWIniIy2+KUWxNlYpEm/S
         xABRtkGSG9/lZ5GrwQ2p7i4bvBKnXJDpI2nrxMbYHWlaxy9NYuiQxG/zmJWVDSxrx0OY
         1BR+CPAnjSLyJ+cJAaZWvgVJVu7lZn33ONCXmA/2bzeAhTo6vOd3Cju03Ws79WFNw9tD
         YERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783416264; x=1784021064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZMpYi0CMP8lLmjFdusnU2dVbBcxO0l5zFZNeINryrw=;
        b=sBC4dE8GivXOHsHYl5MQ+0nHdWvi3MzjG4JZUfxgcnCQPER3FST3iPAlw536K5YyFm
         BiwjovTirCtL21+NGIwEBg9DE2xEkJVvfLOaQ4yKWxSJPCEuXP6kEc6X6WblFsk8txr2
         zb8rzanO4gg9tBYlw9tN4rkcVij8pFgEpzQr/SfpesJ9V0CekXcCvK4jEvYatmXYtRkH
         Bk2Z2lcn7TZJ6LLvbRyuejG2UxdUHP+Z78K20/pZ0lSJvA7jIFVrwupPgh+9n4A/l8T5
         Ynj/MK5srZtCz13QHFyh6P8+nIFMCsKCdk0GpvmhLq4JxQ/hiwyobxpCP2jRTL7iLy9G
         a83Q==
X-Forwarded-Encrypted: i=1; AHgh+RrSZBUA/ZjYpMHqs+E4kSWsuY8semGKandrMelW7RwxbU6Jmp81AvkUyI0qHwVG3fijFhgeimTYhjA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI1IJGByEjLk+EBe98MhIlKaFObHrzBbksCnwPubDhvyZM4gmg
	om5w7uRIjYcMWj+t5guhPFbV6fpcsWvlWxjprXqRLJdjgKLd7d9fBa3UdGkE3g==
X-Gm-Gg: AfdE7cnB384qZwf7lDOMZd3A2VSigYNYvAliquaA1v5Bt1wzCtXLposAnK18fwBemFy
	udvoD9+h/FmWU6DXkmzhREcQLOxV/4kBGMv94V7H6ruQB3DQ4y9QmNjVL27cKyxKyczPzH40eB/
	yAy7cN654TIDNBwpAkgHggDBy6F9Dsua0UrsP1sGGb9L6PBajYvjeZsvlVCvlgwZxdZFAt3To79
	MK5Ood//nWY5EPuRDWGC2WUrUfrsL1e/d94x3xL8MQ2v2oicds5+1eHkyM++eUp2j5PoS8+EyWO
	XprZHtW1Tc14d7CKzI4Rxhj5EObT2ZNCL5t1GG3COSOZS5Le57sfjouep6TX2kF2gguleM3H1xO
	09MwRoSMhCh/1yrHF4NVYpiGE9UZ3Vz0K9EaxuyzErru6s0ODnpryWpjhBjcbCaJB8QxvXDU9sp
	OUG+EYkHEeiGg2qtIgIL281g==
X-Received: by 2002:a17:902:d4c1:b0:2c6:9f6a:9f6f with SMTP id d9443c01a7336-2ccbed27822mr42950775ad.28.1783416264276;
        Tue, 07 Jul 2026 02:24:24 -0700 (PDT)
Received: from [192.168.89.2] ([175.235.236.90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb9a3sm8473225ad.13.2026.07.07.02.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 02:24:23 -0700 (PDT)
Message-ID: <6c25fe1e-6a57-42d2-8be1-efd41892ae72@gmail.com>
Date: Tue, 7 Jul 2026 18:24:21 +0900
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug 221721] New: prom21-xhci does not allow to use USB keyboard
 in plymouth
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: bugzilla-daemon@kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 linux-usb@vger.kernel.org, marx.tomasz@gmail.com
References: <bug-221721-208809@https.bugzilla.kernel.org/>
 <328d3158-8086-4de7-a96e-7c2a514e3018@leemhuis.info>
Content-Language: en-US
From: Jihong Min <hurryman2212@gmail.com>
In-Reply-To: <328d3158-8086-4de7-a96e-7c2a514e3018@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

One of the very first thing discussed during the review process of
prom21-xhci commits was about correct loading of the module during
initramfs stage.

It was mainly about writing correct dependencies in Kconfig for USB host
controller build.



config USB_XHCI_PCI_PROM21
	tristate
	depends on USB_XHCI_PCI
	default USB_XHCI_PCI if SENSORS_PROM21_XHCI != n
	select AUXILIARY_BUS



Maybe it was not enough? Can you perhaps check whether both xhci_pci and
xhci_pci_prom21 are loaded at the plymouth stage?

I also do use OPAL LUKS with dracut, but my setup uses TPM2 to auto
unlock it. I will check the manual keyboard input during dracut
initramfs LUKS unlock stage.


Sincerely,
Jihong Min


On 7/7/26 17:03, Thorsten Leemhuis wrote:
> [Switching to email, hope this will work]
> 
> Jihong Min, it seems a recent change of yours is causing trouble. See
> below for details.
> 
> Side note, but not my area of expertise, so feel free to ignore this, as
> I might be sending people in the wrong direction and it's just a hunch
> anyway: wonder if this is another of those situations where the driver
> needs to be in the initramfs. Tomasz, did you have SENSORS_PROM21_XHCI=m
> when things were broken? And if yes: have you tried if adding it to the
> initramfs or setting SENSORS_PROM21_XHCI=y helps?
> 
> Ciao, Thorsten
> 
> On 7/4/26 17:41, bugzilla-daemon@kernel.org wrote:
>> https://bugzilla.kernel.org/show_bug.cgi?id=221721
>>
>>             Bug ID: 221721
>>            Summary: prom21-xhci does not allow to use USB keyboard in
>>                     plymouth
>>            Product: Drivers
>>            Version: 2.5
>>           Hardware: AMD
>>                 OS: Linux
>>             Status: NEW
>>           Severity: low
>>           Priority: P3
>>          Component: USB
>>           Assignee: drivers_usb@kernel-bugs.kernel.org
>>           Reporter: marx.tomasz@gmail.com
>>         Regression: No
>>
>> Created attachment 310416
>>   --> https://bugzilla.kernel.org/attachment.cgi?id=310416&action=edit
>> output of "sudo lsusb -v"
>>
>> Hi,
>>
>> After update to 7.2-rc1 I was unable to type in LUKS password in plymouth. I
>> tried both of my USB keyboards, but both of them just briefly lit up the LEDs
>> and then seemed to turn off. Bisection pointed to
>>
>> commit 364f4a55c661641c02c86a849f0608d8fc3c0006
>> Merge: e4b4bfaa5090 1c2b66a7d725
>> Author: Linus Torvalds <torvalds@linux-foundation.org>
>> Date:   Mon Jun 22 12:09:47 2026 -0700
>>
>>     Merge tag 'usb-7.2-rc1' of
>> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb
>>
>> and then
>>
>> commit 9e896b4a48c4e815956d28961448041c80ad5a19 (HEAD)
>> Author: Jihong Min <hurryman2212@gmail.com>
>> Date:   Tue May 19 09:07:31 2026 +0900
>>
>>     usb: xhci-pci: add AMD Promontory 21 PCI glue
>>
>> After setting SENSORS_PROM21_XHCI=n and compiling kernel again, I'm able to use
>> my PC normally.
>>
>> CPU: AMD Ryzen 9 9900X
>> Motherboard: X870I AORUS PRO ICE
>> Output of "lsusb -v" provided in attachment.
>>
> 

