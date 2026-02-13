Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9973280014;
	Fri, 13 Feb 2026 19:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771010614; cv=none; b=cWPgrtIaseVIOQzDpTlpa7LE903epBIOIU6yGm9K9q+PYJA4eisgtyqy6NN2xKRN2iggk4f208gq6Hx+AS+S3CTWUIe9giMt9v92MJQbVBtkicKtStW2PLFCDSK2nqC3XFCWsgw8BkUBQBV4J/EFs959+QLDzxXwmFbgpr0iqck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771010614; c=relaxed/simple;
	bh=lrQE9yMTiCZJMvErc9Qumch/oyi82L9FeVKRfh89GgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GEuwTskuGVQ1mMHLlA4Od+c7fFwEfbFapf7t1GJ+t/0f3juTNGzxRd5ZJpw4Ohbdf13DQ2nkKISQQGXl37yhm6vbW5X3uZWA6WiJWD9X9wLcVevO2VNXLI91w5/ztuVM/A0h/MLXzfuwBDcAEpSPZ/scKnZ4wMMoHqyQcpU8M1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VWdYdc6j; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VWdYdc6j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771010610;
	bh=lrQE9yMTiCZJMvErc9Qumch/oyi82L9FeVKRfh89GgM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VWdYdc6jfF1afbkLFPRUALMAktACqGzcst4rtJHyo1vA+NCuiqHz8qKniPLwvyZIE
	 yvAjLe1h1XF4ciK+lGw4jN/NXW4aDKYx9jHVpBc/7TnQp1Gbx3/v1c9JDyYNn/TmGa
	 v3ITujqozNY+onXRFCAZQrTBvuFL3UkbRMJBh4hoZmCmDrkpUsUjxRVDtLSibioMLf
	 eYnA3VzyMb/3pwvqvaAwzWt7rydI+04hpqKZ+wbSwA1RB7KRedQgZ+/OStSfCTggW+
	 lQR53VyQ/xcs1fDVAV/0Xa4Tfpu10fyjEpQo3JMgGloS3JlXD7keHbzSLxRONhu6mx
	 luK78e5TWafJA==
Received: from jupiter.universe (dyndsl-091-248-188-214.ewe-ip-backbone.de [91.248.188.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3ACAD17E1352;
	Fri, 13 Feb 2026 20:23:30 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D0387480023; Fri, 13 Feb 2026 20:23:29 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 13 Feb 2026 20:23:28 +0100
Subject: [PATCH 1/2] usb: typec: mux: avoid duplicated orientation switches
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-typec-mux-duplication-fix-v1-1-70076a7c5691@collabora.com>
References: <20260213-typec-mux-duplication-fix-v1-0-70076a7c5691@collabora.com>
In-Reply-To: <20260213-typec-mux-duplication-fix-v1-0-70076a7c5691@collabora.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1450;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=lrQE9yMTiCZJMvErc9Qumch/oyi82L9FeVKRfh89GgM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmPejGtfmdy8ijV3DWGAAoO4KHY/762ZVR8W
 iIqFDnF9Aovt4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpj3oxAAoJENju1/PI
 O/qaQbMQAIZFL4Lnr6H6UO66I2PbRZ8aS0XnmqkyXJsTZ+BhoISC98HMSd5tzb0bqbdBlMlzgzX
 wljqeozzBSdveosjo8jH/vWjzhKcxi69fabR42WwKo9ju23qJ1UtzztBmXJksJ7/CbnF/bLUT2U
 Q+fb1HDJLo6NoxLKfHgbM/f7T5eUnbzLJAFRbp34UEwibBGxlsCw9IdhxZhaDSTYueDhZltimzq
 4jQTqYQD2GWhsMc3/UH17pk/ped+P0ZyJQhUcQO1FKFPr4Vpy1rpR2Wn1ZVJ8z3g2e7balzY6Qq
 60v1Qmp1VLmImX4khpgmCgDd+aQf335l/WX+tBIhKgvtEf7YZUyjvsYIZx3KdZEcAZIRYZTpdB+
 lXZKDqlFhCa0We8RPPiOV51WkcccxsxAxd8Wyy6lPzGpPaJOv+av9SlrZi8MrwJYtFC+tG/dIXx
 5CyqZ2J+UzP64rgJzUC8+4nh9gtJw20nvOqrp+9tkyNLMa0cPoJ7j7X+6yDNn1nLfTOQRKWcNlh
 v/0cWQxHKgi2RqfdWd6t4VHGrfyFdT/JjRWu6BUWI73smh3csCuCl+Y41hfXctQFQ6AUm0luH/U
 dEs5AEfIdoBYQ6G99HB+Ye0pbARXcRrznPVH6f/6NQbAExtZ73tpCq/UOCPmohjO9K25RqKAq4p
 aRXTogUDIhbXNxXuv0FoyWg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Some devices use combo PHYs (i.e. USB3 + DisplayPort), which also
handle the orientation mux. These PHYs are referenced twice from
the USB-C connector (USB super-speed lines and SBU/AUX lines)
resulting in the switch being configured twice. Avoid this by
dropping duplicates.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/typec/mux.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index 182c902c42f6..db35b7398343 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -72,9 +72,9 @@ struct typec_switch *fwnode_typec_switch_get(struct fwnode_handle *fwnode)
 {
 	struct typec_switch_dev *sw_devs[TYPEC_MUX_MAX_DEVS];
 	struct typec_switch *sw;
+	int i, j, k;
 	int count;
 	int err;
-	int i;
 
 	sw = kzalloc(sizeof(*sw), GFP_KERNEL);
 	if (!sw)
@@ -96,6 +96,18 @@ struct typec_switch *fwnode_typec_switch_get(struct fwnode_handle *fwnode)
 		}
 	}
 
+	/* eliminate duplicates */
+	for (i = 0; i < count; i++) {
+		for (j = i + 1; j < count; j++) {
+			if (sw_devs[j] == sw_devs[i]) {
+				put_device(&sw_devs[j]->dev);
+				for (k = j; k < count; k++)
+					sw_devs[k] = sw_devs[k+1];
+				count--;
+			}
+		}
+	}
+
 	for (i = 0; i < count; i++) {
 		WARN_ON(!try_module_get(sw_devs[i]->dev.parent->driver->owner));
 		sw->sw_devs[i] = sw_devs[i];

-- 
2.51.0

