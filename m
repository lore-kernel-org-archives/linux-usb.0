Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC7D3803F2
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 02:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789871258; cv=pass; b=kaq9UwEzaZ/5X3MsknI9uf0AUHKtgen2ZuB+c6jcXc+28a5iqe9BThuLT9g1+nTRuk0yk2JGhr2R/6391KhD+XWZRCAUPzxGGh0GfBT3VstqOyyClV0AC1gPj2By6IPFDVlkdimmfoHxhy27CocOjEU9gzHuBj5+Kz6WIBqz5FA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789871258; c=relaxed/simple;
	bh=JmsxqgERBIPiXTcKFmSyaxBfMOkZp3IFKvwnMLLzO10=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=RH+PttNDcBBgjpSQUwopFFT+ZntCeiWlpFQ7qz/6PvqYKfdOiwVTzIE67CqBPk6ha42zScbC8l6coC/nCNGM8SP9xZDuO6lMAIhkt+b6vAbR/gSAbECDZYoYGZwg6yluXwLCE8uJsMN4ij4l6NYeBJ1ylZXOsjt8XJBC+sy9838=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EBYQb3vV; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EBYQb3vV"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-8961cca9193so23510827b3.3
        for <linux-usb@vger.kernel.org>; Sat, 19 Sep 2026 19:27:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789871255; cv=none;
        d=google.com; s=arc-20260327;
        b=rscx0o1q+T5PIlyxJFbLLwdvjOQmW+7HlZZ4ljVPJnKOV+j4hYW3ieodYtX600jWEQ
         cwtqZFOYWxGRM3nPgnkUpQWP9gq/BNAaQhorw18x/lNn/lC9DHBJb/9jFd30Hize6zD5
         p2F3dwXbqRhspGcznaij0TlfQyOIk2Ddh+CPSDb1ZOBKBWSS+oA9eNr7p0fMmIc3hYbl
         flveuyS31Wdj2cZRANUQAToR5oRzKr9gBBK4xjMtsU7IrowVnnjfZKX5cLhVT8tQl3UY
         zzNWZnb/VPoquk+3hYIrK9rEMrGvbCnG+iSJ95DDqNvMa9ki6kcP1soqnCguxRBnDVZr
         CtkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=0Gt6NyAh55EAxMHMq6eoFxjUVSj+2cyHI/JsZGgQ8Lc=;
        fh=1WS9/1j1s0+EjLgl96l0aSF2fs+BvgGqKobOkvvxSSg=;
        b=PnZD6zB00yg3zzYDs6yK9xUeFvV3TvX2CsMjsBnbqReJCyUjjhmU61j7MWTY7cgRwG
         AlKprcQ3NiZhCF4M1PMX0OZRDmbG3LF+5v0wIdZy9yQKbVBn5JytF8UpmIX3rn2yPob0
         sNKlfAElxTea0xo0FRqJgqFeG4z03SYdFQBXwerrZnlMfnDmFB8oC4HWwznSmoym9Bl6
         wS/btV2EpzQKJjjEvUCEbqjopIyWWNALnI3DSbkpNttVliETG8y5x8HN9vxEoMnV9hFy
         QXJ/ecpJbiddpOGl2smGFuNCVQiV0cak4qiCKlzO7d72dBcteRTO9L4cpQbzkD9rp9ex
         Rf6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789871255; x=1790476055; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Gt6NyAh55EAxMHMq6eoFxjUVSj+2cyHI/JsZGgQ8Lc=;
        b=EBYQb3vVIzmuQeOD/l9NkipjsgDg2Gkq8baXkzjHHnACjcKZo1D6wsq6hOItWmtNqR
         G3eGXGKEi1Wc2HXAZ1kODu8PW8I54anJpvSMHOuRktPSaXPH0WuwOF70Jby1We970f8B
         WbdBy7r69vA8VVrqFa350CEBUSc/fkLWMBt7viKqg2pLU7kM8Z0Izh2u5yS3R++dUAaG
         Qzv6hNV55qI3McF3DB9gLJDNttJsnOYG/NgEfEMMus15756DgVyPHGw2aL4CKmaNovr9
         /vRRfiYDKp1CXkaDdE9eDcKLXqQV+VFyxB3Uw/YQ2TLlJB6k5c2KDkX7et0CgrduMfIE
         Hgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789871255; x=1790476055;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0Gt6NyAh55EAxMHMq6eoFxjUVSj+2cyHI/JsZGgQ8Lc=;
        b=GvbtqnunJnumCHPahLu+YaosR4UqpJ+GIZYi/y/BI9/G9pyvLViEOICYNMOjztWOOP
         RYesR1O5eWbc24wNZru6pXmB2fIaCviAuP+1ZM6L98lCy46vfTGW/jT+okmG2X6hoR1f
         Hn7DA82iTEorA8kNSyCU6DLCT++Xl5vMsrrvfcJJ2pdRSd0dmTv4BYdYYWT7FAxoq5wS
         Vv7YkWCOkAvhJZP6jdNaZcwj3swmxRnGiOhG94wid73yjOOImCIRevJ31eJ1epML7n/C
         zXjI83GPSSWXoRjNecupcgMnuK3PmuSQIrkROxeP/b8s1hcK12lSCp7paNiqD7gcTIO+
         oDkw==
X-Gm-Message-State: AFuF++n1xgwxvKn+RxSgBjidL3sMr6XP95X93Q0yneLH28IBjRjRSO+u
	6P+EujVLA05+iHeyXqnQMvi5d95hP1aQtbKd8kcFN57fEKimEl94ymSgf/mE8jdfi3JFNn1sXUD
	+egJoYAfcmYnKstcGv1hdQkq3DbFyTXkQ5Q==
X-Gm-Gg: AYBFou1+IVJoineMiskNtndp2yyX/ULFe06EeZlzzc7m6bbYrJoMrCTd2vMr6dyHMzs
	GphDw3W6W/8WhQO79+rGpdRe9CdqHtesYNs7xO4enF20H4X6H55A8VTdcEUNkLe+2RP5D2fa+tD
	9vWl8YtFjZpgnwKwgwLRIFcpCnh0HYuIK6MJnWne/R7365JjI13IFJuXCduJrmuamO78eb0nBWE
	eaE1SQUMtvtp4whLlxaPmL028E/vbfGGDBJaYJDWCaGmV2huFrDc3fFFtIET7DiGSn4J+CeXish
	XIzaU/Ow6b9liZrhjjfEig08zy5B67/fyVEkfPASdaBMnr0E7SCDKuWS6tmO7hZa6xHaf28qSPr
	4vTb22Xs=
X-Received: by 2002:a05:690e:4399:b0:66f:7d56:cf77 with SMTP id
 956f58d0204a3-6717fcdc0d9mr1244517d50.26.1789871255418; Sat, 19 Sep 2026
 19:27:35 -0700 (PDT)
Received: from 313336824172 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 19 Sep 2026 22:27:35 -0400
Received: from 313336824172 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 19 Sep 2026 22:27:35 -0400
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bill Supples <william.supples@gmail.com>
Date: Sat, 19 Sep 2026 22:27:35 -0400
X-Gm-Features: AcwNN1WcNLmO6x7Mr3KU9rUdp-8wSNoGANUF_p4iTf9dDP4F2hQ5p6PVuv13YOg
Message-ID: <CALstvAszkahhGkj0TxOmwBLsVvrjc_OnEoM+QY=-6YzMHAxrkg@mail.gmail.com>
Subject: USB: HP SK-2025 (03f0:0d4a) fails to re-enumerate after S3; port
 power-cycle does not recover
To: linux-usb@vger.kernel.org
Cc: mathias.nyman@linux.intel.com, stern@rowland.harvard.edu, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello USB folks,

HP SK-2025 keyboard (03f0:0d4a, USB 1.1 low-speed HID) does not come
back after ACPI S3 on an MSI PRO B650-P WIFI. The kernel disconnects
it, attempts a port power-cycle, then logs "unable to enumerate USB
device". A physical unplug (long VBUS drop) always recovers it.

This is not a single bad port. The same failure happens on three xHCI
controllers on the same board. A Dell MS116 mouse (also USB 1.1 LS)
on the chipset controller survives the same resume.

I am not reporting the chipset "xHC error in resume, USBSTS 0x401,
Reinit" as the bug. That is the Promontory controller at 10:00.0
(1022:43f7) reinitializing after a failed save/restore (see also
bugzilla 216470). The mouse on that controller comes back. The two
Raphael CPU xHCIs (1022:15b6 / 1022:15b7) never log 0x401 and still
lose this keyboard.

Hardware
========
Board:  MSI PRO B650-P WIFI (MS-7D78), BIOS 1.I0 (2025-03-12)
CPU:    AMD Ryzen 7 7700X (Raphael)
Kernel: 7.2.4-ogc3.1.fc44.x86_64 (Bazzite 44 / Fedora 44 based)
Device: 03f0:0d4a HP SK-2025, bcdUSB 1.10, bcdDevice 2.07,
        bmAttributes 0xa0 (bus-powered, remote-wakeup), MaxPower 100mA,
        speed 1.5 Mbps, persist=1

USB controllers:
  0000:10:00.0  1022:43f7  AMD 600-series / Promontory USB 3.2
  0000:12:00.3  1022:15b6  Raphael USB 3.1 xHCI
  0000:12:00.4  1022:15b7  Raphael USB 3.1 xHCI
  0000:13:00.0  1022:15b8  Raphael USB 2.0 xHCI (no user ports)

Reproduced on
=============
1. Chipset Promontory, direct port usb 1-3
2. Raphael 12:00.4, usb 5-2 (and usb 5-1)
3. Raphael 12:00.3, usb 3-2  (current; rear USB 3.2 Gen2 Type-A)

Also failed after a cold reboot with the cable left connected (device
still wedged until unplug). So this is not only a suspend persist
path; the MCU needs VBUS actually removed.

S3 on Raphael 12:00.3 (usb 3-2), 2026-09-19
===========================================
PM: suspend entry (deep)
ACPI: PM: Waking up from system sleep state S3
xhci_hcd 0000:10:00.0: xHC error in resume, USBSTS 0x401, Reinit
usb 3-2: USB disconnect, device number 13
usb usb3-port2: attempt power cycle
usb usb3-port2: unable to enumerate USB device

(The 0x401 line is the *other* controller. usb3 is 12:00.3 and did
not log a host error.)

A userspace resume hook then wrote 1, slept 3s, wrote 0 to
  /sys/bus/usb/devices/3-0:1.0/usb3-port2/disable
That did not recover the device. After re-enable the kernel retried
as the wrong speed:

usb 3-2: new full-speed USB device number 18 using xhci_hcd
usb usb3-port2: attempt power cycle
usb usb3-port2: unable to enumerate USB device

~90s later a physical unplug/replug enumerated it correctly as
low-speed 03f0:0d4a.

S3 on Raphael 12:00.4 (usb 5-2), no userspace hook
=================================================
PM: suspend entry (deep)
ACPI: PM: Waking up from system sleep state S3
usb 5-2: USB disconnect, device number 2
usb usb5-port2: attempt power cycle
usb usb5-port2: unable to enumerate USB device

After the subsequent reboot, with the cable still connected:
  usb usb5-port2: attempt power cycle
  usb usb5-port2: unable to enumerate USB device
Unplug/replug recovered it.

S3 on Promontory 10:00.0 (usb 1-3)
=================================
xhci_hcd 0000:10:00.0: xHC error in resume, USBSTS 0x401, Reinit
usb 1-3: USB disconnect
usb 1-3: new full-speed USB device number 13 using xhci_hcd
usb 1-3: device descriptor read/64, error -71
usb usb1-port3: attempt power cycle
usb 1-3: device not accepting address 15, error -71
usb usb1-port3: unable to enumerate USB device

~12s later physical replug:
usb 1-3: new low-speed USB device number 17 using xhci_hcd
usb 1-3: New USB device found, idVendor=03f0, idProduct=0d4a

Note the kernel tries full-speed against a USB 1.1 LS device after
the failed resume, then gives up.

Why I do not think USB_QUIRK_RESET_RESUME is enough
===================================================
quirks.c already has USB_QUIRK_RESET_RESUME for other HP/Pixart HIDs
(03f0:2b4a, several 093a:* mice) but not 03f0:0d4a.
RESET_RESUME / DISCONNECT_SUSPEND help devices that stay logically
attached. This keyboard remains dead after a reboot with VBUS left
applied, and a 3s sysfs port/disable on the Raphael USB2 companion
port also failed. That points at PP/VBUS not actually dropping on
these AMD USB2 ports during hub_port power-cycle / port disable.

Questions
=========
1. Does xHCI USB2 port power-cycle on AMD Promontory (1022:43f7) and
   Raphael (1022:15b6/15b7) actually deassert VBUS?
2. If yes: can the off-time be lengthened for this VID:PID (or for LS
   devices that fail the first power-cycle)?
3. If no: that is a host bug; a device quirk cannot fix it.

I did not PCI-reset or unbind the xHCI function (too easy to leave a
controller unbound on a desktop).

Happy to gather more (full dmesg, lsusb -v, usbmon, dynamic debug)
if useful.

Thanks,
Brian
