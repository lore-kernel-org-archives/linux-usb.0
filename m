Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB0C2931DA;
	Tue, 14 Jul 2026 19:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057729; cv=none; b=seRxhHPtDvCXxc+yoNnYew6hUTWY8orPauIy0qfcFuR4XzG3qwdbXbaaIalJYxMamXbye6oliNDTJkvcWfTprPmYBW2V9NEjritbkhFkc0Ys5qsz9asgiqMPuichfkgtrAVpqowe50eIf7dHNYuvpx166pL/Ba2e6H6WeTu68+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057729; c=relaxed/simple;
	bh=sykfJDcEh0P0sU0/0Mx5RGtaMEmg4itoA8UTsTqvby0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ikHuzOywVrKdQ5MHRyCAbPkAUOm1lP3Vc3VG8vnIpStMmM4C4eJDAWrBROxz6j/eKt0l4nJlHuTuHbXFJvjtRjO/GTXh6Ks2BV/7dbKw13id+X7Mo/nE+EoedJI9t6aJ1NR9N9RTRwcGedjKBT5cfsEKFfMrQGUT6znLGyjd+zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jRDJTfhK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jRDJTfhK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057726;
	bh=sykfJDcEh0P0sU0/0Mx5RGtaMEmg4itoA8UTsTqvby0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jRDJTfhK+6QPYMg1L9pxv4z1daQvN2QQFwMaqsWsKC78WwXHTvEgq1WawZR3zRGoc
	 EiihOgIgo/Jeu5mTN8sHQRHbKJa5ZoVdaCy3r1pG0UCBoxNaaTKke2F9fbcS6p1vHQ
	 w9a7w81h/v8dxRgZacvVkIniPwwV9UNmCSGAHK3u4mtSoKM/OVaMbAdJwMtGjmBL4p
	 mifZGVG2P1ehRW9MwhXIpw5pveH3JKQHwIp6Wjp71fD4yb1w2m8qZcwDTVdKllyrub
	 A9e3q1SRk+kUCM0BTAslz3M2gmT77I3rKLxPk2TuWZq9htBVb0FGuZkEqRODUfiCKT
	 pN310zq1qQEBA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D29CE17E0E1C;
	Tue, 14 Jul 2026 21:35:25 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 04B8C48006F; Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:29 +0200
Subject: [PATCH v13 28/35] phy: core: add notifier infrastructure
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-28-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6202;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=sykfJDcEh0P0sU0/0Mx5RGtaMEmg4itoA8UTsTqvby0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjVBkgJl2ck1HXRcrKKhMUm/3mP++3YsYi
 n8Z6b3pV9PER4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1QAAoJENju1/PI
 O/qamc0QAIRxSM2B8YiSBj+Ft7JHB/qltvuud6yJbT0Qrqs1JV3Ae/Sr7WpkwgslPgbLx9qnUqS
 zaRN1Ca+VrlrB8BcxzVU2Aoym4WjSiETgSNfsQyFZzrvSiEIEwnZtIbvJHvqxmy2j/L6PP83bZ1
 qHZ+3Ah6QZytFucXknrOQJyGsQYB6JFRWgd+iRDjpBJUl6WvTenydPf/CY0TsulEb185Kf9PgyX
 RA3PuTyb70iCjCmsD0tTiD8M+gQvafeutCkjYGRniQMAgB+hvB8mgXsgiBDHvYYKvPfBns8BhUQ
 0wJLuPHr4GwE99+FYJDjSww5IqypCl2PPb74LfTunaQY1as2GWDaz1lThyRKKE4VyK6O6s9Be/C
 Wu2r8Pp89fdfiaphtuwfk8sw7zNL2CT1K2m+2eYPJKM8FKOlgBwYXI73yP5K1+TGq4CZvW+iGPl
 ylcN1ULATNDMOLt369wDJX7Zq0/Z/jvRbQMfze3bvpQaiyWRFwAAVT+WSoU+zyyozrRvjEwFGrw
 /3wJCoUR7QpWoiTJ8ZrGPGkOzQkGAtFrdcGZE+T2K5ZV0e0QBTfrr2RbgnUOZVtQt4RRP7lvM6W
 30tjqD015SFWoC/7vj/LIKin5Smp8W+R6QjSqDrIqXbWebWpCnEy9uuXO4KROMMkRybj7ZV31pU
 rMH8pOs5Sg9vMUCfVl5EzBA==
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
 drivers/phy/phy-core.c  | 65 +++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h | 40 ++++++++++++++++++++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 21aaf2f76e53..51d261daae7a 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -542,6 +542,70 @@ int phy_notify_state(struct phy *phy, union phy_notify state)
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
+ * This may be called from within PHY provider callbacks (e.g. set_mode,
+ * power_on) where phy->mutex is held. Consumer notification handlers must
+ * therefore NOT call back into the PHY framework (e.g. phy_power_off,
+ * phy_exit) on the same PHY, as this would result in a deadlock.
+ *
+ * Returns: %0 if successful or no notifiers registered, a negative error
+ * code if a notifier returns an error (for PRE_RESET only)
+ */
+int phy_notify_reset(struct phy *phy, enum phy_notification event)
+{
+	int ret;
+
+	if (!phy)
+		return 0;
+
+	ret = blocking_notifier_call_chain(&phy->notifier, event, phy);
+	return notifier_to_errno(ret);
+}
+EXPORT_SYMBOL_GPL(phy_notify_reset);
+
 /**
  * phy_configure() - Changes the phy parameters
  * @phy: the phy returned by phy_get()
@@ -1018,6 +1082,7 @@ struct phy *phy_create(struct device *dev, struct device_node *node,
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

