Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862143D9DA6
	for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 08:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105678; cv=none; b=IUCnlSgLgJGIZOh4rEkJo+7zPCjNUlLZAHAv5O211c9iy2MI87GUVXrcURvY4ObmhDKYkeO082OoCxLse+UwqbNdQeXfUKLRH0i5x4RDl/Zm3P+IA5L2yN9/GbS6S0eWRlasYO/oGnPWsWJnrnltdmRB1s4hpQ3+4xaDeYDALGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105678; c=relaxed/simple;
	bh=OlqZwr18Cpifvs6/MASST22KmUKK2zb2fxpZOLeBWT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KZKxnVk2DssIBr4OlUA9dW8NqiO7zVGz8OvIPEUvsP7LHV0TCjB/OrXGvBxZPP2Pot1lyXVIqbcbVNKa0LyRXoJIIFaV3poM1QSnLdcZUKNSr+rEOH0XrvxNy38NLofGqVIX6dwq0b6HAkMauUggDUAbed+OindkNjTKxVV1sOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VZgYdqBM; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VZgYdqBM"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-848882fdb18so1897224b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 01:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105676; x=1784710476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dYICwpllA6REcHU83KV0EGKSQt2kKv+TAZuxEKEYalU=;
        b=VZgYdqBM9Bta0pcAAOAqBbcozTRYHYk57aR3CCuV4FYSSO4JxeTaLeOzu0Mpkt7PCU
         c4vU4T8TZ6DPuoPQ7wX5fWouPMzzxJ7aTFnDf+Ucl//tVoUCevXtg/Zi3zPLXN4SfZO6
         KOJcR9CfC2XR4tZCmOUeRaGrFgodnGv1Yt2LE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105676; x=1784710476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dYICwpllA6REcHU83KV0EGKSQt2kKv+TAZuxEKEYalU=;
        b=kSkRL/IgNMgYAhPQgRMt0KAtlLjQp+oDOCBM8IlTc1aoAqo254ydpsHW3d9vGzl/Mz
         Wl603Fdg3l6tJUVJEZibrPA1veeEBRFlYBN6Ga1gtfAWEE173huoBrGLonx+ayOlYs6Y
         t3mZED0D5i2TcDtOTfBTY7W+2BEtHkBKTck94VGL6fIqG2HfzEA7equDJohkW4AwwqS9
         8Tcy1IWkci0DwaCWgaHWnxp1hoAXdySswFu7c0Dkda/0xIEVov/HA62EYP9B8Xf0FD/+
         F3SFxQZFihqcBBgWdtcsyU8PZ0D0ThQKUOWsg2K7F42ZmDacvXsqxkmYPmEowfDZeka/
         Kd7g==
X-Forwarded-Encrypted: i=1; AHgh+RoOkTPAN8LfH5DesTcbtnCUUy7nFDxOeklHVKir7v0bZklifZUQPNcbR9mXDjAgM4yx/tyU4LIgCo4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYFOnR1grD4dX+sP6XNE886O8Q+rZiQqi1SM1ue7wCbJHPk4pT
	QkZqO9TPwVUQF06+957vbn8n5IRhm9tz3LyVu6Sp5I97gImtSxAed6ei3giLPvTXdQ==
X-Gm-Gg: AfdE7cnpX4FePEFwUy7JYx7nsDMagejGa/V5tpaJvZK0kfTrjtd+Bl4LhlGF7ayyCb7
	fhUjuzZ9a1k6shAAFcdvnnR4I/sx5RsoSbsb5zB8fwz/hcwbccqDjAwQCQmz2p5JM002pZY2HBI
	xx59maCc3GrYlNyYQIr/TbOV4HwRHy54QABsMHlOLa8AhJiPwV86+4+ycAn/1DflWD1dDdoqJJ4
	mUsI55VqIjS8e9v1LQEjB4bNPvo3J39+jRDCCB+P/bTQoFZZy3+IL/5slFQcO0GXElrw4hcd8Oh
	gn7gZ65Mbb1yZsfIz5YgFpUOE8PAK/5VQnNGsS2f7dJY89J0YZqyEzVbMsa5U4/M0tSvheNirkD
	debISS1TODttou3fc4UHgT+cLoQQQWiYbzemydkeubnD2g0kyyY8rRvGjLWsjcBYLj2ByESCSbJ
	GrW3BeO42F/XJkSGCeu6MlCmvGyhgh+TFtFoIi6BP4RkayXDd4gmUIt13cHmrxtWvRZOjkVSnx0
	pw89JYY
X-Received: by 2002:a05:6a00:17a4:b0:848:88e6:95d3 with SMTP id d2e1a72fcca58-84a673928d8mr1756444b3a.72.1784105676023;
        Wed, 15 Jul 2026 01:54:36 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:54:35 -0700 (PDT)
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
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v5 04/16] usb: hub: Use assign_bit() in usb_hub_set_port_power()
Date: Wed, 15 Jul 2026 16:53:34 +0800
Message-ID: <20260715085348.3457359-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
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
index 9b2bf608f9cc..36342c5718bb 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -10,6 +10,7 @@
  * Released under the GPLv2 only.
  */
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/module.h>
@@ -896,10 +897,7 @@ int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hub,
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
2.55.0.795.g602f6c329a-goog

