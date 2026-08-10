Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2D4245012
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 23:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786403083; cv=none; b=M4ew1PyPcN2CO7sWbvs1S9mq09CtC/I5extw92jANPgeW7dnXUsZRwtmTQpTcr+X5bQSNshEP5JMID+yxuMIt1hseNzf8XzWNXlNWUNZtRG35J/pFXU0oil7mAealr3JlbD0Xq18pLZblIWExcVWDZf0nKFNjmmiZlXhyeHN/vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786403083; c=relaxed/simple;
	bh=kA3VyBjbnycsi8w8XT7KgGKvM/tIq3TsjWOhM/tLTp8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KQuPnnFXlkIudclTi/Eh1rFCwol2MTwoAQtCZb0oa4a7bOhbzIq6dSqqxjQHkHmUS5+dxOol7QOvvRRbfT5Fxf5YgJqTCtnI0oxvaV7M1jds/LFt/LmXsJ+4jC5qhI4cOSkCoynUnQP6utqbYucEhyNwlMKdibBzQT+UeZWWhFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oKQBQKqM; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oKQBQKqM"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-495437bb891so2803235e9.1
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 16:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786403081; x=1787007881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X0/hcIiPqPs2K48/eoaYUPW9dUsT8eOP20Kvf6Vb/6g=;
        b=oKQBQKqM6mf7KHLicFDfZZKNlq5/nQi7UCppkY9VQU/atstNRkcAoiYevhcxdmj+TZ
         C4s3jfEMRz/iVu5dxyueS2TCrgy1LGaT78cSGeOHUh4s1g1sBDBMtzH3cNThQgnbAux6
         qQxwD9cKoSz/ZEzFZS3VAU2NCruyANVshDRq+z4fI5W9fCRdHgW6MSkUEQ7+SPQzcJBV
         mC/xeWTkdkZE6l04vNn5vLyOic3Gk5c2OlsRzeNMfWKH2N3TS4nmwXJx/y1vUv4J7UTC
         VTYKqmK83T3XKVCw6haV7XIJkMAOJJY5L+P7b/gI6dAIsw6KF2zTMi1LJEPN4SMc8Dt8
         4ekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786403081; x=1787007881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X0/hcIiPqPs2K48/eoaYUPW9dUsT8eOP20Kvf6Vb/6g=;
        b=qOKc4h3benhvZe2R1Qp1U/bmump3uEoKALQ0ti+fbYjg4dxH1oMlBPmBHJNnDIWsTp
         0SZHRtbj9DIXHp++PyvFsdmWFLUQxAzzeKiMtMyWqh6f5xjh5MPuLOnMmFzH1ehlVzLu
         lxNgzVP2vluXCNJrChtZAhDnEqbtjpGGX+BMP5MxO737ikgr8rnW7aDO2eUj1CBjstZp
         513X2oLzzQfWxk6G2Q7uP9L2t+8zPHnOdoe8T3s/up6kv71D9D3Sf28sQDwp1PzOJ5Kp
         TFu46wPNJzwjjSH1QQtaB7u0bfbTQ4VrsPrJ38wSOtIv9HOOpwnKOZIvsqN6DE72zYSv
         CokA==
X-Forwarded-Encrypted: i=1; AHgh+RrqEN9mF/Z0ZzAbLUoYG9LvR6F0S/K1OlN4aZWT5rRMadorCVfNODmE+yuTQILjxJYFUvPq/oIbKNs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB1G6kNuLlqYGiHHJvk58l/Y3PLyJaVvYSeDG5YGcp6rzGXsBz
	y8G7uv/EGl9CFIsxjv1BJqsj1jeYyXkMngrUJ5YRDporby+6ZGhqH+vp
X-Gm-Gg: AR+sD11Iz54GM5P6SXVyRYTUwcyvAQ3+9WRXSa3VxVI20vXAeBY7FYN/8JTSOIa0jQW
	YehUsgrb5AjyJLQSXYv8b/Z2UiFyiPkLI/CoTQivIT6aHj1IyQImL/8DIBX3vQokCi8e4+gJWYB
	raYA8fdzhxqrx2DVg2dD2U5RFwRaA7ctZVy76TgiQbJRGEYXBVG9oX7pBgMwivM7gc9un04Y5QY
	XSjTU8//PXdKBfj9rEQ8EBbd90bmxnKr0MEX13xF8IL9dBbGf25wgOKalVFUwMQK8eXR566Vta7
	9osRgG46mQks5LG5hIPUBz9hokQjFecL1mrgtueegdmY66rUokFnXQGG3oP785gSSZaSi++zfZ+
	UR41DzgE0BHqZrFbxlQGu2uVb7FzVBHxZd6JG/tgCGTq2DxA20iv/R+9hbUamN+sIf1IXLehap7
	roO+NZnRthnhhcddGInFh8bzd38/YgAwOQw8mh/tHbRGXfXXjCXAC5PQfyeHN4w555dUkB8npTo
	qictawjUetO86nwM4gAEwWOA7fvvs+u0XxxNZO190KdIQWkAOWKMhXpyguFJDOHlumylzzIjo3B
	7MxzW/9+flv7qpLTMoq/7dTfRCNSZHuVpj8j5t6EE1KvS9C0h4E2f5uWOaQJgfZW9+4ev8Bu
X-Received: by 2002:a05:600c:c178:b0:499:596b:2e91 with SMTP id 5b1f17b1804b1-49974613499mr16093335e9.3.1786403080417;
        Mon, 10 Aug 2026 16:04:40 -0700 (PDT)
Received: from MBP-von-Karl.localdomain (dynamic-2a02-3100-a1e8-7401-316d-6c00-7a9a-8fac.310.pool.telefonica.de. [2a02:3100:a1e8:7401:316d:6c00:7a9a:8fac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499740f1095sm33395985e9.13.2026.08.10.16.04.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Aug 2026 16:04:39 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: core: handle port status errors in disable_show()
Date: Tue, 11 Aug 2026 01:04:32 +0200
Message-Id: <20260810230432.44511-1-kmehltretter@gmail.com>
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
Changes in v2:
- Simplify error handling (Alan Stern).

v1: https://lore.kernel.org/r/20260808131601.75096-1-kmehltretter@gmail.com/

 drivers/usb/core/port.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b4452b665f59..6503668f303b 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -96,8 +96,9 @@ static ssize_t disable_show(struct device *dev,
 		goto out_hdev_lock;
 	}
 
-	usb_hub_port_status(hub, port1, &portstatus, &unused);
-	disabled = !usb_port_is_power_on(hub, portstatus);
+	rc = usb_hub_port_status(hub, port1, &portstatus, &unused);
+	if (rc >= 0)
+		disabled = !usb_port_is_power_on(hub, portstatus);
 
  out_hdev_lock:
 	usb_unlock_device(hdev);
-- 
2.39.5 (Apple Git-154)

