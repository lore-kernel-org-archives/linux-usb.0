Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95AB3E4C96
	for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 08:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784882671; cv=none; b=qQK91rJjjLtjyK97oVSsuG7UpRpLTt98SGyPRYQKRyt8EaiYdGoG5DkA24P7wwqN6y6zL0m2jPDIGR77JyBNNQlfA+eSLUlynaUUNj/JmutTgBgrK6VHbcPspmHpwWvpu7AnNquPJ8wQ8htS5teiy66zXTzTU7T4HPjzIjz3Kro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784882671; c=relaxed/simple;
	bh=a0af6mRfXl6o/3aQ3C/YjqVxExTXT9xiwTDCu1uF7Ko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qeT9jdEq/9lSlO3QW62qLQtw0XJN0bAb5qW0rWZH+7LUupU9EMsF+HZ4a3zByOqjeDY45EG615fOmlpKzdwJPscrhfZNWprSJQPPtM8Lo7i8sX/6Ml4zGLHE1s69xKZCiRIHgABcjX7YqRo8FBvssRzBOSZvnaefhPY09cq7HyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fTOr5JG5; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fTOr5JG5"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso114360a91.3
        for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 01:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882669; x=1785487469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qjG3+Srh1l1zMMK/k1OHJ2IZC5GaA1LItCzYqUBfaa0=;
        b=fTOr5JG5MIirJf39aUCrW8evnhhd07B9xb4kaUT+iDmksZKkPaCIEP/4MVOvrqyJmd
         8U2tALDlNUYd5j6i8aRsyaNQdyPPDIjsxbuIxMF5m9VSrIc6havZye2eM5XDS0flqt+K
         Hix/kclbTreR+HXWmW8haNTiIxW5gssdg5BjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882669; x=1785487469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qjG3+Srh1l1zMMK/k1OHJ2IZC5GaA1LItCzYqUBfaa0=;
        b=PMLXH4RAp8kFtuELxPNM/fVbsYZ0MvU8YgLV/G2Fci4okb5WJatrufJdu6o7N0aal1
         wddElk0Nkk0gaK2n+jTLmau2kKnerBxFIXlA5CMFuWWdH1QzB6oROTh7HAZYpkx1sxUg
         8fSqmHN76TH37Cln+fzO5pSzqmlXfRuyhbMmPxFT/MGZXGS3n/J6kPIPczcjxlXIV/C+
         ZpALqZlv3voEuQkkpnpRbtcFs32nJcFIkurGJcbkRWMZnJ+83jUCFFK3SjC+TEagtaDp
         sy2M29zCjzZLb2Bj3tOc5NBgZad6K8dV/pGcVRLX+YO+OYb+Od5JyydAWnAZPCXNpdP1
         gLLw==
X-Forwarded-Encrypted: i=1; AHgh+RpfoB7F7zvD2drOdea/XtRPwgITNl8Gy6x6L3ou1FWXsIks92PPXExzSLC+jB6QxQnwm3RaMJtW0XY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIC8YL894OXD7Ym2J2tMKQnb/AUUtNG0qe8FeWOUJ//l8stF4u
	HQNfuE9+BX3fsR0Tn0e5PS1moflYIofeBA/bq56P8HnrDM7r6lZ5He/8JsnRrpqpAw==
X-Gm-Gg: AR+sD13mHM731vOZoXiGGRH5i4gJe0BLgf4DleKqyo4z8rJ2nyjgadjIGIZiYM+by+k
	dqTwYK33I0jlUvWfzrSC/FB4xucWrHQE9GtJKb8Y/vWrEt7ehC7nyr9JpHgSacvA1jPxpPlK43D
	RYG9KCxIyKf+dCZf9VrMuViRYXHiIr6pe/1McAo3JZ3wTZ1StPMOmLYZFB/kYKwlwU1rdXrYH/s
	/b2I/iMMvnaYUFUV0MZjTBAzJwxI+fc6y0HCz5xPc2c+Omu9TmTkLem3FU7rq0Iqq075Gu73vLD
	4VbLtqGAuPNb/ra0luFjjI8Iqxl8oBquaB0C1EOEVAM7YJRELF8TtDAV4IUcjSiLFBQSt9/shXe
	4/GMLF3OnAwmjZIr8jIw5ewO0nhOq0oEczs9ZKBSSy+qgJN0pwtkH/GvWgvCafBlpagtEf+jAxm
	WF95kZSHGL4ryV76x58ueI/ECthlO+21f0gzrfO5VzMyz77BGL8rQBrXXZ9lA=
X-Received: by 2002:a17:90b:2e03:b0:38f:1f8:1fa with SMTP id 98e67ed59e1d1-38f01f802b5mr3474310a91.15.1784882669036;
        Fri, 24 Jul 2026 01:44:29 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:44:28 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v7 05/16] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Fri, 24 Jul 2026 16:43:14 +0800
Message-ID: <20260724084328.3943997-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260724084328.3943997-1-wenst@chromium.org>
References: <20260724084328.3943997-1-wenst@chromium.org>
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

