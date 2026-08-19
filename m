Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE4923ED60
	for <linux-usb@vger.kernel.org>; Wed, 19 Aug 2026 19:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787167856; cv=pass; b=FHvbaY3Ffqs8IKPnKF7yDQd2QYQKa/SEJiFs6Rh+5tfueESeqakHiFEbBCz6IH0Go9lnaNWrVg+hasOakBLtEcUwnBvMII4q5vKz4vPGtY7pAiiB6UU3tC6JBuMCbBNrM7duukA44PkWtEmANTc574ZHWd5F0oc5p4o0x60HmfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787167856; c=relaxed/simple;
	bh=o0DSB0/8QMxjWA/9R98KwaTZYay/JjipjK8HHRnjHFU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=e9NallfhwyT9xAHfUWdOs7EJs5Fn/+5lJdTY9E2vVlUiYxael+dKCsZqxV+C4xZI0VjftQnD6lGLYNr7YuL1kSLqlhbPsLyduxi1fdMDBMw400UGBFCyO4VxxdUimQCrwnXbHK6+EoAtPsTgIv5tpL/lUvhkwQwejKQjwFh3ruU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUndZYKS; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUndZYKS"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-841f1dfc30fso4137017b3.1
        for <linux-usb@vger.kernel.org>; Wed, 19 Aug 2026 12:30:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787167852; cv=none;
        d=google.com; s=arc-20260327;
        b=mEH2QmfqDUek/ED7zPk8SBYtE/p24RFj+D2/NNJKa60NZux0RxwC+u/1vlIPk9H12T
         Je2ZoRJp9gHmGPrGFxGoqT2A4oGWHbF2JaiLbypLkhA0IBoAlUORXPJu1pKsOcq61v7d
         1vIWoeD+lUKSqiB4RlBb9SWNwX11VfZWFDuQQKZEW6pRcey4cKfF9wWA1xz6/3EJWley
         5sVifMtFJjAqcRwh3nLeb8XcsYxK5ja0Jre3XJGEMyWnydKdGXjWJAk9QFtUplc4waDb
         DfiAEV1teAOFxAZ0vNDrmZrlBBA33CZIAEDM2pRRNeKittxNLwL26rKMn2jSCX52M8c3
         YGxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=BULJ8hbnSbHu7w1OvVZ7GuC3YfVQUewJa4AKxr3oqPY=;
        fh=NzeVwnKHNTSa0AafMjSuZWk4S6DcM/nBUypofGRLhgE=;
        b=QdXjYa7Ha7dqQSqwBytme5ycY3UveuIFAaMUfSbGoAnbbwGKFcz0e8uSIZo7d5pM3E
         70Tzwm5o4yuku1UDqG/LtpjtDJkhTnIpiftvxVSvuJVXEsEi3kRtheCvJIqAOecziVx6
         8TZrP7E5uJIRQV6Y1b8MAXKF/dg2cOctq0KR/miXE6clmbHVtGToIQtuTwJd8/7925wq
         pj0uRjYvbHjFirYNWbRhqbp1Y19sJMlYdjTsJ4YmXu0ZIYNBPl3bxhDnI9HMJjSZaN0x
         LBZisI7rEqlOOOi+0W/9yAZ6ip3bud7mdwoS+5aZrWB+hSnxSMktCKuM3q9SazHvD8DU
         JUPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787167852; x=1787772652; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BULJ8hbnSbHu7w1OvVZ7GuC3YfVQUewJa4AKxr3oqPY=;
        b=OUndZYKSvTqf06PhtgMrqbLpxCSJPmLAMf2wRHklv2k0OwFAxXm1F4IjRd8yrGrRg2
         CHuKoNm3D50DZr6e8oq8FIZ/OLJ8lra5Mj5QbLl9CvAXGhMeJ2Jfd6arOltCV/EP/xJE
         fRsDxdgwxmYQyVH0kAlvTwNncKLS1XkLe2MEJtUmzyYSd2/qCEON0KxaaiahMAXSn5M5
         esjof70oVFPKtcWQT1HpKDt0mJZHBsQh0i5b3zoqT2HNcKbTRglCOGaw1zucXm417CkE
         fV5oY9VnlQNM7piJk1bcp3nz1Yz2QfjZuvtlAvxhelLe6ihuZXxKB+5UXxTlhU5qO1oi
         WrPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787167852; x=1787772652;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BULJ8hbnSbHu7w1OvVZ7GuC3YfVQUewJa4AKxr3oqPY=;
        b=K4YQdUb26mNAngxNtcgY6h6XMd6J19gl3BFDVQGZGHao00hXHO1BDFStmSn6TQ1ctJ
         j7Z3/Jwtkr5ygvg3A0jon0e5YbLc82wX33SmRVQcU9BPIODnHF60U+xdZ/84n+sfmMrm
         HrXKG2DkiVsrVLxh7wujjzyV+MC56ajo/mVN8bhZoQDMIo4+zom9fyS9lh1p6R6PhuYs
         bEtQR0rKxmTuGnlNH8eWb+bRI++j6smh/TMmyAnu8SP4fEzn+TN6EAbQO1KZdveHkwRd
         +p2437hb3QTD0ZMP02I2qim0ZbCXxjV9r0Os/ANAhCjqnX3VbVDMDSzaAF+WQNJgRH9U
         bbdA==
X-Gm-Message-State: AFuF++kWM/mWxnrff3EV1el7qDe7Dm/LFo/vmU9h/ZNPH6pFoCcve68d
	QhaSZ8yhx1T3MIV7veTp8G23+LsK/PKgOOC2KkrDcplCnXDzLNKQ0d/yfYNDi5fA0zFbRJMamvR
	RJty4eJ5gIBlY8LFgOCxk4KMSeS49g7EP/b3ceSbMRw==
X-Gm-Gg: AR+sD11IZGTCAKV70EoVyZBGWfXDYpT7SdumfH4Y+8BdZZF652N9Nu4kGxDyvoTP+pA
	Y6mo0MG5z+wtEIWdxJ+hVQjaICPyBpC4tJdLB+wOWBeCVBf/T4aT37X1//Z8qd1JJZFbdoumd/G
	UgYxXIuFaLDA2BlHGnedI3UYcq8Ulhb+jvgM2PJU00gvRrvBfRpSGa5tpiXEn+RlZ082sehNnlJ
	3TlOgzPt3YygJl/Jx328KUD8sq96AZDKm9ZwxJxjTReyWMv/iEhHC67FdAQhyU5HNxCYnipTiGh
	Yx0TWVv06xLM7rrzi7xthnTfQ5Zp9si8oaYsFgF6LtMlkQ==
X-Received: by 2002:a05:690c:b96:b0:82d:8dc0:9cf with SMTP id
 00721157ae682-8470c1665aemr6746937b3.13.1787167852065; Wed, 19 Aug 2026
 12:30:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Vanchez Rodriges <vrsmilemen4@gmail.com>
Date: Wed, 19 Aug 2026 22:30:40 +0300
X-Gm-Features: AcwNN1UKLAT24bdMuxdlLgk79Tqac4nP9-MIGhYwqYqm4Qx3VqxFGq2fPLPNl3s
Message-ID: <CAEoJKMsytZcfNLBWezRGBUsmOYRBxFMoEnJoNin07AH+26x6PQ@mail.gmail.com>
Subject: Subject: Built-in UVC camera never appears on the bus under Linux,
 port powered, works in Windows (Acer Nitro ANV16S-41)
To: linux-usb@vger.kernel.org, Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello,

I am looking for advice on how to trace this further, not for a fix.

On an Acer Nitro ANV16S-41 the built-in camera has never enumerated under
Linux. The port it is wired to has power, but nothing answers on it. The same
camera enumerates normally under Windows 11 on the same machine, on the same
port, with the standard usbvideo class driver. So the module works and the
difference is in how the two systems bring it up.

Hardware
  Model:   Acer Nitro ANV16S-41, board HWK / BRZ_SKF
  BIOS:    INSYDE V1.14, EC 1.8
  CPU:     AMD Ryzen 7 260
  xHCI:    0000:64:00.4, root hubs usb5 (2.0) and usb6 (3.0), one port each
  Camera:  USB 0408:4035, SunplusIT module, USB 2.0

Kernels: 7.0.0-29, 7.0.0-28, 6.17.0-20, 6.17.0-14 (Ubuntu 24.04). Never seen
on any of them.

Topology

In the DSDT the camera is \_SB.PCI0.GP17.XHC1.RHUB.PRT1 with child nodes CAM0
(_ADR 1) and CAM1 (_ADR 3). GP17 is 00:08.1, XHC1 is PCI 64:00.4. In Linux
that is usb5-port1, connect_type "hardwired", state "not attached".
usb6-port1 is "not used", so the module is a High Speed device.

Windows uses exactly the same path:
  PCIROOT(0)#PCI(0801)#PCI(0004)#USBROOT(0)#USB(1)
  ACPI(_SB_)#ACPI(PCI0)#ACPI(GP17)#ACPI(XHC1)#ACPI(RHUB)#ACPI(PRT1)#ACPI(CAM0)

Port registers

Read after keeping the controller awake (echo on > power/control):

  64:00.4 port01 : 0x0a0002a0  Speed=0 Link=RxDetect PP WCE WOE
  64:00.4 port02 : 0x0a0002a0  Speed=0 Link=RxDetect PP WCE WOE

  64:00.3 port01 : 0x00000e03  Speed=3 Link=U0 CCS PP PED   (working port)

PP is set on both ports of the controller, CCS on neither.

What was tried

  - port disable/enable: portsc goes to Link=Disabled and back to RxDetect,
    no device
  - controller removed from the PCI bus and rescanned: comes back clean, no
    device
  - BIOS updated V1.01 -> V1.14, no change
  - Fast Boot turned off in BIOS, no change
  - warm reboot directly out of Windows into Linux, no change, so Windows
    does not leave an enable bit behind in the EC

What the firmware offers

  - XHC1 has only _ADR. The port node has only _UPC and _PLD. There is no
    _DSM, no power resource method and no other control for the camera
  - no GpioIo resource exists in any of the 36 ACPI tables, only 18 GpioInt
  - the EC RAM layout, about 130 fields, has no camera field, and none of the
    38 _Qxx handlers relates to one
  - the ACPI device set seen by Linux matches the one Windows sees, so
    nothing is gated on _OSI

The known uvcvideo quirks for 0408:4035 do not apply. Those fix the case
where the device is visible in lsusb but fails at "Failed to query UVC probe
control", and that fix has been in the kernel since 6.11. Here the device
never reaches enumeration.

Questions

1. With PP set and CCS clear on a hardwired port, is there anything else on
   the xHCI side worth reading or poking before concluding that the module
   itself stays powered down?
2. Is there a practical way to compare the port bring up sequence with what
   Windows does, short of a hardware USB analyser?
3. Has anyone seen an AMD platform where the internal camera needs a step
   that is neither in ACPI nor in the EC?

Related reports

  microphone on the same machine, ALC245, all zeros:
  https://lore.kernel.org/linux-sound/CAEoJKMvx4306roZyBX7bZjcRs1T0goH3-V+nauWYnSBJMJLP+A@mail.gmail.com/

  Ubuntu bug, microphone:
  https://bugs.launchpad.net/ubuntu/+source/linux-hwe-7.0/+bug/2164573

  Ubuntu bug, camera:
  https://bugs.launchpad.net/ubuntu/+source/linux-hwe-7.0/+bug/2164574

A support request covering both devices was also filed with Acer.

I can run any test on this machine and rebuild kernels if that helps.

Thanks.
