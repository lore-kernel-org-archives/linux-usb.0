Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766CE4302E5
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 06:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616902; cv=none; b=ieZk9mv5uHkvb0ktuqD6r3ZQWJQ5/Xce1GPEL0EZg+y6gA6HSP9I06zIy2qECzwnokuKidT9zPhkIUWz9Cy6ctP6P560l66n62SXJxeHEdf8I21Ar1WvBg4zf9QSB7vLKwoZfxu2YhZ2DqMKiIXJ7xiOpiwOCz8Wq7hpytwOUR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616902; c=relaxed/simple;
	bh=a0af6mRfXl6o/3aQ3C/YjqVxExTXT9xiwTDCu1uF7Ko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hu3+zSSj5drPq02J6XvdbWlh806Lqan/YlVaEIoMdHRvYhzPtwICwpNK4Rf33OdbkjtwukR1lPNa4bAsbQDWV4xtzlhXb3WNZSl4vorN+het6/r6O/PzySP47paZWzgNG3HmRA1132TB0q5KYtjU9dpPcfv+Y86I4dnR/EHwBZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NBBDrs/N; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NBBDrs/N"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ccf2360620so68977885ad.3
        for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2026 23:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616900; x=1785221700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qjG3+Srh1l1zMMK/k1OHJ2IZC5GaA1LItCzYqUBfaa0=;
        b=NBBDrs/NQavuacQelDdLBiYhlVe/vnCZtgSgZCweoqnblw2zw7vtbbK2kKVoJSCKmP
         Z9tnIvvap6QILEODnDzwAflKSsM3V0/Gk1ouNOJzHtWuWfT1cYPe/wPHsGrI2s7dpduP
         dJpZKdntutIwQsKg/AtNR+2au+rGVOJtv1lJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616900; x=1785221700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qjG3+Srh1l1zMMK/k1OHJ2IZC5GaA1LItCzYqUBfaa0=;
        b=f2FNRr3b08g7I1FBOe3+HA6K4cueklvGBj8QSBXQSgqr2Hd95iJw7fhNTPLJg7nn1j
         IDONe1SRQikRpMvK7em9H185KhiQ7ShIfn6s31zqx0aydcxNWflvWLjoNRNGsqNJl6Jz
         TuUhFCVV1Vch/zHBl+ScX5OaDOI1kMPec/1EAqcKP8LZhwWd4hosgFzEhctRQOdg5GFA
         kNc+g/Z51IjnA/3+PGLDAEAka3iO2msRprG54Fv2/AtGIRjHRoJkudjGYko8JiM3r+gg
         aVwFge44TYmi4tNEB/EyDrC/+NZgJJx9au9oV8vpgGIvmIxKpsGExSxKe0fFMY18nRS/
         doJA==
X-Forwarded-Encrypted: i=1; AHgh+RpsZaa/PLWDUGJlYoOTn8+vwKL8Mynluxi6VhwQdxPfGxkCqI7hRJ/H71P+1YiduOTno0vmaawrDZg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZnokYyLc7rzuClHBpSOLywfVIubfqpmll3Be0XqdHvYuNyJoZ
	Qp2okNeSOjtv+f5wB6QbbtU9ej2CdJ0s28TooL1davU12rE4PX2g4r3wed9aAYZYEA==
X-Gm-Gg: AfdE7cm/HcuT9Xy/XKjX8cN1sCougMvJumPlFt/5Fl74cPO2iTY8ogrXCWhYG1pTI/+
	4pw1J5BB84Fb1KjyptWM09ZXzFgmW5vDcOew0TY05VD03qwdrsA7DsICljMPKDz+W1TwOiFQ1Vd
	bXsTRPZ9wRV7QsUE24R6iPdoDh3kGhW8PXLx98A1VdlhGFMmfNEh+c4oGerBnHUc19bgfwb7cf2
	y8rO2XeI62WC3tmH5AtewgY90QHpVZNDO/a84K+0//EvuCQOrIw8ojC3bglq+ecDHfykCsvQ3Cf
	cNDy169xvQHxO4qwGrD4qQvjYOeHbSwMr53JC/qI+HRZ3+u0c0vA7Henj8Gx7qt58CmpoW6yPAh
	VQNA/IFNvTvDbMWVQskuBaHA2m1WLLk0AzE6p9XOXpqPybunxQaKEeu5G/gK8odSWpRIEtplplA
	iNZltQ0wVxgAqlVWoiYoT0Pl5vP/WoOQ1Wb7saChZdVgUmXG6TTHOS+TDokoY=
X-Received: by 2002:a17:903:1a90:b0:2cc:6b7a:dfcb with SMTP id d9443c01a7336-2cf349cc789mr186191295ad.33.1784616899938;
        Mon, 20 Jul 2026 23:54:59 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:54:59 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v6 05/16] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Tue, 21 Jul 2026 14:54:00 +0800
Message-ID: <20260721065413.2306137-6-wenst@chromium.org>
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

The addition of power sequencing descriptor handling in the USB hub code
requires dealing with deferred probing from pwrseq_get(). The power
sequencing provider may not yet be available when the USB hub probes.

Return the actual error code from hub_configure() when it fails, so that
the driver core can notice the deferred probe request.

Also rewrite this section into the standard error handling pattern:

    if (error) {
        # handle error
        return error;
    }

    # do more work
    return 0;

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Rewrite into standard error handling pattern

Changes since v1:
- Moved "int ret" declaration in hub_configure() over here from the next
  patch
---
 drivers/usb/core/hub.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 715f26f05a31..8f8624a0d36a 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1875,6 +1875,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	struct usb_host_interface *desc;
 	struct usb_device *hdev;
 	struct usb_hub *hub;
+	int ret;
 
 	desc = intf->cur_altsetting;
 	hdev = interface_to_usbdev(intf);
@@ -2006,14 +2007,15 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		usb_set_interface(hdev, 0, 0);
 	}
 
-	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0) {
-		onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
-
-		return 0;
+	ret = hub_configure(hub, &desc->endpoint[0].desc);
+	if (ret < 0) {
+		hub_disconnect(intf);
+		return ret;
 	}
 
-	hub_disconnect(intf);
-	return -ENODEV;
+	onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
+
+	return 0;
 }
 
 static int
-- 
2.55.0.229.g6434b31f56-goog

