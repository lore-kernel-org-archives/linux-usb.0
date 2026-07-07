Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BAD3D5C3C
	for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2026 22:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783462802; cv=none; b=jLmcvMAlYqhAio+hNh0oVa2Xlol4QemujIoFHoGR5HcrEzzNkQYNnu9nLSexqiIQ8Nobg4fK8dhCjLxH5mZ03dgeWXyZVuiBSwVV8UI3l7uKQ+QcXTEbj/GrMcQtdl/5EcvKLz5a7rTQn1D40cp+39jF6y/boSsMbBGeuSMG1p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783462802; c=relaxed/simple;
	bh=frBgeJaIAR17/Qfijmu+ULcqVkAmYosEXyunoPucIGo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=QULw5NSqe3RuXDOq3uKGobMuFchkzT1mZ/ysid2uGlwD7UXFGXAjrAzTbbUwsNFv5DQ51wxlO4fPnIO+tDCN5fYPfwKEvhEqP6ZyoKEjsvKlm7oH1/lpFZheWZg2d4NXfvVN9VPni84+4pUVSe/0BahoWOUL//Q9wpbQbWCn5Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EiikkTbK; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EiikkTbK"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cacd69a9c0so762945ad.1
        for <linux-usb@vger.kernel.org>; Tue, 07 Jul 2026 15:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783462800; x=1784067600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y+WwbKpOYSnyAyf6gFYLcLjARJ2PtI2beb2eDL2zlr0=;
        b=EiikkTbKM5sXcy/ET38cWInzOKXgH6aPhrcvBhdKGRrptNxQYLZ3/v3QCGAQ6LcVaB
         9W01NmXaDEYgKjgc0IinK4+dz+joBKkCPaHcDFjQPm2LaF5H2Hjm7e/XJojRYqL/tLmt
         Zj4O6gTONgxa5j+h+8y2T9cBoAi0ZGEO2iLbrtJIhEFT8+Fg5jtcAWqndgHikCbebruf
         jxRxYsA+hb6unWuh2Y1HyNoEcNvC5JKVx5uTnYrfH5EfqqYkQV7rUqpbRKPHEH+ajU46
         UMGnUJMHVwgv2g/PMLNe8vdOt5vCz7Ze264/AW7iOLv47qYYkYFzPNkJjihVRMICqjeI
         QJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783462800; x=1784067600;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y+WwbKpOYSnyAyf6gFYLcLjARJ2PtI2beb2eDL2zlr0=;
        b=dOZTUey56VtVYbXnY3+tEt/JWqZHq6DrU0PQ4Rz0B1POcj5NQ/eDFEY6CtIk2Of2VA
         wGnoidfq/Cr3O6fKWvoI/e+tbIqtuNf46ke9jbM6tqzJRWaZvT7/GdQ3KYBnAjNKCXRd
         VuWG5ERmebxpLlh1CbcrjnOJcTF2qB2iOG+HLQhkvM2rlcJv5/UQVweWERzhrWEZ6ynQ
         PhnWIkijIuDUU/9/t0TmHD+adZW+Ffxu5x1yk+AFQZbcZK5UcmmAmwHNJvhmzi8fMH7x
         w3Ia2Nx+Toa1cTEbiO6GhUNB4JWs8M908HyyNapnI8SnIeczv2oLelhVXswQb/ua3UY+
         j+Og==
X-Forwarded-Encrypted: i=1; AHgh+Ro1W8dJnXd2ftMNzxnvcgnE/dGK37H+4n2Pu3Lv77SM91C80A3kZgkKZPiY2BolvIuLRCBt5La9+Zw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+cPVJsj7C2tbjWNpfSycacdlKul3qDtX8H0yIH4tSnhYJs1yy
	G0CwJo4aYnDz04/jpgngu07JqmcZC574kHDyd/Ivv7amk0hDt+UzCxyLIvfNog==
X-Gm-Gg: AfdE7cnyu+w/SW21BwCd15lt1pXN9nDHQH3G/WaaR/yZH+K01hXUOD/prnjdYJT87R2
	aFqgg9ahi9MT/5Azekz9g2o06MfohKw6DfxJnjkffXrQcVmtGm1Tc1aQRkXU/y0ngEQYnYb8Aye
	e/uA+gXCbS43QZE7LP7rLlk24lUu1XV/25z7DLdWREYDlCj0xkXbaBiEplea1FxUIu5SXbwVl3I
	hzjBDtD5fVNSDoq5e2Mj5DA4wMtwiZZXIuActzoENxrH81PXEAh0mWaLaLkxXc2FaKznjOCOIVD
	ccY+KMe/yg0p0FX90rcxD5PM+YlqHdF6ixTQtIHIAjLtIJVhqgFTKQpJzTQyAs9JFEm+w9TJ8AR
	VAgACOKmzN6V7YaLhP0gSDqnzt8Nui2h8GOxzlUisgZqEdoe9zTKWx69PNw6iRW6mH0AgpLGq4L
	VYMCL1V+Pj3lL8SjuvqiMhTg==
X-Received: by 2002:a17:902:cf10:b0:2ca:b300:43b7 with SMTP id d9443c01a7336-2ccbe3f1a73mr63797925ad.4.1783462800142;
        Tue, 07 Jul 2026 15:20:00 -0700 (PDT)
Received: from [192.168.89.2] ([175.235.236.90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d952sm18087585ad.61.2026.07.07.15.19.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 15:19:59 -0700 (PDT)
Message-ID: <f7f1662d-6472-49e3-8489-fe7d8ecebe08@gmail.com>
Date: Wed, 8 Jul 2026 07:19:57 +0900
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug 221721] New: prom21-xhci does not allow to use USB keyboard
 in plymouth
From: Jihong Min <hurryman2212@gmail.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: bugzilla-daemon@kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 linux-usb@vger.kernel.org, marx.tomasz@gmail.com
References: <bug-221721-208809@https.bugzilla.kernel.org/>
 <328d3158-8086-4de7-a96e-7c2a514e3018@leemhuis.info>
 <620721eb-2b0e-4279-81e2-420996195206@gmail.com>
Content-Language: en-US
In-Reply-To: <620721eb-2b0e-4279-81e2-420996195206@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

PR for Dracut-ng is now submitted:
https://github.com/dracut-ng/dracut/pull/2491


Sincerely,
Jihong Min

On 7/7/26 18:53, Jihong Min wrote:
> With a little more of thinking, I think this happens due to the
> initramfs building tool not including xhci-pci-prom21.ko when
> xhci-pci.ko is built with the Kconfig where USB_XHCI_PCI_PROM21 was enabled.
> 
> Can you check your initramfs file for whether it holds
> xhci-pci-prom21.ko correctly, or not?
> 
> For example, with dracut, you can do something like:
> cat <<'EOF' | sudo tee /etc/dracut.conf.d/10-xhci-pci-prom21.conf
> # PROM21 xHCI PCI glue is needed before root/LUKS unlock when xhci-pci
> is modular.
> force_drivers+=" xhci-pci-prom21 "
> EOF
> 
> 
> Sincerely,
> Jihong Min
> 
> 
> On 7/7/26 17:03, Thorsten Leemhuis wrote:
>> [Switching to email, hope this will work]
>>
>> Jihong Min, it seems a recent change of yours is causing trouble. See
>> below for details.
>>
>> Side note, but not my area of expertise, so feel free to ignore this, as
>> I might be sending people in the wrong direction and it's just a hunch
>> anyway: wonder if this is another of those situations where the driver
>> needs to be in the initramfs. Tomasz, did you have SENSORS_PROM21_XHCI=m
>> when things were broken? And if yes: have you tried if adding it to the
>> initramfs or setting SENSORS_PROM21_XHCI=y helps?
>>
>> Ciao, Thorsten
>>
>> On 7/4/26 17:41, bugzilla-daemon@kernel.org wrote:
>>> https://bugzilla.kernel.org/show_bug.cgi?id=221721
>>>
>>>             Bug ID: 221721
>>>            Summary: prom21-xhci does not allow to use USB keyboard in
>>>                     plymouth
>>>            Product: Drivers
>>>            Version: 2.5
>>>           Hardware: AMD
>>>                 OS: Linux
>>>             Status: NEW
>>>           Severity: low
>>>           Priority: P3
>>>          Component: USB
>>>           Assignee: drivers_usb@kernel-bugs.kernel.org
>>>           Reporter: marx.tomasz@gmail.com
>>>         Regression: No
>>>
>>> Created attachment 310416
>>>   --> https://bugzilla.kernel.org/attachment.cgi?id=310416&action=edit
>>> output of "sudo lsusb -v"
>>>
>>> Hi,
>>>
>>> After update to 7.2-rc1 I was unable to type in LUKS password in plymouth. I
>>> tried both of my USB keyboards, but both of them just briefly lit up the LEDs
>>> and then seemed to turn off. Bisection pointed to
>>>
>>> commit 364f4a55c661641c02c86a849f0608d8fc3c0006
>>> Merge: e4b4bfaa5090 1c2b66a7d725
>>> Author: Linus Torvalds <torvalds@linux-foundation.org>
>>> Date:   Mon Jun 22 12:09:47 2026 -0700
>>>
>>>     Merge tag 'usb-7.2-rc1' of
>>> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb
>>>
>>> and then
>>>
>>> commit 9e896b4a48c4e815956d28961448041c80ad5a19 (HEAD)
>>> Author: Jihong Min <hurryman2212@gmail.com>
>>> Date:   Tue May 19 09:07:31 2026 +0900
>>>
>>>     usb: xhci-pci: add AMD Promontory 21 PCI glue
>>>
>>> After setting SENSORS_PROM21_XHCI=n and compiling kernel again, I'm able to use
>>> my PC normally.
>>>
>>> CPU: AMD Ryzen 9 9900X
>>> Motherboard: X870I AORUS PRO ICE
>>> Output of "lsusb -v" provided in attachment.
>>>
>>
> 

