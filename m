Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B90C428481;
	Wed,  1 Jul 2026 23:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782948961; cv=none; b=I74dXaIYJrtOX+oREBkYVtpspGB8Y9PdesX2BH6LTTjgS/ooKJFAG+KUba5zd0QInu3yd30tD/eA1mdzCtie/DtuTRAXZNuIpqsnkZzs0u7gH4AwHaQZ5Mynfwx6dunF4FpEECvH7w3kqLqrllisAfqtVU4jdpXYjv9MVDLBP2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782948961; c=relaxed/simple;
	bh=ikQQ7R67iWEi0faIcN8A/nmORI4U0ATMeZtF0w69Moc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qhec9fVqCAxie2FtSPOvMpE8hCNDiTl+6MKKFHlylaPuxjWT1GVU5R266OT0r2QhJ7USdf9WpdC359aX213/1qAXKPuFydseC1IVLgP/nX68yVsrjIBq0QONUdlmSiwyIuDh08v7bCv+igU33MmN44LdyC40dCp7KMQua2IDWQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=omod0ca2; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="omod0ca2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948950;
	bh=ikQQ7R67iWEi0faIcN8A/nmORI4U0ATMeZtF0w69Moc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=omod0ca2GYNlxhws/xCOGLMsgbaiqo2FO4zutUtVx9WDIF84f+zj5Qh060prxuIRV
	 e6Gr02DSDAUmAi4B2qKedAt3Bg0zg+Zz6agys0DpOFc9xKjME3C7r1niSkr9FHkE4k
	 YE46JXaZZMiQdfnLC8kHibGW1d75mPFWU9oztHJymvPStWj0tSj7G4bXBiXP98Ow1S
	 Bibwx84wpKfVqf7kFhZapGuZiZuVVdbONQcVhsSz0Zu2HJ4qKrNaBft9QyFqnVR7cK
	 zS96X1POYMwwSUq4lL8wAgxYN5L99q0rKjUDjicdV7w0w5pDMCVZJn+PlRD22p23rQ
	 5gpO7tmQU1gAg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2223C17E35FD;
	Thu,  2 Jul 2026 01:35:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id DAB19480075; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:36:09 +0200
Subject: [PATCH v9 31/38] phy: core: add notifier infrastructure
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-31-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5859;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ikQQ7R67iWEi0faIcN8A/nmORI4U0ATMeZtF0w69Moc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFTlVIUt76H8NwaAq0XfNfnni0dMPMysW
 WSuKJ8hWhF1PIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRUAAoJENju1/PI
 O/qakZoP/2fEIIZzFio+WHZ6QlN2EmWAbYj5L9SJpYGxwFeUgLlR/Bdvp9j6VsEK3+/6uUW0exP
 /EhnD46zOHpgcLdZPJyCNTvv8HD4JTWC6vDTHeJIJNAdRUU+Ug5h7tP3U1Om3WArPzwy9uQ3F7m
 2jdPpp1WbYxgTdCVUCOPJ4iGk/uh+MPGGObHVnrlayaZyTuk7yrrxmSnGiPllDNnNsIJ+xsH/xx
 Va4i5QhYrnJZNL0Ik1DmXAvmSoE9I8MT6MhnWaAiwE95qNrYD7FYOKouwxd/KBxnLcJvT6LTdAK
 woIPDpkBa26WLbKJvN2TRUY7jK9mBMs8Cb+lxnWsZUtugrCNOnBYtb+rTatEOd6s9x/jVj5ZSy2
 WtmKBFK5/6VawPdi2UfUZ361EnqwnNdcTEbpswk7COotQWpytmx3iNEHwFk4wxvCIfX/m0I+hqo
 DvCxdbnrz4ZS5t5gy5vKtOM9NHWbzqOX7mHI509QMNzPM78IoBe0w4ZGRDPkmoYxHONMx/qa+D0
 FDwVnzwWFsTKJAhqyJyRns5NIMoRTBsMbAYcydEkA56ABJhQ72lJIvW3yNdZaTTD6XWbfRzeKLQ
 kAodA+vIzIjIue9XzMGgsYDcKTwcjsq4/nGWZ4kXNMdX/PJ/qUZ63AZo741407rxcOPLrhXeGYb
 PbRhG2pyXEg6yIKI2e54pyQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Some PHY devices with multiple ports (e.g. USB3 and DP) require a reset
if the configuration changes or cable orientation changes. This is a
problem, as the consumer device will run into undefined behavior.

With the new PHY notifier API introduced in this patch, the consumer
driver can hook into reset events coming from a PHY device to handle the
PHY going down gracefully.

Note that this uses -ENOSYS instead of the more sensible -ENOTSUP for
the stub functions when GENERIC_PHY is disabled to stay consistent with
the existing ones.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/phy-core.c  | 57 +++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h | 40 ++++++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 21aaf2f76e53..533473d975d3 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -542,6 +542,62 @@ int phy_notify_state(struct phy *phy, union phy_notify state)
 }
 EXPORT_SYMBOL_GPL(phy_notify_state);
 
+/**
+ * phy_register_notifier() - register a notifier for PHY events
+ * @phy: the phy returned by phy_get()
+ * @nb: notifier block to register
+ *
+ * Allows PHY consumers to receive notifications about PHY reset events.
+ * PHY providers can signal these events using phy_notify_reset().
+ *
+ * Returns: %0 if successful, a negative error code otherwise
+ */
+int phy_register_notifier(struct phy *phy, struct notifier_block *nb)
+{
+	if (!phy)
+		return 0;
+
+	return blocking_notifier_chain_register(&phy->notifier, nb);
+}
+EXPORT_SYMBOL_GPL(phy_register_notifier);
+
+/**
+ * phy_unregister_notifier() - unregister a notifier for PHY events
+ * @phy: the phy returned by phy_get()
+ * @nb: notifier block to unregister
+ *
+ * Returns: %0 if successful, a negative error code otherwise
+ */
+int phy_unregister_notifier(struct phy *phy, struct notifier_block *nb)
+{
+	if (!phy)
+		return 0;
+
+	return blocking_notifier_chain_unregister(&phy->notifier, nb);
+}
+EXPORT_SYMBOL_GPL(phy_unregister_notifier);
+
+/**
+ * phy_notify_reset() - notify consumers of a PHY reset event
+ * @phy: the phy that is being reset
+ * @event: the notification event (PRE_RESET or POST_RESET)
+ *
+ * Called by PHY providers to notify consumers that the PHY is about to
+ * be reset or has completed a reset. This allows consumers to quiesce
+ * hardware before the PHY becomes unavailable.
+ *
+ * Returns: %0 if successful or no notifiers registered, a negative error
+ * code if a notifier returns an error (for PRE_RESET only)
+ */
+int phy_notify_reset(struct phy *phy, enum phy_notification event)
+{
+	if (!phy)
+		return 0;
+
+	return blocking_notifier_call_chain(&phy->notifier, event, phy);
+}
+EXPORT_SYMBOL_GPL(phy_notify_reset);
+
 /**
  * phy_configure() - Changes the phy parameters
  * @phy: the phy returned by phy_get()
@@ -1018,6 +1074,7 @@ struct phy *phy_create(struct device *dev, struct device_node *node,
 	device_initialize(&phy->dev);
 	lockdep_register_key(&phy->lockdep_key);
 	mutex_init_with_key(&phy->mutex, &phy->lockdep_key);
+	BLOCKING_INIT_NOTIFIER_HEAD(&phy->notifier);
 
 	phy->dev.class = &phy_class;
 	phy->dev.parent = dev;
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index ea47975e288a..3779a4d0a02c 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -11,6 +11,7 @@
 #define __DRIVERS_PHY_H
 
 #include <linux/err.h>
+#include <linux/notifier.h>
 #include <linux/of.h>
 #include <linux/device.h>
 #include <linux/pm_runtime.h>
@@ -53,6 +54,16 @@ enum phy_media {
 	PHY_MEDIA_DAC,
 };
 
+/**
+ * enum phy_notification - PHY notification events
+ * @PHY_NOTIFY_PRE_RESET: PHY is about to be reset, consumers should quiesce
+ * @PHY_NOTIFY_POST_RESET: PHY reset is complete, consumers may resume
+ */
+enum phy_notification {
+	PHY_NOTIFY_PRE_RESET,
+	PHY_NOTIFY_POST_RESET,
+};
+
 enum phy_ufs_state {
 	PHY_UFS_HIBERN8_ENTER,
 	PHY_UFS_HIBERN8_EXIT,
@@ -170,6 +181,7 @@ struct phy_attrs {
  * @power_count: used to protect when the PHY is used by multiple consumers
  * @attrs: used to specify PHY specific attributes
  * @pwr: power regulator associated with the phy
+ * @notifier: notifier head for PHY reset events
  * @debugfs: debugfs directory
  */
 struct phy {
@@ -182,6 +194,7 @@ struct phy {
 	int			power_count;
 	struct phy_attrs	attrs;
 	struct regulator	*pwr;
+	struct blocking_notifier_head notifier;
 	struct dentry		*debugfs;
 };
 
@@ -267,6 +280,9 @@ int phy_calibrate(struct phy *phy);
 int phy_notify_connect(struct phy *phy, int port);
 int phy_notify_disconnect(struct phy *phy, int port);
 int phy_notify_state(struct phy *phy, union phy_notify state);
+int phy_register_notifier(struct phy *phy, struct notifier_block *nb);
+int phy_unregister_notifier(struct phy *phy, struct notifier_block *nb);
+int phy_notify_reset(struct phy *phy, enum phy_notification event);
 static inline int phy_get_bus_width(struct phy *phy)
 {
 	return phy->attrs.bus_width;
@@ -428,6 +444,30 @@ static inline int phy_notify_state(struct phy *phy, union phy_notify state)
 	return -ENOSYS;
 }
 
+static inline int phy_register_notifier(struct phy *phy,
+					struct notifier_block *nb)
+{
+	if (!phy)
+		return 0;
+	return -ENOSYS;
+}
+
+static inline int phy_unregister_notifier(struct phy *phy,
+					  struct notifier_block *nb)
+{
+	if (!phy)
+		return 0;
+	return -ENOSYS;
+}
+
+static inline int phy_notify_reset(struct phy *phy,
+				   enum phy_notification event)
+{
+	if (!phy)
+		return 0;
+	return -ENOSYS;
+}
+
 static inline int phy_configure(struct phy *phy,
 				union phy_configure_opts *opts)
 {

-- 
2.53.0

