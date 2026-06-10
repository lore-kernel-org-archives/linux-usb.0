Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654BA3B7B64
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 08:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080899; cv=none; b=UyTzX92mHB7tYKrgqPEUnVDwTA03EZhUxyphfJTHIxMhm1lmJEnqshiYUlwfWO7EOrkz6d56v56jqkOwsBENEBlEXM0eekiesGIyMGkPE0+0MEmw+Tuz/d8TkYZ93krlBgZyv2hPmfLDlOATPxbQPWxbGVhRolrMUdWAWsIyuNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080899; c=relaxed/simple;
	bh=dvbeJqgKk8hUMtZra0MzuL9+2wvRJGQPlU81QUpycmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WQF0zm/w/NjgQzfO6UpvMxJvEOxrHy7ARd6wW0YsFWiaRPfA9YcuMnVofPlQUADK7lb+Gw+OgrMI/HrAtr8VQSp2p1cFKehiu9AX9EbJe2Ckjgg57mvtCkTzpjlWRK9wHjbYVPo8cO24bqmF3/ypB/9wBUdIkBPatCvXoIsVcdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gbCpAOZa; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gbCpAOZa"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2bf114b0cf9so59288245ad.2
        for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 01:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080897; x=1781685697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYYX9NwLUP4rFqvakVHrp1Kb1i3tLTyqtPoxV/1lOfk=;
        b=gbCpAOZafVE1nUDkx9SBxpXTSKWMK82rT6v0O4aMSDK/X8AYw8G7b/nccSXabAwHQM
         egzySzhhb2E01MkyANJm3Qqmkk2jxMTx0Vj4kWFtmK1pCGJM6fxNaufCfyZetOo3MzB2
         NgGL21H9wSden0o3JGVHmDG955Apr3VE+qQ8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080897; x=1781685697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BYYX9NwLUP4rFqvakVHrp1Kb1i3tLTyqtPoxV/1lOfk=;
        b=fZTPhV+HaprPeRL2Howezlmx1doLBgEDwtdTc7T9RCb3Atn4zwmIjuTWp08UYw2zfl
         /f7769daePhVpbLzVBmOYbpfT8Wy8iLwdH2WfG2h62X28KrVJWYWMrW5jBh4EeuPRPh7
         Xu7Az/CCoEwBj1rjeetS6lP3bTnfJ1NegZ6YyFmwpGWEh/vKg0Vl3P2Lk8AMiEpq9Bgd
         5e62hvonE7mSPjMf9+vgxnM2X6+F5+nNBbeq3Iz7ckETduDOzi7nni2yjnfZdhCXMyQ2
         85W2TEya63MjvkduhEhnkSG0l81+5tnQMJ+PcLtfGNzXvYi+FN2Pp2LozZarz3kahYaB
         DNsw==
X-Forwarded-Encrypted: i=1; AFNElJ94GHSw2xQ8+3luCEPgRWeWNWGKR2zzeLm4+NYI4Sy0VyBhRN4k/K75mO9THzIPDQP7KMSDFG5DAb8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAbkBY3Is2sNAaie8aEc8PGnqVVTzSGv1xZ2HagNZMYz9H/ni/
	upyFKrA1azainQJ1N+lwLWGhooCgIV9SnTdPBCrh3UjdwrcZj+naUeZUvQN3NHdVlA==
X-Gm-Gg: Acq92OFUKSOVUGRiSqyjq9dtvlEz+Xy7UDktis5kBOQfcyz8NPPuxq65f0ufItGgadf
	jfC/bktx4Rrq3bDGF1OnkkqRs5kfjssrYIWO+0OS5D2/pb9guX9FkJvUMpSHyJVnrr1z3LYdxAd
	tV2m8vhJyVQ8JAsMCa7QZrfEPzvv8IqzIrcSpYO2f+nNh94iQLo9N4hWIMC06X2ZMjzyZCy1ce3
	17pR81h158mYqSd1JSthJjN3edpsg3Nndg3F9eknCTAtI9JppQCDG9jsV5pWUbmk6neZZA5qGgK
	TbRxw29hCfBkZ9wF/QMIUsa6vpL4u7fVuS+mvuqmLX9ACoLjMKH6fBeiWgLmsUQVyY1+MhpHOC/
	jl3ukQZomqs2d/fWuq8KRNj9EeEyBShClDDsPYI1d/pB3fK54IXU+21GT4mPPtmZwX4gNRMj4IQ
	Qf1DaRG2F8xLbwaorhfCxcDA+aaAVj8ZsEaaF7+wh1eWLrsintu/0DMKfVnB8q+tDI9aOGfFxdg
	d51+trbeHKmXjduhQ==
X-Received: by 2002:a17:903:1205:b0:2c0:e5ee:f55e with SMTP id d9443c01a7336-2c1e80f9b57mr283573295ad.7.1781080896672;
        Wed, 10 Jun 2026 01:41:36 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:41:36 -0700 (PDT)
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
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v2 04/16] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Wed, 10 Jun 2026 16:40:38 +0800
Message-ID: <20260610084053.2059858-5-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
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

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Moved "int ret" declaration in hub_configure() over here from the next
  patch
---
 drivers/usb/core/hub.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 13264e86bc6d..985551d013b2 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1874,6 +1874,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	struct usb_host_interface *desc;
 	struct usb_device *hdev;
 	struct usb_hub *hub;
+	int ret;
 
 	desc = intf->cur_altsetting;
 	hdev = interface_to_usbdev(intf);
@@ -2005,14 +2006,15 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		usb_set_interface(hdev, 0, 0);
 	}
 
-	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0) {
+	ret = hub_configure(hub, &desc->endpoint[0].desc);
+	if (ret >= 0) {
 		onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
 
 		return 0;
 	}
 
 	hub_disconnect(intf);
-	return -ENODEV;
+	return ret;
 }
 
 static int
-- 
2.54.0.1099.g489fc7bff1-goog

