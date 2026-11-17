Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933581;
	b=CfCnXtXG/fTTJdOThEkoXX7voqV4T9S1K8Kl2qZ3nJmpiFWl5FrAs2vJ8SM8QI4mVQIB
	 xZUJHsZD1vWOQUeGFUDMYXNe2lQ9zbNaU83UBAm7OOZYQpNtn5tZ6VpgnWpi3zeFMFAXE
	 PQMx2tZ4tpmotbKbEbMkklls6iL9/CeH5AF2Jcb7JlzI6M3mSmLBVKoo13sPqLM9D9rzn
	 jtuwux7k0pF7qE7fYUV3dUKGVm9e2rYPaNQM3JdV9JNvby90yQ+SdszALSZj3fgzCpDP6
	 17CaE8H0qV9LP8/c8YYwUJlQa2s/s31zx7dpoEaWvVhqrdL8QELvx8J+/wsimDr6uXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=iMc4CFcXOWr3ZfmZEHkTdrVLJyWhK9ZAZAwwufof5Hc=;
	b=q6hVq2YI3GBrvgwq5KnA5x3E/u2fWodWS00nVkSStty0v4AcKulsG9E71FJX1ZPXet3l
	 oKbWt6/izqJ8vLvfqPCv4eKGfYH00PNztgtJyUfnA4se+EnJ0C4wavPmsHck/m1WyGDBz
	 je2HJBDaJI/ChQ3Cj7anUvGCqOt9vDVgwXGXj3u70SYLzb55yoHoWfqP3jnDPddDNjd1F
	 ToHNCUQ3ejnl0GSkxLxObQMvIFElx6Evkw5m1MYxnkvOW3NghHQ7Hjvbes1yrP0rz/7A8
	 GE58s8/N+50t2LSAjfiI6d+NP5YEtkzHaXaI9xOPFAoGdYs3pwaDvHajxU812jd0jQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EPC3v+hM;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24FB606A331
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 16:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F24FB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EPC3v+hM
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so568365e9.2
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 08:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933579; x=1795538379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iMc4CFcXOWr3ZfmZEHkTdrVLJyWhK9ZAZAwwufof5Hc=;
        b=EPC3v+hMuSeFY9c3SPhNQuYOUnoCttiB0zd3Xssj9gtLLdhTAO0HRwOMyHyqMnYdVC
         kDt7Pjr1BrVlhk1M9Qhw4n0NUIjNBcOvAPSoKmq7qXYDFEiiB4UfUPA7ImaKDAWuJ0AZ
         9kI2NHlgFDEaEBpuXywzndeUF+SpFaxy+iBn9Gnbplporap80/3C10MVn8OCEvBnRjMv
         FqVigchHmEy55OJow3rgtGp8a8H02nvIpFIDSC2GSz1sRGAOWuDB9U9o8++rjvLdMQEG
         har7bqbEeN8TtmaUVZyEByRXGd6VSjRxJIyLQHSGuYhG2mRU4begVjT1bDt9dMCpNelY
         dW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933579; x=1795538379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iMc4CFcXOWr3ZfmZEHkTdrVLJyWhK9ZAZAwwufof5Hc=;
        b=U5l9gnCMH78qxTJ0GvdR5SWkxWxt1Sz08v1VO8ir/szOOduwMnSXJR6tIUsqPu1l96
         +FdlpINFBMxopLGx2ib/HJ03JmsnZpU0ianJK5TrE/axWxycskGnXUQeeIC8QPfUc2Bt
         1UQHP/BVMPa2iE+5dNs3iH5qlUBxHYoH2TCG3BcgKmp60NPrCTf/0EGd33jqPfvzyZ5f
         xmGuXT6tyvfnASfE1f3WguklnM7Bx73Lj0cNSaEN7wkFa+B2cjHvOAxl9Qlcv+ABCNa2
         WthhF6AovZVDwZzzdnbdZRPES8gXZqsyZ0fkLUqF1waAWAPp27SNPYzy58RAXceuaOO0
         /SxA==
X-Gm-Message-State: APuU4Z+mV5eo50hh4GEi8qRV08PvAxuXYF0zDUlZGFV4P73VmSoKiPGE
	GF0VU1iSnATS7VKBQ2TS7V3dGrpxzYlaAvXvL2einPM8N0Bi7k83h4s9
X-Gm-Gg: AYBFou1Y1s9aLduiOx7GiOTKAuX4eadrXwq4jqIY5yTb6d1Fr0FfmWMX6MY3ABXZhH/
	gsp9pbWk9AqY1QHXAIPVOgWd8Qfr9i/tn2jU4b19fbpFXW7Qyxn7D8ehgU5bx7UbLisOxFVlTNV
	SqfSsfaep9G4w3+F8nxJ+aDSXTG5J1V5XXmyvDECTn7iJGNXtza51N3cMIEUL3Zr2Rj50vnQGJn
	hscKXUgqxgdLfSPRDYeoOnjW8zqGFLJf1bFKg52062Ve91yMUkI5MISgsDHwNd77XDzVn4SwYrD
	wvsZJS5WDMCflWycdqAeIq7sqjosH45AkTtOA8573MQmVU3UmyO7JluX7WPTbvXgAHqeJbRu+f9
	SFz15N1Cfj8he1DlU3z/CDis42Z653VwgdBvN3M48J0Kvc65e2aAlpfpgEGzPIJvLht3qT/Svad
	pgadB0NUjkTj3GrD9F4k/tEU1sRx8IPhKzVWpb8hW24VkMOI0Lz3mucQHSsthgr2xFowHsUHwSc
	Yv2k8f+3W4Excv2zqRIfXniW53FIn0w07vmzTK2ftqzA9d9LFlgbZNljTr+vQZWMtsPMbmxY3Fr
	NuVWh9ntKpqDqUjCsCvYv70QWtmUSDeeD0eWDSES2qpF0Izd9g6/iR0tq9/oFiIrfcNlCv2vmIr
	3nqMQt2flYMs3O2i9zblR8zTtnlujajDM/YnXBR0tda1ozgk=
X-Received: by 2002:a05:600c:470d:b0:4bb:6b59:aac3 with SMTP id 5b1f17b1804b1-4bb6b59adeamr179333065e9.29.1794933579138;
        Tue, 17 Nov 2026 08:39:39 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783e9288sm80817565e9.15.2026.11.17.08.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:39:38 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev
Subject: [PATCH RESEND] usb: octeon-hcd: fix the kernel-doc of struct octeon_hcd
Date: Tue, 17 Nov 2026 16:39:37 +0000
Message-ID: <20261117163937.3727045-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The struct octeon_hcd comment opens with /** but names its members
without the @ prefix, so kernel-doc sees none of them and warns about
every member. aebbc7d63407 added sof_timer without a line at all,
which the robot reports as a new W=1 warning.

Prefix the members with @, drop "pipe", which is no longer a member,
and describe the three that were missing: periodic, nonperiodic and
sof_timer. scripts/kernel-doc -Wall reports nothing for octeon_hcd
afterwards.

Fixes: aebbc7d63407 ("usb: octeon-hcd: sleep on an hrtimer for far-off periodic transfers")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610151637.5srThc2q-lkp@intel.com/
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
RESEND: no change but the Assisted-by tag, now dropped (an LLM helped
write this patch). The warning is still there in v7.4-rc1, and this
applies to it unchanged.
v1: https://lore.kernel.org/all/20261015194043.1597422-1-orgads@gmail.com/

 drivers/usb/host/octeon-hcd.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/host/octeon-hcd.c b/drivers/usb/host/octeon-hcd.c
index 4929c6a..d6ba52b 100644
--- a/drivers/usb/host/octeon-hcd.c
+++ b/drivers/usb/host/octeon-hcd.c
@@ -348,20 +348,23 @@ struct cvmx_usb_tx_fifo {
 /**
  * struct octeon_hcd - the state of the USB block
  *
- * lock:		   Serialization lock.
- * init_flags:		   Flags passed to initialize.
- * index:		   Which USB block this is for.
- * idle_hardware_channels: Bit set for every idle hardware channel.
- * usbcx_hprt:		   Stored port status so we don't need to read a CSR to
- *			   determine splits.
- * pipe_for_channel:	   Map channels to pipes.
- * pipe:		   Storage for pipes.
- * indent:		   Used by debug output to indent functions.
- * port_status:		   Last port status used for change notification.
- * idle_pipes:		   List of open pipes that have no transactions.
- * active_pipes:	   Active pipes indexed by transfer type.
- * frame_number:	   Increments every SOF interrupt for time keeping.
- * active_split:	   Points to the current active split, or NULL.
+ * @lock:		Serialization lock.
+ * @init_flags:		Flags passed to initialize.
+ * @index:		Which USB block this is for.
+ * @idle_hardware_channels: Bit set for every idle hardware channel.
+ * @usbcx_hprt:		Stored port status so we don't need to read a CSR to
+ *			determine splits.
+ * @pipe_for_channel:	Map channels to pipes.
+ * @indent:		Used by debug output to indent functions.
+ * @port_status:	Last port status used for change notification.
+ * @idle_pipes:		List of open pipes that have no transactions.
+ * @active_pipes:	Active pipes indexed by transfer type.
+ * @frame_number:	Increments every SOF interrupt for time keeping.
+ * @active_split:	Points to the current active split, or NULL.
+ * @periodic:		Pending TX FIFO writes for periodic channels.
+ * @nonperiodic:	Pending TX FIFO writes for non-periodic channels.
+ * @sof_timer:		Polls the block when the next periodic transfer is
+ *			due, so SOF interrupts can stay off until then.
  */
 struct octeon_hcd {
 	spinlock_t lock; /* serialization lock */
-- 
2.53.0

