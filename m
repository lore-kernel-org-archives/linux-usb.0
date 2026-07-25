Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B8E2DC78C
	for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2026 21:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785015155; cv=pass; b=H2v/5YlBaqPut87k94Wl6ATfZWYY7hnS/pqudcVhE8hFpuNgjhOC2bYShKb/gRlNnOGMON2O/naNbJbd9n19lGccMwD1ne278NkPcWemvruCQr9MUfak0j41df164z6ZpG3szJyj5ENogwauFFRGgVkuOd4WDoG7N0ibSU8NAVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785015155; c=relaxed/simple;
	bh=gWSXJ988CtisQ59qEr+M8v5kn9wb4fh4rUqWXXvQ+V4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=tSdKMV4N5KOp3whV1oYfQtk5BzMdzkVx/22pfwFer0zS1mcKA+ufgr+gAXZ2O4dh+Tmk2qPboP72zCwg5TvRE1hQG9pg8hZHxCL3FxqJ0u7f39+eEibyLJLidRymYb6EyxDCekNw8F5mghE582ZjSZonJugqSTC/ieMAdGRXxPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riff.dk; spf=none smtp.mailfrom=riff.dk; dkim=pass (2048-bit key) header.d=riff-dk.20251104.gappssmtp.com header.i=@riff-dk.20251104.gappssmtp.com header.b=R/ymmnSs; arc=pass smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riff.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=riff.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riff-dk.20251104.gappssmtp.com header.i=@riff-dk.20251104.gappssmtp.com header.b="R/ymmnSs"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-92ea24a2dbfso140587685a.0
        for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2026 14:32:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785015151; cv=none;
        d=google.com; s=arc-20260327;
        b=s41EbbKo124Qzs/A/dyfpN+x0p+rlD3to+hpv5yECazzOwKeFspS2azzAsXaEawZ+v
         Cv8sOfcpY0nrbFfPxTw8RtMNGjrBnhAD0lSoHyBioytMoQAlLnDM/HX07tTLyOk4zYec
         GHT0R8s8e61UfaYKpcMHGH+MzRoHvA7Uol6IvRFfE9uUIceYPaH8QL7ahA7E7vhZ9Xu6
         fItqI9mBEGhfKxsWRoCVgLW2wyxR3daiD51wBBxiWeLubk2GhQj08chlo/rZqFWcvntb
         KDILZIuqe30WLNIfa5tcQ/+sbdNjiF2XHy3a7yw0HnOc44GG1V5LOIsQ3jh1liy3YFs6
         7t+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=EhVPvTzQNWOneVSZMHFQHqnqEf/Dz5AYybiTIkMYd0w=;
        fh=HXYDs94KzwTSsUf1O3tCI1GSm/xkj2EYYWY1hO6y3Vo=;
        b=l/y2Ozsif/HthnCDBSCpu5nwNScsj1/Bp0W1xrsSeJL+gLQz9qbXJfgXvqipvZA390
         uBtYmBpnadPM9IUlWZaWYuAQrfMhRaGaYAblWIgSl4znLos1+XNA3+O5kAwtPLbDO3Ik
         7zzczshW0LdjxalxOoyCZlc+S7pPX0W0nTrJ8MVloblQwAUuUftQsGFqC/tyF/u9XJWL
         5TkEsJvBMuJRlbsTibilgdCqU3P7WYjOpHpGou4wovFnqmbPS3FNdjpp2QgvE6r1qdhY
         r01m58Z8rjcO0jplfHpfbIA/SyeeJhLE5ZQoRZBGGlp0orXDmAuWkxrsBnAtvrmMVELW
         Sb+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riff-dk.20251104.gappssmtp.com; s=20251104; t=1785015151; x=1785619951; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EhVPvTzQNWOneVSZMHFQHqnqEf/Dz5AYybiTIkMYd0w=;
        b=R/ymmnSsT8lnpwhng80+cRTtQLjhcWbPm2hgoVfMnWRhl4YIW+tI2SkLIfLS1CSJbR
         ew1KEyHq7+aji2HyPyjPD/CT8KDGV4FK0vd4DCEUQ3Jkp+LvybnFKykryg52FKYrG2wW
         DlcCtky1M8LQJkMHdcENP/B87Pky69I9j9nnDwJ9h68ZXeL5unvnySgvkLj5f49mvRu+
         gcBFshsdpPSsrHiG4SFtc843+YqfPgs0dHtyOW5v5yoUwJh9KSvf5rVKJulQ226vDSMN
         hsw4FxWilutMsCKQi7wUnfOK2eXdxMqvrzNpZ41/agtP2BBDOUW3lBCGVwjBlZ/q6zgl
         dtNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785015151; x=1785619951;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EhVPvTzQNWOneVSZMHFQHqnqEf/Dz5AYybiTIkMYd0w=;
        b=Bf210C+MwHsGKtD7nLO+uABFIW4fNzB0U6XbWXXF61ULPNHT5ixNqSMhjxPI6GH2n5
         fDkog/aVPJY3kNLcRve8lkesaBj//EQCwQR4ys4oRKJApwcm/PsP0I9xzOwON6LweOWY
         F9vtATg6cKG7RILAh6lJ89h4nmWkSa7CZ3jgRelHuw0yyMR/3oes5wWzlpbFo078/P1r
         MAz3V6m/PaPn0K3oJOGqSU2nHkU5Q1mfdKwY8cOdR6kCW3Hk8AO01EZrkPIe6CSXcmmJ
         DLHIWu8buAEUFS6/7kZE/2WtRGAON6H+wZMFuNqUu4CnkyGP/hW0b6NtYj6UkN1PFQou
         MVRQ==
X-Gm-Message-State: AOJu0YzDNEZadlmawiLQPLkEn/pz7G7Hvz9SPE/9LZheXmV0kPL4adya
	KgSlTYT3Nybyt2D3sgq0hi4hh2BvmJG7dHe8w01WvlnkWJw0y5IEUW4yCoCCa0oV2jyDWyZt6Rw
	OZdmtzrWr943Gle8Hw4ABHw2tn3jHVNifrBDrJG6z+AjZbj4+O1TwaNJo8A==
X-Gm-Gg: AR+sD10BGUm/6PJr/MDtzJ/nz8WWO7MZPyrnh0HC0mCKrJBexhG1sY5DDOau3v3Bodo
	HAAV/MXbsLXi5ZXflUdTfrPeGqHjZBkjiZYx1ANtLXRcu+7DH3PJvHlcwcaZ5tcZFSA02YDITaW
	ybtv4swHjRUkiDcO26PWl7FJ36f3mBTgSGd6qVJjs1Pxn85+kMdP2FXFAVd7fdLDxAHLGTUffuC
	sVJnCGcwkjpsVFkRMCahdmsqWBxHXgcLDJg9lMMrPwB2txwFf1CsQXp9xQ48qrUOFycuLguWipB
	YjW2hLXMpFHMmt2GmNDzB5XVSLOtujs=
X-Received: by 2002:a05:620a:318a:b0:92e:e90f:71c9 with SMTP id
 af79cd13be357-932df6ac830mr341151085a.62.1785015151026; Sat, 25 Jul 2026
 14:32:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jacob Riff <jacob@riff.dk>
Date: Sat, 25 Jul 2026 14:31:53 -0700
X-Gm-Features: AUfX_mxZ16ueQij6TnJGNG9ZV5eJoL6dDoPzZNrLBbB1jKzyoHSAUSphhwnDoVc
Message-ID: <CAAw_munfAcpOUw-J9dPcnzVu+sibyxymFkLTp-a3-PMEe6VRZQ@mail.gmail.com>
Subject: ucsi_acpi: intermittent "PPM init failed" at boot is never retried,
 Type-C event handling stays dead for the session
To: linux-usb@vger.kernel.org
Cc: heikki.krogerus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On a Lenovo ThinkPad X1 Carbon Gen 14 (21V7CTO1WW, Panther Lake), UCSI
initialization intermittently fails at boot, and because the failure is
never retried, no typec ports are registered for the rest of the
session. Most visible consequence: after unplugging and replugging the
USB-C charger (a PD monitor), the machine silently never resumes
charging. Notably, DisplayPort alt mode on the same port continues to
work across replugs in this state, and charging does work if the
charger was already attached at boot (EC autonomous) - it is
specifically resumption of charging after a replug that is lost, which
makes the failure easy to miss until the battery is unexpectedly
drained.

Failure rate: 5 of 8 boots on one day of testing. Reproduced on two
firmware versions including the latest (BIOS N4OET49W/1.12 and
N4OET51W/1.14, EC 1.09 and 1.10). No clear correlation with whether
anything is attached at boot: two boots one minute apart with the same
setup split ok/fail.

Kernel: 7.1.4 (Arch Linux, unpatched in this area)

Two failure flavors seen:

  ucsi_acpi USBC000:00: error -ENODEV: PPM init failed

and:

  ucsi_acpi USBC000:00: possible UCSI driver bug 2
  ucsi_acpi USBC000:00: error -EINVAL: PPM init failed

Both appear ~1s after the typec ports bind. On failed boots
/sys/class/typec/ stays empty.

The part that suggests a driver-side improvement: recovery is trivial.
Reloading the module seconds later has succeeded on every attempt so
far (double digits by now):

  modprobe -r ucsi_acpi && sleep 2 && modprobe ucsi_acpi

after which connectors register and charging renegotiates immediately,
no replug needed.

ucsi_init_work() currently only requeues the init work for
-EPROBE_DEFER (up to UCSI_ROLE_SWITCH_WAIT_COUNT). Given that an
immediate retry reliably succeeds here, would it be reasonable to also
retry a few times on other errors (-ENODEV/-EINVAL) before giving up?
The PPM on these machines appears to simply not be ready to answer
during a window around when init runs.

Possibly related prior reports of Lenovo PPMs being slow/unready at
init: the "usb: typec: ucsi: increase timeout for PPM reset operations"
RFC (Feb 2025) and Ubuntu bug #2054928 (ThinkPad E490, -ENODEV).

Happy to test patches on this hardware.

Thanks,
Jacob Riff
