Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F383CAE8D
	for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 07:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785309237; cv=pass; b=bieHPQRwb/A+3mlA/9xPqE9gprXxCj/ICJnDHIDaOStu8wyLQ7lFC39tROwQIF13bFPrdC98jIe/tvRv55Z5hD+LHCAjKDi0iMHvhG6vMI95B5yMrerlnNb8AuCPI/mwE/7GMTAY1xQ+oE4h6+0WCcTATeStPrB5iMWnlZCAyjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785309237; c=relaxed/simple;
	bh=KpYULavbjtKvFdrpkXDnK1yzhJE4jkFyhzzm/kEvt24=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=cIzvfUTh+dhAmLHb4LBFPiwMakU4GmWAv1mjYA/2AFQl3IviJW/6eHaA6JX5fXSlMfsblPbrgcJ+zT7ON/lywAngF4iEv60ngxHlJm7OtOw7Qwr55HXpxNQw25jTJY+nigfEwD0lHP/nri6FzXP0gUhTlfVtfubKN7RDhy5pNxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sft9mcUn; arc=pass smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sft9mcUn"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-969524c1aefso194058241.3
        for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 00:13:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785309228; cv=none;
        d=google.com; s=arc-20260327;
        b=WWR6L6NaCusMb/DaJU8gyJ6uQhVjTIr9pSgXb/D09pbmHV2ctcsQqtECgJVZ+HeWqR
         xn9YDTWh/G6cTF4gy3Iczv7MhzNoPVChfJX+1lc/nCcEjLDpTvb4OKdus/HuR0Qp4NeR
         V1wj6h3IsSW8UcShDmicRA00quJL116jEAPAfljzDZ2yonwG3q7N5NsHvBTYRttwnhlc
         HbNDG/F4NFqE0u1cPPU8B0uWOeBuY9V0RmjfhPgOaxszLGU5F9Jlwnx3J1eSyMYvwJZS
         bvozEDJ0KhbTv9irdBDc3X2fKrMUuPPih5ENvfnw2j5qYBCaAgXcY4dAoYR1JRTTr7hL
         eoGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=fs+jIt+cbjSuNDysNWabBfq+6b6qQltF4ClvU4rx7Ok=;
        fh=+o3Ju6DM5aSes1Mc6gRgBxYp0ge6yZl+8bzw/XgeBv8=;
        b=h+yUokbT9K9fihgrJqspSNhbG5ofnADwiAt0wqmqqomv2aypwnzxxLVGp30ycXQp8T
         8E8ywZmQbCrCzajJbBSW4CAwY+Av+3cfNvrxzC1adj2rVeCT3E6cuUgX7s93Dfrobue7
         5GwO2Kq4uqB+nAVX20dxUYJb7WRSEdQ+VTjmoR1qxuIyoqlmj551ZuKvvCoOevwcGY/S
         g4vvyIPxwfP5HCmUkSh2zVRgzBBZWhuoBei0BXa8fEOvJnJ0qCQhAqyNjV4FERqtYaom
         173R7LPS9YEQBJ9/QMDtHNlzuNvrtJBlzvibJK2rw2luQF+lXanymdxNM83GEwY6Kkxt
         gblQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785309228; x=1785914028; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fs+jIt+cbjSuNDysNWabBfq+6b6qQltF4ClvU4rx7Ok=;
        b=sft9mcUnUwaBwkznaWOw5tDR62xcayGvxD0I15D462BV2rkk5/GRVb/QURghbg2Juo
         seIeohFVRtcr2R/geRfBoepX0lmWZMfBRHR1wUE83jYfFEigo43wJj2ycIv1UWJx0uSv
         8ExTAvhF7qum0BSRmIv837hVoMSkN89WmRRH2Ag8jcfCkWELxRNmplLIMyyfWvZZDPAB
         hFjfd+h4LriSfQKHrahJmZUro0PTVoJhVsbuvvdktsAEK9/uC+bYzFBlzLuNTYl7SEXh
         fjWLixreDCf6CUfzHGqZ8Q2wacLb8mNoG7ZGj2zPuJK8p2zrEopukAenvmt1LF5+rb26
         igFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785309228; x=1785914028;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fs+jIt+cbjSuNDysNWabBfq+6b6qQltF4ClvU4rx7Ok=;
        b=ZJJ6H3Yh39VTxgdoaZlJk1u5N+GsrOupFj8AZ0F8qEZ2dd8gw2S7w3aDfD75Pnj99E
         dM8p1Bz6xLIvl7pRZ5zxial3GXUfImqYwmqUABbkrK7VdyWBUJuFAuxuIwR8pNiLawIF
         FFmP/fkICFx/gOaW/5yi0OGxs8LLXJHKjL6syOZuzkVTNgVe60N+mgqXKhitS7mJhr9O
         N3lCZmrehsUSfBFA4K7QrF8QOcVnByJ268EMCzYoEHaWsVyxrnJvOKj3ELIIiyCTGHRr
         2MyifZIKVm2gKBaITBg2YvQY/7HjGpQnLdxaOprIOVvwRi8iJRXf4SJKacTB4+3BBwPO
         u9tg==
X-Forwarded-Encrypted: i=1; AHgh+Rra+AHU0Hkefb67MCNjSEClIcgxf2c31KxkhAyEBD+q26JqjYM0FNhe1qOgMJPiZEr3J7GuHYT0fCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrJxXAS1eUNtmlO4UY4JyO9xUJnbTWzizvPYajgraoZdcTDleE
	LxR6f9EXT3aCv25F3jneMLQme8WbI9sI61WrYz9lpzlNt/mRJ+EQuTqqwdZxbjbtmTE00xBRRB5
	GLr6p5KJZnuxQDw4ZQgwKnbV+YJrrNUk=
X-Gm-Gg: AR+sD132taciA9cWF+y2ii0bZDKf3ERy2WbXW0g+3Ys+8FE1pab1XdG/BUMo4J6kwKi
	oZFyKr2M9SwhIlTWvSvFlwVxEL8ePFXhnNUk+TnzFxMF0hbbYjAT6cid61ww9v/Nuph03Rw9Bqu
	XoOoTCDvqgBOoaoUz9F9lEQbOvRPKRP45snZcmqH0gRwf+jKVms2/0PeYGQ2UO3tVvoc5UZI5xv
	LPdzOqsPlDUlSRqDynVgHpAwtJkO4WQ/SQ9FbtjWEb6w23mjt+wiRBL9V4yQsjpxiM9+7n0OW2H
	HL2qw74QWrxbs6A0Ev6h4PY3lypqQtnV9MIaE6UIA9eBSfxzNIZ4/LsyqA==
X-Received: by 2002:a05:6102:571b:b0:740:22ba:8a4e with SMTP id
 ada2fe7eead31-7549f657d0emr2248081137.6.1785309227977; Wed, 29 Jul 2026
 00:13:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Snake Pilot <snakepilot10@gmail.com>
Date: Wed, 29 Jul 2026 01:13:36 -0600
X-Gm-Features: AUfX_mw9EhIxqweqSgEi1AawCPL0kcmUZ0QCkalyp2e3NkfvGdVYFyBPcptR2Ug
Message-ID: <CA+fxq6gPCQOYr6mh+_1ReOGzaiTULzMazXhs5q0PXc8PsjRJEQ@mail.gmail.com>
Subject: [BUG] rtw88_8723de: Wi-Fi and Bluetooth fail after warm reboot
To: linux-wireless@vger.kernel.org
Cc: pkshih@realtek.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I would like to report a reproducible warm-reboot issue affecting the
Realtek RTL8723DE combo device.  I have included the reproduction steps,
relevant logs, and a tested workaround below.

The RTL8723DE combo device in this HP laptop is unusable after a warm
reboot.  The PCIe Wi-Fi function fails to power on and the USB Bluetooth
function fails to enumerate.  A cold boot restores both functions.

This prevents the laptop from using either Wi-Fi or Bluetooth after a
normal reboot.  The problem is reproducible.  I have also observed the
same behavior while using other Linux distributions.

System information:

  Laptop:             HP Laptop 15-da1xxx
  Product SKU:        18K59LA#ABM
  BIOS:               Insyde F.48, 2024-04-26
  Wi-Fi:              10ec:d723, subsystem 103c:8319
  Bluetooth:          USB 0bda:b009
  Distribution:       Soplos Linux Tyron RC4
  Kernel:             7.1.3+deb14-amd64
  Kernel package:     Debian 7.1.3-1
  Kernel taint:       0
  Driver:             in-tree rtw88_8723de
  Wi-Fi firmware:     48.0.0
  firmware-realtek:   20260622-1

The failing boot used the packaged Debian kernel with the in-tree driver,
no rtw88 module options, and no local shutdown workaround.  The kernel
reported taint value 0 when the failure was captured.

Steps to reproduce:

  1. Start the laptop after a complete power-off.  Wi-Fi and Bluetooth
     work normally.
  2. Reboot Linux normally.
  3. Wi-Fi and Bluetooth are both unavailable after the reboot.
  4. Power off the laptop and hold the power button for about 30 seconds.
  5. Start the laptop.  Wi-Fi and Bluetooth work again.

Expected result:

  Both functions should initialize after a warm reboot.

Actual result:

  The Wi-Fi PCI function remains visible at 02:00.0, but the driver does
  not bind.  The relevant kernel messages are:

  rtw88_8723de 0000:02:00.0: Firmware version 48.0.0, H2C version 0
  rtw88_8723de 0000:02:00.0: failed to poll offset=0x5 mask=0x1 value=0x0
  rtw88_8723de 0000:02:00.0: mac power on failed
  rtw88_8723de 0000:02:00.0: failed to power on mac
  rtw88_8723de 0000:02:00.0: failed to setup chip efuse info
  rtw88_8723de 0000:02:00.0: failed to setup chip information
  rtw88_8723de 0000:02:00.0: probe with driver rtw88_8723de failed with
  error -16

  During the same boot, the Bluetooth USB function fails before btusb can
  bind:

  usb 1-10: device descriptor read/64, error -71
  usb usb1-port10: attempt power cycle
  usb 1-10: device not accepting address 6, error -71
  usb 1-10: device not accepting address 7, error -71
  usb usb1-port10: unable to enumerate USB device

On a successful cold boot the same hardware produces:

  usb 1-10: New USB device found, idVendor=0bda, idProduct=b009
  rtw88_8723de 0000:02:00.0: Firmware version 48.0.0, H2C version 0
  rtw88_8723de 0000:02:00.0 wlo1: renamed from wlan0

Disabling ASPM with the following module option did not change the result:

  options rtw88_pci disable_aspm=1

The option was confirmed active during the test and was removed
afterwards.

The failure can be prevented by stopping NetworkManager and Bluetooth,
unloading btusb and rtw88_8723de, waiting three seconds, and then
rebooting.  On the same system, this workaround completed three
consecutive warm reboots without either failure:

  modprobe -r btusb
  modprobe -r rtw88_8723de
  sleep 3
  reboot

The fact that both bus functions fail together, while an explicit driver
shutdown prevents the failure, appears to indicate that the combo device
retains an invalid power or reset state across warm reboot.

An older report describes the same behavior on an HP 15-da0xxx with the
same PCI and USB identifiers.  It used the driver available in 2018, but
also reported USB error -71, MAC initialization failure after warm reboot,
and recovery after a cold boot:

  https://bbs.archlinux.org/viewtopic.php?id=240675
  https://bugzilla.kernel.org/show_bug.cgi?id=201239

A related RTL8723DE rtw88 power-sequence report is archived here:

  https://www.spinics.net/lists/linux-wireless/msg200831.html

Please let me know which additional traces or tests would help determine
whether the shutdown sequence belongs in rtw88 or requires a platform
quirk.

Thank you for your time and help.
