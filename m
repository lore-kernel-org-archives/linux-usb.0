Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A16284896
	for <linux-usb@vger.kernel.org>; Sat,  8 Aug 2026 13:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786195044; cv=none; b=OV1sgJbq2FQLaE7GPfd36Jz1Qa4q7T7/l+kR8LEhcKFfN8mDS+id5gdK2aCRCcJ9wru+LOxRvfRxZiu8azuXRoPg8JjFclJw8+LoFFv9ArgCs3V4UThb2/RHRgwjs+ebHGYns/xUgndDDWDRW7mHkTs9mZ6iNJwRpO4nzAkiGBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786195044; c=relaxed/simple;
	bh=uNXKSJdgCM/gcLD9oVG87DBC0E23vzXLQvQaP902Z2U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=druTM32e7/qeHuq6LdA4EtaGimSUUTi3/pknlVi1JNi4Y0/dHQbBPy4nBXerELyaQ3HOP8heaJtpJq+3445gGf4L8RUXmaC6Og2r4l9NNzjGqh4tLV1UWyed0flX10z5YzYtENjZXor7iQh/RB/Jo+z4Sx8Q5v5BmoP/V7/TWJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9AmlLeH; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9AmlLeH"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso193204f8f.1
        for <linux-usb@vger.kernel.org>; Sat, 08 Aug 2026 06:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786195041; x=1786799841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k7rLDJgiGBNy28Y0Cch7JU2d64DR0itzNJWdOavO6CM=;
        b=V9AmlLeHBaOlhcZ8QuNIJ6v1xG0zgD8CrXJsoPGvycOYI6j2UkZxhpEsUv5RyKI3wn
         R/HDbp+dh3J4zz0Kb6LDKq3TR+/OBEolgKdS14jy5Jmvs1Vr+3KHnH5OL9QkhJWT8Um/
         ZrkVySZiehMJGOkUZWZEMa60MULy9eTth/q/0eeYtVEyq8vd2SNldTNKe4fh+0NqgMN1
         v+ly1oXAkMrF7Ni9NV+tsNGcQ7gknLTNyLyA3fOlBN7uxlFEG5Ns8jiq2B0UPprO+U/u
         kXcKBG2NT+u5vGUWbQzvwm0H3cmfuJvTbvWu2UW+rwHEHO6qSHQzR01CXJjxO7641l20
         91hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786195041; x=1786799841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k7rLDJgiGBNy28Y0Cch7JU2d64DR0itzNJWdOavO6CM=;
        b=jxlXCB+9Ci8WbXmox9z9zRISolBd6BkpHiONVkBGG+9lGKz/gXXG1K0uMzZwje22HH
         1xEeXkPJMX4z+/W+iZbvUC5/Ot7nFDvvDy3NFtWGt7ofl7DxUiKH2SaOt4FwiITduQnM
         Pj9SlMpBC+I/XULjG8YrERRAgSzTFv2V4EIXqrZOv5FYjN/g/jcc8/EIw/9dgLsNSpHO
         NfZ5IBGqN4A2csn4NzAGJBjQx6iScEL2xz245/tb0O4MW8zaKHQ9h22mHR54DgE/OdLq
         wXdVjWssdSXd764+ZAD3yaGJg/2KnL+9OjM6VxyiVRBohE0kDQuqmeSOBmyla2BVXoIl
         E5Kg==
X-Forwarded-Encrypted: i=1; AHgh+RrZaFK3vOiIlC1YLETw+N70CIPZ5rJWkkYz8OXVi/zfRu59l+Orh90AysiTrJkF0G/h9C3W4wQ2eDI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFzs+YLeslsAX6smjS++itf0msTbrautJjwdleX05fqvPXtQJ7
	W827jBU2aRS2VIati7u5FZXO7JvvO9xkDpjcJ/7f/6nJ3XbCxw4nwwghHLtuRSg+
X-Gm-Gg: AR+sD10O5KpOz54t95+Gp2cwiLmxGpZ1maW/aJZ1NRRUMlupvLptPn6YBtn12UlGQKq
	6CWLdez3lNajMSzggyyUpzDLv3Jzjc0ZuwYG0jLjXV6/+BarNJ4rmJjtcF9lG87xg/AarXrcV6V
	qTJBhZzkswu+VxVLidwC3LVDLqLh80Ghgi+h+AKwfF2NIpR6kjH7TwQ6ybluIoVotXmaF+tOQL3
	0pZ6US6Cv8kDYtMHRtXjbFqr7NmW/WndNin0Lw6+CgHiJ2JBIDyGsgp5e5bbDBQSA7zGPo2UVo6
	TiepQ5uBOuhAa+D6t9qu6PAjknX6T2drYaVNoKL7TIDlftN6yo6Mw04RXrH9yjQ/fUtVgSamZPG
	VfG9akrrXpzs7YV3/w4/kZqOmb2fz4GvL6B42jdu8mxgOCFfcwih6/c2slLA+t4MvQEV97eiwsG
	puZPiCkKXVSBYDy46Cz9DC4IbQbqJWT85lkq7ddWpvROTZFJ0Dz9TywJLFdVEOKd6kgcs1kyhQC
	5gvib5uxe+9UBckDrdUjOzEjeGu836dM7IxJdgRXOGlCGTCMU4w6wXAmrEyBdr+/ulhMHHbc+os
	9lPSa7u2zaZbWjTZJzOIoQoSsG73jeBwwSI=
X-Received: by 2002:a05:6000:41ed:b0:47f:8d71:210a with SMTP id ffacd0b85a97d-48130ed871emr9891239f8f.15.1786195041367;
        Sat, 08 Aug 2026 06:17:21 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-077-007-004-134.77.7.pool.telefonica.de. [77.7.4.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021509a5sm14087590f8f.16.2026.08.08.06.17.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 08 Aug 2026 06:17:20 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: core: handle port status errors in disable_show()
Date: Sat,  8 Aug 2026 15:16:01 +0200
Message-Id: <20260808131601.75096-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_hub_port_status() leaves its output arguments untouched when the
status request fails. disable_show() nevertheless uses portstatus, so a
sysfs read may report the wrong port state instead of an error.

Propagate the status request error.

Fixes: f061f43d7418c ("usb: hub: port: add sysfs entry to switch port power")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/usb/core/port.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b4452b665f591..0022473e526d7 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -96,7 +96,9 @@ static ssize_t disable_show(struct device *dev,
 		goto out_hdev_lock;
 	}
 
-	usb_hub_port_status(hub, port1, &portstatus, &unused);
+	rc = usb_hub_port_status(hub, port1, &portstatus, &unused);
+	if (rc < 0)
+		goto out_hdev_lock;
 	disabled = !usb_port_is_power_on(hub, portstatus);
 
  out_hdev_lock:
-- 
2.53.0

