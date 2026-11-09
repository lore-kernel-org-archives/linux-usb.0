Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233493;
	b=igtopT3td75KN733w3/GPTEuwXK1tGW5LwpNq6BiCt/GpgOLlcw5Nb/PRHt2BxF9+3Mr
	 gJhU3r9uh4etbQic0p9YoEJz/ePUlIpeExb+7er2r+0NmxbiByxCZSIVIkdIm/3osK2yG
	 Rffl8+3LeYabnNuPLezspyhytE/6EUwlWL2ptakeVQLabEVmDSlRSC+QzplqQcBOfTtVX
	 6qaEV7PP4nR5S5A8fpBB/wzmFxzvuD51WILpxpEbJ67HulVsO4piS39dTG3ObZMVM7A7o
	 232F13ISDojMqngp3huE1p/c8SWkLQTM9VCodYT2UkEp8fvyHtpxGk4ejNH/cOfFaBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=94IXRk93nt74TzOoS1Le6GCJeHsVAm9GcFaLl22SAUQ=;
	b=i+oiA/WI23moabnl/iZ1gchvyx2skM/Nf1ckwmDv2WNQ3vxXwf9oxUfewx7SMubkdGc7
	 PU6x3Oa2BzSqeiG8Y9aVnxNDwgk+w2vHzUqsWmeQsU1FaQHpQzvkdX3eJFcxs6ARZuPRC
	 vrFWUBzj/hAH9BRcEDhs53iKdBvHg2KTzo8Gg3DAJlA3Yw+rqtEWYYtfr9DMVE721weVP
	 FjvEVWZzqROr00YxYBZDnULspTu3JRewCKNo1JU35Qa5lwHlVQWm0yIvs6vDMDr217V+F
	 OR7a9I8hoJPRrQGNa2VVpgSCReq4ojojqnW+JGlGoi2aiIYdp8P6acj63rTShPK0/jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iwb6fJkc;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53456606D826
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 14:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53456606D826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iwb6fJkc
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36f8cdd30beso544319eec.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 06:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794233492; x=1794838292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=94IXRk93nt74TzOoS1Le6GCJeHsVAm9GcFaLl22SAUQ=;
        b=Iwb6fJkcCT8MXHNa1hBk0ISw11TIiSTAdr0h7XAg57SBCSoOHrOwiuTzAYiLgyQNQ5
         vi1y5iwawn/PmPReXz5YF8g+EpzVqCVlcnbQkzkLVGeRwTVAg4YdlSGagCKjiZ7peiSh
         pIyd/zFfPkB/ju6TppD8IW1VnwX30tpWacTyeD09txT1PtP6TQDAbxf+0pRjz5ufUGpf
         kLTXwh+spXEXMFo5KDYh2VmYffIKZt4d95w0R8r7DVyRDq0wAgn+6t7zMBilWUyLQQvm
         bC3Qyg0nS/HPN97EEOQCdxzi/lpDAS8mRIdtx0e4TeudwoW1tt0c4ERSYLSini2KsrcX
         aKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233492; x=1794838292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=94IXRk93nt74TzOoS1Le6GCJeHsVAm9GcFaLl22SAUQ=;
        b=sPG1uXH3OUTKs6G+BjdQ/nOm56xRZ0B31NfI7GXE/QJm5amwF/8lEaIukzz/WNOOyT
         1Q+OyRE2xjoInX1El6JSGq8ZUwdtdiFiutXOJSwuMmEmhmQX2nFQqB6buwiflRrhyrIl
         YC80422rAOHe6ZOvp7ZWX+SO9ZMdND+tj7O8B+8duaxARiTY/2Dvtlrz+4NJmsqoBybN
         ob9DpCVKI4LkPa7jMSne9wHZvKjzlnnvL8MQ3uAKDE/3E9CFv3rbOxhHmOVEG/dFdiBQ
         KOiWBTKjKGCDXlMimneKkx2LZ2gsjSsR6PoRNgb2o+SsC3quayxAM3d0gF2jsyGyuzEA
         U9ag==
X-Gm-Message-State: APuU4Z/wAgC+O0kzlD1RMrTsBfwwbctwJcx1FmK2I2DFPuPUPx0c6m3t
	GJNHytCjwzxAhclyPoVYQ/2FPcJKdxr8EZ+XVmfYvYI1tpQpVReMiQ5n
X-Gm-Gg: AYBFou0/xXdK3VDbtTSrZVWGXJcqfvV2bH7a9c1XRgbNVzgMb8lhwpQvjwBmQUIhsx8
	fkTlWyCxKgDTDBp30+eDWf5J1VtADHbsC4UeEOqdqPvAsSshS8MifdTNXivua07QS45ZwTgv00h
	Vg93tNYpn/tvEusytRQq3nDTdH+HZ89IOL1dnxisTkohAocqXkVy68XffnIrFxo4xGfhjhoI8ii
	nWrU7rhKyO+exFD21WUGmuEVeTvKuhzAh3yGRDGZmdxRaLl4IIwIRaTaY54fOuXgsMm4cngZy38
	VogurOXmgOsJ/mD7/1DQ13RtqHqILnRMPy2VqsAMUs6XNCET8Ugkjwi3qdZ2+IW7/jZ/WatCjeX
	dzF5VNcvAed+F8vw1hTW/BzRj6AYHnilQFwIf6pYKBlV3x+J2sCyWuL9Sw3obCwITLkISfuq2kX
	Hda1R/upUdLc+q+KO8aTFKsC2BhVVXsuRF2zndiL5SR1+MlKISLZ/aZQoWwpL9+cS269k7DYwIU
	kw4FM/E8iqkO9o7oqof3L79fYQvIlwvP3f/ECmjaSU5WlnaOrs5OD+syhg0W1I9UccUZFWiTBvD
	1qdVci6ZEtfoGlVxSQWNbdeZcUC+VWf9ZCkW+nIX1+rLVmIFEoO2Hok9m/TyyjjYNLeNXcRLF3s
	EmnRXqgrIJKh8DczV0n2sH9N24fLVp1AKGS9s5ucydnpoUKfD//gKQzI=
X-Received: by 2002:a05:693c:62cc:b0:36c:9afe:fcd8 with SMTP id 5a478bee46e88-3725e829ec5mr6713983eec.30.1794233492230;
        Mon, 09 Nov 2026 06:11:32 -0800 (PST)
Received: from localhost.localdomain ([103.71.17.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265a16c49sm12727082eec.10.2026.11.09.06.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:11:31 -0800 (PST)
From: Varun Singh <varun.singh10011@gmail.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bigeasy@linutronix.de,
	syzbot+39a2135de1558208d3b3@syzkaller.appspotmail.com,
	Varun Singh <varun.singh10011@gmail.com>
Subject: [PATCH v3 0/2] usb: gadget: u_serial: fix gs_port use-after-free on open/unbind race
Date: Mon,  9 Nov 2026 19:41:08 +0530
Message-Id: <20261109141110.3538-1-varun.singh10011@gmail.com>
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
Content-Transfer-Encoding: 8bit

2/2 fixes the use-after-free reported by syzbot in check_tty_count(). It
is based on v2, with the device unregistration change moved into 1/2.

1/2 is new. While reviewing v2 I noticed that ports[n].lock protected the
ports[n].port slot but not the matching tty device registration, letting
concurrent function creation and removal race so that creation fails with
-EEXIST. That is independent of the reported use-after-free, but 2/2
relies on the slot and the device changing together, so it goes first.

v2 -> v3:
 - new 1/2: hold ports[n].lock across slot assignment and device
   registration, and across slot clearing and device unregistration
 - 2/2: unregister-before-free moved into 1/2; otherwise unchanged

v1 -> v2:
 - look the port up in .install and hold a tty_port reference for the
   lifetime of the tty, instead of clearing tty->driver_data on close
 - drop the close_wait handshake: with a correct port count it blocks
   rmdir until userspace closes /dev/ttyGS*, seen as a hung task
 - hang up any tty still installed on a freed line, and recheck in
   gs_open() that tty->driver_data matches the registered port

Testing, in QEMU against a configfs mkdir/rmdir and open() race
reproducer, A/B against unmodified master each time:
 - clean under KASAN and, separately, under lockdep (PROVE_LOCKING,
   DEBUG_ATOMIC_SLEEP, DETECT_HUNG_TASK); kmemleak reported no leaks
 - slab fault injection exercised 1/2's registration-failure rollback
   107 times, after which the line was still allocatable and openable
 - 1/2 was built and booted on its own, to check bisectability
 - the series passed #syz test on 2026-11-08 against syzbot's own
   reproducer, which covers the acm path the local one does not:
   "testing succeeded, no crash reproduced"

Not addressed here: gserial_alloc_line() re-reads ports[0].port after the
line's lock has been dropped and passes it to gs_console_init(), which has
no NULL check, so a concurrent gserial_free_line(0) can leave it NULL.
This predates the series. I have left it out rather than pull
register_console() under ports[n].lock without investigating that further,
and can send a separate patch for it.

Link: https://lore.kernel.org/all/20261102193436.6044-1-varun.singh10011@gmail.com/ [v2]

Varun Singh (2):
  usb: gadget: u_serial: serialise line setup against line teardown
  usb: gadget: u_serial: fix gs_port use-after-free on open/unbind race

 drivers/usb/gadget/function/u_serial.c | 132 ++++++++++++++++---------
 1 file changed, 85 insertions(+), 47 deletions(-)

-- 
2.34.1

