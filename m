Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0039D3FF886
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 19:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791400304; cv=none; b=PrGmWNZRv8SIrlb3jTgc6F5uWPiZFEtQoDjeCACWIrx9EUITdXTWH2OeQITwcZWXVSFtpIP45zrsp6oxw9tTW1LirgehLxu9hkIbP1GZU0ZYRLLQUOzYQzLoAZMN0BjhR5cjWAiVkLKyZNgzikdxx4S+vR6hXu7iiAEBnE92yfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791400304; c=relaxed/simple;
	bh=c6/wsWEgIoAqhhn5+zQ/eb4VCbi0Mkt3bYBr7jxLGpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EkIUAL8EuPQlo1GLV+Goqz0SoT7PIThPSgOEs/Lr1PStCfID2OI7Yledf6za5ygmPNImkyq/j18O8I3ga3tm3ZUrCcCZUeD+IHSbJ8lX61XZvQYiKOCo46r7oredLk4yZDPcsrztcDmaWWEKfF3XArQQ49brUQtsh8kZw7m9rpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EIKs55Ts; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EIKs55Ts"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so44309055e9.2
        for <linux-usb@vger.kernel.org>; Wed, 07 Oct 2026 12:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791400301; x=1792005101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x17halSewF1CqvQRuX6zQF0SoDUJ4edQrK0pXUMAalU=;
        b=EIKs55TsSHMsE7RwTFgu56z6qZfezDZZujNk7qm6LGVx7G0XElWHlUFx35hov8vAiJ
         msu7MA5fPZhGhXA15+uJAD1LWM/qIQpb+/n6VQn39opvhczeaxASY3/iK0RROu8Y2Okn
         TGZgYTAaKLxCgAbB0qP+7MIbVrs06Ne5gI4ZFZMAnKk9pNCa4pUAnMZDMy8zy3ysf0dw
         ezEETbA87U463gjP7Q5pLH1z5R7Rj8DId+0FYc+aw/Z887nA+bP4W84b28259/kcpXHP
         965Yttk9Nqi/BBQt/xD3QGE5C1XR2moPQZQZOof9zdT7PwivE3Oh2PENIfyFm1gQVA/Z
         o6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791400301; x=1792005101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x17halSewF1CqvQRuX6zQF0SoDUJ4edQrK0pXUMAalU=;
        b=hEuHs6dywWtQAcQNYRMBJDC4hBjUtwSmMCR7AcAx6/sVHECkzd0UeCgHlN/EBybsNz
         v50w4/g0WYf7lumvj4I2VcP2fysqdnA4skorlm7SuNDNQL+isHfEVlecUuOHxzVCB63L
         HtNLIbQtVthu1D75Vy+Vt/aZfuJ5NJ06jARTwczaXVXirE1FhIfm8UHdG3i+9VEcjleG
         mZCH60oAegfSBgEM02n/++p+rGbu3PZeCUwq9pTN/0m1FAlAmc4TI7sWnu7MjcEB6bGL
         GdiVPeiiEQ4oj3ELOO3hFlATmnakogPgHfIEHunDMLaoP/ODZb4xWtANQHfZfWiBCp6t
         wIkg==
X-Gm-Message-State: AFuF++kQZQ6SUhsytJlSPSMVeFhLM/6myuD0bLRK+6bzFgypYLI/cIAj
	oa/zKUzvyrCauhrgA45DF81aS+VpXHaKOs9HtIsV98Wio9kq7RezBH/Drt3qE6BkBj0=
X-Gm-Gg: AYBFou0AAlQKAjZLgjzWhnEPKJHofuhpsT2yDuGyw0faC6BXSR4xYSxEawqBhszAdgP
	JXYw4/o4/rAwCNmyONNl6JwcLaqs95JDg5PLw9xx4Nzxmr4knitza8RBHMAsT/by9EEIyEiXoRp
	YlsYDDjqOxlQPgblk4/vfKGKZDJ799F7wiJlMIuB01DaTvjGqkh0dM8fwLZX8NIumfY+Ifqggjz
	M2dPm9VheLY0gqWvfGFzixqQGrcBLmb6YnMKyHwZevVDAu6g7U25rBGtlygewj1DIOZQeW072dS
	Q1hufN7p7aEZTMG39rII/aGY3zETWtysOQaGzTboXXxhvXk2sVEB4cMkCdN31NVcOTOmxz7zf3X
	JBVgUaJftdYxueqkv0/8vhysrPF0951RR5UrAFx0ltQGcye66xmQ7PEZKnYW5cWkFALL163Mb86
	YetQUQiS+UAy3vB0o8u+h94GGNgCnTl9NmSKGpPA3lXwJg5n0VbDxrGj70ZNv9gRwHdkrn0C2qi
	f/RJITjww==
X-Received: by 2002:a05:600c:3b89:b0:4a0:159b:d2a9 with SMTP id 5b1f17b1804b1-4a18043cc39mr74788595e9.24.1791400301158;
        Wed, 07 Oct 2026 12:11:41 -0700 (PDT)
Received: from unicorn.lan.internal ([2a0d:3341:b894:4600:81be:9245:330e:d4a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f48ab77sm92276425e9.1.2026.10.07.12.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 12:11:40 -0700 (PDT)
From: Giuseppe Piscitelli <ooonea@gmail.com>
To: linux-usb@vger.kernel.org
Cc: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: [RFC PATCH v2] USB: core: emit a device-level modalias
Date: Wed,  7 Oct 2026 21:11:30 +0200
Message-ID: <20261007191130.8652-1-ooonea@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <afcecb34-0024-460f-bc21-a7f2b1754d23@rowland.harvard.edu>
References: <afcecb34-0024-460f-bc21-a7f2b1754d23@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the first insertion of an iPhone (05ac:12a8) after boot, an already
running usbmuxd can select USB configuration 4 before the charging driver
apple-mfi-fastcharge loads. usbmuxd is a userspace daemon that uses libusb
to communicate with Apple devices; apple-mfi-fastcharge is a USB device
driver that enables their higher charging current.

USB device uevents have no MODALIAS. The charging module instead loads
from an interface uevent. Its registration reprobes the device, unbinds
the generic driver and calls usb_set_configuration(udev, -1), tearing down
the interfaces and interrupting usbmuxd's transfers.

Emit a modalias in the USB device uevent, using wildcards for interface
fields because no particular interface is described by this event. This
allows udev's kmod builtin to load matching device drivers while handling
the device add event, before broadcasting that event to libudev listeners.
libusb's udev hotplug backend listens for this broadcast, so usbmuxd sees
the arrival after the charging module has finished loading and reprobed
the device, rather than before a later interface event loads it.

A slow udev worker delays both module loading and the broadcast; it does
not reverse this ordering. This addresses hotplug through the udev
backend, not clients reading raw kernel events or scanning devices before
udev has finished, and does not synchronize later manual module loading.

Signed-off-by: Giuseppe Piscitelli <ooonea@gmail.com>
Assisted-by: OpenAI Codex
---
v2:
- Explain the iPhone, charging driver and usbmuxd interaction.
- Describe synchronous module loading before the libudev broadcast,
  including the ordering when udev runs slowly and its scope limits.
- No code changes.

v1: https://lore.kernel.org/linux-usb/20261007161721.60593-1-ooonea@gmail.com/

Tested on x86_64 with Linux 7.2.9 and an iPhone (05ac:12a8): first
insertion after boot without module preload loads the charging driver,
keeps configuration 4 and works with iLoader. Tracing the earlier udev
builtin experiment showed driver registration before usbmuxd selected
configuration 4. No delayed-udev runtime test has been performed.
The usb-next function passes 18 source-extracted cases; a full usb-next
kernel has not been built. OpenAI Codex assisted with diagnosis, the
patch, the test harness and this description.

 drivers/usb/core/driver.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 3c3bbaf89..29d1acba9 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -954,6 +954,17 @@ static int usb_uevent(const struct device *dev, struct kobj_uevent_env *env)
 			   usb_dev->descriptor.bDeviceProtocol))
 		return -ENOMEM;
 
+	if (is_usb_device(dev) &&
+	    add_uevent_var(env,
+			   "MODALIAS=usb:v%04Xp%04Xd%04Xdc%02Xdsc%02Xdp%02Xic*isc*ip*in*",
+			   le16_to_cpu(usb_dev->descriptor.idVendor),
+			   le16_to_cpu(usb_dev->descriptor.idProduct),
+			   le16_to_cpu(usb_dev->descriptor.bcdDevice),
+			   usb_dev->descriptor.bDeviceClass,
+			   usb_dev->descriptor.bDeviceSubClass,
+			   usb_dev->descriptor.bDeviceProtocol))
+		return -ENOMEM;
+
 	return 0;
 }
 

base-commit: 42bcac323cc3b16566fed8c5b250318ad02a0de0
-- 
2.54.0

