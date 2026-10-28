Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793161154;
	b=lG9TWlAhptCNT/VePL6NZHL5X9tm8dsqpWL5/F/sWHcmPj0GMLeakynMSpNJiZyJMn/Q
	 kStYDrUWmU6ranqlK2N8uaiQM7voYjYLrLddKStE5a6hOf/O5fCTZNKTV0CH/0xm2VT1F
	 gUxatx+TlAXcBCL3WebUhlfHHxb3uqVN/h477hdxoqp2S7BiVpzXFEv7q3MzSx8FYlGn/
	 YxCNhUznhGCCOt6CQ3wPMvECm/ykewRV7ky/K2EQ1sZtoPr5bAjOkHI6BCYWARcBT0Yg5
	 OEExuh6Rz2zFhLad7peq6MXw9tpcDhMHPQcw/Nz2al+xIoqnkxwroDBE82NWJ0KCl6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793161154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ltn8uO83uSCJJFiLynG8yy9CG6KbIYfFtGbU36TPU8Y=;
	b=Qk2M5r/yjJjF3pCdhBTSrnnswuPPlML4arY+SLUEaQbYTwMe8iZVvgJBjDJ2nkEdbvnA
	 U4LPvgBWI01q4zh1Y08uwbxpVmbO3HSYYbvDBs+phnXJjJRlGME2IM4lrJG7lBx4pYSrW
	 xE3/Kl/f9We8fHmSGvJRIR0m+pHfzpABcSJNiVmgtsqL2kkBgEr5AfQg+yBSFOhzYldVp
	 Y+hQqbKFSBB3clmhmM3RMbDIm711dUIxDrg11/r8751T1hBZHVONUrDEmLTIR5IGPdZiJ
	 qt3NpN6EgcS+cNVW0K+1ifHwsLQiWYodAQgF0dlTwnKk9f+aeQDliExiVSVLcRkWzLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BmXc+wnl;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D3A606A31A
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 04:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46D3A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BmXc+wnl
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so258010a12.1
        for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 21:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161153; x=1793765953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ltn8uO83uSCJJFiLynG8yy9CG6KbIYfFtGbU36TPU8Y=;
        b=BmXc+wnlcRKYvkF8gmd5XN4jaHRhrXqev63ZmIrEuI5TUNQPO4LrZC180J3kEdMmzu
         yT4+co3kGpQgKTyf6kLgkqArJhBMB7xb54qwLBC1hQ9sxiBNM/Wi7eVPYcnvv8e7BAN5
         Zebp7Yiich//isnc9YSk17TY2rIs/odM+sIsof5+pp1SFoGZOc1XzQ0PNCH2jqamKwXi
         V07hXbHskEnT082rJj5WGf41FI0Y6mGjW0XJw6NEIqhGRQT4rCMJRBkKVx3Wwp5rQ1Tw
         c1GHi7uC1+VKqGwTzSI/aWCc6aPFprzqngyVvkIcQDNNkp4r3+K6VtGgnRPiMC3BH5po
         NbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161153; x=1793765953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ltn8uO83uSCJJFiLynG8yy9CG6KbIYfFtGbU36TPU8Y=;
        b=lX5Mhs82uGN/kzzEPyihxQXrdUBmYIn9alXnjfb19D96scd2DWoCa1toXAPcC2n0a1
         pdI4rx2+8uwhd1DGF7PCypDY4Y/IeteVWgs6KJyOuAGMPqmdBhVRQi1hU3LjHRx7EzQF
         ZEGoUR0Yql6SYS5gNGR99C4PpVj47MMb8/pMJqYuXTpEJmwp3LqTYnmD1Mms3X7UZVs4
         LNChVOFrjCwuIxkhQXVtFq0888UXK1OKD3MpPUq/KIaUQOCMqMxVw35SEfo9oJkOea4V
         e90+OHpTYbGwT4cSO0Q4tkipClO3VqMBcq62YVFt1JKnrnVpBEBsHxzoAlG/73Pnxjqa
         WOMw==
X-Forwarded-Encrypted: i=1; AKwUvBxuMNCqOC0zLZJBL9bUaM0MoxVBSxcYLxaqwFwqSWdEQuRBEatp0WKwzf2M2po5MGBA/dBnMs23MQA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdZ1qpFYLB7wu4pBuSE4iK6BK76cRQ4g//Lo1YLALqzMp27qUa
	ygF19Vgdke0icwjqDDl2QCsuKDq9v9Cizz9ZqsuoT1XxCzOYuB8FO1Ir
X-Gm-Gg: AYBFou21zveC8HC2vLsX3d2djQy2shv//GMjXpiX3qAePvnQeRxiMF6EDbxHWTOJe+V
	SFWfKO6VMQg4feUMRUe1axNgYOXUgOI+J+2TRrL7sdOx4VzLi4a70grXdSEe/WYUmNkc8LDcdRi
	37JHP9ZaJoel7whBgn952AV03KnxK09V+OfRr6kz594wuuvNvZlUZY41WaOrgfLv//oTOYxoJ7I
	3+UdDPnV8u4/5CSE0VabJRHeP50gbIbN9IposdtB9G5wasIZtKT4Eqv0Wj3yMucOWsVgVAp2m5K
	iWn4zKIYLp/cIkybWYGOeklPfxvuzePM77mWB8KpciYfu3+9QPq9epgQ46LN6s5aiKcZQkJDKMB
	PxO8fv95N1zblRMXHWMtdKy13xEXh9AdJHuaULcNRBpvPNpqS4Tw0siSEF8EcA4Su3449aDM+Ry
	40Uu5UOxrBqjgURkPkkfeklA2w4UM/c7GaAUAqyBrrguAGIX0NQVXeqkWX2xJbmSbgowbUDqAy/
	nWtqA9VmQJUjNtmh3r3t1OsdWSV+zF4nE4S5o7i1Wi9qkrRZCivrmN13GD8jwtgNX9WHo+yHrVJ
	UaiTFd32PBRnOwZ+FOWFvfhXs/JnAnU+TeZLWXx7uaRJvqCVZwPPG0QEmJUNBYYk
X-Received: by 2002:a05:6a21:4d81:b0:3e2:2459:b774 with SMTP id adf61e73a8af0-3e90807fa4emr117670637.16.1793161153541;
        Tue, 27 Oct 2026 21:19:13 -0700 (PDT)
Received: from localhost.localdomain ([14.116.239.37])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a73bfea7sm636952b3a.47.2026.10.27.21.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:19:11 -0700 (PDT)
From: Jianping Liu <frankljpliu@gmail.com>
To: gregkh@linuxfoundation.org,
	dakr@kernel.org,
	shashank.mahadasyam@sony.com,
	johan@kernel.org,
	hadess@hadess.net,
	frankjpliu@tencent.com,
	guanyulin@google.com,
	gary@garyguo.net,
	rafael.j.wysocki@intel.com
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: core: raise root-hub autosuspend delay to stop a busy-loop
Date: Wed, 28 Oct 2026 12:18:59 +0800
Message-ID: <20261028041859.1061836-1-frankljpliu@gmail.com>
X-Mailer: git-send-email 2.43.7
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

From: Jianping Liu <frankjpliu@tencent.com>

hub_probe() sets the hub autosuspend delay to 0. An idle hub is
therefore suspended at once, with no waiting time.

Suspending the root hub can fail. While a port reports over-current
or a connect change, xHCI refuses the bus suspend and returns -EBUSY.
usb_runtime_suspend() returns that error. The hub is resumed, and when
its status URB completes the same suspend runs again.

The PM core would normally leave a gap before that next attempt. It
starts the autosuspend timer only when the delay is still in the
future. A delay of 0 is already due, so no timer is started and there
is nothing to wait for. Suspend and resume repeat immediately, and one
CPU core stays at 100% until the port is no longer stuck.

If a root-hub runtime suspend fails while the delay is still 0, set
the delay to 1000 ms so the next attempt waits. If a later runtime
suspend succeeds and the delay is not 0, put it back to 0.

Signed-off-by: Jianping Liu <frankjpliu@tencent.com>
---
 drivers/usb/core/driver.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index d3a61ebc6afb..30965d6ffd67 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -2008,6 +2008,20 @@ int usb_runtime_suspend(struct device *dev)
 	if (status == -EAGAIN || status == -EBUSY)
 		usb_mark_last_busy(udev);
 
+	/*
+	 * Root hubs use 0ms delay, so a persistent -EBUSY retries with no
+	 * wait and pins one CPU at 100%. Set autosuspend_delay to 1000ms
+	 * on fail, then back to 0 ms on success.
+	 */
+	if (!udev->parent) {
+		int delay = READ_ONCE(dev->power.autosuspend_delay);
+
+		if (unlikely(status != 0 && delay == 0))
+			pm_runtime_set_autosuspend_delay(dev, 1000);
+		if (unlikely(status == 0 && delay != 0))
+			pm_runtime_set_autosuspend_delay(dev, 0);
+	}
+
 	/*
 	 * The PM core reacts badly unless the return code is 0,
 	 * -EAGAIN, or -EBUSY, so always return -EBUSY on an error
-- 
2.43.7

