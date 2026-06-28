Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324FF35E1BC
	for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 12:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782648886; cv=pass; b=IUr2Pad98o+RyZfnJy2mkCJ5G2is7zgFoRv7cUxVfHvUTLTao+daK47C+fv2o0axkiBDUpBLOYexh3POHI96L2VEBuA4mpaTo8p9mnO3wYI74n5gyYLV0vrmGeNwT2wVp/do00ayRn308THoddJ4b5jbckf9hPLxj8kXiK4tATc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782648886; c=relaxed/simple;
	bh=qaUW3AjuwtoOywojNgAqlgPtM3L64MbB/I19suDXSEs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=OcylTFFCVpNKodPoqT+wgwEpm2DAorEMsosAzMcamrfa9Z66i96sJwJ/mAJ3c9BpTrGlo0WgmmdSo0uCFtkpUQFDi3bOAO7Cgo1nYxWLX5TcNWnUHMr4fReqlS6uQfnX6PxwsJ4Lj/jMHslMgNrAkO3CwagmntrcKmqA9bkORUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZAHFmN6; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZAHFmN6"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-80bb41f7f3cso21654227b3.2
        for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 05:14:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782648884; cv=none;
        d=google.com; s=arc-20260327;
        b=M9e+DmPVGIoD5M5YmhKIjCFymcCAyQM/E7wd6aIfveFusd5SKDCaQvCURn5xr6VlTM
         3HfUN44BuDAag68N7l7OXGpQlrmhXlErLU3NAWZR28faajztmhvHZwXjRBXB3rG4lKRl
         TUeie55BCmyBZBetaduotz/DzcJGHIALwusbWeVCpGMgAQMTDCPcD4xBeKmwImK6CuwI
         leqETWreyQWIbxzW2cPSa39ew5131BDwcPDZwyr8d1t1Vt0hZN52yQKkaufp8wrevJ//
         TEvBymuEVJTX3bp0tg8t0/dGoBNf8Mon4e+icjsNokni1jV2K5QksIZJDdYjZJuggtp1
         VoLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=RoFKePYMv/2QYt4oAvZSrzqXmd4Fw63oxxvPL+dV14U=;
        fh=8RzGTxy+wnhDxE5ibGjVXa2/swVSYC/oiDmdQsqOtJU=;
        b=GwEJmjjR1LR3JcAs873uxW3m5baOWu/H5/i126aeHj0fkOFsKPs7lUqvJyqV7/umJY
         OtLPpU0oMEJ8OY5rt3arfuC+gzo7XliRQoIxKs7NmuT/Mb1oVzTdF5EMrC+qNwSqXg09
         snP1asSawrR94aLh3B8tmWQgUlWifaB93OpKlTZ8rw3PUQUxL8LRw+GM7KQHqlV6v81+
         qnUhoivFHZfmswhEDy1ITHqWL3Msc3kMwFaze+5czd9SUYFcgxqBo8vgRA0fccqb6jda
         ZIZNmQ4KNHm3Q72q0MMak47pKxc4/SWF/s2zqe/qsuuhpZ8TGImoiOS/liiycb5omMYh
         L0bQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782648884; x=1783253684; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RoFKePYMv/2QYt4oAvZSrzqXmd4Fw63oxxvPL+dV14U=;
        b=XZAHFmN6RkmZ2HYaBvbCV/2tiZaxkCkeDKTPfqMS4oIQ/4aLog6AW1GXgnWf7cYxpw
         KrVd93Qnx2G4xviiHeTghyR6yJM+YxJQBVk1BGGj7N/EWa8nrjRryDFbE6UsOPkcu9w5
         3H1H63a3aCPPLYocbfaaQPp1wkJa3afLmfTmX7JcVw+9oZBjdlgFYBLQ42OaQxc4OEnq
         0FFsT52qKfaR1KNxDda0qeOGP8bXscN89NY4f1Wcboi0C8rCSeIdr3SKkuSGUj2YaMal
         WtCxBCiO/nalu+SUmjEOy45/CVcw8tv53y6vf96K+3dI7e5dURLwsu5+W06UtetAZMYX
         wyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782648884; x=1783253684;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RoFKePYMv/2QYt4oAvZSrzqXmd4Fw63oxxvPL+dV14U=;
        b=R0yqtlnfGRjJoRY1jbAn+bBbkF0GI5vYoySbYMEFVuHrNCstQDewZyF446ILFK7nov
         SmBEfuj1WVaTgeNnOJ51Dk0dZttA8jW2YHqf+Kna8C+w1MWMVknla/gHpuq67Sd3E391
         1gQV/Z8/3ZszZM9g+BCFnsFvLlgONKqvuM7e7CZ5pHKWcv30lGGJ2frwX8RVkiqYq9Sn
         DO+7nPQv4/skDhxACrIqVjQ+ZXBzX3bGca3UcXVxGfWMTt6ILNOJ/RnebR7S+rWxYWPR
         WrjsI8LiDpkCNmVR8KzR5VmukDdU/P31ux3loIiskKZ4Yc5HpvliasI6m16oyZLX/Zx7
         duSQ==
X-Gm-Message-State: AOJu0Yztclmj4zcEJafgXpbrBXpoVw/dXaPt5KhfT9mZtLVAoKea7NYZ
	r3D/1gjRoGhDi54rh+ExrUxNd+W6NN/nj/vzLJ2ClvT34W2HdOyWURYH4H9uLQX1WOoiD5pYlht
	gd98qzyUwFZZSGfNu1LD01pCU1MIS9HEPXg==
X-Gm-Gg: AfdE7clGXOe3ZyfbGO6E8EKlUxexZG4cY6Yy2EPHSQt2+c1+EKjZsNqmHZxI8TKj4iN
	FFJRg6FiFd8Goqa+Sz7dv3M8zMmoisCEHVDMwzRABucCMlYRcK0vUKgXn/ZAL47dUH1FMx5at0d
	hbPhumKtiErgH16A9a+5ZF6JP9CsxM8rS6kWXwPFXKYvbc28fDkjzL+HcAwSUnqkl1NgAlxE9Th
	pjZJRVr/Q8NEIjeTVm+4myaSDwXOw4IecX2VPlNWVcILUymgQGftGocxfL6OH0VsGOxVQGSrJ9E
	UyhHo8gZ
X-Received: by 2002:a05:690c:c456:b0:80c:85e5:8749 with SMTP id
 00721157ae682-80c85e58afdmr66741417b3.71.1782648884094; Sun, 28 Jun 2026
 05:14:44 -0700 (PDT)
Received: from 538537146032 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 28 Jun 2026 05:14:43 -0700
Received: from 538537146032 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 28 Jun 2026 05:14:43 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Lisin Sra <wux2418@gmail.com>
Date: Sun, 28 Jun 2026 05:14:43 -0700
X-Gm-Features: AVVi8CejQcXg41wecwn-m4CXpelYlZfpZGmzKtGb-Epi2M-jKkKZ2Gi9lLyxHgU
Message-ID: <CADr8yHn75g+6_48GUQgGGjiRXv4eZbtuaM6=f0GLQtP+a+2UPg@mail.gmail.com>
Subject: ASMedia ASM4242 [1b21:2426]: full-speed devices behind hub reset
 ~20x/min on USB-C port
To: linux-usb@vger.kernel.org
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

A note up front: this is my first kernel bug report, so I apologise if
anything is off-format and I'm glad to be corrected. I'm not a kernel
developer, and I used Claude Code to help me write and format this
mail. The hardware, the logs, and the test results
below are all from my own machine.

The USB-C port on my ASUS ROG Strix G16 G614FR (AMD Ryzen 9 9955HX3D)
resets full-speed devices in a loop. The port runs on an ASMedia
ASM4242 xHCI controller [1b21:2426]. The laptop's USB-A ports, which
hang off the AMD-internal xHCI, stay stable with the same hub and the
same devices.

Symptom
-------
I plug a USB-C hub (mouse and keyboard attached) into the USB-C port.
It enumerates, then the full-speed devices behind it reset about 20
times a minute and never settle. Input lags and keys stick or repeat.
The kernel log fills with:

    usb 1-2.2: reset full-speed USB device number 4 using xhci_hcd

On connect I get a one-shot:

    ucsi_acpi USBC000:00: unknown error 0

What points to the ASM4242
--------------------------
- The same hub and devices on the AMD-internal xHCI (USB-A ports) show
  no resets.
- The same hub works in the BIOS / Limine pre-boot environment.
- The same hub works on a different, older laptop.
- The fault starts only after Linux xhci_hcd binds the ASM4242.

Windows cross-check
-------------------
On a clean Windows install the hub showed the same resets until I
installed the MyASUS background service, after which it ran stable.
Disabling the ASUS services (via G-Helper) brings the bug straight
back. This points to a vendor service covering a USB3 LPM / link-power
or controller-init quirk that Linux does not apply. I found no Linux
equivalent (asusctl/asusd change nothing).

Environment
-----------
- Distro/kernel: CachyOS, 7.1.1-2-cachyos
  (also reproduced on linux-cachyos-lts 6.18.36)
- Desktop: GNOME / Wayland
- Bootloader: Limine
- BIOS: G614FR.316
- Controller: ASMedia ASM4242 xHCI [1b21:2426]

Tried, no change
----------------
- LTS kernel (6.18.36)
- usbcore.autosuspend=-1
- A second, different hub
- The other USB-C port
- A single device on the hub (not just mouse and keyboard together)
- A powered (self-powered) hub
- asusctl / asusd
- ASMedia firmware update (fwupd reports no update available)

Logs
----
Full dmesg, from boot through plugging in the hub:
    https://paste.cachyos.org/p/9f27cbe.log

On request I can also send:
    lsusb -t
    lspci -nnk -d 1b21:2426
    dynamic debug:
      echo 'module xhci_hcd =p' > \
        /sys/kernel/debug/dynamic_debug/control

Questions
---------
1. Is this a known ASM4242 [1b21:2426] erratum that warrants an xhci
   quirk, for example disabling U1/U2 LPM or a XHCI_* quirk flag?
2. Given the MyASUS-service correlation on Windows, is there a
   link-power or controller-init step Linux should replicate?
3. Is there a UCSI or BIOS angle worth checking for the
   "ucsi_acpi ... unknown error 0"?

I'm happy to gather logs, enable dynamic debug, or test patches.

Thanks for your time,
LightCat
