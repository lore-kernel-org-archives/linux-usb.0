Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FDE3EEAC1
	for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 08:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784882687; cv=none; b=BJPdqVvvkM2Q4VKbxdhnHgowbyO9tXCT4p1esdXD7rmIFKKy8Q5WsF1/or+Golde6sCkADpE55tIyiS3CBM3cS3/5PYY/8v8D0rc2d/8Ac8ZXGCMeAxsJa5r/zNm1fZFJFhk3bgtf9de9L6vvuRYB9tUL/zTiNzDegExaeTTqD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784882687; c=relaxed/simple;
	bh=uMqpD/0Y+buNT85mCET4vOpwigIs8u3oS1rlx2XlGCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=txFA7aa4iyWRnL15uKOS/s+N/y0AAhxqLf+Cd23YLaGKcSKN25urgZ0jb3PDaAVZZnIoeqaEvJmKL17qFSIJhy9HJu/hSILrV0ZhJZMGmemANsDnLQPRY146EpgWEBeO1mJQLC5cegryQLbZbR19maBls/Us9E0mHBqQDc7frb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MUjExbfS; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MUjExbfS"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so94642a91.1
        for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 01:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882685; x=1785487485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rURTZ+6KnrNnBGX3zC7u+30dtH0N63AaHeGxXuU8P7M=;
        b=MUjExbfSO7SZodhAHF9gY3skiCAFof7vEKleYWiDCa5SSvQFp20A7zQSIXBxnFUIGb
         //zA8t+Pkm98z45tC10CocXtFwrx7VSlUfCAO0jnia6h65j4AZb3eBCSCxgN5ji0kgoU
         IkblWSiFyqjy6+eq+4a/TmmKtiRB/K7bdN9m8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882685; x=1785487485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rURTZ+6KnrNnBGX3zC7u+30dtH0N63AaHeGxXuU8P7M=;
        b=ENN0/Hb5u+UoQhhLWPHnudS2MJt46fkIVOXo4z6Dj/6UTLnw2hMty5EGME39ERXk/s
         pfz0rCVSHF04T9z0T52CHO6zT+S5mNEYrsslnRbwEg33QO35M/7d8H5c8XTCBXOXh0on
         19vLT7JEqb6VbFFul2VbKcFc2OMA+5iEOIVYkmsBbZt5QCJAUGf+4vsXuHUE0FubKHvn
         7hD4pWpVRR8qK7IA6gfkdzgdm/wjHEgwn/GKFZ5sfcBYbE8eR8O85V/h6YTwCqyH4kWS
         YQH6CsH02k7P3H45hli3IK45PFnnA/63A1FrwsOqmoSSLeVQZVHfsXOkVNofwONyd8+l
         uMZA==
X-Forwarded-Encrypted: i=1; AHgh+RoniE/50jTQnxQ+EjIMMrRMrJhLbjTOV1iua21MrQeOEWtl6nPe2Kx4XkYTwrUFhI4mo9S4WurwRig=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKguuGpwnhQYaEEMchBSpCW6l13Bp0MOIsC49fhX83j58ToISl
	q7E2MZwWvHSjNUVz7r8Vkp86ewjntXwu/ufXDO+u3HWbqV28Yq44QJnQpEilGQhhHQ==
X-Gm-Gg: AR+sD11T2UGvrQMx/8IAqm5/2GKRfB+ioEUbS+W/ikwECyfZgsfOFxEAg8BwdlCe8e6
	5ZpBAC01GabwzSf7QChfOVhjrLYnlkZayIMtQ5mzA0nX6lSaIfNPXG35IHfc0bdo7ZIAeNxRUP1
	+1ZYeo3u3Ek1+s6TBVCH4irO+9UgedDk3rjwPQQEGgP3AzlbFqF+lqAh9naOCWMBqn7Auq+RvsG
	6xGL2ecAnzPXjklCAmUi+scddNJ0tFXN3ksmbKSp1p5WFjYbPV/XIKlp8hUMpXC1EgjHtBXqbxJ
	Vo7hIp3PQyiAedXQ5W6wjFNUqQG4D2bwcof87v8fyV5ELT0QN8IgiXZ3wh/MJv74bwGMztiF1UT
	gAUk2nKOGyL3dnZcK3djR4eHbfz105vd8GbEHn3Zdp3GrwxVTeWwcLm9F8xe28JCbab8xPk+zmR
	QfqPryBHtYiF9P76QOQJlHlwxIO6F0L/yWTGaWmrtGJ4NW3q8gynEo2PDhEPo=
X-Received: by 2002:a17:90b:1c01:b0:38e:6ba9:5203 with SMTP id 98e67ed59e1d1-38ec658e6bcmr6608480a91.22.1784882685067;
        Fri, 24 Jul 2026 01:44:45 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:44:44 -0700 (PDT)
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
Subject: [PATCH v7 08/16] usb: hub: Pass |struct usb_port*| to usb_port_is_power_on()
Date: Fri, 24 Jul 2026 16:43:17 +0800
Message-ID: <20260724084328.3943997-9-wenst@chromium.org>
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

usb_port_is_power_on() currently takes |struct usb_hub*|, but only needs
it to tell if the hub/port is SuperSpeed or not.

In a subsequent change, usb_port_is_power_on() needs access to a pwrseq
state tracking field in |struct usb_port|. Either structure can be used
to identify whether a port/hub is SuperSpeed or not, as the field in
|struct usb_port| is inherited from the hub:

    port->is_superspeed = hub_is_superspeed(hub)

Replace usb_port_is_power_on()'s |struct usb_hub*| parameter with
|struct usb_port*| so a subsequent change can use it.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v3:
- Adapted to move of usb_port_is_power_on() to port.c and port.h
---
 drivers/usb/core/hub.c  | 7 ++++---
 drivers/usb/core/port.c | 6 +++---
 drivers/usb/core/port.h | 4 +---
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index a6c4e4c0368a..6671b5e45191 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -3291,7 +3291,7 @@ static int check_port_resume_type(struct usb_device *udev,
 	}
 	/* Is the device still present? */
 	else if (status || port_is_suspended(hub, portstatus) ||
-			!usb_port_is_power_on(hub, portstatus)) {
+			!usb_port_is_power_on(port_dev, portstatus)) {
 		if (status >= 0)
 			status = -ENODEV;
 	} else if (!(portstatus & USB_PORT_STAT_CONNECTION)) {
@@ -3733,12 +3733,13 @@ static int wait_for_connected(struct usb_device *udev,
 		struct usb_hub *hub, int port1,
 		u16 *portchange, u16 *portstatus)
 {
+	struct usb_port *port_dev = hub->ports[port1 - 1];
 	int status = 0, delay_ms = 0;
 
 	while (delay_ms < 2000) {
 		if (status || *portstatus & USB_PORT_STAT_CONNECTION)
 			break;
-		if (!usb_port_is_power_on(hub, *portstatus)) {
+		if (!usb_port_is_power_on(port_dev, *portstatus)) {
 			status = -ENODEV;
 			break;
 		}
@@ -5434,7 +5435,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		 * but only if the port isn't owned by someone else.
 		 */
 		if (hub_is_port_power_switchable(hub)
-				&& !usb_port_is_power_on(hub, portstatus)
+				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
 			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
 
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b2e953f137f8..8d686d43e996 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -23,11 +23,11 @@ static int usb_port_block_power_off;
 static const struct attribute_group *port_dev_group[];
 
 /* Check if a port is power on */
-int usb_port_is_power_on(struct usb_hub *hub, unsigned int portstatus)
+int usb_port_is_power_on(struct usb_port *port, unsigned int portstatus)
 {
 	int ret = 0;
 
-	if (hub_is_superspeed(hub->hdev)) {
+	if (port->is_superspeed) {
 		if (portstatus & USB_SS_PORT_STAT_POWER)
 			ret = 1;
 	} else {
@@ -114,7 +114,7 @@ static ssize_t disable_show(struct device *dev,
 	}
 
 	usb_hub_port_status(hub, port1, &portstatus, &unused);
-	disabled = !usb_port_is_power_on(hub, portstatus);
+	disabled = !usb_port_is_power_on(port_dev, portstatus);
 
  out_hdev_lock:
 	usb_unlock_device(hdev);
diff --git a/drivers/usb/core/port.h b/drivers/usb/core/port.h
index 00f7500af336..2f4349b3ce6b 100644
--- a/drivers/usb/core/port.h
+++ b/drivers/usb/core/port.h
@@ -63,6 +63,4 @@ struct usb_port {
 #define to_usb_port(_dev) \
 	container_of(_dev, struct usb_port, dev)
 
-struct usb_hub;
-
-int usb_port_is_power_on(struct usb_hub *hub, unsigned int portstatus);
+int usb_port_is_power_on(struct usb_port *port, unsigned int portstatus);
-- 
2.55.0.229.g6434b31f56-goog

