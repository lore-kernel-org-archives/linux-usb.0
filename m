Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760637;
	b=ynDZ/XO70KsguSkY9TapmoAlKRw9oRSVWKlmITVTOnU0tUiIlJ6O+qJn1+K+xXxhrDOC
	 6YV15J3EngRRD7p0swXKOotilJaY3Kgdgs5AaLIhHZuI7ba3RuM4GRRHOBjeGAqR31wpA
	 FYMWskuKI/9r2FcTvpNqpE+dRFMRjENu6/nuEj3DqWGNDSpLgWlLQyf1qjSkM9K0gYPp/
	 EXzGlsYS2uh4uwbhlOYknUyW4hjdpxXY2RgsTzNPiASo2sbgcnc+EVZfMuHU8HVrtmbjO
	 NwQUVyoif0Shn7fUkDe+SGxSNZwxIlg90baFmev3WTC6ylyiIELgbbIcmWsoKlJrFEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=h0UIOA5y5g73G2xVp5c5QuGwzYb9nfi5JmvYX9WUW4U=;
	b=eIgPOA8icjPhipvQ168uZ5WiDSYCjrEIRPzVWTM9D13CuCEfajbxGfLL6Ctpi3su5oDA
	 PzWTOUCzfOiFfhijl5p6aIsktvmA79Xp9FPjz0ko+1tScPysEOF41HOF9iXAxPNh9wbQk
	 pc8DhIq5xkb51oXk3BA4erjKkx0yubRQ2VR925TJNjOuz1Z9k6CvD9D5GK2OPWFBKUGhJ
	 yBNVJucUimDXhI9kgyd3Dzdq7n0tgifnlF8CKHzm71d4rdAqWOMh0aJq71VupuMl27YNn
	 jUWpM3r6k5nIMTs4tnCsDPyqjFb+KZH5PAqhWSKv1AC1HAS3k87UD9+AnUYDECOMFGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QqyV6JyO;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0596606A31E
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 16:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0596606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QqyV6JyO
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a2761c69fbso3304849c88.0
        for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 08:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794760636; x=1795365436; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0UIOA5y5g73G2xVp5c5QuGwzYb9nfi5JmvYX9WUW4U=;
        b=QqyV6JyOFTRAuPpUpSjsHjh9IltAK1HRjYR22txDU9rj6OyuT6FBuBqcxjeeWYYxam
         SZTQrd5xAckq5xaBB+yc2zXRsLxU+BIbtCalXB0e0AmJesDoOB5ZLXOuw8CMAVf2J6FF
         24zyCDpaVw0u/olJEZVIyTaJSt3jDIXdq3cQ5H1PSctybE2rQ4eK7RZN+11l6XX0CuHn
         06I05KDZAiEZRHzFTQM5Eh2HUNTMl0tzOedZ9he4BQLQ8CGHzPN9ESUkp/nMiSzMJl3U
         T3ewmEaTRByrHFBgI4xz2gCTsjEmVfeA3h27J7ShH9/c6I+jswMEagRseT/dnHGyIfrm
         iYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760636; x=1795365436;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h0UIOA5y5g73G2xVp5c5QuGwzYb9nfi5JmvYX9WUW4U=;
        b=ZYBappyykwbSMPFG6qCkzQWLoQUGEosuvTujLiLw53Csz6RezhEj+wkpWFcdkDhAx8
         FheXCZ9viu4ZyDLjQcp9vSWtZIcxmnmuqCyjz3qKbUZMPftYs27T3GT6FcCkrG1l+dxv
         Gwf+PPDIucXOTFB/jIT6sjthJSoDejFtKf+jfGAupddFIdQdr5SeffKJHgiCMLF3jhks
         S76pAGxmrTYDOU+ShTsIRzpHU2de65PqSxDI9j7SEY5x5pi7x2JdPZcmx4t6yrFFm8ZD
         HBT4XiKk1pv4/UXx5qTbv65BybYKduURAvQVpozMlperZ3UZODQpsNutCnhdZQfqj8mX
         zaYQ==
X-Forwarded-Encrypted: i=1; AL+hErG8XpBHwf+okMfxdIgOqaHQxXZhwyqxq+3y957nOltdpQkOAdnnonSm5HNIsqXZLvaVj/rVY/XT6mY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/IoFaKtJl7SllI6rs3ydgwyx6/xDV/gAFEuhpUUOCvfC+IByT
	qXjQ9D/GIktAhCbVXYcaXxoE90Pz+oY8Knv39+m6e6ubzBMOgmMAid0BHKrT7Ke6Wis=
X-Gm-Gg: AYBFou0PgIWbb5bLuC4CJr6Ww69qTv7x5MmHss6XJtfzwAnNVfGJlJddjGiO6NwK3/h
	AKtEgTHpiyueCMRaC69TrrCJKZQKXK2NtrGtxETyI4BgNkcjZwNbLs20JXBGQqOtaK2SP3W49qy
	RJSO/PqBkUSSKHRpsEue4JaG7dpiLx0rqpHrdZnLJ1F6r3yKjmTdctkP67Fqz5jkgRonuGKnIax
	m2Lt+PVxMrYDuQf7N4zZWVFj3Un6+nrFhzbktIL3ycHei4eCEhHGv5MfR01m4zHZb3n4RUn7J/1
	dmmLMriB3NqmNN2/tHl62Y4E+BCaLmlpoUzCfyIsAVbfEIX5pNCPeiP+k2pSz31Q/AxwXOwPcrt
	/6ajXb4g4qpriqLi5sL3kOVecGiWQjs6gBWYPHG9hgisTktqKct5lgjFD5BpzVEplzayH5q4yr/
	ednxxw117GeVGZFOH6gaV1IMJxfHSXIDv04gLa5LCQ6fRM6WvBvMrxTaUeqp6j/Ej8x19MM+W5I
	OpaHUDRD2Lmn33NfqRgyCVn9xBwFXzoVi5EGITPLbydP4rSRhyr37gFoP3Q949nui1AijKqwPEM
	Ba3effCqwj9h2mUiwBIKL7TRjC+kZmsGdLZoJ6HHCfF9e/Oc4BQJ9sCGFAMlyEcR1WW+6fmP43K
	a0N059nRoLeU1Rg==
X-Received: by 2002:a05:701a:8458:10b0:1b5:1a5a:1dc with SMTP id a92af1059eb24-1b51a5a0221mr4419691c88.12.1794760635969;
        Sun, 15 Nov 2026 08:37:15 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm26437031c88.14.2026.11.15.08.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:37:15 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [QUESTION] usb: usbfs SETINTERFACE during a runtime reset-resume
Date: Sun, 15 Nov 2026 08:37:09 -0800
Message-Id: <20261115163709.226641-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Alan,

I have a question about usbfs and runtime reset-resume. I am not sure
it is a bug, so I would like to ask before sending anything.

The kerneldoc of usb_reset_and_verify_device() says:

  Locking exception: This routine may also be called from within an
  autoresume handler.  Such usage won't conflict with other tasks
  holding the device lock because these tasks should always call
  usb_autopm_resume_device(), thereby preventing any unwanted
  autoresume.

(usb_autopm_resume_device() no longer exists; I assume
usb_autoresume_device() is meant.)

proc_setintf() runs under the device lock but takes no PM reference.
After USBDEVFS_ALLOW_SUSPEND, the device can be runtime suspended
while the file is open. If it then resumes through reset-resume,
finish_port_resume() sets USB_STATE_CONFIGURED before
usb_reset_and_verify_device() runs its restore loop. A SETINTERFACE
issued at that moment passes checkintf() and calls usb_set_interface()
while the restore loop is still reading intf->cur_altsetting and
calling usb_set_interface() to put the interfaces back into their old
altsettings.

On v7.3, with dummy_hcd and a gadget that forces reset-resume, I saw
1097 SETINTERFACE calls complete inside the resume window over ten
rounds, all with -EPROTO. There were no KASAN or lockdep reports, and
I did not see any corrupted state afterwards. I know 7794f486ed0b says
that I/O to a suspended device fails with an error code, so -EPROTO by
itself may be expected.

My questions are:

1. Is usbfs expected to follow the assumption in that comment, so
   that proc_setintf() should hold a PM reference while it changes the
   altsetting?

2. Or is it up to the program to call USBDEVFS_FORBID_SUSPEND or
   USBDEVFS_WAIT_FOR_RESUME first, so that this overlap with the
   restore loop is acceptable?

3. If it is the first, would taking usb_autoresume_device() around
   checkintf() and usb_set_interface() be the right fix? In my test
   the ioctl then waited until the resume finished and returned 0,
   which changes the current behavior of failing with an error.

Thanks,
Cheng Yongkang
