Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00B73AD509
	for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2026 05:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784526672; cv=pass; b=Sbjed1qC0uMbfGEkyTn7jTq6gqzH2RRrnjPzbbY21hLe1Z0gc1g7GCu7mdY1vn89d2TlP9w+snNM+ykeLAt5/HajFb/Fi/ksSZQpFEmPoZCtbDw9gDDhclCwttjEtEIXPGOAqZgLYNYFD1wIJvseGDzZEUs10n1/qiAahUgHJ+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784526672; c=relaxed/simple;
	bh=LZRuXgFmOuw+vhH8LGGQuHAtsZjsIr1L+tU+NlCYkeU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=MpW+WpSbjvoJZHRZ7wYxKC+Iai0wb4L3CeVMQ1w8ID5uhegLKC3F6mhCRx4P/DLMueVVG/h2S8XViIAeXedCywIVhXLk3Ae1cGck/H7sZz1Dpuy02a/Y9J93TYlNOEpezX/YzFyRXVoUFW1Bk5q53JBy1tWL0Fgcn05iGDASWt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VN0vEk9k; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VN0vEk9k"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca957432c7fso6634161a12.1
        for <linux-usb@vger.kernel.org>; Sun, 19 Jul 2026 22:51:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784526662; cv=none;
        d=google.com; s=arc-20260327;
        b=nogup7CoWVhWmdJFK8TA7Ej/bvtFDzwNFQc2lKiL24+RTZr5O8brF6SIHyWSb8FawS
         ikvcFQvt0PLE1iVKHh/yG5VaTOgR029j6JRrgNl7IQeb0qsuW8y7hJfAZNQdv8SmeJaY
         mcicHHZam/VEtmNu34s6klRmaliXpR6JVQqbmZCW5kffBGmxha78QCgBlUmmVAbVFQgo
         rrPBghSxJDXBryZdslKpcgXRPYX90Okez3h1M8DPl9thxEOWEo6h3cjudT5ms6H0qw/V
         ola5e15Cn4mHL8aMbZ3eZOr4CgT8dZPx0ZDMR2kOqlDW+bhxf74Nzftcg6CGhy715SgM
         J3cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Y55y0oMeszkJO3sQ6ovHaAw3y5zL/BlrRGZGyNORkjE=;
        fh=VimqKRrJCN9rdcfuq5onff2+63396vNbthBTDDSyxg0=;
        b=SbKo4K73pttx6MkEaAvwOXMjV8CCzPt0GUWtfUwutd9ZiF2zuXSZK/BfJQn3jDeuVs
         Rqu0LpRRN7pjw2ZaooBJbEkN9joI3xGAzNXmPT2Fkozpsav6E2MCCDXrMA6WN5D9fplm
         8j/mv3o8IwO7ri1U6r4cCTXuTnQvCgEpxZI4RKhhkdaZRU5OjA/oGxgMaaB3gF8zL+le
         M6MlDkWHXlC9OaPmzABNhG2+BuiHG9tkXK0xKkg/CHUp+HisWd5miXfbE4hFh5D97kw2
         lijnJrMYaZFLPAPrBxFfMZUmNgAphb4mgwYYTiw2aQIvOz3clrDWmufxJuzCBt70ZUvE
         qpmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784526662; x=1785131462; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Y55y0oMeszkJO3sQ6ovHaAw3y5zL/BlrRGZGyNORkjE=;
        b=VN0vEk9kWohhySxRwcJHSpigiT8s71ERphZZGXDVTKKTQj9POz3vgQILti0asRSN90
         uOKOPvGvqSL3fZ3jVT2ZrA2hjqPtefLPBD9UxNISouAQ2aHllGejBnsyOsqFOi73WnZF
         hpkUHphWYnrR6ZLZnQdthT4WhAtOxSIBe1R7+fT8vZ/Ppx7rXZDUAq36iengL9u9R64E
         7qoCojrmeWKx6IyzMjUF2WHFjNqQO9KMEKvu69nwyDNYfZ9+1Frjhrbtx5ypJ12l7obd
         2uxUf/5hzplRz9Rhfl80quA3hX9DHDGncEBa9zxuL6Ff/fdhtvEflgVyMi0FVOnuU679
         mLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784526662; x=1785131462;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y55y0oMeszkJO3sQ6ovHaAw3y5zL/BlrRGZGyNORkjE=;
        b=WeY1fBJr9XSIqx3usgFkN/qWEJg5jMNQiHiO1JBWUmb4JIbatKYRtc8gF04W9uIn3o
         ZAmqvzuZiyyAqP8YSuqojmGYA4kodjVDa7T8m1gaGwoiQ5rxcuBG736XciNxsLBEMvlQ
         qWELIHg+kwZFFxss0YXGXjcRkpwrE/e9Uu+sBpoNJJvXsLLfi+bz0ae2kpSOjcETX9pe
         P06qF290F49gRHOiW/Xf6tcXC212l25kfYYVFI87H+4b1J/xQURpPS4KFrWyluHMaLcn
         xl/cWVNfEhC6nDu3DDCGqaNYxUCOMm0ur1FJQWZOUhSzddTelNZUndYJOoN8YFON7e8Z
         E2rw==
X-Gm-Message-State: AOJu0YzxHwYkewGrOp8B/XkFPqycT0Uce+IYtmMpa6GVTty+j/PUEqIw
	wLrmKraEbU49aljvmEtvm3C6X2KbCcCITl7wcbRlGql3vRTVt7OB7jgjbEUqeHXLf9krT+invfm
	2wBP7Q3YD8xmgUFK1VfyrTsV7RJPCJ/B1PtSV
X-Gm-Gg: AfdE7cmeTROmzpdbXshRzW3HBdBYWvfobfFJ1nbCf4GNoGBC/nY2/J+zhTwpfpcevZz
	9Eq0b233cBC8166ATGaMYuMamvnasByGR5NXEylVhRtfdJjy1mtqIVPMXwVf1TN3z5BEGe9E+Mj
	psrmJDVZAPLs7INWyxJOXRXY8PI/n81YpUvECwgjAIibQXBlm/x+sFRVw7fez+MFjMtZeSFhajD
	f8eFX47HdUNBo6XnVRFDyronYGyMy9aJGJCFYkXjKJgGZ9q2nVyjL91TMHG9YAWuG4BQhE=
X-Received: by 2002:a05:6a21:e0a6:b0:3c0:9c19:6589 with SMTP id
 adf61e73a8af0-3c3ad9e7735mr13573124637.67.1784526661694; Sun, 19 Jul 2026
 22:51:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Anon <myaltforstuff1234@gmail.com>
Date: Mon, 20 Jul 2026 08:50:49 +0300
X-Gm-Features: AUfX_mzfgf5_1lz-BifAcyZwfmGUltArw01BpQtVvT6z_uzShAd-lMpFD6kkzkw
Message-ID: <CAJ5U=Uw2R7xVEY3ugZ_gRsi+yC9WviMbFEO9RbR6A3ue-G=adg@mail.gmail.com>
Subject: [BUG] usbcore: EPROTO on first-stage Config Descriptor read (ShanWan
 clone, 2563:028e)
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Rapoo V600SE / ShanWan-family chipset -- X-input persona (2563:028E)
fails USB enumeration one stage earlier than the known Switch Pro
fallback bug

Hardware
--------
Product: Rapoo V600SE Dual-Mode Vibration Gamepad (marketed with
Hall-effect sticks/triggers, X/D/A mode switching)
Underlying chipset family: ShenZhen ShanWan Technology Co., Ltd.
(confirmed via multiple vendor IDs observed from the same physical
unit: 0x2563, 0x20BC)
System: CachyOS (Arch-based), systemd-boot bootloader, kernel 7.1.3-2-cachyos
USB controller: xHCI (xhci_hcd)

Summary
-------
This controller presents at least four distinct USB identities from
the same physical hardware, depending on mode-button state and
connection type. Three of these are already individually documented in
various places (ArchWiki, xpad issue tracker, hid-shanwan project) as
instances of a known ShanWan firmware bug: a malformed response to the
two-stage USB Configuration Descriptor read causing -71 EPROTO
(sometimes -32 EPIPE), leading to enumeration failure and a silent
firmware-side fallback to a lower-capability "Android" persona.

What doesn't appear to be documented anywhere I could find: the
specific persona corresponding to this device's X-input mode
(2563:028E) fails at an earlier stage of enumeration than the
already-documented Switch Pro fallback (057E:2009), and the known
workarounds for the latter (usbcore.old_scheme_first=1, various
usbcore.quirks= flag combinations) do not fix the former. I'm posting
the full investigation in case this is useful to whoever maintains
hid-shanwan, xpad, or the ArchWiki Gamepad page, or in case someone
recognizes this specific failure signature and knows a fix I haven't
found.

The four personas observed
---------------------------
1. VID:PID 05AC:033E (spoofs Apple's vendor ID)
   Windows behavior: Not normally seen (Windows reaches the modes below)
   Linux behavior: Default fallback, wired. Enumerates cleanly. Full
analog sticks+triggers. No EV_FF.
   Driver claiming it: hid-generic

2. VID:PID 20BC:5001 (ShanWan)
   Windows behavior: Not normally seen
   Linux behavior: Default fallback, wireless (2.4GHz dongle).
Functionally identical to above.
   Driver claiming it: hid-generic

3. VID:PID 057E:2009 (spoofs Nintendo's real Switch Pro Controller ID)
   Windows behavior: Not normally seen
   Linux behavior: Reachable only with usbcore.old_scheme_first=1.
Rumble works. No analog trigger channel (protocol-accurate to real
Switch Pro hardware, which has digital-only triggers).
   Driver claiming it: hid-nintendo (in-kernel)

4. VID:PID 2563:028E (ShanWan vendor ID, reusing Microsoft's real Xbox
360 Controller product ID)
   Windows behavior: This is X-input mode on Windows. Full analog
triggers + working rumble.
   Linux behavior: Never successfully completes enumeration under any
combination of workarounds tested.
   Driver claiming it: N/A -- never gets far enough

Root cause (confirmed at byte level via raw usbmon)
-----------------------------------------------------
This matches the general failure mode already described on the
ArchWiki Gamepad page (https://wiki.archlinux.org/title/Gamepad) for
ShanWan-family devices: during enumeration, the host requests the
Configuration Descriptor in two stages -- a 9-byte header first (to
learn wTotalLength), then the full descriptor. Some ShanWan firmware
responds to the first request by sending the full descriptor anyway,
which is a USB spec violation, and strict host controllers reject it
with EPROTO/EPIPE. Windows tolerates this; Linux (by default) does
not, and the device firmware silently re-enumerates into a
lower-capability fallback persona after the failure.

What's new here: I captured both the 057E:2009 failure and the
2563:028E failure at the raw usbmon level (via
/sys/kernel/debug/usb/usbmon/1u, not Wireshark's usb.idVendor-filtered
view -- that filter only matches devices that finish registering, and
is blind to failures during enumeration itself, which cost me a fair
amount of time before I realized it). The two personas fail at
different stages:

057E:2009 (Switch Pro) -- fails on the second-stage (41-byte) descriptor read

C Ci:1:039:0 0 9  = 09022900 01010080 fa                    (9-byte
header -- SUCCEEDS)
S Ci:1:039:0 s 80 06 0200 0000 0029 41 <                     (request
full 41-byte descriptor)
C Ci:1:039:0 -71 0                                            (FAILS)
[ ...repeats -71 two more times, then device is abandoned, new device
number starts fresh and succeeds cleanly... ]

This is the case usbcore.old_scheme_first=1 fixes -- it doesn't
correct the malformed response, but changes the enumeration approach
enough that a subsequent full attempt succeeds.

2563:028E (X-input) -- fails on the first-stage (9-byte) descriptor read itself

C Ci:1:044:0 0 18 = 12010002 00000040 63258e02 30010002 0301  (Device
descriptor -- SUCCEEDS, decodes to idVendor=2563, idProduct=028e)
S Ci:1:044:0 s 80 06 0600 0000 000a 10 <                       (Device
Qualifier probe)
C Ci:1:044:0 -32 0                                             (stalls
x3 -- normal/expected, not the bug)
S Ci:1:044:0 s 80 06 0200 0000 0009 9 <
(Configuration descriptor, 9-byte header stage)
C Ci:1:044:0 -71 0                                             (FAILS
immediately, on the very first stage)

Workarounds tested against 2563:028E, all unsuccessful
---------------------------------------------------------
1. usbcore.old_scheme_first=1 (both as a live sysfs toggle via
/sys/module/usbcore/parameters/old_scheme_first, and previously
persisted via systemd-boot entry) -- no effect, still falls back every
time, confirmed via lsusb immediately after physical mode-button
press.
2. usbcore.quirks=2563:028e:ik (USB_QUIRK_DEVICE_QUALIFIER +
USB_QUIRK_NO_LPM) -- no effect.
3. usbcore.quirks=2563:028e:gn (USB_QUIRK_DELAY_INIT +
USB_QUIRK_DELAY_CTRL_MSG) -- no effect.

Given the failure happens on the first config descriptor request
rather than the second, I suspect none of the currently-defined
usbcore.quirks letters target this exact failure mode, since (as far
as I can tell from Documentation/admin-guide/kernel-parameters.txt)
none of them specifically address "device sends a malformed/oversized
response to a request smaller than what it wants to send" -- the
actual documented ShanWan bug -- at either stage. It's possible a more
aggressive retry-on-EPROTO patch, or a quirk that makes usbcore skip
straight to requesting the full descriptor length (bypassing the
two-stage negotiation entirely) for a specific VID:PID, would be
needed.

Additional relevant background found during this investigation
-------------------------------------------------------------------
- hid-shanwan project (https://github.com/hbiyik/hid-shanwan)
documents a related but distinct "Rich Mode vs Poor Mode" fallback
behavior for a different ShanWan wireless gamepad (2563:0575), where
an unrecognized HID/USB request (rather than the descriptor-stage bug
above) causes a similar fallback to a reduced-capability persona
(20BC:0055) with force feedback disabled. Same vendor family, same
general "fails gracefully into a worse mode" firmware philosophy,
different specific trigger.
- xpad issue #336 (https://github.com/paroj/xpad/issues/336) documents
a user with what appears to be the same physical chipset seeing both
2563:0575 and 20BC:5001 during mode transitions, captured via a
similar raw-usbmon grep technique to the one I used.
- The mainline kernel does have a hid-shanwan.c driver (added via
patches referenced on LKML, CONFIG_HID_SHANWAN / CONFIG_SHANWAN_FF),
but per its own documentation it only restores force feedback for
devices that reach "rich mode" successfully -- it cannot help a device
that's stuck in fallback due to a failed enumeration, which is the
situation here.

What I'm hoping for
--------------------
- Has anyone seen this specific earlier-stage (first 9-byte header)
EPROTO failure on a ShanWan-family device, as opposed to the more
commonly documented second-stage failure? Is there a known fix?
- Would a patch that increases retry attempts specifically around
EPROTO on the Configuration Descriptor's first stage (perhaps gated to
known-bad VID:PID ranges, similar to how hid-shanwan and hid-sony's
existing ShanWan quirks are scoped) be a reasonable ask, or is this
considered out of scope for mainline given it's cloned/unofficial
hardware?
- I'm not a kernel developer, but I'm willing to test patches, provide
more capture data, or run a device on a spare machine if that's useful
to anyone actively working on hid-shanwan or xpad.

Happy to attach full usbmon capture files and Wireshark exports on
request -- trimmed the above to the relevant excerpts for readability.
