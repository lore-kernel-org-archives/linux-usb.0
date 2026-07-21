Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0023B42F6E2
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 06:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616897; cv=none; b=u6104XDD5Mdud/r/IXdqEKs5LU1bxKXMgKPLGyb6gzW2KVK9YO+poKVIZM+RGFcKzJsu6uGVgPim8cMXTADGGr7AonJ05kV/EGr6uTY8tPhd8vAvUmG+go+t7kjy2y/xr6vF+KGdRxe9cwzqUo9j53dwqGlHWF+P1C0Rx6L7ris=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616897; c=relaxed/simple;
	bh=DZukzCQ7CZkay93mS9H4jkJ+htZvTV7aL2cJyc7/2CA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fFYX0Y/CnJIVW+HMWK6dspoL7+NkyTMjSmoiaapoK0HIenoXRGfhzkovomSePkB3V29pk1pxds9fdRlf0B9cPeylGpD4ljm+iQMonayAgqqAMvIYg3e0ifWvhGs3E14LNQMuTg0/YSyswmyEP9PdzgDY73uHKlCFDSSCV1jYZPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TRp4Tdb5; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TRp4Tdb5"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so22146025ad.0
        for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2026 23:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616895; x=1785221695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xc02KBsQrd1xdK8Ho0VEf5G63Rz5XQrKjQwFcbcQ37E=;
        b=TRp4Tdb53zpmXKorIc41xp1t8wmTayjsPM4PK5fPlj1LSUfXfcSXEPOmVz/58B7vKZ
         iDUEJRXDZ/SSSqXFjHvPSk3EKVH0FBDIlcx4Gx8tvzKd9kqrrAPSffOt/NAOH/u5l1pQ
         aKgfclmZXnBQ9fswEwto2MwK0vlbPfOyucXbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616895; x=1785221695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xc02KBsQrd1xdK8Ho0VEf5G63Rz5XQrKjQwFcbcQ37E=;
        b=VXT7eaevp9/KArr9EfrhM2MwJFkU6W3IjGYPTW5Ma413ZLx8Z1t+aOeoSIwThy1MGF
         w7qq2ivBbAvL7PwIMPWwFmmPcikpvJ8jrysPeNKPLTTRWqFGGR/kzr+yELhdJRxGKdSu
         WtSRvAfUPBE6j4YgO1Kr0yoXF269ksZRKv+lBZwDCN7+pBNEO7JakuvES6G8CRp09HAR
         i0j940Ob49+0jZFTRrxwJfbTQj6G0ucwxdUgUMutYDySnYx6PghQwoeYkbTSGhc0HxA+
         tWLHX9Sbh9fl01r/ICZb8mYavj3stEZZYrlGTsueyTZw6hKoB2Vdk6k6alCvFnohZ0Fk
         zNBA==
X-Forwarded-Encrypted: i=1; AHgh+RrwV7TDspRm0wkqmHYAw9ZfII7f/I/I1wPCN3VgUZU33eOJTmM8oqyABftg35M/aeHTSWEIxkSpLko=@vger.kernel.org
X-Gm-Message-State: AOJu0YylGt2vPeo75MMU+oak6Cww6JUNMabCSM39JycAADbtrY+QywuV
	FtS84yEXB0fk/7GMyYefcTjbYufYXCMOXyFWl6mq5mbv8qoILWkaBO9Px8vZQp6LUw==
X-Gm-Gg: AR+sD110F0/1ZYvbDXAFoM3+JP/UqE6iV/x4qBacceQMXskQKbM4gl/luxYp/kb8AnG
	fjiPX0iQMBrFA3nq9xUFhAumYqOxp5dlcsWZZgXuRrdbFkEetFyBB6XeW50i5FyNBLaOl0zXMMi
	rnLIOa/lvp8cfoTLMoYQQNBsZi8UI3qqh7hMG51bnWJt5ZRSI+0wXvg87HRMUf9Cps4QYLb9baQ
	4T54SdEug8bpn/BWRgPal73e8c128iDg1bSIxURrHhgyx6wYdudxhJeWyUHuyALopAYmuPkKKhq
	/sZc2GMvgjUuyATLEnAw/XxNaOMRMNbSOn6n5YUy+QPkzDRXdmsUq0NgE5rx1IQFxmXiTF9k+Ba
	n6YQkif1WEr74EJ0kI8STRfvzezEwk6mRILQJYY9W6Kx+q1ieRMZZpIitQ9A26Tb36LYBfIHbVF
	iEtvaqHCYIqA0ddVcPGQW4RZBz+FNPh8B3tClvA9hzhBB0gWxr2wBsfRKf7wc=
X-Received: by 2002:a17:903:41c3:b0:2c7:1200:bd7e with SMTP id d9443c01a7336-2cf3486b0b1mr185750155ad.18.1784616895361;
        Mon, 20 Jul 2026 23:54:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:54:54 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v6 04/16] usb: hub: Use assign_bit() in usb_hub_set_port_power()
Date: Tue, 21 Jul 2026 14:53:59 +0800
Message-ID: <20260721065413.2306137-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_hub_set_port_power() open-codes assign_bit(). Just use the
assign_bit() macro instead. This makes subsequent additions to
usb_hub_set_port_power() easier to read.

This change does not introduce any functional changes.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Attributing suggestion to Andy, since the change was originally
requested as part of a review.

Changes since v4:
- New patch (split out from "usb: hub: Power on connected M.2 E-key
  connectors with power sequencing API") (Andy)
---
 drivers/usb/core/hub.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 2cfe09a141d8..715f26f05a31 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -10,6 +10,7 @@
  * Released under the GPLv2 only.
  */
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/module.h>
@@ -899,10 +900,7 @@ int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hub,
 	if (ret)
 		return ret;
 
-	if (set)
-		set_bit(port1, hub->power_bits);
-	else
-		clear_bit(port1, hub->power_bits);
+	assign_bit(port1, hub->power_bits, set);
 	return 0;
 }
 
-- 
2.55.0.229.g6434b31f56-goog

