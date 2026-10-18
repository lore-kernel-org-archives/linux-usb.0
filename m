Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45B02AD0C
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 17:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792346285; cv=pass; b=mNijvm6BKfQiMi0LcSn2mZvsrmub5U8aOYP3z9ifHL5I1LB1giMcAARVUbbeEr1jZAr8cCkQbRuaIguT08TgWI1wXBXbU4m6jS3CFMj010/dyifraVwMWzyty8HbA4q6dBJnZflTxc9AJ/JposJEZrPwjnprlGKIZfSAQ7aqiJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792346285; c=relaxed/simple;
	bh=iQPskCNoqtPoMIcpKpZqttiB5ypZPAjgyiyTyp6wuYw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=d0p50wfpEdY8j+887xvzJbymYXhvnI6anvXSeMG+xRxISEMajiGjxFTwLWeLPdL5bjp95sKS1FnEGqV1lzuWwPtCwcry6C0ETOj07IVelS+DQQeTZxoqUlFY7c1X+HvBScc8eQsUi56F8nFOCcN9Wtu8B/CsHJ4tmvaphUOba4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=voidship.net; spf=pass smtp.mailfrom=voidship.net; dkim=pass (2048-bit key) header.d=voidship-net.20251104.gappssmtp.com header.i=@voidship-net.20251104.gappssmtp.com header.b=XkeD72Qc; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=voidship.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=voidship.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=voidship-net.20251104.gappssmtp.com header.i=@voidship-net.20251104.gappssmtp.com header.b="XkeD72Qc"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-675676afc3cso1362205d50.3
        for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 10:58:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792346282; cv=none;
        d=google.com; s=arc-20260327;
        b=ENzePDDiKi1hzTtqBlVUypMjLUuGflM4V10pmaOGIpu80a4vLAnjJbg7shuX4AhG3Y
         txZTO5ubdo3kH0XX2PYXTaFEo1kKe8e9vY7uZoHkPI41RRTbV9w6tQ4hAkmAZv+qbsOC
         wRj6RqPkNVcgAbfP4G5E/+0V3eaclEU6aut2DAJIRom6le3M6TcQH0P4pFpq1IKq/0Ig
         9ROmNdqCnlaO2ULvjG2LNpuaRStUUf3Jcq0kLDxl/XutzhQQ/PAfuiXqQfxh86eYRW5Y
         aqhPhpYLMWIcbBB9oQydLsqDGzgTv4tU5k+haAEn2xVNJhcjziMcEdEzIQhQNUbzvuW7
         j0mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=1vqWMr0i+A+wOg3Y8J4IXW6zaKZ6EAFuThjGg28E8gc=;
        fh=lU+Ng+3RZXYLu170vVzhv9nlfsIMjyHVC8Zenn64AYQ=;
        b=nmS/+I/E9k4AO+YVp5hlSiAwJriKALS/+TWttBb0xcWlHoMhJsL+wPqREP22TDmHjv
         XEpyWrSLljoJKy6/XR972FlHpC+j4p94PXENple6S9qLzMNzh5A3esO3cwS/suEV7I5H
         9A3acszXRups7Ul94BexHcAyCPZsE/ZffYKK8GI1KuO5Cmf7fUm1VwzNfcWn6Aq4OAeH
         e8ln8O9rXKo5Sb0LAA794U+zFq8ZUMeZin/I59CbMH1zdp92NAG5dC9U2BxTpG+b1SUm
         Dr20h2Zd+HAbTm8E0dxCEQPMk8EGhGpPi5s0mjpXOg40TluPyufUJmBG3M6N6EBc76el
         ZxFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=voidship-net.20251104.gappssmtp.com; s=20251104; t=1792346282; x=1792951082; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1vqWMr0i+A+wOg3Y8J4IXW6zaKZ6EAFuThjGg28E8gc=;
        b=XkeD72QcA6zmnTfMKMbVIBz5tfb82Sk+64DoHW1Kl+x1jTsOrvvxfhnwb6ZozyADnN
         NnbpsTr/IIwPAV/hmH7CAAzFbXflavka7dsjAOiAYX+kAFf7GEwq1J/RDcDA735Qor94
         woHWkeTjNBLiEajQCdsEjqAzkwg4bESsUARBzgHuFqnBSE7ZWhTYt9Zk+NEE/vYUEd8N
         hszHUReHz9O8FONRXWyyVJFYV246fxbg+g6msq08fvcntd7/iyYObYvVgjp3ypyBX/gu
         15t50EgnyFIikKtB2eGi6IGg5UzOIy1qFFzJTdnMu2wPoacZm5KaGX2u4d8Ma+xb7kvi
         PIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792346282; x=1792951082;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1vqWMr0i+A+wOg3Y8J4IXW6zaKZ6EAFuThjGg28E8gc=;
        b=UdKMQmSB2ZOkMNwywCyF56nU9F6/MjBlnFXKDujWexz8llZJeKYCT2slsW3W8UMCFF
         Kdg9SfSZvoIFlrSMxRNUeiJLP0O9f87jxaorj3Ww68tM6MS+/EurtM/uVEmSeGcLWcMx
         dvX8+XBOX41HVl84IWo+mIYV73s6rwEqFVOPuMLSyjem+xhchnXqX4yXhTfnTQ2byNbM
         NW8h75Q0N7m8Qfs7Vx68hx1R3ka7AruGgjZG9af2Z5SDiuz/xoJz6PKsjDf0+RJ3m3yj
         dFwZi0BGe9vj6DlrP2hyAK8s2aDOvj5dvaXVGSqRaXRlpt9aPJxk7axxRXp3z3rXAk5F
         5PjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwM/WuClxmgOkFxmBq3e8ecbmdophu/PhnaCSCFX86arLBeBI+viUD3rh38uM+tkFmYl2fJPrcTKp4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgjI2lkX2zyRVu5fRzTvedqoYoAfxRwA2PfWlwpzbFdyo/5Jgi
	N8JSsNR1YOfR/SxkaT3m8WdRepAQu5LtTFEDuIBvVtnERn0fZZIQNDNpTgQMPKViBSXcpH5s+Vd
	AxaPrlvedzze2J0MtPDLm2nAY8EH6xIFJEvon96Q7yw==
X-Gm-Gg: AYBFou1wWG9f+8/BaZQ9O0PX8nlsHelD4YYQX4JXledUKJGpDeoSlqS2G6HPG7CEohX
	MDIIMog+AQ98B0SLATPzqWW40vni5Tw5Tc1yfOT01u/lkGSL6dKTULY8gm1ZOnMKDMGOMnUaPQm
	cfFJY4XGhrpVQ5sD5FIOobZygPEK6MDwBGHay440UL4QIjU/jJl1HTBAAsvQxsHCm+kc6gBpEcV
	/0QhHzNSo66u7zgTtyolKBNYtq61GPv4pp/BEPYKlTvS5PCPR3NU2hX5mpx4iBkt9q6NQ6qpogG
	7BeWyXP+72BN916V5T9V/vw5zzHbijEz+MDqaBDigQu5JJ25ZF9yaD4=
X-Received: by 2002:a05:690e:80c:20b0:671:2ab1:899c with SMTP id
 956f58d0204a3-679ca8c23d2mr1000683d50.89.1792346282539; Sun, 18 Oct 2026
 10:58:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Karlos Abel <kabel@voidship.net>
Date: Sun, 18 Oct 2026 13:57:51 -0400
X-Gm-Features: AclHuK-uZlwOXUocPsVVlfaIB9gzCJ2YCWicP8Um52WGcy0S0rsyATVZG5eZq9o
Message-ID: <CANDoYxu94VsX-_Sfzj-pk4Xjfg-oZo_5=L806DHnw786oQD9JQ@mail.gmail.com>
Subject: [BUG] xhci Intel 8086:777d: Bluetooth active disconnect leaves USB2
 PLL on; isolated U3 prevents it
To: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Cc: Xi Pardee <xi.pardee@linux.intel.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On a ThinkPad T14 Gen 6, turning off the platform Bluetooth rfkill switch
while its USB link is active leaves PMC0:USB2_PLL_OFF_STS at 0 after the
xHCI controller runtime-suspends. Suspending the USB device before the
same radio-off operation leaves the status at 1. Earlier installed-kernel
tests associated these conditions with failed and successful S0ix entry.

I have narrowed the difference to hardware link suspension, independently
of Linux's normal USB-device suspend bookkeeping. I am asking for guidance
on the controller/platform mechanism before proposing a kernel fix.

Hardware and software:
  Lenovo ThinkPad T14 Gen 6, type 21QDS3DH00
  Core Ultra 7 255U; BIOS N4JET28W (1.18), dated 2026-06-16
  xHCI 0000:00:14.0, PCI 8086:777d, xHCI version 1.20
  Bluetooth USB 8087:0033, full-speed (12 Mbps), root port 10 / USB 3-10
  Bluetooth firmware intel/ibt-0093-0041.sfi
  Active-versus-normal-suspend failure reproduced on stock 7.2.7-arch1-1
  Latest isolation test: 7.2.7-arch1-bzlink1, a local diagnostic build
  This report does not claim a hardware test of current mainline.

A source comparison on 2026-10-18 against stable 7.2.11 and mainline
32c52ec87d6245ee2d12ed5dd509e40062939b50 found no matching clock-release fix
in the reviewed USB/xHCI, Bluetooth, rfkill, ACPI, and PMC paths. Mainline
does contain newer endpoint-recovery prevention after disconnect, including
042aad8d0db6 and 7e0ef4332ed9. In the captured radio-off-to-clock-sample
intervals, however, the only traced xHCI command is Disable Slot: there are
no endpoint reset, stop, or Set TR Dequeue commands for those changes to
suppress. This source review does not replace testing a current kernel.

All five cases below ran in one boot, awake on battery. Before each case:
hold the root hub and PCI controller runtime-active; re-enable Bluetooth;
wait for firmware download and boot plus successful MGMT Read Info; force
the USB device on/active; remove its configuration and interfaces. For the
diagnostic cases, also require an idle EP0 and disabled data endpoints.

Then perform the indicated action, block tpacpi_bluetooth_sw, wait for USB
removal, release parent PM holds, and sample the clock condition after PCI
runtime suspend. The clock reading was stable across three samples.

  State immediately before radio-off                 USB2_PLL_OFF_STS
  Normal USB suspend, initial control                         1
  Active U0                                                  0
  Stop Endpoint (Suspend=1), remain U0, wait one second        0
  Same Stop Endpoint, set U3, wait one second                 1
  Normal USB suspend, final control                          1

The local diagnostic uses xhci_set_link_state(..., XDEV_U3) after the guarded
EP0 stop. It does not set udev->port_is_suspended or the xHCI suspended_ports
bit. Both flags were observed clear; USB state remained ADDRESS and runtime
PM remained active/manual. Debugfs showed EP0 stopped and PORTSC 0x663 (U3)
before and after a measured 1.000659-second wait. The stopped-U0 case showed
PORTSC 0x603 across its matched wait. No normal suspend callback was used
for the isolated case.

The verifier checked command success, firmware readiness, no target URBs,
no unexpected target port writes, no target/parent PM transitions during
isolation, and zero trace loss. No kernel errors occurred in the comparison.
An initial AC-connected preflight refusal preceded the valid comparison and
did not change the test state.

At the first disconnect event, all five cases already report identical
PORTSC 0x000202a0: disconnected, disabled, RxDetect, power on, CSC set.
Their subsequent target PORTSC writes are also identical:
  0x000202a0, 0x0a0002a0, 0x0a0202a0.
Disable Slot is issued in each case. Earlier captures verified successful
Disable Slot completion even when the clock stayed on.

The local source and saved AML show:
  thinkpad_acpi bluetooth_set_status -> SBDC(0) -> BPWC(0)
  -> SGOV(0x00140414, 0), a GPIO output change.
There is no USB-suspend handshake in this path. By disconnect handling time,
the port is disabled; the normal xHCI U3 operation requires an enabled port.

Other established controls: driver unbinding, removal of USB configuration,
logical USB removal before radio-off, and extra active-idle time do not
substitute for suspension. Resuming a suspended device before radio-off
reintroduces the failure. Cycling the empty port's power repairs it, but
that has only been treated as a diagnostic recovery, not a proposed fix.

Is there a known controller/PHY or CNVi sequencing requirement for active
full-speed Bluetooth removal on this controller? In particular, should
the disconnected/disabled port release this clock autonomously, or is
there a documented platform pre-power-off sequence or controller recovery
that Linux should implement?

The guarded diagnostic patches, exact harness, traces, register snapshots,
and hash-verified evidence are available. QEMU validates the diagnostic's
guards and isolated U3 behavior, but does not reproduce Intel PMC behavior.
The internal defect, minimum useful suspend duration, and production fix
remain unestablished.

Investigation and drafting were assisted by Codex.  Any mistakes,
however, are entirely and regrettably my own.

Thank you very much for your attention and your work maintaining this
stack.  if I can provide any further details, I'm very happy to.

Karlos Abel
