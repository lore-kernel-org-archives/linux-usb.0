Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007094FECE0
	for <linux-usb@vger.kernel.org>; Thu,  1 Oct 2026 11:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852805; cv=none; b=e/7vGEj4jW5Yv3YaztVCy2ufWD4ClqystoEbRmkOE8aPFZmfAxqfU/OtxKOmwtH5N82jcVBPxOO6MW5iRheUxaMaXwd+C5FAUjtQs1qsRNTbo9jOsL3dEJbo6hUsMd9+VUUjOE9IWK8IB1Qf5tK6P8HwxUmzHsL7ifb7xRgv3M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852805; c=relaxed/simple;
	bh=VJhODPY00t6tM3jIhYztXG9F/1xpVlGsrl89toP9HDM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iQnIAmLiLahbVZI7pBHrDYhmUvNPOy4n1wFlWwvyOdPcSQESa7ZeMRsmMYkIeSUIe67etA6xmtqQZFhMP7WVFFLs06qWRFiYQRdw3jMs9NQYHvBygGL6KOikpriglQj1sDT44NlpZg0QrVDBX2JkrAnXIOwp7TzK5eeXydky5vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SfwvNdUh; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SfwvNdUh"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so243620a91.0
        for <linux-usb@vger.kernel.org>; Thu, 01 Oct 2026 04:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790852803; x=1791457603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YcXyTnOXW2W3qLKJJiiWOP9lP4SUYSkZqRBXa53K+vw=;
        b=SfwvNdUhxVCFpYec3ZEW/C3ogpnEwFhecypEc/1qjIEEC3I6aZRUJXubr/syrR7Hg1
         RcOx0fq9sVN72cEp1UT1HH1JigU2wMQkvh9C10KeVGyt4HmK7BomovQPypwi1R1YsDVy
         cXuE4QC8oVOh7Ocoptdw5kOaBdmSfnuM8l/5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852803; x=1791457603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YcXyTnOXW2W3qLKJJiiWOP9lP4SUYSkZqRBXa53K+vw=;
        b=a4DNPxoZJ2WT6ApQ6iRDbIyZr5w8g1kR6FtVzH7ZhKeuU3EFYPxkkXy1i2ECg97HJg
         r56C2KyVcKbUx//Gwf4GhLQFyidczbTjOpDGPRKLfvrFVVbiIUMiE0o0XB0r273aLXAs
         Uyg7s6H+XMG6UAT4nMSUCSAq283b+79FUG0ZoUaMMaAAZlbQCY6f+pnAQHVbSnMWel5k
         u6PeOKkhoytVNI9buECxsifvhX0BBp2Tp6g5fg0R/cCc3E4CJJ5SotPMqGx5IlSWRkWT
         F4gccxhQDHoI+mM8IZYZVlsoPnCe7g636ppX0FsQQD3bKhe25ACHmR+A/ftlWJB9hbqe
         RO2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxMywGFycJa+QLZbcdEKVo7Yg69cV8s0r0Q8RuLhVUk/JQ4ii0SScKUXOWYwtTiKfkNE6fv3DyQqzc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJchGLTOFucABSpdju4WZS7lhq4l0TRGy0epB1zy8P0O+hdjyMr
	ywdIclGXHex/WW10cS4KGda+0fPYVGxnasth08d8uJH0osr77iFbK2z7XbU8SzNqNw==
X-Gm-Gg: AYBFou1ZyLOH6pud3o9pm5wxm48Bf8J3OHyqPRvNjRR7wuYMCm3y99F3OKDEKxAFDyj
	vwAx4Lsxu211c680we93LMXD8i7NpuG3oPk1t8q4oZslDbLDm/lgzz3LCOvGSjRcrVbo2fPmGPj
	yyNVoXvFY8Tn2FNy40KK/VfmMaI8p1KRzVrJbXtVgzMVNMR6fiJTRolwKYSTZTtR3ioy77kXS6A
	NgGerMN6vjLUL6wqHloFv+Wl8eOGcVUXAxvPXQ61yll5xDIgFkXsGO77qmGBA/ewS0Z3Hotx/md
	vhVVzjeQp95X2tkyoKWqdR/KL3TS6CpoXeRdDOQhFrHTLNyYX7zkS+QTb+v1OVezmquWcFviCz2
	KD6t2Ovfp1TDXe1J5eR58DX4tNPQlgnWCFG0OpMAxkFwa4ePLZCscfbD8LcHOMENpiyk8VoMfXf
	ZA7YlQJA4F6OqdaPxHPMBSq83hrP9tUepAgxUyVott2lIAa5v02TLG7i1UYCmf73O79I6XkuV7j
	2AV+fz/VoxUPeND5g1XPzVoetLpZ85KA6gp6C5SVLJBP8Ycr+FCg20fqA==
X-Received: by 2002:a17:90b:5383:b0:39e:6ed8:8e84 with SMTP id 98e67ed59e1d1-3a4f3a5a0f0mr1583429a91.34.1790852803176;
        Thu, 01 Oct 2026 04:06:43 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:9d96:5df1:469d:9e89])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7e54a4121sm1265705a12.20.2026.10.01.04.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:06:42 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v3] usb: hub: Set proper message when usb_hub_create_port_device() fails
Date: Thu,  1 Oct 2026 19:06:30 +0800
Message-ID: <20261001110630.1476797-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Right now when usb_hub_create_port_device() fails, it prints a separate
error message to say which port failed, but otherwise leaves 'message'
set to the default "out of memory", which is somewhat misleading.

Use a small buffer on the stack to put the custom formatted error message
in and use it as the error message.

Assisted-by: LLM # local reviews
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Simplify to just using a small buffer on the stack (Alan)

Changes since v1:
- Explicitly track and free the allocated custom error message instead
  of using devm_kasprintf()
- Link to v1:
  https://lore.kernel.org/all/20260728100005.413868-1-wenst@chromium.org/

Sorry Andy, I ended up not using your __free(kfree_const) patch. My LLM
was telling me that it won't work correctly if CONFIG_USB=m.
---
 drivers/usb/core/hub.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 0e929a4c9fa1..d7f39e86b24c 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1480,6 +1480,7 @@ static int hub_configure(struct usb_hub *hub,
 	unsigned int pipe;
 	int maxp, ret, i;
 	char *message = "out of memory";
+	char msg_buf[32] = {};
 	unsigned unit_load;
 	unsigned full_load;
 	unsigned maxchild;
@@ -1756,8 +1757,8 @@ static int hub_configure(struct usb_hub *hub,
 	for (i = 0; i < maxchild; i++) {
 		ret = usb_hub_create_port_device(hub, i + 1);
 		if (ret < 0) {
-			dev_err(hub->intfdev,
-				"couldn't create port%d device.\n", i + 1);
+			snprintf(msg_buf, sizeof(msg_buf), "couldn't create port%d device", i + 1);
+			message = msg_buf;
 			break;
 		}
 	}
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

