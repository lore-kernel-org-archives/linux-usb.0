Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC79B3C10B3
	for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2026 23:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783378988; cv=pass; b=T3BwcHwAiVaGnsqu1Ran44j22r0qCa05+6YVgrH3pSQbSqPkDgEvSrGPVOc3Sv+CXBPfh9DVdCbhWsbvWTh1+3kXFJoO+xELUjHweheXLDM6yNjmrBYToxzhx+f9iqWowihHf2Xc98E142Jm2JEGu7omF76PwRSzCHfVGFhCSCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783378988; c=relaxed/simple;
	bh=7vIzpAhHfv1fy1WEJHyxG77wxwgvWM0bb9mMsdtNHOA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=gph7T5WEP31WpdfyBbZGmMxxNUfbKAOQyo+RHf8cxJhGjByR1GQCgzJda/FkFBFGt1ghm6ClrO/Lsx3zxsXDLY7ItZCeSxkI8trO4bFJkddhRSUyzXAq2JRMncLtSKkfGz01mk6Di/8F/CZibF/TXZIib8GWLKUEKpK1uq4SVgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXR0A4+U; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXR0A4+U"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2caf228a910so21331695ad.2
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 16:03:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783378986; cv=none;
        d=google.com; s=arc-20260327;
        b=UXL0bA86XHc3JbXMM8/MORWdn0iYU1agIIpmXa2t8nXt/ry3XtEZiZDxx5dwZGaBoM
         O3n+am/Ei/cVPsnNezae4TB7pMR/cwnOGCfFQOkVD8/ptG10KsNc4H89WAp8XQed87eA
         1ZR5R2h04bibppgbdaz29PvGczj9GYpkFSd0aCVlF91xJ55ppiTtCRkZu5QNq0z14P2I
         ejNPrZ4wZ5cCoGyIWelzt97unJV/s6Lb5qLFj0Ti5omCYDS9ESkr1BN8XEj4A+v0RZH5
         hyMv9r2+/r1X1sLVcqQ3HDaPcMY+7lLcJ3lBhbSl4N9qEx1tAF7IyJs6RnAOKNokTv4p
         FJmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=7vIzpAhHfv1fy1WEJHyxG77wxwgvWM0bb9mMsdtNHOA=;
        fh=GoNmhV6+oSFZmzK9Z7TXl+6ahh7GnaA7YYIVnj08qAI=;
        b=YdRJbHd9Ux7KAsnt1pPVpSh4SIuN4DNKFnm/4F6cO8uybSLdJVdBDPFotcSjPxb4IP
         dLFMit0taMe1TpR9kqPL97Ye6dJAcmkQEeCURu/M8GvMPgtaeNA9HmwQ6i6C0080w9Ws
         yBlu9y5p1X9xbQ0nhUEoU1ZHJwFz3hOY0WXjKZ3gOD2k+ptX5EYWKFao2BLMBygLpMiN
         YXrIlvzbYVwnYoKGcZGG6o6KFIRFz9KVtgnDEHUJLhTfK+2lOQrbyLd18u0RCwHD4r4f
         ST34MFI1oPCI/Tvi+HXQDgFtrRrp3/p6+FhtQ8DzyasEKEZNPenPtmWNFLzoeSZGIp83
         LRYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783378986; x=1783983786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7vIzpAhHfv1fy1WEJHyxG77wxwgvWM0bb9mMsdtNHOA=;
        b=VXR0A4+UsfWLLaz6zHzB1VZp7tYvDn6kZMiggELc8BVZkvVK+CQ6tmzKwsth65Lefq
         bUL1gqcRsL2M4XdryfgxvjeFTk4gSM0O8kdSwV7dvmapZ0tqY8TZN9vrLNl8zULQQa+R
         rF6ByUUfv+5Tvk1wlzfVu7oYAoe7xhMhagFL0QKaXHmAIphqt390PeV4vdCel+qBwi4x
         1LiJbNKgWtU09H1iOn9B9s2X6D4n3otP+ppA+cN7bQ3xUyJE+LxiUvwPcPD9vgh19ln9
         JYDXuJZGAelHy2//0CTSFt6ZXeX16vljJzVcPiebBr0cOMdfAr4do8+h/jTS9RzeesIa
         Xowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783378986; x=1783983786;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7vIzpAhHfv1fy1WEJHyxG77wxwgvWM0bb9mMsdtNHOA=;
        b=Ksr3CK7pJ6dGpBNIA3OpVUAZsMjzd5c3+uzuh7BDWorjFUSQ2HNXMHzgsSbkz+1dUX
         00Q7tbQQ4AqyAsRQeMsSWtuuSq6M4/tsokCgFtYncMIrVO6mRmQ6wvbjZ3rYGCYAKc9U
         yYgWNJePRklYaAKPEieIvYPhEGv+CY0JRb+DZol02WpnIUj19vZsdovQGW4qfIruSlMM
         6jcn5Qap6S8iJTkydior2YDsaaoK0FYB7zz06zmh8SdpXwd3xEjxNvP1vzTucIVLWKGq
         OY4uPN4zo9HP92F+8fs4E8Rbh9OgS2evp8vCasyyrY/yjbczJGGR0fHnH1EjYS6gRmEm
         nlIg==
X-Forwarded-Encrypted: i=1; AHgh+Ro2NyFX2FoFthVLYdeEKCGhTAIlM/ce3gegZV0BsEfYTtnqF/tH66YiqrvoN0twZKlSpPSPC5jqvJI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2taY+ZKzFRxcTajvZS+m4g+fajLEuFSMvPtFYEizlJVYGGi1N
	IgUZGkKIxWONuR5TDfsbgD5pPFjhHNR/t9DrFpiLQv68uCgbgz1HFN5uF8SrSZraplnqvtz+6aC
	ILgQjrbZnLniJyfkzijdzq2TxrlexTW4=
X-Gm-Gg: AfdE7ckfCHa9R8XbaWUQ+g85W0dGJVn/wvw3ALLv9ENs/7CCYxehqsvoCzSQ0Li1m32
	cYPhGkiFC7w4Ebjk/6SEOt+kfknz/MlwvJS8NtHwiBqwO7axDY/3Qtc/H97i9i7lSTmRnLm41CQ
	x3OsNXdGJ0V8yywQq5Qs7IcVZpSdw7xAUtM+4wrPrZlgZHSq+BS+Et96pqfMzS+WNd+07/s2k0e
	jiQuvDmnU8TuiB42SokxGuYVf7FTzw7XitAX6CJbbmhHNUzwp4m1OGwd/DC9bhSET3UyvlP5Xlw
	CEb1aTZvgBuPyLLD7+T0MhS+yqWR+/BAv9ndyWJ1XgBVSvl7E4QksOXj09n5BeU=
X-Received: by 2002:a17:903:37c3:b0:2cc:9473:97c8 with SMTP id
 d9443c01a7336-2ccbe722810mr29050555ad.15.1783378986220; Mon, 06 Jul 2026
 16:03:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Michael Howard <mikehow1005@gmail.com>
Date: Mon, 6 Jul 2026 16:02:54 -0700
X-Gm-Features: AVVi8CfP2onEDo6cTSEwdEHQKyYNmVeZdczZKkcxITZy1nsEUbiRjHbs2Q3s5m8
Message-ID: <CAAp0Da=70LviGBcMM1ECPVpCnU62zzXqA4qSq2NdELaxOq0nhg@mail.gmail.com>
Subject: xhci_hcd / usbcore: ASMedia ASM1051E/1053E/1153/1153E (174c:55aa)
 SATA-USB bridge fails or takes minutes to re-enumerate after s2idle suspend/resume
To: mathias.nyman@intel.com
Cc: "oneukum@suse.com" <oneukum@suse.com>, stern@rowland.harvard.edu, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

## Environment

- Kernel: `6.16.12-valve24.4-1-neptune-616-gfe145653a794` (Valve
SteamOS kernel, Arch-based), also worth testing on mainline
- Platform: Valve Steam Machine, AMD Custom CPU 1772 (APU)
- Host controller: `xhci_hcd 0000:09:00.4` (a discrete xHCI function
providing the rear USB-C ports; separate from the controller used by
the wireless controller pucks)
- Suspend mode: only `s2idle` is available on this hardware
(`/sys/power/mem_sleep` shows `[s2idle]` only, no `deep`)
- Connection: direct to the rear USB-C port via a short (1 ft) passive
USB-C 3.2 Gen 2x2 cable =E2=80=94 no hub/dock in the path (ruled out as a
variable)

## Device

```
Bus 008 Device 027: ID 174c:55aa ASMedia Technology Inc. ASM1051E SATA
6Gb/s bridge,
ASM1053E SATA 6Gb/s bridge, ASM1153 SATA 3Gb/s bridge, ASM1153E SATA
6Gb/s bridge
Negotiated speed: SuperSpeed+ (10Gbps)
idVendor 0x174c ASMedia Technology Inc.
idProduct 0x55aa
bcdDevice 0.01
iManufacturer "SP" (Silicon Power)
iProduct "B75 Pro"
bcdUSB 3.10
bmAttributes 0xc0 (Self Powered), MaxPower 0mA
bNumInterfaces 1
Interface, alt 0: Mass Storage / SCSI / Bulk-Only (BOT) =E2=80=94 2 bulk
endpoints, no streams
Interface, alt 1: Mass Storage / SCSI / protocol 0x62 (UAS) =E2=80=94 4 bul=
k
endpoints, MaxStreams 8 each
```

Device is a Silicon Power "B75 Pro" external SATA SSD (4TB), using the
`uas` driver by default (confirmed via `lsusb -t`, `Driver=3Duas`).

## Summary

After the system resumes from `s2idle` suspend, this drive frequently fails=
 to
re-enumerate on the first (and often several subsequent) attempts, logging
repeated `error -62` / control-transfer timeouts. Recovery time is highly
inconsistent =E2=80=94 anywhere from under a minute to several minutes =E2=
=80=94 and in at
least one observed case the kernel's own port power-cycle recovery gave up
entirely (`unable to enumerate USB device`), requiring a physical unplug/re=
plug
to bring the drive back. On at least one occasion, this happened while the
drive was actively mounted (ext4), and the sudden loss of the device produc=
ed
real filesystem-level I/O errors (journal abort, `lost sync page write`) =
=E2=80=94
i.e. this is not merely a slow-enumeration inconvenience, it is a data-inte=
grity
risk for any drive of this class attached across a suspend cycle.

Three real occurrences were captured in full via `journalctl`, detailed bel=
ow.
Common signature across all three:

```
xhci_hcd 0000:09:00.4: Timeout while waiting for setup device command
usb 8-1: device not accepting address N, error -62
```

## Case 1 =E2=80=94 resume, mounted, filesystem impact, never recovered bef=
ore reboot

Suspended at 23:58:18, resumed 08:07:13 (~8h asleep). Drive was mounted
(`ext4` on `sda1`) at the time.

```
Jul 05 08:07:13 kernel: PM: suspend exit
Jul 05 08:07:13 kernel: xhci_hcd 0000:09:00.4: WARN: endpoint 0x81 has
streams on device reset, freeing streams.
Jul 05 08:07:13 kernel: xhci_hcd 0000:09:00.4: WARN: endpoint 0x02 has
streams on device reset, freeing streams.
Jul 05 08:07:13 kernel: xhci_hcd 0000:09:00.4: WARN: endpoint 0x83 has
streams on device reset, freeing streams.
Jul 05 08:07:13 kernel: xhci_hcd 0000:09:00.4: Timeout while waiting
for setup device command [x4 pairs]
Jul 05 08:07:13 kernel: usb 8-1: device not accepting address 3, error -62 =
[x4]
Jul 05 08:07:13 kernel: usb 8-1: USB disconnect, device number 3
Jul 05 08:07:13 kernel: device offline error, dev sda, sector 0 op
0x1:(WRITE) ...
Jul 05 08:07:13 udisksd: Error opening device file /dev/sda while
getting PM state: No such device or address
Jul 05 08:07:14 kernel: EXT4-fs (sda1): shut down requested (2)
Jul 05 08:07:14 kernel: Aborting journal on device sda1-8.
Jul 05 08:07:14 kernel: Buffer I/O error on dev sda1, logical block
488144896, lost sync page write
Jul 05 08:07:14 kernel: JBD2: I/O error when updating journal
superblock for sda1-8.
Jul 05 08:07:26 kernel: usb 8-1: device not accepting address 4, error -62
Jul 05 08:07:37 kernel: usb 8-1: device not accepting address 5, error -62
Jul 05 08:07:49 kernel: usb 8-1: device not accepting address 6, error -62
Jul 05 08:08:00 kernel: usb 8-1: device not accepting address 7, error -62
```
No further retry or recovery is logged before the system was rebooted sever=
al
minutes later (user-initiated, unrelated to this fault). Note the streams
teardown warnings (`endpoint 0x81/0x02/0x83 has streams on device reset`) =
=E2=80=94
this device was in UAS mode with streams-capable endpoints (alt setting 1,
`MaxStreams 8`) active at the time.

(On the subsequent cold boot immediately after, the *same* device again too=
k
multiple retries and ~7 minutes to successfully enumerate =E2=80=94 address=
es 2
through 9 all failed at increasing intervals before address 10 finally
succeeded, with **no** intervening `USB disconnect` event logged, i.e. no
physical replug =E2=80=94 the device appears to have recovered on its own, =
slowly:

```
Jul 05 08:16:05 kernel: usb 8-1: device not accepting address 2, error -62
Jul 05 08:16:05 kernel: usb 8-1: device not accepting address 3, error -62
Jul 05 08:16:05 kernel: usb 8-1: device not accepting address 4, error -62
Jul 05 08:16:05 kernel: usb 8-1: device not accepting address 5, error -62
Jul 05 08:16:17 kernel: usb 8-1: device not accepting address 6, error -62
Jul 05 08:16:28 kernel: usb 8-1: device not accepting address 7, error -62
Jul 05 08:16:41 kernel: usb 8-1: device not accepting address 8, error -62
Jul 05 08:16:52 kernel: usb 8-1: device not accepting address 9, error -62
Jul 05 08:23:07 kernel: usb 8-1: new SuperSpeed Plus Gen 2x1 USB
device number 10 using xhci_hcd
Jul 05 08:23:07 kernel: usb 8-1: New USB device found, idVendor=3D174c,
idProduct=3D55aa, bcdDevice=3D 0.01
```
Notably there is a **~6 minute gap with no logged retry attempts at all**
between the address-9 failure (08:16:52) and the address-10 success
(08:23:07) =E2=80=94 suggesting the driver-side retry loop had already give=
n up
silently sometime before 08:23:07, and the eventual recovery was in fact
initiated by the device itself re-asserting its connection, not by continue=
d
host polling. This is worth confirming against the actual retry-loop logic =
in
`drivers/usb/core/hub.c`.)

## Case 2 =E2=80=94 resume, unmounted, hard failure requiring physical repl=
ug

A later, deliberately short (~13s) suspend/resume test, with the drive
*unmounted* beforehand (via a userspace pre-suspend hook, so no filesystem =
was
exposed this time):

```
Jul 06 15:10:16 systemd-sleep: Performing sleep operation 'suspend'...
Jul 06 15:10:29 systemd-sleep: System returned from sleep operation 'suspen=
d'.
Jul 06 15:10:34 kernel: xhci_hcd 0000:09:00.4: Timeout while waiting
for setup device command
Jul 06 15:10:40 kernel: xhci_hcd 0000:09:00.4: Timeout while waiting
for setup device command
Jul 06 15:10:40 kernel: usb 8-1: device not accepting address 23, error -62
Jul 06 15:10:45 kernel: xhci_hcd 0000:09:00.4: Timeout while waiting
for setup device command
Jul 06 15:10:51 kernel: xhci_hcd 0000:09:00.4: Timeout while waiting
for setup device command
Jul 06 15:10:51 kernel: usb 8-1: device not accepting address 24, error -62
Jul 06 15:10:51 kernel: usb usb8-port1: attempt power cycle
Jul 06 15:10:57 kernel: xhci_hcd 0000:09:00.4: Timeout while waiting
for setup device command
Jul 06 15:11:03 kernel: xhci_hcd 0000:09:00.4: Timeout while waiting
for setup device command
Jul 06 15:11:03 kernel: usb 8-1: device not accepting address 25, error -62
Jul 06 15:11:08 kernel: xhci_hcd 0000:09:00.4: Timeout while waiting
for setup device command
Jul 06 15:11:14 kernel: xhci_hcd 0000:09:00.4: Timeout while waiting
for setup device command
Jul 06 15:11:14 kernel: usb 8-1: device not accepting address 26, error -62
Jul 06 15:11:14 kernel: usb usb8-port1: unable to enumerate USB device
```
Here, the kernel's own `attempt power cycle` recovery ran once, failed, and
the port was given up on entirely (`unable to enumerate USB device`) after
only ~38 seconds total =E2=80=94 notably *faster* to give up than Case 1's =
cold-boot
recovery took to succeed. The device did not reappear on its own; a physica=
l
unplug/replug was required to restore it. No UAS streams warnings this time
(nothing was mounted/active), suggesting this is not purely a UAS/streams
teardown problem =E2=80=94 it reproduces from a fully idle, unmounted state=
 too.

## Notes on things already ruled out

- Not a cable/hub issue: same short passive USB-C 3.2 Gen2x2 cable, direct =
to
the rear port, no hub in the path.
- Not USB autosuspend: `power/control` for this device was already `on`
(autosuspend disabled) in all observed cases.
- Not filesystem corruption from a bad drive: a full offline `e2fsck -n -f`
after Case 1 found zero structural errors (ext4's own journal replay had
already cleanly recovered from the abrupt disconnect).
- Inconsistent retry/give-up behavior between a cold-plug enumeration path
(Case 1's post-reboot recovery: ~9 retries over ~7 minutes, eventual
success, no give-up message) vs. a resume-triggered path (Case 2: only 4
retries over ~38 seconds before an explicit give-up) suggests these may hit
different retry-count/timeout ceilings in `drivers/usb/core/hub.c`
depending on code path (initial connect vs. post-resume port reset).

## Ask

- Is the retry/timeout ceiling in the post-resume port-reset path
intentionally much lower than the initial-connect path, or is this a bug?
- Would a device-specific quirk entry (`USB_DEVICE(0x174c, 0x55aa)`, e.g. a=
n
added init/reset delay, or more patient retry count) be an appropriate fix
for known-slow bridge chips like this one, given the existing precedent of
similar quirks in `drivers/usb/core/quirks.c`?
- Given the observed ext4 journal-abort fallout in Case 1, should there be
any hardening around how abruptly a mounted block device's failure to
reset/reconnect propagates to the filesystem layer, independent of fixing
the USB-side timing itself?

Happy to test proposed patches/quirks against this exact hardware =E2=80=94=
 the
failure is reproducible on demand via suspend/resume with the drive attache=
d.
