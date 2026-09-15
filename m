Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABA047ACC6
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 10:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468016; cv=pass; b=SZLO9K1YbxpQkgCdJd311hKlK7v6P29VnExzW3N7P2riso+Whc7DViNy4uZoeUEbNIsJrE35X9ffOgCJmfiQ1nSIBlptGEVmF8FueOgnVGsvsAt91MSekcqLmnCfwXf8iiTOET8VGII99IlJjPx30PKFmmt65m0eN02E+Egnzrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468016; c=relaxed/simple;
	bh=/pZG8IQrrP/E9Be1cs9XHp9yB9CbR9VGUuUb1zFopAE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=gNrYNIbgBypYeupoyFfVYArMIMUtvKV9AUpBf4Xl6S53VyZCLfRARoTUZmGVA/MW/yiAe2nr9vIQ0SVhrW9+ewUmZ3pBRBBIQY5mZcXkJKRRYqu14Jl8WX3ZPA5GkboQzvTE2ErbxlRmWBctLJxTMo7BtG7ftswtC8G7jPFxlWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HVUJqSx7; arc=pass smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVUJqSx7"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c7b4ed2so68649241.2
        for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 03:26:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789468013; cv=none;
        d=google.com; s=arc-20260327;
        b=gHSMFw5+zPBMlDrbud7It8qlBcEi7ta3geMghTAEy3MsPb9JrKvPW75mur+x54e9Rq
         ILlsxC8Qw449nQWaGKZmX7xxaIFJ5goPLzJwWlCJ1z1LdQeXJvjE1sj61jirTHi5B+yV
         ISTczhOCboNIKM2MPnIIRNmtHaaSkUKPLXTA7Fl+7ppePeJISA5nwFaQq+tbC/oNZ8uz
         3uYe2F91XL+5BbModPJjg+NOqtWFVdHHPWNutgttS48zgK4xMni9C6McVwIU4v6YTxO8
         zAc1xaOPD8v6DVjTTbM8RKIdXJ+Sq0RckFKc1Cg6wHJ5SHOQ0VPbZD180zYSdV5/dFz5
         a21w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=A8jPby3CbgYpZAruNuWpIg4oizmU51NjLdLxei4hwaI=;
        fh=Mkp69qN5ADA4slW+EAEvfQI/ggj4rxigi/QC49UWQxc=;
        b=fadZviu+3pK6kIhaJlpwi2ab14vQAfxxQpeVURIUPTZ1p40kCI0BwHh0XGCZQmTemE
         GnmXCF78MtoDkzrqMEuqhQy5oyJ82d1mdKgH1WjP2z2hupddqNuuqVvhpELrsbQyfapa
         r+4YnDqb+wPQh8m8OgDJvyJfUZeuvRFUm9T8BLjuId+bsGQ+MVLQq+oCQ6cRZeT3ZJOF
         ei8Uj3l4yNpiCsjKYABXK0FSvHjoJ/VK3jP4Jb3vS+JUg2+a3IhblmRGCFSLT70Y+Ebj
         OXuNh1XheWhAs4buPF989Eqx9R8SB1+XHV/AwWt1o0pveMqYR1ULjxfpiO7D2o0UYuKm
         iXCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789468013; x=1790072813; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A8jPby3CbgYpZAruNuWpIg4oizmU51NjLdLxei4hwaI=;
        b=HVUJqSx7dy1RFNL1G4KjXsq9R86OWn3kTFF2VullJQZxWUdRc6kVV19eCgzRKdMFPn
         cAsDQSQvk8y1RA740IGOQINtw7MjUIyT6yZNLKVRxsmpJFs2cqdIuTz9hJDZjnCht/Qh
         vzunPt6qXUbGXKXYJnMq5J3X+yatWQG8OklWT3PyZoF7VNGpIx59/RQT7v7DyKqKLTCU
         JG8j9xKtNQpgyQ8KAJFgW4qWaKspO3qzdpJe5ELA4LQ9iASqgjnFEP5Y4POBlQNYdrNx
         g8L7WxW1klw4rMk6xupE5p90d7SnnIzPAM3h0hZwuaMjyKdJrSb9S4W4ToAYQNvihFRM
         zPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789468013; x=1790072813;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A8jPby3CbgYpZAruNuWpIg4oizmU51NjLdLxei4hwaI=;
        b=TBzv7TzK4/8ZBxjvycous/klx1f1m0fn7zBVP/ZYKFnwZ0fdATL1LShQM06Lc7bUyd
         bIIbKKRavxfWax4L2X12jUZO7C9pbK0RUwFbsiTTz7QBYt+UjnLyAMR/pRfhCaEbnmUf
         jStMRXTRIuFpdOnFeC3ui7Tz0vA3zLeVMX32IwPZG73DyrUuupHgSzJE7cOAKu06B5sR
         LW7SOxvG732EiuZOh/1NsD35DnuFL3PLEZhcQcOZxmRxKM+KfMSxyyiP2oWtKlOWbqcf
         8kZ+ICtA8+Ka65QvK8h6E9P00xY5XtsEvdgxeRydDK7Gm9Ef/D8cus67img1O1DwJuwi
         paTA==
X-Gm-Message-State: AFuF++nfp/BHoT9DVSBBRN/EJ8Wk+8Azy6g+deDZd6HAujNjw+gp7Hb3
	3p4LsM9LG2rRH0BCthL3+PojEMyed0QVP+lAQcj4anXEzYY9PrJGhI6+ltAQiI+8fNxlXyzPhhO
	2gg57f0WgjyEjQGDbC0api5KRZmHgIMkAYw==
X-Gm-Gg: AYBFou3qC/LEuocP6LZdvKNRAYcgiAmWfWrv8HDWLES4ZIFqHDiCX+/BHOQuCEG35WU
	OcvhAigHdv12TIrtAb0A6q4s+Jq4iIbBP1W+uq9whOfN0C9CC3d36pRJvTa6DBOCcFhs2DZ/ags
	eX8yuRVdwVR1Y+ncRsC9MZLGMqyBGTTsq3bLnGzKtzrMFK+aiZ3kuGbyY/rfQVng1KjbqqjvNFo
	3WS0hyl+wrrfjTWpbUWqTZNBHRy6HaQzVmhjdcaRXZLFMPoq84wN8KXEtIBIdOog8QcxIEqMJPN
	poBQEYkJLfENkI5yl37i+5TgAkT6YFN2KEOtuu/xX7MvaCzLJkkNJZXBY2E/8UTCLNLUXbQAd7B
	vu95w5X4fAg==
X-Received: by 2002:a05:6102:578f:b0:79e:3401:403a with SMTP id
 ada2fe7eead31-79ed75369edmr323413137.8.1789468013128; Tue, 15 Sep 2026
 03:26:53 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 15 Sep 2026 06:26:51 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 15 Sep 2026 06:26:51 -0400
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ola Cewers <ola.cewers@gmail.com>
Date: Tue, 15 Sep 2026 06:26:51 -0400
X-Gm-Features: AcwNN1X50H87TRcNCkhS7VthW7CSXDnLb8sOZ2YKdBy5AN-2Fcw-nsGHWcmGhE8
Message-ID: <CANJWS4yi_2X1h_V14V=kMOYL+pALacVF0U6byJJXVAsgpXPy1A@mail.gmail.com>
Subject: ThinkPad X1 Carbon Gen 14: DP reconnect fails with Type-C ports
 registered; connector reset does not recover
To: linux-usb@vger.kernel.org
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

Hi,

My report on 10 September was rejected by the list because it contained
an HTML MIME part. This revised report is intended to be sent as text/plain
only, with no HTML alternative.

System: ThinkPad X1 Carbon Gen 14, 21V7CTO1WW, Intel Panther Lake,
Arch Linux / Omarchy, xe graphics driver, direct USB-C to Dell U2722DE.
Firmware-side report:
https://github.com/fwupd/firmware-lenovo/issues/628

Update from testing on 15 September 2026 (same kernel 7.2.3-arch1-3,
BIOS N4OET51W 1.14, EC 1.11; last recorded system firmware 0.1.21).

The display reconnect failure also reproduces on a boot where all three
Type-C ports registered and no "PPM init failed" was logged. This corrects
my earlier statement that initialization fails on every boot. It does
not establish that all UCSI functionality is healthy.

On the 09:59 boot, port0/port1/port2 were present, DP-1 was connected,
and AC/online=1 with the battery charging. After unplug/replug at about
11:30, DP-1 became disconnected while AC/online remained 1. The log shows
GET_CABLE_PROPERTY failed (-95) at 11:30:19 and 11:30:20. A duplicate
port altmode warning (SVID 0x17ef, con1) appeared at boot.

I also upgraded the Dell U2722DE from M3T103 to M3T107 using Dell's
Linux utility. The utility reported "Update Successful"; after the
required monitor power cycle and a laptop reboot, the monitor's own
OSD confirmed M3T107. The unplug/replug failure still reproduces.

A targeted reset was tested while the display was missing:
  printf '0x30003\n' > /sys/kernel/debug/usb/ucsi/USBC000:00/command
  cat /sys/kernel/debug/usb/ucsi/USBC000:00/response

This requests CONNECTOR_RESET (0x03) for connector 3, with bit 23 clear.
port2 was the connected PD sink, and ucsi-source-psy-USBC000:003 was
online (001 and 002 were offline). The write and response read completed
with exit status 0, and response was:
  0x00000000000000000000000000000000

The display remained disconnected; AC/online remained 1. Another physical
unplug/replug also failed to restore it. This demonstrates no reported
command error, not independent proof that the hardware completed a reset.
The exact command is included rather than calling it a verified hard/data
reset: those semantics depend on UCSI version, which was not recorded.

Earlier tests before the monitor firmware update also failed to restore
video: reloading ucsi_acpi, trying all three USB-C ports, and removing
monitor mains power for several minutes. Rebooting the laptop with the
monitor attached has repeatedly restored video. These earlier reset tests
have not all been repeated with M3T107.

Two further corrections to the earlier description:
- During earlier failed reconnects, partner altmode active sometimes read
  yes while displayport/configuration stayed [USB] sink and hpd stayed 0.
  The failure cannot be described simply as partner active always being no.
- Switching to another display and back did restore video once, before
  another unplug/replug reproduced the failure. Reboot is our repeatable
  recovery, not proven to be the only possible recovery.

The observations suggest that the boot initialization failure alone does
not explain the reconnect failure. Could you advise which connector/altmode
trace to capture next, and whether a different supported local recovery is
expected to re-establish DP alt mode on this platform?

For context, earlier boots failed UCSI initialization with -ENODEV or
-EINVAL ("possible UCSI driver bug 2"), leaving /sys/class/typec empty.
Reloading ucsi_acpi registered ports but did not restore video. The new
observation above separates that initialization symptom from a reconnect
failure that can occur with ports already registered.

I can provide the filtered boot log and the earlier ACPI/table captures.

Thanks,
Ola Cewers
