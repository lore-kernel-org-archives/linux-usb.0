Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675EF22F74A
	for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2026 09:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783418044; cv=none; b=PjhUiswQyLXs/VgKkDUFmIguIsSU3Wr6FZZCMscks4r6t+M5Bs7DM9t9YPqcho+BkYMQlTWvFELn8NonYP2Xy/ripItGVCjHLZWbk4P1eEgEUV5xgyhaGAc/Skf4w3/f2RrnWIFSNw9ggAI/SEBDEWkXoZ0zMbhAAdaUafNx2DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783418044; c=relaxed/simple;
	bh=UjaXMKyvEOp1zeuBxEdrqNCY5stinBSf9PEaxdvXrtI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n+m6cCDjDzT90DQgnooxUAQr9hBkbjwkfiuU5jBx20Jd6mYa3i/96qaXzmQGINdBHUlJwJ7UaUi9JMbDxbqyUEzVE5THmXIJOLGSBcrMlGLTJ84MW06O+0L9QfxSypna/aMX88W5w6OaF3BFzzyBSpiTy5ueOpX7w9D08Hw2drk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWklebTK; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWklebTK"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3804e42ad5fso4953687a91.2
        for <linux-usb@vger.kernel.org>; Tue, 07 Jul 2026 02:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783418042; x=1784022842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k/xYrqPyf8ll/32Q4x4Jpg+aWEda5MiF2/lDjq25sTQ=;
        b=VWklebTKl2EMppTeGusYgEINtmYctXtxBB6gAt3JotF4vztlpsuch17mGBdjt0KSrg
         cOZXsAnp4M0kUTgz7oJ/wYNUzTN498KmV+UddJKQhnHksD+zjOQhhGLYTN1eRIaZcUFc
         z9W0Y+YVmaYCFxEwQvk7mItDr+YKIvOZwBXAIrtmG1gLrlMx4tWySbWATphLYQLPN6st
         bNG1l1RXZGJil+H2SkbdcYV6LIz262HkIckhjzTPFB7J6VlgR6zYw/7NMvWkJItI4wfo
         yUl68bGLXByja3w3nToyEheAQINYiRgzLELCl8eBXJitbnvMAv3nRVZKpFPuCBHj57kh
         R/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783418042; x=1784022842;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k/xYrqPyf8ll/32Q4x4Jpg+aWEda5MiF2/lDjq25sTQ=;
        b=FqV4CDhiej3egC/jm2LdA1mU/SwfM++asdVG2DP8kvZmKWoKNvhgEELz+hMI/6AlQo
         FNOY5aa3Gu/47Ql26LO/KvqO44x1vzCEvqJ910b3K15TUjGNfpoGfqiZtnn13Qjn+hcs
         8KH92IUffFUq2WVuyXygrMHeOmUkCyVyLXpr2367Pj53QoLXTT/FCZvxKU4CsW6Cqley
         8K+J2XvDs4XHMLrknf501pUbtbqM9svrYuOD/E/f5+N8jqNioFRlAfqz6fbuc2U6b8fS
         allmG8xWZdQCyG6tAT8Za5lqud/AXqq/xdmhWNlOGswt3tvJMFHuVyD/NYa1HBNF2DPp
         NaTQ==
X-Forwarded-Encrypted: i=1; AHgh+RrmJG5orb4VaSa1rMkUumJUneHe9Rp1c8AYMRuKV83OcXMpdp8eSPyQRkYFGDr+MpHQV+Dq2F5KSVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA2OujGN5gaFgGC7LS9ftcWmVGC7if4Xy41NF2FGakWjqc+jeH
	G/jHACmyPf+YilAmfp9fVPePZUDRr+XSWoPm4xTRuJ5uD91r5kaojo8qQd2d6A==
X-Gm-Gg: AfdE7ckK/uUa+k8ninbzaldru5s8cU9ETfQicZNwSYMeeHJ0ey4fnG/F+99TCUD8Iss
	23rp6QwnIQd/HYn4pqQ1+axafAMAf34Z+gqFnn+JHxdRTHSe507TtTKEq/FU+9IHuDGx6LNCRXY
	2ASouAqtEfaDyKl1q8pT7odCpB1YdiBcsnmL2HW4oQ2FRAoHr2XLDGC7CenakLjEDXfF0NePKwv
	RJyKnf5PFnf2UD5iNEBPUAWCao/CAgpPP0vLltd6KOJjpJjqN52D5LrZXHxpDIArXIHWivq5/jR
	Lh9AxjNbfWcGWj8u7PsVv18i0vk1NaIWe7I9T7kNuepKLRGvDWRbpjvvQxD8tXd4Hem1rcnKnA9
	wjfjV8GcuIsHFvRc9IwRwWS7iAzYvbZ6l59Vcj080yiqtuIYzrMV4OADgQ9qddLZKimYsK++yUk
	6OR5+dSgQzgaB1Rx137wU2lg==
X-Received: by 2002:a17:90b:3c10:b0:387:e0db:3faf with SMTP id 98e67ed59e1d1-387e0db4814mr2167165a91.40.1783418041386;
        Tue, 07 Jul 2026 02:54:01 -0700 (PDT)
Received: from [192.168.89.2] ([175.235.236.90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bdf5sm8642525ad.73.2026.07.07.02.53.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 02:54:00 -0700 (PDT)
Message-ID: <620721eb-2b0e-4279-81e2-420996195206@gmail.com>
Date: Tue, 7 Jul 2026 18:53:58 +0900
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

With a little more of thinking, I think this happens due to the
initramfs building tool not including xhci-pci-prom21.ko when
xhci-pci.ko is built with the Kconfig where USB_XHCI_PCI_PROM21 was enabled.

Can you check your initramfs file for whether it holds
xhci-pci-prom21.ko correctly, or not?

For example, with dracut, you can do something like:
cat <<'EOF' | sudo tee /etc/dracut.conf.d/10-xhci-pci-prom21.conf
# PROM21 xHCI PCI glue is needed before root/LUKS unlock when xhci-pci
is modular.
force_drivers+=" xhci-pci-prom21 "
EOF


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

