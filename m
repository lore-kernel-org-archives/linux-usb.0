Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F9D41D216
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 13:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785765311; cv=pass; b=iI2qN9L42B9V535cnNWzksFqNfBjvc6HE5RCWbFNz045vcE6HNblA+kFpV0G9sRoPQkWgbqJ4APwcgHxyvPAN5Sny2IHZtCSW4qn6pNPhMp2JCww2nnMjwidXtsBNqG5m5CkPYkWmT0CB+0sT4Sj4ONjx1YzIUJwq9rRNTcczt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785765311; c=relaxed/simple;
	bh=01VxCD9EHLva6kKIN8vbUyWSOxJtZeSP3AI/Q4UBcq4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=KkSDpIYt9sKO6Eszb7t1ReghSleoNrDqIMRFDSw8P/fVvpReX/AN4aWowtYYs9KO88MEheBJpwsyqos0s0qPgrCoXrfn2VnJ3w7Qbgs8vXJn17qMr8LEOCB5MeDK+crxWy6wD/vvjgELfkDARaTlckIF9mihVFhjuxC7qScSa+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9fH0T9i; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9fH0T9i"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-80c5cb9a888so35891147b3.3
        for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 06:55:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785765309; cv=none;
        d=google.com; s=arc-20260327;
        b=J5QUtfdRz4Mhb2+oNWzG1zFpxf1xwMFLJi2Y4m8qouOkJDVqxIiYVx+R6syVDrHkfC
         iI8yFqYCfOvb/N1cwMaqR0/wmn8M8VOy4MzdLjTlA6mVJSnfYtFSv6xHrhcu/Ya8M9oa
         KMgN4F3v/EO3II1TfZoelNiWPwIt9DE9UPGghydJK4cn+Jo8jZIfxFCH2EQXqi4PpvWf
         KGvdmG5ycdyB7ghR+LqAYHgE1rzm88kfyXAPQuRQe1UwEyS6wI/FOio+xKgXelvmypvN
         l62Wccl99jYx2BOWFxJg/NQ7pjqrnGmKdTkGSMnov9Il/V8rztjLesAGy6BOiqsShVTs
         l6FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=wbzWIdW8fZsXyI10pvq5o3wafEmAdRRb1ceQnwGi3BM=;
        fh=CNrcobwP1hhBLuaQLmXRPzdhtlGl4Pg8Gdjs0GHyrRg=;
        b=HTlYbTbwFYTZel2sRplggXF2ZTEna7BgoG6DHHyvgKI3PcFEIfeH1Oz3O0EKzjR4Et
         +QqKVsAmW1iij2NO5Ir/XXabkhDPBw8UqnDhdcvR4BvtOaF+x3+g8WNymkcWvM94rGgU
         w7LGkTN4MMp2dS9+G1xauXUfByf0YNkhi7cDBUIICE2itwxXjl2weksxD7rRwksNYS6Z
         036kpXZJpbylwo/8YqZ6/sFzrI4D7H0Iyft9PgV40XZpSj0Yc0jQ3PJqYyxQKpxLKZo1
         PEjJ5jVIR4KyxyO+rIOjs2+Lifhy7GzazJ5Eos2voqGG0WyKVp+eAR24slfD8qnqmVMR
         3uvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785765309; x=1786370109; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wbzWIdW8fZsXyI10pvq5o3wafEmAdRRb1ceQnwGi3BM=;
        b=F9fH0T9iT5nJy5DS5eVe+9KNlANPFYxh3bVvtnu763Zb5kLO8hCVjORJElbGG8Sc8F
         Muak3CcKTkb3jZ/rESKKxKh5Ha9/RD0MUxXhsxY1Biu4tx/5B15yhsXMGwSggDEXmFdM
         3Lb3u/70BWGxo0uVaAS3WHoKwsgca/NSsBabCR7wCEQ3PDbxM2KRw+QiUlTNHT+P8r84
         NxKPbUeBYHzegI/3zy6uA5iTgAeDoeb/zJnXRt9pGkc+r76+b29p3XH6OVjRsBJFiMSR
         FIhuLYGVYo3vonwJJARNI2fVlQL7GpsUqdo3q5P+IyuEfY4SdcQj7HNvNwe7p+jVmmvA
         R+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785765309; x=1786370109;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wbzWIdW8fZsXyI10pvq5o3wafEmAdRRb1ceQnwGi3BM=;
        b=gFB9/yqz4dOs+2YMCuato9hLDaiDU+QyKLVIutnyuQSI2znr3Mt1fAPHoexBAp/9rV
         QsT/wf1CBnhquN5GU26gvi0PIxq8kU+xPb5wx8CWwNd37eoKkwnTfUrHhVvfUT0glxAN
         Poki35ZKnf/GoVJ5wxjoZ2h/jNudvPyDWUTPf6GwVwBOFyaxCJyCcNRikYYSOMAdEQfJ
         XQyH8GuyXy50wv/a5PzZ/yVDZGweiph4wttQ11NIRKKRehlj4VwgWM8FA/O4PlmTeEZb
         9qXm24z+l/RWlatKnjKz0J9n3oHVHGGESyy7jZaIXqtwnSjiSozer8QqYDZCRm/1XEPf
         P0jA==
X-Forwarded-Encrypted: i=1; AHgh+Ro34Krtv9yZmH5GgULNeit5fSOVvxVFOvfIZBlyFGHjJ5LH9Y5dgqH9nN5AcJw6+h4pb5CeJbXRNm0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9e0h9IA7epaVpHDVnzyUEo/h9MeGurtN0efKRqaRBPOBy0JU4
	mLeSeo/+SCHlWxyA2eFOdLpwkJklyB7+xGG/ruYvWm5+freA8bNY6HA3u6tMwBTBa/CYBMEqkb+
	L5WYvpsfE6rWdRA+ekmtdOcTbhvyY6EU=
X-Gm-Gg: AR+sD12C+8L0iqlvs/u6doMrmpdVLOBUOjI82U2Qd6yaY5JpVFKgnMMAkc1Nn4cPWsP
	9vlU/tu2qgPGqrOR/gfyHbKfkyBariXM9H8HEMh7yHj9OpDkDKKmDWz3BFMeaZXV0T1loFBwutg
	bkgM+A6eG9FpAkbw4QcNTLKmtjCAsYC6PRiY1+8Kdl4wdn9OzIagWZfodcEh/b3j7jDCz2r8yRn
	7abme6Y8K5r5jV6pqRtNElyy3z+hxjmy5s3rtK88DKcXyUgwIptg6hF4Q7/+xeadBBgIJXJdxhO
	D3BL/ZEPua2jU5t+FzzDG/3aQRzYTQTQ7uY/mhDEAkV9IRzBtDjowaJf78xRQmteArbZ+WkZOgR
	L31kq
X-Received: by 2002:a05:690c:350a:b0:81e:8d95:3d32 with SMTP id
 00721157ae682-81fd49fec5dmr135575237b3.9.1785765308900; Mon, 03 Aug 2026
 06:55:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Slavik Dev <developer.slavik@gmail.com>
Date: Mon, 3 Aug 2026 16:54:58 +0300
X-Gm-Features: AUfX_mzPBSiPlF2WjoylmVIVyaUnX72awZOGWW6Btd5FopJJedrIcGHH8ISoEfM
Message-ID: <CAGQo=TJXef-QzbkFEpTcJ138j0k6WYnV4=tNY8Q7s3U7DUOY+Q@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] usb: hub: total system freeze after
 running adb
To: forestix@kcat.cc
Cc: mathias.nyman@linux.intel.com, gregkh@linuxfoundation.org, 
	stern@rowland.harvard.edu, heikki.krogerus@linux.intel.com, 
	stefan.eichenberger@toradex.com, pawell@cadence.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm hitting what appears to be the same regression, on the same xHCI
hardware as the original report. I spent months chasing this as a
hardware problem (RAM, PSU, BIOS) before the adb correlation
eventually led me to this thread. Earlier today I applied the
workaround discussed here (disabling USB runtime PM), and so far it
is holding up. Sharing my data in case it helps revive the
investigation -- until the workaround, this reproduced reliably for
me, up to several freezes per evening.

Hardware:
- AMD Ryzen 7 7700 (Raphael, display on iGPU), ASUS TUF GAMING B650-E
  WIFI, BIOS 3881 (AGESA 1.3.0.1b)
- The affected controller from the original report is present:
  0b:00.0 USB controller [1022:15b8] (AMD Raphael USB 2.0 xHCI)

Kernels (Linux Mint 22.3 / Ubuntu HWE builds):
- Freezes observed on 6.17.0-14/-19-generic and 6.14.0-37-generic
  (based on 6.14.11 + stable backports, built 2025-11-20).
- First freeze on 2026-03-10, shortly after kernel package updates;
  16 freezes total through 2026-08-03.

Correlation with adb:
- The last 4 freezes occurred 5, 12, 35 and 81 minutes after the adb
  server was started (using the once-per-boot "adb uses wireless
  extensions" kernel warning as the start marker in the journal).
- Earlier freezes also occurred with an Android phone plugged in while
  the adb server was NOT running -- including one freeze 2 seconds
  after unplugging the phone. Consistent with hub runtime
  suspend/resume transitions being the trigger rather than adb itself.

Freeze signature:
- Journal stops mid-second, no oops/panic, no MCE/WHEA, efi-pstore
  empty. nmi_watchdog=1 and hardlockup_panic=1 never fire.
- Notably: the chipset watchdog (sp5100_tco + systemd
  RuntimeWatchdogSec=30) DOES fire and resets the machine ~30 s after
  the hang, so the platform stays alive -- it is the kernel/CPUs that
  stop responding.

Ruled out on this machine:
- RAM: freezes identically with DDR5 at EXPO 6000, EXPO 5600 and
  JEDEC stock 4800.
- Pure load: 60 minutes of stress-ng (16 CPU workers + 16 GB VM
  workers, no adb running) survives without issues.
- Firmware: BIOS update 3223 -> 3881 (AGESA 1.3.0.1b) made no
  difference.

Side observation: in freezing sessions, Bluetooth (MT7922 on the same
bus as most devices) repeatedly logs "hci0: ACL packet for unknown
connection handle" before the freeze.

Workaround status:
- Running with runtime PM disabled for all USB devices
  (power/control=on via udev rule) since 2026-08-03. Reporting while
  it's fresh: the adb server has since been running continuously,
  already well past my longest previously observed time-to-freeze
  (81 min), and so far so good.
