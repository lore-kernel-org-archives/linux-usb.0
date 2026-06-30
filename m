Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DFA3AB5DA
	for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 09:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811545; cv=none; b=WQPk/9tGuhK40TJ3c0TxUqj2J2z8RoY7sN0nhsvMje8wXp5x5r8oS/+n9n6Z342YMn06FixYfKEXQ8AvhJ1TFT3E7Xuipkwr++6/mxOnUCY2Tdc/Iyykx6tEKGrCWy3onQuZ7lg1WmfG/tf2moU4LLId5H4OqjHO11L2U6tiU+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811545; c=relaxed/simple;
	bh=nKgJuR3XmigsMa9k1vUOF1nEXfRW73tQ2flOgLH5ZLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NhPBGL+ngt+lLvbsetf7DGd6XGyJPfcJ2vBnbnFCmcrZVYVDa7A2TNWuavSD/pPDwMe1X8YeZRMP4MpqIXUJr9MbwM7yitA6lN3AYtkCmoTTiNXjEKiFfQlU2AMacQbVZXeY5H2UAyA72RWUtG7fjD+sfdGa/9qoKvvs+qHH8/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=lEfABP8O; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="lEfABP8O"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49270caa5c0so33492255e9.3
        for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 02:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782811542; x=1783416342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7ewNEAV0CZ6uEr2SBDB8shOgIrUe4fTtYVHBGDjmtk=;
        b=lEfABP8O18g+5PG+8ONtbktIbBHXLuCccLUTs2gf6uOh0a72ZTatheZ3s8GbgU+GOZ
         zvwoeifjA/yMaw842Uflv9xU77i4W2JjEAn7RBd3LQ8gutn7m5IlrUyBpzZwQl6Y0gwE
         ZqnZ9rBQ+DCqbMndg1wgR6glO1VnP467KI7ZAYBzWxFJLD9IoXRbEXl4bAIrhinOutoV
         bGAjKrYP+MzZuzKqVLrrfJqeNiwrN9cJ538TKyGtsxIRsEG/5cR6Ics/cLUUrSYCgwS8
         QCWbNHZRSW3SOAKUk4TEeObW4MIbOtxd5O4O+AIUJjVMCIMRXQ37yRB5iLRNyUV35yd8
         qm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811542; x=1783416342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V7ewNEAV0CZ6uEr2SBDB8shOgIrUe4fTtYVHBGDjmtk=;
        b=X7pYmJf+TLUPPWpel0v4MUVDVdTvKcqPlY5thfzpTkZDN0HNgAI2akYZ4YVH3uthyJ
         PkcLxbEKRq4IOo0Kg5qpqTWjFxEnrroyEy8QBr8Dh3MQU8RetPEpzl/DMEmVj0grwn2N
         XgKi4pS1Eb+0kDMo8L6jNHIHFvb35Dox74QSjQMLpfBWApmMwK8pFni1EfZpxXJOOzJ5
         riBhRezdOSUxWvaqfZcs2CEpP0j5vHFVnpH/BN7N/ptOdD4cKlbLhObTjqYPJOMy/8CB
         PiDkGc4eWZgmN0c6QEMNqosPPs6fdRLKgCwqOsAYvgsizoJtcevNaXWn2HYwf9QPlDVb
         Dm+w==
X-Gm-Message-State: AOJu0Yyw6NbYK0Zd/tSxXI1bHqGGN8J5sW3CcZQYwtlV3F06pDYX1b43
	lI5CmsHbAjbvMB9ngkL+0Ka0dA5amvepJAL+2ufpcfoB5AUxzqnvHz5OQi+meP8X1r4=
X-Gm-Gg: AfdE7clkTcOKQyCUXNnbHfcpjb6GVjkrboyUV2vQAhdxr7BehNLpMUSf8kWrR61ELDj
	ca/7GDq8K6VdnjFj1WFWIIult5X5yrUBthn+easT7fhZOzjqcJf5kdz5pfXKAhrFJtGpJWdZ+SO
	yMLizOFzoS/pNWSztXrHkosrOxLOGLiv5RYfmIhtrnRkpvfQoZx9Fd7t9kiDBj5hViizsw6IDxv
	43qDZBCU8nMpYdqfEJYTszMDokGPcXoCrDbBWsyJCzBPIrD1WHVhw/njVsqxDm9V6WLslsIl+qC
	nwdJLK2KSfy7UbYH4P/dQHInr6IIf9JlolPg7MJbbBlEV6rivScH6nni5lbI1xHxE0UAT4ouAK6
	Ha2Te2Oib3wpqOtnG3aSuhXphGk+s2jJuSDCfWblXzjLWXzh2v+ftFXqxmbqbpiIyTvlRQErHx/
	dRfHe+K4DYYET1AXAOzr+cm3JBpca8upy3YwCROj8dy+rYrj6Xohh8O2GCfUd/dAuGfHWch0Y7d
	irh
X-Received: by 2002:a05:600c:6d1a:b0:493:9661:f55d with SMTP id 5b1f17b1804b1-493b82b6268mr30314925e9.30.1782811541599;
        Tue, 30 Jun 2026 02:25:41 -0700 (PDT)
Received: from localhost (p200300f65f47db042c439d749f38355a.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2c43:9d74:9f38:355a])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493b8ca8b1csm48631215e9.9.2026.06.30.02.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:25:41 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: [PATCH v4 11/17] usb: dwc2: Add include defining struct pci_device_id
Date: Tue, 30 Jun 2026 11:24:30 +0200
Message-ID: <bddfcdfaf36d735c244e03efada6083ef98ebd51.1782808461.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782808460.git.u.kleine-koenig@baylibre.com>
References: <cover.1782808460.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1232; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=nKgJuR3XmigsMa9k1vUOF1nEXfRW73tQ2flOgLH5ZLk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqQ4tk5Pe4TcR9j/CYq0yForKiZdZPL2DJ5/ig7 yJZpp1tmPGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakOLZAAKCRCPgPtYfRL+ ThezB/9BXHjeVlgZJ7vno5dhcwiYb5Mi3Kln2XqWMphxC43/NZ2BjsCNu4jvWC9EJperHd2gjpB s/3NbAgcyxCs3Kf76zB6uoXitCovWTwjr+bTjx5rVrdZELtENX3/tzNrN0nNNTlZs2XGWmrUk1x Eh6YXexnby3dZrDCaFtXvYjIAif8pW6Hi4U6ng3PJctM07PZ7rMzxCvXbgxNLSFnEwt//MR00NN j5GJhEoV0OvzIDtp2R6NdHVq6nR80kLVWk/A8kCGxJ+CS6qlWD7cCoeUJy2tcb5jB82Pxdr5QKY 1X/oXvucYhaXmF9alzG8zmLYpupacmXKc+zPhUXKhQQVxsWy
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Up to now <linux/acpi.h> includes <linux/mod_devicetable.h> that
provides struct pci_device_id. However <linux/mod_devicetable.h> was
split into per bus headers and <linux/acpi.h> will only include the acpi
related one (and similar for other bus headers).

As struct pci_device_id is used in drivers/usb/dwc2/core.h, add an
include to ensure it's defined also after the includes in <linux/acpi.h>
are tightened.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Link: https://patch.msgid.link/9147201c2ccb659812c9db7f1c82c8bc05070049.1782682124.git.ukleinek@kernel.org
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/usb/dwc2/core.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 34127b890b2a..767251aa1aa3 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -9,6 +9,7 @@
 #define __DWC2_CORE_H__
 
 #include <linux/acpi.h>
+#include <linux/device-id/pci.h>
 #include <linux/phy/phy.h>
 #include <linux/regulator/consumer.h>
 #include <linux/usb/gadget.h>
-- 
2.47.3

