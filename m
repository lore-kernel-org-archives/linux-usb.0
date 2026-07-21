Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDFA47010D
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 20:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784665405; cv=none; b=BODo/7PbL4GvDph27bUbJFW+KL12U0N71cD4xZ7sPocAhim/po1C537djcuAlIH/DU/TkvtKzAv4MSkYBeuk3uRHnqhIodX/CEj6P3vlrrWQCwBYtflgMpEJTNgvQ7rit3x7NxrFd3d22iF2xkvXV79buyTWJ/Ssz1acXQZLzQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784665405; c=relaxed/simple;
	bh=JBlHO5DQokP7KzJFu7kjEI7Wjf9nZX1JcZlQnvCG/DA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T+c5ZkCXm1Gaz/dFwhFwfS1+ME8bm6XRNgnp8I7hhNQYtqvSOtWitE1tDaltfHrP7ShVJZSCte/l/A0aRS79Q2a2eyBfeFGnJQCKeFCU3W8wuI0snmOm8+q+6rFFIrGu97J2/1a/Div5uW22RnPIRjN/Ojl0EcY8LslZRHU6IoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mP4LDj2A; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mP4LDj2A"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f7027ca11so2288106f8f.3
        for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 13:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784665402; x=1785270202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YqxrRu6c0CmsNnLQXaa6olxyd1SouOkiNs++sl3QAeY=;
        b=mP4LDj2AwfnHoYDsVSDL8cVJgXfHZ0kLszzs+mg87lI+gzAsP1R2MBdXGvg1JiWSV4
         YjHbSgf2ievKsDSWHRV6CESAQZxjX+Ofwuc4V9uKjmeCUYV79r1dQbOeiI2xxNaoEUfU
         qZVzKjEKmAgeIhx/cTRgBzhD1l+WLxmmGYxUF+0e8Jl61tkPUxfNrzG/cfmxDL1qBrQD
         KgejpnDBrWsbJ2pOGDGN0TUgTPubqyW1JRbuxR8dmkgVbbZtkPYkClq/33iWD+5GLPRY
         pOYnAbpRYt5KE1Umb+OimHrLIYmy05Ywh74TCNQhzNWXW0iwnhQDh3l16vn7eJbj9IXk
         L2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784665402; x=1785270202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YqxrRu6c0CmsNnLQXaa6olxyd1SouOkiNs++sl3QAeY=;
        b=PPesn5zKFc9+EtZbWdh1H6iGfy6KK4uxjNWkxJr1sxy3sQIxk99JqNjN4oN4bBelbA
         5W8SZaUFKrvjf8LKNJeTkvEpEKhapk1X3blLUeP/dBTTpAKeKobRO5ho/K8r74FS/GjB
         9ZoNO8Nt2AMIzgP5+VxWxHaLxPTL5cFeyRstpN4gdbouWw2NWjadNDzA7mIo6hXy8hDD
         Y9EUr3ZYCuDdbptKMYC4AcUKhvOfscTMyVYE2vOsGVGM20KtcSJYaldXTGYza96QYNLS
         eNP69gAIEeRUjBiGCyQAkOCEuMlG1p0urZRsyVjirmJDTMocvzEKSiB0GLrZgGepXwSN
         Kn1A==
X-Forwarded-Encrypted: i=1; AHgh+Rrcw9A9gTdV20rE/ce7gzp3KyNR6pfKRDIaSy/sG886+NCpAFisQ6rtv0kOxaSyqfZ/0ckDqspyXBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsHO+LztbCew8m2EitPTgvqLYJB3V1UBDmjqtKXDqCp82xkeY9
	sqzwKzdRBDyPBCxij03v1JULIjPGQsJ9Wr3Sk4p1kjBbc9fYR7+Mg2+X
X-Gm-Gg: AR+sD11UP1hhQLnjQWigkyQvTBP5F2RFd0bYqUPUdGvvOzw5EfRLDuraHiWzETzuDvM
	gYDQJTewf3VdWklUvdeW/tO8q5AoUMLe4HygUGLzNnVrtVXkXLkLB6dlBEQG7v3a1U9bOhls2xg
	uT+/eq1+JFfVm0IEIu2866iiUdiXVQTp1cvOlKOdIZkBozZsWcisIctV2AY+VGaBpIPPHroo33i
	1U7YvgwiZF1nbgL7o42SNCTk+ZjlpiJCb25aDg2gFkbB7aU+QUDysWoYcNuFXTK6+6YQoeIVING
	GPsX6W3gLOm2u2frJyQ/Cm2Ec1dJ2XWms/U53Chgbg0xJUvBQ6809TeknEr0DiPctkwiGtb2EWy
	i2tg3HVwZzw/ZRlSgCQSZEvWlAzSrlHJhtBim/FA8abgTEp1FIVYUSvndRE5RmPcB5If38XHKSx
	nce5Qoa6HFs8wLGKEbfBBJolmZmGb+/Xkl7InZ3gcyAFFURQZ41OPXJmJRc/DqzVl6DHcnt5yJZ
	wguAEutgA1fnHEj1KJMGOwxuxvZ38JND+gP9zHJdQ==
X-Received: by 2002:a05:6000:29c3:b0:47f:6fbd:8a23 with SMTP id ffacd0b85a97d-47f6fbd8f53mr10389528f8f.9.1784665401839;
        Tue, 21 Jul 2026 13:23:21 -0700 (PDT)
Received: from asterix.home (host-82-52-196-160.retail.telecomitalia.it. [82.52.196.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63edcd13sm41259478f8f.26.2026.07.21.13.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 13:23:21 -0700 (PDT)
From: Marco Tormento <mtormento80@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Tormento <mtormento80@gmail.com>
Subject: [PATCH] usb: core: deattach child device from typec connector on port unbind
Date: Tue, 21 Jul 2026 22:22:01 +0200
Message-ID: <20260721202201.27442-1-mtormento80@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

connector_bind() tells the Type-C connector about a port's already
attached child via typec_attach(), but connector_unbind() has no
mirror image: it drops port_dev->connector without deattaching a
still-present child first. When that happens, port->usb2_dev (or
usb3_dev) in the Type-C port is left pointing at a device that is
about to be torn down, and typec_partner_deattach() never runs for
it.

This shows up on hardware where a single Type-C connector's component
aggregate spans ports on more than one USB root hub sharing an xHCI
controller (e.g. a Thunderbolt-attached hub exposing both a USB-2 and
a USB-3 root-hub port through the same connector). Unbinding the
connector from one root hub's ports also unbinds it for the other's,
even though the other root hub's child device is still attached and
gets disconnected later, by which point the connector is already
gone. The result is a "kernfs: can not remove 'typec', no directory"
warning the first time, "sysfs: cannot create duplicate filename"
the next time the device is reattached, and eventually a general
protection fault in typec_unregister_partner() when it dereferences
port->usb2_dev/usb3_dev after the device it points to has been freed.

Fix connector_unbind() to mirror connector_bind(): deattach the
child from the connector before dropping the reference to it. This
closes the race regardless of which order the parent USB controllers
happen to be torn down in.

Reported on a Lenovo Thinkpad T480s (BenQ EX3501R monitor with an
integrated USB hub, connected via the Thunderbolt-capable Type-C
port, alongside a USB-C power delivery brick on the other Type-C
port). Ran the reported plug/unplug sequence multiple times on that
hardware with this patch applied and could not reproduce the failure;
the same kernel build without the patch reproduced it on the first
attempt. Supersedes an earlier attempt that reordered
typec_deattach() in usb_disconnect() instead; that approach worked
around the same race but only for one ordering of controller teardown,
and inverted the normal teardown-mirrors-setup convention.

The original investigation, including the v1 patch and the hardware
reproduction that led to identifying this bug, is my own work. The
connector_unbind() fix approach below was proposed by Claude (Anthropic,
Sonnet 5) during code review of the v1 patch. Hardware reproduction and
validation of this fix were carried out by me, on the same hardware, per
the note above.

Link: https://lore.kernel.org/r/20250720210847.30998-1-mtormento80@gmail.com

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Marco Tormento <mtormento80@gmail.com>
---
 drivers/usb/core/port.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b1364f0c384c..3b258246bb3f 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -738,6 +738,14 @@ static void connector_unbind(struct device *dev, struct device *connector, void
 {
 	struct usb_port *port_dev = to_usb_port(dev);
 
+	/*
+	 * If a USB device is still connected to the port, let the
+	 * Type-C connector know it's going away before we drop our
+	 * reference to it.
+	 */
+	if (port_dev->child)
+		typec_deattach(data, &port_dev->child->dev);
+
 	sysfs_remove_link(&connector->kobj, dev_name(dev));
 	sysfs_remove_link(&dev->kobj, "connector");
 	port_dev->connector = NULL;
-- 
2.55.0

