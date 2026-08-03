Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8421127A92D
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 22:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785795989; cv=none; b=NJBDtk+wa0rTXeIkfiJ08/SVeXRaiyTMkFygsaEmyl3C9HvmmoxN/xqBXv7Mw9Mw1pOL7MO6Zk3QbocbEAKIpFOv1iLIgtl1kj1vfRpmSKNIAwwWiMI0R+g9FUDbLbN3MTX/nV/yeiNlwZu/OghI2SVcEEETOSG2t9Va1nR1koU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785795989; c=relaxed/simple;
	bh=L26H4R8gykJzn2cppPi5p7TIPzSS9wI8HHyNAiF6V9k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YqrOzmYc8HkX6irCQ4T+VEZiFtXadHGDhbr+PiFWKOhTatH48yu5GLPgmskH3expaC0Vb+SIdobGyhm9hfnaNcRWx1CmeGVTuN4D639LcQO6BiLuF7tqTwYgpaA7F1ZCwHMdU3lATo0LCZ/+fq7XAgM4Wet5gPYpNpWdFw+KMN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D6BqyZ8t; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D6BqyZ8t"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso2420278f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 15:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785795986; x=1786400786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kw2hpVX/Drh43dQcP6P18Jwi9h9do6TMzF5RgAgXlME=;
        b=D6BqyZ8tYdEbV/ZKThzNn8pZpbJJTrOUM975qa56VucxE+s1MlankA8F88EDmZe395
         dZfY82pVXoOo6Oz4oDZBoRUGL4lU9U/ad7M5cz0DG1tHq/00NBL8/yBCy/32E/u6b3wm
         K0SIre0Uh5f+VgnXEqv6K+caEii5JHTCAk0IainQ7/0UnwDkyEzJbF40v4VyDRsjW/yb
         YKF0ibr6lHHHnqMkJshj8thMPJrWnOKlAwbs3tJPT0jvQBqlRkY3nbykN/rsriEWTePy
         E4pfp6SCwJHBJqjm4qlB6B7vTXS32d1gALyzEjOuTg8BNjSR4vXQ503+3BPbQ1ZDuNRl
         7Erg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785795986; x=1786400786;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kw2hpVX/Drh43dQcP6P18Jwi9h9do6TMzF5RgAgXlME=;
        b=s5xnMdY63ZQQSeDrdVq3hRi4Xbh/auS+qwYJW5zNgnrUGF6jmFXcmO3+3Tz4LE8wEH
         K6NZkpa+HrCY8yRDZD4JknvrNeO1rSP7xEPf63ksbB9Z3Q56nj+634exn0N5aHAk/egu
         QQyErlrjm8TIaKgWCu52akpCPJWCiqcuGtHky/gsnLdooXvwoiXteV11yJ5i+/148vDB
         JLEfNbsF9ExjNrpBvi7J3lUzQx0J29PUhTouSFvN01M+kvq9/UzKQAicKLJYlew4XG5Y
         C6vj2hP7x5ftZdIZ7xzOsSved+j+B34d2l0iOG4/JyOgk++wwoMawOAfmWC0na5NFCD6
         7neA==
X-Forwarded-Encrypted: i=1; AHgh+Rrm7nHubVLLIjky0FTWz5K1D3xYKfV/yr+CPvnm3tgaKHG5gaDYhyuAfJ+A6cp+kM4HGFJ+XqJ5aEE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7jCBiJysUkKd7FwlNgQpIaTty0ZT/nTYN4OE321ZLhQN3SMKi
	WLKFjciKpQFKp9ncSEN4Fu+uGQBi49uHq2YhfgudgwYy7D2fheA9J2qpW+CCHA==
X-Gm-Gg: AR+sD10UyAdV0KZ09BpBcTMqpEEHWeFLzROA2Cfj0img7Kyj355FYmsUhSlji8uN3MJ
	6qaV0rrnD9zKJdRGZeU9WE89K3+JvPaN41FKeYu7e05Cy9FeBBZoPw0vn7TtKmS3dyBAkHudeVP
	HNJQjk3jswwLY14NaTF+E7L/f3LaFoOLDNXYtzofigNqJ2fipeRtNiJrpnMBwF4gu5hVPSUultv
	t07o9wO/JD+CXahJdPHVl0YjmHb6TxqI3CDe90WokR+V2QhZOGyfdzcHFS8KMXXl0bnhz66WUiV
	9MFkW/GJK0BJnhe2FXG26SLsFCrTMnij1L2mKND4X+wcAl56/QpIBnIFF39+3Acj+ZLjVuLndUH
	smVBbtaMGb0wXo8O6ACxiMk9D0AbrG73u5NC650HpBk0qLjHjcoz4HIWaWyX6Wfim+4n+icMSLH
	/Li8O4DQxsFLD3xeP0yZUyEFa/VF8CmWwYSFtaQ+3Nw9u1g3ylHb2jb7WJeRY4H56V48C/1itE
X-Received: by 2002:a05:600d:644d:10b0:493:bb6b:5bb5 with SMTP id 5b1f17b1804b1-4980c672d64mr214538005e9.13.1785795985713;
        Mon, 03 Aug 2026 15:26:25 -0700 (PDT)
Received: from foxbook (bgt135.neoplus.adsl.tpnet.pl. [83.28.83.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b85be7sm325733345e9.2.2026.08.03.15.26.24
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 03 Aug 2026 15:26:25 -0700 (PDT)
Date: Tue, 4 Aug 2026 00:26:21 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Slavik Dev <developer.slavik@gmail.com>
Cc: forestix@kcat.cc, mathias.nyman@linux.intel.com,
 gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
 heikki.krogerus@linux.intel.com, stefan.eichenberger@toradex.com,
 pawell@cadence.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev, Mario
 Limonciello <mario.limonciello@amd.com>
Subject: Re: [REGRESSION][BISECTED] usb: hub: total system freeze after
 running adb
Message-ID: <20260804002621.7a8a5647.michal.pecio@gmail.com>
In-Reply-To: <CAGQo=TJXef-QzbkFEpTcJ138j0k6WYnV4=tNY8Q7s3U7DUOY+Q@mail.gmail.com>
References: <CAGQo=TJXef-QzbkFEpTcJ138j0k6WYnV4=tNY8Q7s3U7DUOY+Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 3 Aug 2026 16:54:58 +0300, Slavik Dev wrote:
> Hi,
> 
> I'm hitting what appears to be the same regression, on the same xHCI
> hardware as the original report.

Hi,

I got your email from linux-usb with no working reference to the
original thread, I presume you mean this one:

https://lore.kernel.org/regressions/qc0nhk9c6l0a08bkfeplrm3qjssgrjkvkp@sonic.net/

And it appears that this (later) bugzilla issue was another dupe,
which fact had been overlooked at the time:

https://bugzilla.kernel.org/show_bug.cgi?id=221103

> Earlier today I applied the workaround discussed here (disabling USB
> runtime PM), and so far it is holding up.

Slightly simpler workaround is described in bugzilla comment 16
and it should work for you too if it's the same bug.

In comment 26 there is a reference to another bug affecting AMD
hardware power management, where some success has been achieved.
AFAIK no one tried if those patches would work for the ADB issue.

Somebody has apparently bisected this to the commit below.
Failing the above, does reverting the commit work for you?

commit 8f5b7e2bec1c36578fdaa74a6951833541103e27
2025-06-11 14:24:41 +0300
usb: hub: fix detection of high tier USB3 devices behind suspended hubs

> Hardware:
> - AMD Ryzen 7 7700 (Raphael, display on iGPU), ASUS TUF GAMING B650-E
>   WIFI, BIOS 3881 (AGESA 1.3.0.1b)
> - The affected controller from the original report is present:
>   0b:00.0 USB controller [1022:15b8] (AMD Raphael USB 2.0 xHCI)
> 
> Kernels (Linux Mint 22.3 / Ubuntu HWE builds):
> - Freezes observed on 6.17.0-14/-19-generic and 6.14.0-37-generic
>   (based on 6.14.11 + stable backports, built 2025-11-20).
> - First freeze on 2026-03-10, shortly after kernel package updates;
>   16 freezes total through 2026-08-03.
> 
> Correlation with adb:
> - The last 4 freezes occurred 5, 12, 35 and 81 minutes after the adb
>   server was started (using the once-per-boot "adb uses wireless
>   extensions" kernel warning as the start marker in the journal).
> - Earlier freezes also occurred with an Android phone plugged in while
>   the adb server was NOT running -- including one freeze 2 seconds
>   after unplugging the phone. Consistent with hub runtime
>   suspend/resume transitions being the trigger rather than adb itself.
> 
> Freeze signature:
> - Journal stops mid-second, no oops/panic, no MCE/WHEA, efi-pstore
>   empty. nmi_watchdog=1 and hardlockup_panic=1 never fire.
> - Notably: the chipset watchdog (sp5100_tco + systemd
>   RuntimeWatchdogSec=30) DOES fire and resets the machine ~30 s after
>   the hang, so the platform stays alive -- it is the kernel/CPUs that
>   stop responding.
> 
> Ruled out on this machine:
> - RAM: freezes identically with DDR5 at EXPO 6000, EXPO 5600 and
>   JEDEC stock 4800.
> - Pure load: 60 minutes of stress-ng (16 CPU workers + 16 GB VM
>   workers, no adb running) survives without issues.
> - Firmware: BIOS update 3223 -> 3881 (AGESA 1.3.0.1b) made no
>   difference.
> 
> Side observation: in freezing sessions, Bluetooth (MT7922 on the same
> bus as most devices) repeatedly logs "hci0: ACL packet for unknown
> connection handle" before the freeze.
> 
> Workaround status:
> - Running with runtime PM disabled for all USB devices
>   (power/control=on via udev rule) since 2026-08-03. Reporting while
>   it's fresh: the adb server has since been running continuously,
>   already well past my longest previously observed time-to-freeze
>   (81 min), and so far so good.
