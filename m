Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E91643B3E5;
	Thu, 13 Aug 2026 20:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654328; cv=none; b=McW+co0pDRH6ST7d324fUKxMlUeCijXwplB11YTo08Lj1lC1MHNmG5fjXw/9olza9uXqf4qSv1ggDNv9NUtJ+LSBt3+EKObb6U6p8sqdSEO6S7h5FDBvPv73J6Nd1NxgGI+7kv4wSWefhPkoev4DtNUiVktSYQ7jel/6l32qN4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654328; c=relaxed/simple;
	bh=sykfJDcEh0P0sU0/0Mx5RGtaMEmg4itoA8UTsTqvby0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ls8W+BQgF21hfiOqFl8rLRDzv+2j24GYTkK2snWmDY2HSMydExQgC3R6VVFUl/kLZIlQREyEy6a1WYa77YUPuHOw1CikJsKdFZ7aKSvn+m885rAYCY6T3wZdQp9wIvndfIXHLnOuXMUqnrSb3uXQd208VI27nD6BVbx2dydntJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=l634mdIM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="l634mdIM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654311;
	bh=sykfJDcEh0P0sU0/0Mx5RGtaMEmg4itoA8UTsTqvby0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l634mdIMcYJCngBcbjpYwt/w1QdiNhJlAcWyvIjW7oE9FdJLdPoV0J4Z1UK+GDHMH
	 xvLFIOC97u/FkEJLxeZ+O4WSioF2P+OV4EvfbbHDcidcHI0wlS8rAYiqu5vpB9OCZC
	 CYiqFLAgu0OsuADnEVziRStfMisbGVWzND/9iMtxRquAGazHpLyhRw6ctSSe+mzHny
	 3ctUX6yItq7bJBBT7m33zclXSBhqBEkdFC4akQ3IZCdPp3PRZTfwL78WKm5mj+1AR9
	 vpZny1Fh+mjkxNFMjH8uTmcErv1zw/9geS+WpsyrRymoPINMaLSS49klNvzoniBOJ3
	 hBeqkEt8g/JNQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DAEB717E1550;
	Thu, 13 Aug 2026 22:51:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C007148006F; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:52:11 +0200
Subject: [PATCH v14 28/38] phy: core: add notifier infrastructure
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-28-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6202;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=sykfJDcEh0P0sU0/0Mx5RGtaMEmg4itoA8UTsTqvby0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmX4ptTscnNCEw3YsyR5jwJkQcbSamTqk
 Q3X3YzKA+unxIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5lAAoJENju1/PI
 O/qaEbYP/2w8fqfEhWyukOWtdq7YA6lyYEL/cIMxJDzVP4THnwdSQmaEYFHJp9eQOWe8tKBJ9pR
 7b7EYSfQjKvLuFg7fGqxDn17R8ofvVjAHwfSCrudZPbljTjSvpTMORdeNveHeokj5O9WhBD9GLN
 IEDWC04idTcYck/xBxMWn0W/8460AunNhtUcvT4nVpJ7V6yxjhq9HZhBszEiV4PL7iPJWXaGbcx
 wCsXeT4o/tA5oQquxcqNxAkvOZPxfb2T5hl27TLbQFqwpSZsm/mkBG9HffR2y1D9vQIoL6REs01
 u/tGDnpic0I7DIg91hiLRSxAmrRk2vFTm1NS9dyKwPBj7+3tSR9MH9/Uub/U1+R8Tw19/yRLzYf
 Qc7+/bBSJEzuji/qOKXszkDCYy0v5k+djG9OSZlVRNAm1s7ZE7zbSOtK+VwQb9iiIxdmpkLxvSc
 uaUYvcZ4cNMiG9axWaY4cnu9nuHAIU+O5ljkadgxW2Gn7lKNxrlmQ+RuiMq6D1uET0ajxWef+d4
 FiWZHM+o0+qKvWTTi34bMV+LzGkMSN5B5sdhLmbmppZrGTcrBfcGpdqX6bvt+gdFSILPkANy/UT
 rpGLdrhH6G24eekudWOr6p63Qg+srWQqqHyzr+D8pTkb0ZNNkBW4gYJBCz+yDJWIOa0Jvxebbxi
 oes8ZwMpcotinRd8HQ3kzWg==
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

