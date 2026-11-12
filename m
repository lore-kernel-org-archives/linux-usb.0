Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794442609;
	b=J1vm+pIvk3GOXForpwuS7dBctkn4qmz23KvHWfv8Hd169uT0VUuT0m+BL7VOUkyPtQoB
	 Sk7+doCFSWVn0aLxoLBF5hww+JBizHxne3KoHmYbJ4Y0kutJ9psC8cQ00nk7Xm4HuDNJL
	 qgN6RBfzP5blkVlXdWeDqxwDZVS55JCPxtQCT75e7WIPymV2WxfESuc3Kj5NzhRsolR+j
	 ifiozQAiteSITYL6EkQ1wKsIDgJ1SPjJDVSmaxt1uR3JrQ3aDM4D+UVn7ZOYUmae1yhNj
	 X0sd99btdLaQHltN3slLxxSz69ae54K2gn+c1VH/9w/hg7UMR3y4GiPFauF5CC4Jh+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PGexwgK5GsfrYlYAzT+bpSfeXRNUax72AD2f2NRfT8M=;
	b=kvyt4Zmffz0LI1TIcJAW8IfK9JE3NVnQEvRPzLIQ2rx2yYARfLVyPFJcqdxKIcgJvGz3
	 +OdsL9nrzvrGDsXqJKBWQChPNMVGUx/xeBnKV65dEiINQA17x81xe0V3LJOFUcePxBuIB
	 Ge7eWTM8wfYbaMdr4f7zimjkelAApl4R5O8RP7Wf4yhXIhGxJRuhqVDnLYy4sd+XKzenU
	 FsAKZnmG6pSH3ag9w3IhvzftSnp9cPHLaRbzNIBWn65Zltxu2L1T3rnE50K0i2BkMHKiV
	 GOzfAmUZ2f5FHLDVkz0z8Mq5CtDrTf0jL27r/5upPvZjUmlEi0JuwdyCNsGoSNvPptQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oYsbeP7c;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5081606A31C
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 00:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5081606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oYsbeP7c
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so5614239eec.0
        for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 16:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794442608; x=1795047408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PGexwgK5GsfrYlYAzT+bpSfeXRNUax72AD2f2NRfT8M=;
        b=oYsbeP7czHMN8STkrlG9EQASwg8LH9HR4yZ2fph1J+MVwj0VdxpbC030HkYSoHGdcv
         LrVHhmJ960HrTsEhYE7nZxQ6HZPTBX07IVdDx/nzgkntOiHig5/JwJFwXGWi49sBlWGv
         GEio3pcvQGErbq7nJI2niWk9wbuvLpW0vNB7H6lL4aSmAVm9/eaayucx3b8NS0k381ju
         PuX/mGJUqJathYlYtHcvMeYRHlTQYxqs52aoAGzlan4gDP1+eYHvZ9fzZHdLn5+kq1NG
         hUPRhaJeUto1AQmLisDwksEDttf6arV4JvwftiMOljF+zpf2ZXTD95TiLMZ1wxrs7sCf
         uRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794442608; x=1795047408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGexwgK5GsfrYlYAzT+bpSfeXRNUax72AD2f2NRfT8M=;
        b=WlVgsaWC4ftkIMY3qQdw4IRlkGFTz14OGRQw28Wd+RxV0vpfBsqDwjH5EwLIAPn5t9
         mi5ryhkm7w670gCwL78nMDlHNuoMzWYVHTGtY/x2ddz3KCiPaiHzb2tloJv73vOxtc83
         ieJwK0gVcXLaRGB2yDKGWlvPapsKusvVFEgA3nuSYRjh4rqJaYPr54OQPdfB0cBGAbG6
         1omjfzk82S9Hl0ws/R4u96JZC1mAi57mut+M4hjfu6UEr4LSxc/b6Td43L/HNPjFhz8M
         BDHo5p0brRJp/NTtAO8S8kgDjEFXsgoB0BJ16xLLO9ehB4RKqBHU8agMuFqFGdtr3Xtf
         iQ2Q==
X-Forwarded-Encrypted: i=1; AL+hErEfJAwVCiM/yFwCwBhDsAhETTl7pAQmS/05V+o8K6DAldnU0z3JW3NgoffLzlxOe9EjSm8+GEzyu1I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oEDgdPpGSjSzEWh6tVP+BD3yKF9gBkAvIjS9fL5l7A3nNuDSh
	X30ijAGccWzq85hpTfIzNDZ8h3K+sITUjDklh4ziPaROGWDhljJ2EU5F
X-Gm-Gg: AYBFou3MVSTp3ToNlig4UYUPSw0Sy4vMq2B/kZAX1NjLzSyt/+WheoZ8KBVihuN0fPG
	aOdw0pan9hWMLAeqsN8nWNGoFDLymppzhA95AzF5OeDWd56D4GQQqM23pbaqJF5DXhDQ7/dYl7U
	jFlCbtrIzGCTC3YUNQGExs0pepvH0GFWSSgE+u8lLND2K3Ym5R4Uhw2euMmz08ZWfzptWyUKnZt
	hqWs9xiVznL//8gtMIKCr3Io/GUZp4iG3HlpQPs61BgCswFoYjCYOoTYNDmCDj7riM4TPkPfSa9
	sKa+NCVcoR6tz+03gQmT7O2lgFzY+C0fbVDUHNr08TNdF3o0TWReU9ZYnyJHSkJA6BQWQ/FWLLO
	NqJAHmdXbAT9KGfG3gAQ/71IDH2NXhuofUKcNOrgKbqif+jMJD6MVd6DuVgMAmkPGQ8vZvL0BHD
	o+1FbUoNxVy52NCVBl9vMkrqVJwgf2Bi8KKGrQ0wbcRSdzD2rNgSL91gH8GVvJ8sI2VaoLpWx1G
	c1faSW0EgIgu0Fiw2hV3nIAAXtjzJNdDsj7n5MY4ja8cU1srP4cXi549ZwBFVubxFdXJ9R4e2nu
	NPcQChzrZKjj1MlUozvK/GaBR1tGuYA625w5rovHbyP43wxu2M/DFk2hLO/k9xGe2LJ+LXb4uRs
	7c5sYv54IQ89oeO45
X-Received: by 2002:a05:7301:514a:b0:36a:7b3c:4e0a with SMTP id 5a478bee46e88-3768675676dmr4358326eec.24.1794442607773;
        Wed, 11 Nov 2026 16:16:47 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:182d:659:ffce:39a4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bf3e18sm40492697eec.16.2026.11.11.16.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 16:16:46 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Alfred E . Heggestad" <aeh@db.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>
Cc: Oliver Neukum <oneukum@suse.com>,
	Thomas Reitmayr <treitmayr@devbase.at>,
	Shaun Jackman <sjackman@gmail.com>,
	Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
	Florian Euchner <florian.euchner@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Xue Lei <Xue.Lei@windriver.com>,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Input: remove obsolete cm109 USB phone driver
Date: Wed, 11 Nov 2026 16:16:40 -0800
Message-ID: <20261112001642.243554-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This short series removes the obsolete cm109 driver for mid-2000s USB
VoIP/Skype handsets based on the C-Media CM109 USB audio and HID
controller (0x0d8c:0x000e) and drops its module selection from
ppc6xx_defconfig.

The driver was written in 2007-2008 (modeled after yealink) to poll a
4x4 phone keypad matrix and toggle a buzzer wired to the chip's GPIO
pins across four phone models (Komunikate KIP1000, Genius G-talk,
Allied-Telesis Corega USBPH01, and ATCom AU-100), relying on a module
parameter (phone=...) to choose the keymap. The mid-2000s userspace
VoIP/Skype bridge ecosystem for these handsets is long defunct, and the
driver has seen no new hardware support since 2008 while continuing to
attract syzbot crashes in its custom URB state machine.

Furthermore, because 0x0d8c:0x000e is the generic default C-Media CM109
VID:PID and was added to hid_ignore_list[] so cm109 could claim the USB
interface, cm109 actively interferes with non-phone CM109 devices still
in use today: amateur radio interfaces (Direwolf, AllStarLink, SVXLink,
UniPager, Hamlib) have to blacklist cm109 so usbhid can expose
/dev/hidraw* and so opening the input device does not pulse the GPIO
pins and key the radio transmitter's PTT line, while standard USB
headsets with 0x0d8c:0x000e can bind to usbhid directly via the chip's
standard HID Consumer Page volume and mute descriptors once the
hid_ignore_list[] entry is dropped.

Thanks.

Dmitry Torokhov (2):
  powerpc/configs: drop CONFIG_INPUT_CM109 from ppc6xx_defconfig
  Input: cm109 - remove driver

 arch/powerpc/configs/ppc6xx_defconfig |   1 -
 drivers/hid/hid-ids.h                 |   1 -
 drivers/hid/hid-quirks.c              |   1 -
 drivers/input/misc/Kconfig            |  12 -
 drivers/input/misc/Makefile           |   1 -
 drivers/input/misc/cm109.c            | 940 --------------------------
 6 files changed, 956 deletions(-)
 delete mode 100644 drivers/input/misc/cm109.c

-- 
2.56.0.567.gdb80ae8cd5-goog

