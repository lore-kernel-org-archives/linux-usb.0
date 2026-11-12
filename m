Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794454131;
	b=E6fzaMLTJHLXxdK/RU0cv18v6wwkBFyaoDQZqrhdO/4f7UqJK/AaAkLRxGRo+rZ1OKRj
	 eiUr9wfuo7vKvLDnDbC1vEYWosSLxtfeIrVoaXH3/XsU9CmZ3+NROITrcNNOIMvneHJxP
	 tEUqJa8PKlQuXySWQk9FC/BbGzG7uGWF62TRC+k4K6FljowWQmtCYplQOCvn//VnEpGFg
	 YaHuzVeV4MpGG2ZJXhsc2dw5duUSuZ3IhTF9qWbAL3QrCAxTk2eFcoqS9Y7+dxikfGx0k
	 9AMALPuJbemCGXVEDtSz358lVo6jXTM+blFske0+uzpG5vIdRcuqqohH2g7nEgXb1cA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794454131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=HcHn4DaRv2+hECQT8RVUZ+tHgwgVlXbHmAhJXlXXpmo=;
	b=gLO/DeycPSnRPY1e+kHDj4GbycUQlMxXyqXLwXWzc5stSZrXC20UMh7S1VdAcKKTjPsc
	 Ep9y6rXsgbZfJq0UlTUeslFExWiGUJyOXr0imwfxQ/hfhjaTUJyKgqbW6+Dyfhv0LPhxg
	 HZMxBtQUlFMsMvgp0LKHscySH0GzZZODdp+WxKgKMfq8k2qMh5JLnXtcWbbQFI4lY9Evt
	 A+3cvJ9dIrNBss16b0nG+UamZlYdYHcrVi9B9UZ4QjhFW9B335//eDbolnmMDz4h9QuEa
	 bmNok/N+6WbP9yH8daK4SvyhDeWWEda6Qcp+7ATce7D+doGCa6yvVfQfvfi8pd1U1ng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KKwaDcxd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22291606A323
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 03:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22291606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KKwaDcxd
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d58c50743so368322866b.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 19:28:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794454129; cv=none;
        d=google.com; s=arc-20260327;
        b=S/p/KDy5wfamwM84cMzLiMZQnQk1wWnVxHj2aK3AcEsRy8ToUEAXjuMw7oe4xzqM4f
         5ZbkKV0dN0YcqUibvzh6MDz12kKcCoyM//FfVJxLMyoW9TPXCvmSt3eqRYiEWR5ia5xW
         0tM05Pxp4EOXCyuRVNPezPaMdBoA9F9VmmgSfTO5o31EB0Oe4wjt+w8lA1vwrZ9x+D9Z
         pMnWLFrVG36ILqR7MBUyvXdzwjLuBf2QvhmY4neKUaMsTGP6ta0dhFYkAm2OBufG/fbi
         +bIJGl4CfrpUBcRok+04Z1OvT/NdRqx1GlZqKb/6cTYcTf7DC9o5+8JCoDqaPUI5PU7t
         RbgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=HcHn4DaRv2+hECQT8RVUZ+tHgwgVlXbHmAhJXlXXpmo=;
        fh=pU6ey+KNMRLC7HAQLDh4XLOfoNkJrzBBX1iK5bYJRsI=;
        b=DvJYC9bT79agYN1isF97ATb876Mvz3vI4GGDa8Wdk2fu+w0aTSz7PxOi4kDRdN1dlt
         iZT2J5GiTkUthnXH9X6wCr6VIPAZ81F9kJJ+P1tpbqqXXFz5mDxSWXxrTB1gfr3irEub
         qWLdDJeuD46Z0zOfmepGXAEaB3v5z84GJgarbBwY5fkablcDtpTJRdMS51StMg/+F1gk
         nRCgIf0NAFaVwa6g8FP+8oR8KYXNfNXAzG7J05h0V09aH0sRiPRDa1YGYOt9YJZofJmR
         AzRzWG6aGtv4IYFWM0V/aj0BsYVBiFJlYYv1+wysNGlEsmgYC4g6HmiJVR7NGtkmWEw6
         CUHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794454129; x=1795058929; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HcHn4DaRv2+hECQT8RVUZ+tHgwgVlXbHmAhJXlXXpmo=;
        b=KKwaDcxdz5o8gx8Uc7mBh3ET55XrPKo2I2NHYBp3FlN7JyG3CJ0C/mX7f8aG0wQO9N
         5RhazaX/AQr0tpdtwjnk7gPvc/sCM6B2lae8g6sdMIKb68+zhaJcMeM8gbCM3YNbIn5L
         VkNCSzFK2tXXCMRlas5gTbxHMdnpN3oJaq2aOo4jDJ2eg2ygmrJrydteO1vc290P798f
         dafsoZVm0gIfyBLh3wVbmNPAEBOB/o8ekKdSUgWdHDpuIr1SyQBAI88w+Iw0JQbqEHM9
         uSa8VWEllyLL22ZJ8nflZyDv8TGhgQDEEIeSwYbYaxNOT7iCziF/G6HBZSvlDlLnvHhB
         m5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794454129; x=1795058929;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HcHn4DaRv2+hECQT8RVUZ+tHgwgVlXbHmAhJXlXXpmo=;
        b=ZFaj/tim1JxT8m5vJlres92kKwpta3jbIhTD5eDihaeWEy4caoptmAIPVjMFg2g1SO
         0QiUk3KfiLGAwxsSj4sYQFp5u7Dn9nl29PaNkgnG+jwuX4/5km+vGg7ko+6iEoOM9UIU
         yGJZNFBErNveWfdR2C2bFje/Qxp8taSnXEEewGbTaNqN3n+VPCNL5dJcf4C39K3fmPVY
         Z+Oi1r9EZ4RozmIL7BchzmyY357FQbDOndXoSM8Vhr8fpF+SGiSkQUq1sQJWhJvAUqTF
         uUVI7GYdjBDz8zzLOFJPieJP3a3OaWfCo10KEh/8K7jOfLU9Zs+DxEZdzygabmGkUZdP
         nNiQ==
X-Gm-Message-State: APuU4Z9jIdbdzmHv/4BhrOoBtfxs/j4DL3LN5CLMsN5Ip1X0/XwJp1W8
	0wh1U0WciooOKReYx8tBRk0WF3y5qYJbyGkveLaH3UU3BfUU24/Jv7ga5GPdWXqa3k9n572Ie8p
	G1+Pvrw22McrRynsjv1GM6VXwcW79VDWybQ==
X-Gm-Gg: AYBFou2IDFtFZIOanIcbNR3X/2IdADjswQnNUIDssfme2L+uMDzKs/kPJd1UF0+52L8
	uuvvpKHg8RkjrXjQxzzBs2yFFZnlXh5y7mpQnkZnx2YADQVlbVqJMSv60FVtJYw02kr/KTt4EEb
	YGGCGNZp3dPiycFiNbdNZeQc2WVQp/2C169Lrt/hiDlh70tcFMBl3Vc6/Vwk66udxJqIpnq+ywh
	B6Qz2Ubk7W1tKxkuqMYHSTVDMjPxF+T628wXOpq6H58AGfVvGWPUpErlea5LIPiyYhsXwvyrIR9
	Ckbdpik45WtUXTAwmeSfTH+sBwu9SWmTWl75ApcZmXpAv4X5SMoxg5pLf+CDk1QeCLvACL5rLMD
	D11hQcZ9QXuxwmY6R6sNahQ8rRcrfmxcOfOrG2mm4QWjrMDomAK0beprGBjg3xbv7TYL1ZKtoXK
	n2N5i9+RYmCU1P
X-Received: by 2002:a17:907:3e1e:b0:c50:475d:9804 with SMTP id
 a640c23a62f3a-c5066aea7a1mr322211866b.13.1794454129277; Wed, 11 Nov 2026
 19:28:49 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 11 Nov 2026 22:28:48 -0500
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Daniel Burbridge <daniel.john.burbridge@gmail.com>
Date: Wed, 11 Nov 2026 22:28:48 -0500
X-Gm-Features: AclHuK_1bVADescIpj98PN2zi2aUzoZ4LlepeVyddi8KH2aU99nDSErjL3391xA
Message-ID: <CALbTNWk-0OE=3HkF6Sd+ujBeVpvjL=OwE9QHG2LNbEd3yY4Tyw@mail.gmail.com>
Subject: Realtek 0bda:0328 rev 2908: ~5.6s S3 resume stall avoided by RESET_RESUME
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org, stern@rowland.harvard.edu
Content-Type: text/plain; charset="UTF-8"

Hello,

I have measured a long USB resume callback on the built-in Realtek SD
reader in a Lenovo ThinkPad X1 Carbon. The locked desktop looks frozen
after wake, before password entry. A reader-specific RESET_RESUME quirk
removed the long delay in the attended tests described below.

This was tested on Omarchy's vendor kernel 7.2.15-2-omarchy, not a vanilla
mainline build. I have not established a last-known-good kernel, checked
taint status, or reproduced this on a second machine. This is an initial
hardware report and request for guidance, not a regression claim or patch.

Hardware and original settings
------------------------------
- USB ID 0bda:0328, bcdDevice 0x2908, product USB3.0-CRW.
- Fixed internal reader at USB 2-3, below PCI 0000:00:14.0.
- Interface driver: usb-storage.
- Before the workaround: device quirks 0x0, power/persist=1,
  power/control=on; runtime autosuspend was already disabled.
- System sleep was deep/S3.

Observed behaviour and measurements
-----------------------------------
Closing the lid normally, waiting about ten seconds, then opening it
produced a several-second delay before the lock screen accepted input.

One temporarily enabled pm_print_times trial identified this callback:

  usb 2-3: PM: usb_dev_resume returned 0 after 5588546 usecs

Its SCSI descendants resumed afterwards, followed by task restart.
Graphics and camera callbacks completed much earlier. A separate
Thunderbolt xHCI controller also reported a restore warning, but its
measured callback was short and was not this reader's long callback.

After safely unmounting and physically removing the SD card, the empty
reader still showed a 6.373817-second interval from
"ACPI: PM: Low-level resume complete" to "PM: suspend exit".
Removing the card therefore did not resolve the delay.

Tested workaround
-----------------
I added only the reader-specific dynamic quirk 0bda:0328:b
(USB_QUIRK_RESET_RESUME), then performed one USBDEVFS_RESET on that
specific reader while all its block nodes were empty and unmounted.
Readback confirmed quirks=0x2, persist=1, control=on and usb-storage.

With pm_print_times restored to 0:
- Empty reader: low-level resume to suspend exit was 1.136717 seconds.
- Original card reinserted and mounted normally as vfat, read/write:
  the matched S3 wake took 1.143450 seconds over that same kernel phase
  interval. The perceived input delay was about one second or instant.
- The reader and mounted media remained present with no reader
  disconnect or card I/O/FAT error recorded in that matched cycle.
  No filesystem write test or integrity check was performed.

Those intervals use native kernel source monotonic timestamps, not
journal ingestion or buffered SSH arrival times. They do not measure
first paint or exact first-input readiness.

A failed normal status request before reset recovery is a possible
explanation for the long callback, but the individual USB transfer was
not traced. I am not claiming that internal step has been proved.

The boot argument usbcore.quirks=0bda:0328:b has also been included in
the generated UKI and checked there. A later boot with that argument
has not yet been tested; the successful wake tests used the live quirk.

Would a device/revision-scoped RESET_RESUME quirk be appropriate here,
or is there a more suitable existing fix or next measurement? I realise
that confirming on a current vanilla kernel may be needed before a
kernel patch can be justified.

Thanks,
Daniel Burbridge
