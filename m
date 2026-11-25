Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795598685;
	b=wIhX+crQGzYOT5QqH1gMrDzTcsUCaF6CrnWwuxF2pl/Tk9sMBkyNCudjca77/WX6RJDf
	 S8vbHRKC8on1zZpcLIG5fk0V6waYr4qyBXr84AneswiKbcbLVoE+FCEe+pZuRVyoQ1NjI
	 7uA50f6f+Dx+HS9kiu1tYM9WwTNIdO6LlsoP4WG+ntVrUGlzi7HO/spKM2NUjqlaCiXNM
	 8bXuNMeuRF7aHe+tYawxmMqpYoOESXYqSBZTPTiLkmhiYC/y1Z6GBOmic6gUK+ZSAZJrU
	 xDm63Xnw6ukz82FaO5KQKtIRJENxpVHDVXrtlKJYPtVEP7t7j1cKAFN5l/kdh242yyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=LoUqXSMbdzfiCID2GLThVhw132KJLt9huSg+e/LMgag=;
	b=Yvbeq91KyVDsYomKUXxgI1XuTqsNq9RfvmL94OK8zRqX2upJ2sbKVM+JXAGtdrW+LE8s
	 kXHMEMrpN2OVKlXXmhxVnTfbi1u9c2YYz/ijo29t8dMtAHyT7tVPB/8K37lZA5WIAT1p1
	 QOgRKu3/16gXSTSt7Q1qBV2IvNPXTEHwWgLfpGHOBbC+3tDD/yr01vyfenpxSZZqSz+tx
	 ys80czuLOjwyWvkkgD6uTynhMMBEAdcP8rtC5vxC7Ur7eWh5Kx9/0zyTTIE3MtFlRf2tZ
	 qqtogMcZMVgakMKFVO51dq6DW9HmlmmtPBkf7g3YESBr8DYXV6dn4PO71RkXcQnv06g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qCkJlMQj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50153606A33C
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 09:24:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50153606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qCkJlMQj
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ad0102edd4so49388381fa.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 01:24:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795598683; cv=none;
        d=google.com; s=arc-20260327;
        b=g4g+OcT2q5KbJOV9PaRAWjrNSzo3kFpQdegI/GmRptRe+BM6ALP8XyT8sM4cKIXXWQ
         yKbCWK9Rhf5iFXHfnCN/PH1sb7wC1QSLcutC2AkHGudrMvSuyTAtsm/60uwIkAnOsU9u
         dkKwncBFVPyQzfharr1UzebXV0IOCjGtOsEQkK6kfUfxF1NZvk80z+vBCJzZShxfdMZR
         KDTawp6KVTcptiUIURDPIgJMQ66VJ9k/fGM/aCBLu4RTSXPX5kV4ZTakpx+HBAVe8mdy
         TJ72XMfZstBCI3XE6tZzbeoRVGPrgOuSbopy4tRVkrTz/YA/fKxDDDYxvnpnq9BQoUhY
         Qwbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=LoUqXSMbdzfiCID2GLThVhw132KJLt9huSg+e/LMgag=;
        fh=wmTmlJhY1fVvA4iACQ/HhNpTIT78BVdam9y1BtV+/B8=;
        b=C5bcn0beFUKVTiJZWnnUOhK0uuuYXpIqQvGN6qbr9L+vsCeWuGy4hIOR4TeE3sTAID
         cPHzMv3aI0yxTXn9BJ2b7NlpSBN1kAU71gDBMO85KDR/aVTqOLouG/qjTmLPxgAndVT2
         4eqX31Srd2h0VgLeqbFlESQf1wB7f6HL+3QREGVFodYlLLIolSKb+ZYgRhaFOgVrJUyt
         dW+8h2MXw6eWHF/kNDWno6ARD395SQB/b/uqxFufPFq1Uqf3955xxzQm9HImGrA67w9J
         pEfskXptylh1X0yI7v8oCDYhlOD7T/0lBU4SVLOJFN+icAg2knJnUAbQ88Q6W/5p5q8u
         Inaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795598683; x=1796203483; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LoUqXSMbdzfiCID2GLThVhw132KJLt9huSg+e/LMgag=;
        b=qCkJlMQjsRmoQ/WWXS+fWVgBpLmg0ubGdxJV/jFJEDLuza/6J4hrKHYJAft6I0IbsZ
         AQHkRfBVY34ST9BBzxuQZ2WBGFoandD4oMZYyZ9fxHnBk3a2GLgxm9P3jU2bi6uCqM1L
         EgO4aWCktsCnI7uEmEWCULgYw+MoY6qIU+tHlq1shyR7IDdDyOBV9G1Qgi02WZVBfZUJ
         UxfRirBjClTslgYuOLmnvVBl0Yn+WFxsjqP81NVtIQtYv/ls4mQ98FeCzTp0o9whxORV
         Mdb0kCFRkUx2bN6tAZhCl5YwPJZeHmaAN+EM3QOwLRvXrdXwbsqwqtS2hlD29oQJvJFB
         lVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598683; x=1796203483;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LoUqXSMbdzfiCID2GLThVhw132KJLt9huSg+e/LMgag=;
        b=nbijPhftqxYsdd9z/2nj1itdWM8lkwSYsygqFA3oFlk9JrhxxSsWlaU87cWAoJybG0
         0b1RVmRJSFpBILqqLMtmi3EqQsAKjF0Myt3IRRJ8hYhEKNXFy15l6Zy5Sc1R4ZIioG5O
         EPgm1L7Uwr3q8uGZBMfEKkgSeKvLdkKqIJQPXMGHODnjJWYR2kQfWYR3ecn5g5H2c6Ws
         p63ErJETCC5ifHtup+yy15dQ86rXw+jpSiffZfF3r9Jy2/TO/XA1s8IV3HiCPDLYrDmC
         oJ/Vuqpgk71NMHEAFFfRYcJ7fB4rWlgCNoAgWLhqAVrHu44Z5Fd3ukuvxu+JedvJXc0w
         VGRw==
X-Gm-Message-State: APuU4Z9pEzDvZGT6OHQZsu5V+T469ZH4S1oCgvj+plCM0kpy1M3fcoFH
	QYmpbEZxlmbGJItRyz0YMpIyMB3Z+40ypdtZD5nGjXuB4USbYPeacsaKvQTDDeKLPQvlmnm/Ngu
	CCGoo07ZNBkPwWapS6hXZZjJ6R+6LOJs=
X-Gm-Gg: AZFdTZdXtvVd2z7g/0K6mdx3C/APzpnEUAaFAKuDp/BFKuhrIja21lfPaRFx4HWhXSd
	mkuiRN0wKq7buDn9yBrA6JGk4owP7BLNzW71SD6odkET1wkkMxxTUKg6vYMvop87rqnYyojCVHn
	MQLZt92uv30qOLVLDu8Oss716UZsDkAqfbzJL0mbmSyE9l099ulbRFBSpdF0pHjl9IVdNhx5Vol
	Jj5/WQ++ai8zmAfpBXBFL0g4Grqs37qGrs92cPSaRnC1agmcbRkSI9LrSfmGXZbpBBgLWVFcflE
	xr/QGHj4OcaG4ZGiMcaZf56XtXwrKNpdXfUYp/CBlzydDbVrMIv6L8ta2vM5RkhV6mTxNYbPCsw
	4o9uIMyyNxVgPxH8jMU8YcOOVWMFadJX+MynVksnCJZxRj6TGMUGGzX5e95TlX/Bz/wGi
X-Received: by 2002:a05:651c:1585:b0:3ac:ff0a:9d85 with SMTP id
 38308e7fff4ca-3ae7f9b2233mr51182081fa.7.1795598683266; Wed, 25 Nov 2026
 01:24:43 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Jun Cheol Gim <dialogbox@gmail.com>
Date: Wed, 25 Nov 2026 18:24:31 +0900
X-Gm-Features: Aa3M54qT9tnmZcrxybXqvrlGXEWwLRvn7QmQG1FspTFq6CZWWSzhu5tBjdUlIuw
Message-ID: <CANb8v8EGmQf90hRvr8cE3vTKOOY8b6LTxki1uORW_TJ9HadrZw@mail.gmail.com>
Subject: [REGRESSION] Lunar Lake: s2idle randomly misses S0ix when PCH xHCI
 (8086:a87d) is runtime-suspended; much worse since 7.3
To: Mathias Nyman <mathias.nyman@intel.com>, Xi Pardee <xi.pardee@linux.intel.com>
Cc: linux-usb@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

On a Lenovo ThinkPad T14s Gen 6 (Core Ultra 5 228V, Lunar Lake),
s2idle sometimes resumes normally but never reached S0ix: last_hw_sleep
is 0 and the package stays in PC2 for the whole sleep (about 1.7 W
instead of 0.25 W). Since 7.3 this got much more frequent. Full details,
acpidump and logs: https://bugzilla.kernel.org/show_bug.cgi?id=222281

I narrowed it down. If the PCH xHCI controller at 00:14.0 (8086:a87d)
is runtime-suspended (D3hot) when the system suspends, the platform
fails to reach S0ix at random. If it is kept in D0 (power/control=on),
the failures almost go away, on both 7.0 and 7.4-rc4. That is why a
live USB system with a USB stick plugged in never failed (280/280).

Test loop: battery, no external USB devices, screen off, then
rtcwake -m mem -s 8 repeatedly. A cycle counts as OK if the S0i2.2
residency increased. "instr" means pm_debug_messages=1 plus an Intel
PMT telemetry dump around every cycle. That changes the success rate
by itself, so runs are only compared at the same instrumentation
setting.

  kernel               xHCI 00:14.0          instr  OK / total
  -------------------  --------------------  -----  ---------------
  7.0.0-44 (Ubuntu)    auto (D3hot, default) no     112 / 130 (86%)
  7.0.0-44 (Ubuntu)    on   (D0)             no      99 / 100
  v7.4-rc4             auto (D3hot, default) no       5 / 30  (17%)
  v7.4-rc4             on   (D0)             no      95 / 100
  7.0.0-44, same boot  auto                  yes     45 / 100
  7.0.0-44, same boot  on                    yes     96 / 100

- on vs auto: Fisher p = 1e-12 (7.0, same boot) and 1e-13 (7.4-rc4).
- With xHCI on, 7.0 and 7.4-rc4 cannot be told apart (99% vs 95%,
  p = 0.21).
- Caveat on the regression range: mainline v7.0 built with my config
  (Ubuntu config plus localmodconfig, checked that all loaded modules
  were built) reached only 15/30 with xHCI at "auto". So the clearly
  good kernel is Ubuntu's 7.0.0-44 (v7.0.14 plus Ubuntu patches), not
  plain v7.0. I have not tested v7.0 with xHCI on.

Failed cycles, according to Intel PMT (LNL aggregators 0x3072105 /
0x3072005, decoded with the public Intel-PMT XML):
- PREVENT_PKGC6_CHIPSET_1 and _2 count for the whole sleep (about 8300
  of 8300 ms). In OK cycles they count 40-75 ms.
- The package sits in PC2 and never enters PC10. GT RC6, media C6,
  core C6 and memory self-refresh look normal.
- In the unnamed regions telem5 (GUID 0x12057328) and telem6
  (0x11646436), most counters do not move at all during a failed sleep.
- The few failures left with xHCI on have the same signature.
- pm_debug_messages shows no "Constraint not met" over several hundred
  cycles. The LPS0 _DSM calls always succeed, and the RTC is the only
  wake source.
- Nothing read before suspend predicts the outcome. I checked every
  32-bit field of all 9 PMT regions and the PMC live status.
  Consecutive cycles are independent.
- Real lid-close sleeps behave the same way. An 82 min failed sleep was
  blocked by CHIPSET_1/2 for about 4960 s; a 105 min good sleep was
  100% PC10.

Workaround in use (one udev rule, split with backslashes):
  ACTION=="add|bind|change", SUBSYSTEM=="pci", \
    ATTR{vendor}=="0x8086", ATTR{device}=="0xa87d", \
    ATTR{power/control}="on"
During suspend I see no cost: OK cycles with on and auto use the same
package and Psys energy. I have not measured the idle cost while the
system is awake.

Questions:
1. Is there a known LNL issue when the PCH xHCI enters system suspend
   while already runtime-suspended (direct_complete or similar), as
   opposed to from D0? Should xhci-pci resume it before s2idle on this
   platform?
2. What do "Chipset 1" and "Chipset 2" in PREVENT_PKGC6_CHIPSET_* cover
   on LNL? Can the telem5 and telem6 data narrow down which IP keeps the
   package out of PC6? Raw per-cycle dumps are attached to the bugzilla
   entry (xhci-pmt-data.tar.gz).
3. I can bisect v7.0..v7.3 with xHCI left at "auto" if that is useful.
   Each step needs about 100 cycles (about 30 minutes) to separate the
   success rates reliably.

System: BIOS N4IET31W 1.17 (latest), EC 1.12, microcode 0x128,
Kubuntu 26.04, KDE Wayland. The cmdline also has no_console_suspend
(removing it at runtime did not help).

#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=222281

Thanks,
Jason Kim
