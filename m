Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD7C3E6DF7
	for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2026 22:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788386709; cv=pass; b=DHtDhEyKlSkatshI9wf3+W3Q8E6jDzuCbrY42qoc7S2eqKQ99enocJcWL/y77+cDciIgDZGpN6aqgkbDrLCiqHAGLYKyYgYMOdMvEW9zBca4kNxf7q1WGP8gV0/bNhqzDzo7TXvUXphzUTjpdzNSE4cvJ66VPcvPQB6lndPt1fA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788386709; c=relaxed/simple;
	bh=vymcWxDasHrJLG/O7a7gPtgz4cGfHkYuhD0/Qct86Rk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=JGHCKVmO6IwQZ3rqajL3ZQbHxVCuOZ6/Imes2yQW3ZvF9kF7y5j3SaY3DNymY/D6PG9imOdvsEP+XuE1FF6lqXyhdqrxHFCXmusIRGqgcwMDqBmjB18it1cONms4Xp3B/mly9qcxueUdbYK/gSgEC0QL2U7g+Y+JYH9SQXghWnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cLq4jS3D; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cLq4jS3D"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso1985437a91.3
        for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2026 15:05:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788386705; cv=none;
        d=google.com; s=arc-20260327;
        b=S/405l7M5Q6ipplAFIVuQLXrR5g2/Sa7Fdp2IXMRzcsD3oMyuBqOzBXAZtvTAWg9Mk
         uxYB/MQNSf8qJxHRErFtVe2U32YGWZSk8R5om9DSmYpWu3SAz6cJkuoNO8hcsgpvljZf
         rIMF8uspPF2jybe8Ed4nsG00d1TGVGG6Wpv55sFKBob3q2dfaxaMUvrnkp/1nbEaix1+
         ugGJag5xw3d1mASya5mNMkMm0BVt4s2I9746OnyBVphuV9W7w3WUT8ILxLnR3EGG/qVg
         Caor383aFcpyEW1xQAC3xLy8oM9LlyJy2R12ir9SJhNo84MEUXfe+WOf2/SUQMam5mAq
         WAqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=lve7n9fJPhLbV3LbTQszuhovnEe63wbSuLmE8uBG5Zs=;
        fh=ZqLUodXBe5d3K1ECFDskmLjsdFLKIdzl2actgZn48KE=;
        b=dhexZ/q1KATRQYgLqw0FoBg8zEk4ueYT+2+xVogzjNgwuRuh+2jJPfqaVdMb6sfZAm
         O/yjtW5W6OYlNAa0+/iSB+ZEUDz9d4CkGNE60DgamVtH2hvP4vTBuImLAAu5h8vfAZzr
         /E2Pjh4E1kCLYMUWRip51T+C+ZbEC/HcFsIC3W/AmLXE99JYQXU0gbcWtBvpim2TtadM
         VCuzXZYwQzzzWZOF7baO+Kb9QBXglKwHEiOLQ/l5QNj8+JQyuQ1SYoeYhPpk4DhTO91w
         k5dxsptQjltylWndjb3vJA/8wcaiPjcTv4zIkCtIk12wbSCpQUmeYXLeiQI9jc7FrPh4
         U9Fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788386705; x=1788991505; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lve7n9fJPhLbV3LbTQszuhovnEe63wbSuLmE8uBG5Zs=;
        b=cLq4jS3DackRSRXf3Ad1J2bHCh7mPWFHfn6pJJ1YABozvEdObaWlHrvF8anQiO7S+I
         4s8PebVrIfx4rK5vG4u/8+BSRQ2Du6VrW40+4Hf0AnGIA6+/8LPf+In3HNol4EOQWRsD
         ByECQecteZ/jErCkuSvZ+w095MmzWjH1D19BrRr3ucq2/7u+y6zRKdhLcp7tAxuFTmM/
         ny0MHQkR+5i1icWaaOuM+MsSLfaZRu1JdH1Ln/WBsMLK2iZRcV/Px6WXhsTzbr1RMzPL
         OcesqeAtnlTCpYUsnyDsTlIk5wzvDgj53rQRmqdFaNb/wqqZHC/OD3LmbzM95LpBDqiu
         INkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788386705; x=1788991505;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lve7n9fJPhLbV3LbTQszuhovnEe63wbSuLmE8uBG5Zs=;
        b=VETWM1kevFK6fW/0MQtXaWrWKTZEfSbCf2uFpeTvdKJU9DwQlzEaQng+9DmEp/7+jK
         VndJ5TU4S9NWO74ng2OJzc7xlSKnXA2qH5M3f2jINkqJS0p7cqwCxi4bV9nWSQZGYCns
         6b1oyGdqSpbaAwjzD6MyiS9ZtBmAux54xWHPvWvfH81O6Sal5h3myTKGFpRw014zshiR
         Epk1AGM2uDg4cTmvy22X8l+/UFBiVfQrW0x6yL8iJaaEx0neCT5CVVtg7+lo3zu9eSm0
         Az3gSt0lH1I5XgcOtOOQSJb5w+27/BVA8XF5ix6yMtQhOqUOw4zms1F/+WN6AsgBYZ6t
         0/KQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHMMcDYCE1eCXXMh5wGZ2h59YWhyalmVynvgrxg3jIxeh0oo03FWgI/2ZkQ3rNzFnYJ9filG5CE/Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mrH7N0mYlL33Uo4UVK0s54jjH8iHIxXQ/IbmPC6rsv4N8UsNSp
	mGd/1cuCXlvjIbO8Lv5weGAOkoQUcFsVSNIUjTaP+qfS1hSWXDp4PRG8rrZ3L5eZm7tUhJHRC/d
	xAIitO000lw59qqA2HGGCdBvWryz/o/UdHaQT/44=
X-Gm-Gg: AYBFou3y1ADR35ADVdxzT7eAQKbgaklwPKC2bdhJMCPoIVta1lSGkYPJknJJ8Qos8TX
	bPmhtD9ZnyMqKJc2Ic5z44oNH1fmts8l9Yie+g0uX6ffKETtyLG0sjo++YcUHjWKUnpu/ETD1Q2
	Ff0Kz1PqsA8Q2zzCBfeNiMLL7bEaYMLCLaMrRRdk/VuwC2aEdevmnbK2NQP+9BopJoEFWBTyhRh
	VQmWkzNFUKz3s+5be5/7T2Y4dFFjUABfkKuBBYXd9dpiPKvnq9TyJ+D8KqqG8c3JlP0FEyxeR5F
	PuzvDQeGeugz+wjSo3b2gyqG8yDI0DC0WDQwo2tjKxcM7Q==
X-Received: by 2002:a17:90b:3845:b0:38e:57a3:f218 with SMTP id
 98e67ed59e1d1-39aee16ff3amr9495040a91.13.1788386704413; Wed, 02 Sep 2026
 15:05:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Fredrik <whatbadgerseat@gmail.com>
Date: Thu, 3 Sep 2026 00:04:53 +0200
X-Gm-Features: AcwNN1VCdBhX6I9oZwhX6_beYo-1Kt3BLOCDqjj7Q1m7SgJrfLKqF69NYApB2-4
Message-ID: <CAHqR8QJ=3RbOaaPcZxFr31VbsnVZ_u7Q37aiDs1R379w_gLvqA@mail.gmail.com>
Subject: usb-ljca: bridge dead after hibernation (S4) resume, no software recovery
To: linux-media@vger.kernel.org, linux-usb@vger.kernel.org
Cc: hansg@kernel.org, sakari.ailus@linux.intel.com, bingbu.cao@intel.com, 
	wentong.wu@intel.com
Content-Type: text/plain; charset="UTF-8"

Hardware:  Dell XPS 13 Plus 9315 (DMI "XPS 9315", board 0X696X), BIOS 1.39.0
Kernel:    7.1.9 (Arch, ~current mainline)
Chain:     USB LJCA bridge (usb_ljca, 8086:0b63, USB 3-4 on xHCI 0000:00:14.0)
             -> ljca-gpio / ljca-i2c / ljca-spi
             -> vsc-tp (SPI, spi-INTC1094:00 / ACPI INTC1094)  [reset
GPIO from ljca-gpio]
             -> mei_vsc -> ivsc_csi / ivsc_ace
             -> ipu_bridge -> intel_ipu6 / intel_ipu6_isys
             -> ov01a10 (I2C, OVTI01A0:00)

Summary
-------
At every cold boot the camera enumerates and works:

  intel-ipu6 0000:00:05.0: Found supported sensor OVTI01A0:00
  intel-ipu6 0000:00:05.0: Connected 1 cameras
  media graph: ov01a10 17-0036 -> Intel IVSC CSI -> Intel IPU6 CSI2 0
-> ISYS Capture

After resume from hibernation (S4) the camera is gone and stays gone until a
full power cycle. `cam -l` reports no cameras; the media graph has lost both
the sensor and the IVSC entities. Plain s2idle suspend/resume is completely
unaffected (many clean cycles) -- there LJCA keeps power.

What resume looks like
----------------------
  usb usb1: root hub lost power or was reset
  usb usb2: root hub lost power or was reset
  usb usb3: root hub lost power or was reset
  usb usb4: root hub lost power or was reset
  gpio_ljca usb_ljca.ljca-gpio.0: set value failed offset: 1 val: 0
ret: -19  (-ENODEV)
  vsc-tp spi-INTC1094:00: wakeup firmware failed ret: -110
       (-ETIMEDOUT)
  gpio_ljca usb_ljca.ljca-gpio.0: set value failed offset: 1 val: 1 ret: -19
  gpio_ljca usb_ljca.ljca-gpio.0: set value failed offset: 0 val: 0 ret: -19
  gpio_ljca usb_ljca.ljca-gpio.0: set value failed offset: 0 val: 1 ret: -19
  gpio_ljca usb_ljca.ljca-gpio.0: set value failed offset: 1 val: 1 ret: -19
  ivsc_csi intel_vsc-...: mei-csi probed without device fwnode!

Note there is NO usb_ljca re-probe here. USB persist keeps the device bound
across the root-hub power loss, so usb_ljca is never re-initialised -- but the
LJCA microcontroller has silently lost its state, so every subsequent command
over it fails -ENODEV. vsc-tp's reset/wake GPIO is provided by that gpiochip,
so the VSC firmware handshake times out and the whole camera chain below it
never comes back.

If you force a re-probe (rmmod/modprobe usb_ljca, or unbind/bind the USB
interface), the MCU proves unresponsive at the protocol level:

  ljca 3-4:1.0: enumerate GPIO error
  ljca 3-4:1.0: probe with driver ljca failed with error -110

No software recovery
--------------------
All of the following were tried after a broken resume. Every one leaves the
camera dead:

  - echo 0 > /sys/power/pm_async before hibernating (the workaround from
    intel/ivsc-driver#32) -- verified on a clean boot with a working camera;
    makes no difference

  - echo 0 > /sys/bus/usb/devices/3-4/power/persist before hibernating.
    This one behaves differently and is worth a close look. The device is now
    properly disconnected on resume:

      usb 3-4: USB disconnect, device number 3

    and it *partially* re-enumerates. Afterwards:

      - ljca-gpio.0, ljca-i2c.0 and ljca-i2c.1 aux devices are back
      - ljca-spi.0 is NOT recreated
      - the 3-4:1.0 interface shows driver=none (ljca not bound)
      - ov01a10 re-binds, and the media graph looks complete again
        (ov01a10 17-0036 -> Intel IVSC CSI -> Intel IPU6 CSI2 0)
      - vsc-tp is left unbound (no SPI device to bind to)
      - `cam -l` therefore *lists* the camera, but any capture blocks
        indefinitely, and lsusb hangs on the device

    So with persist enabled the failure is silent-but-honest (no camera), and
    with it disabled the re-enumeration is incomplete in a way that leaves a
    camera advertised but unusable. Either way the SPI path / vsc-tp never
    comes back.
  - rmmod + modprobe the whole stack (mei_vsc_hw mei_vsc ivsc_csi ivsc_ace
    ov01a10 ipu_bridge intel_ipu6 intel_ipu6_isys), with and without usb_ljca
  - USBDEVFS_RESET ioctl on the LJCA device (8086:0b63)
  - unbind/bind the LJCA USB interface via /sys/bus/usb/drivers/usb
  - unbind/bind the entire xHCI controller 0000:00:14.0 via
    /sys/bus/pci/drivers/xhci_hcd

Only reboot / poweroff brings the LJCA MCU back. The bridge firmware appears
not to survive the S4 power transition, and nothing in the driver
re-initialises or re-downloads it on resume.

Questions for maintainers
-------------------------
  - Should usb-ljca implement a resume handler that re-initialises the bridge
    (or at least detects the dead MCU and forces a re-enumeration) rather than
    relying on USB persist keeping a device that is no longer functional?
  - Is USB persist even correct for this device across S4, given the MCU loses
    state? (See the persist=0 experiment above -- it does force a
    re-enumeration, but an incomplete one.) Is there a reset (ACPI, GPIO,
    or port power cycle) that should be applied?
  - Independently: ipu_bridge builds the CSI-2 fwnode graph once at intel_ipu6
    probe and does not reconstruct it when the stack re-probes, so even if
    LJCA recovered, ivsc_csi would come back "without device fwnode".
    Should that graph setup be re-runnable?

Happy to test patches and collect more (usb-ljca / mei dynamic debug,
ftrace of the resume path, lsusb -v before and after, etc.).

Prior reports I found while investigating, for reference:

  - https://github.com/intel/ivsc-driver/issues/32 -- "i2c_ljca prevents
    resume-from hibernate". Different symptom (whole machine freezes on
    resume), still open, and that repo was archived in Nov 2024. Its
    pm_async=0 workaround does not help the case above.
  - https://bbs.archlinux.org/viewtopic.php?id=277462&p=4 -- Dell XPS 13
    Plus 9320, same hardware family, same "camera fine, hibernate kills it,
    s2idle fine" pattern. Never root-caused.

I could not find this specific failure reported upstream; apologies if I
missed an existing thread.

Thanks, Fredrik
