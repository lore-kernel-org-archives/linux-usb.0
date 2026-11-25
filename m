Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795650522;
	b=QMx1sFohoVvtqUstf9/n5j7XLock0p683seZUhDsjJqZ6f9RqQ9b7jmM/Tbg5urEw148
	 pOhAh+wK3YHEqXV9D+TJc0mXMNbnDFxG7q0lxvwTMSLWAv8AWrEa2t5msG6RT5jKGWEqB
	 7VknpbmYraj14xGWMSEctC1+ss5pwYguUIFC+eT8w2/ROqCHDploJqJC/6aArz6B8DeSc
	 I7wQoCxy6zrfHw367UUFdht3LCZgAjBTvlRadmqIkwvHnJrjm9ZdjLiwGGwUVt2uCDoJQ
	 G/UFMh+gJocahQ0gPEwEGWmXL+U1QC5h5Nst3VMy8VAE/IChj6eW0nDrzgaYQ2ffAAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795650522;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=YN9b4r1l2WEcKPPzcib2/w/o7uMJblItRnA3t+GlaQM=;
	b=IxHwf3NGwz9n01YpQ97J89FWj9etfIV3Zu6lnPVKz8MOiTVzJf6boXr2f9cbgEl8aZ0x
	 Q+O7XpD4qI4L2CWy/4dop9LcG18/p9exAZ00isApVbs0bnxr8bjVMiftWOJ4SUjbmjHe7
	 3Rm09A87a29+gAJXarwRpYUKjaH9rHhdgH2Pd7OSWotCpdIf3nUkpy4lbO79ZW6K9x0qa
	 6pFZKUTUCz7wY/mpf7Pwo95ArisxFQwck96DQn9BEVZi95FW+TWD0+Rs0mTdH8otMEOlO
	 oUKE0hV2pp2QTuiqZ2j58+xme8EJaezA+MrhdRizQfIWQrhise+KE7gLgFW9HU/FB9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cjwpFuiO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13F7606A321;
	Wed, 25 Nov 2026 23:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cjwpFuiO
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795650521;
	b=GkkbpHugocfhM5oeRggNJJlGSUuGYGTiYrHFNYe9sEhAdg44/WxDAxW/8svRCcVXO6CK
	 Y+VyDt9NUfLN4MAp2s48gfDv4PdJtJC/6UFDbjiYPOrfxiUi029NVTiULK1ypzlHpYUYA
	 THoTTnYpf6jMCIizT34sUWKwUpTV5m3kfoXmDi61dZxZzIGDmmZw84etnjk+/1Nzy9Vx3
	 fITzzJNDZWrnWFOIz8LsCDMJ/APEkPYXR8GKHUQtWGekcCnwRtcFqSQHVsexcBCuG/hZ2
	 jjbZ6rc3erHx0sgkVzkp6oYswxmtvgkBClsoq+q+ZoBzRaMEnYwyd4aLXDF7NYSd47A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795650521;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=YN9b4r1l2WEcKPPzcib2/w/o7uMJblItRnA3t+GlaQM=;
	b=cSOO25PCa0QjC+qJRSUmXWEYmBhCKykPXQJCKlDf2gp36CKUxmvHtuhvwmMpMSSEtG0l
	 laJ/WZniAZRDcKnRuyh/96VScKyyIkdNebG4nydjFWxctBqPO4rkD8rWEl5r9e/icjhSp
	 tHiQiPR4tI9e2LwzFIFN+Tjh3u8Eaw+bIk+ZjQgh3O1753RXpNtv6doSgI0ToW1YFbjnA
	 UyJpLPmLW6b3kr66hsalXj7vNHbpBfBARn+C7kjkJp6rEb7RcSLK11J2DKC9c1oz+gY0S
	 +d29425/4qvxPCnPX3cvblG9c4ZkYA32ocUcaPuEJ3xgr6Q4iSXEpQa743F9YH0Mi1Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B8F411F000E1;
	Wed, 25 Nov 2026 23:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795650521;
	bh=YN9b4r1l2WEcKPPzcib2/w/o7uMJblItRnA3t+GlaQM=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=cjwpFuiODqQ3+ukuHC9ueSajrLexd0a4k35PcIRpwCt0KLbneSft3q6JWGeLRvlS9
	 A4Mh+Pw2+P0cZ1LZi29HA1plObfTeAVXD9qa0vkfm+CnAE6CInhs1ivLEtr0B1kxlE
	 T1SxDpucPSxy28PQjZ3Ebrq6W/nbPWTR8LBAjAFNzMHbIKoW5A14T8OCD+560HhJHB
	 w5cw39BXNEllJyYkWHnppOMEsbZ31jWdbyF6KeibbIYSSsKtdKn9Ko4tZlOjWGr1rB
	 D+z/7ek5pmomR1kfsPQfkEYXTDP5U5I9mHh4RL3OwVH5Bmr00p/Im3/u+J6u0hDlR9
	 XG3K8/dk5Hl4g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4892D4D0B8;
	Wed, 25 Nov 2026 23:48:26 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH] usb: roles: serialize registered checks and unregister
 under sw->lock
Date: Wed, 25 Nov 2026 23:48:25 +0000
Message-Id: <20261125234825.94733-1-iasnezhkov@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795650505; l=2685;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=GuND8n2xqj5QQdwL+68NjBweSNAn1cbbNFIZ1io33u8=;
 b=VX6Qt7SJnnMShPHXs0AFA3PZgzsq8zQ9J0kvT4+DaIasbDiJWcAhIvaOm7WqJxoTjdV2aHnlu
 Pov7pAV68lICjkt3ZjvroL0Xh5HTPEM+j4lia4hOjBqdxq0PHrIzQuH
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
Reply-To: iasnezhkov@gmail.com
Content-Transfer-Encoding: 7bit

From: Ilia Snezhkov <iasnezhkov@gmail.com>

usb_role_switch_set_role() and usb_role_switch_get_role() check
sw->registered outside sw->lock, while usb_role_switch_unregister()
clears sw->registered without acquiring sw->lock.

A consumer can observe sw->registered == true, be preempted before
acquiring sw->lock, and still invoke sw->set() or sw->get() after
usb_role_switch_unregister() has returned and the provider driver has
torn down its state. Likewise, an in-flight callback already holding
sw->lock is not drained before usb_role_switch_unregister() returns.

Move the sw->registered check inside sw->lock in both
usb_role_switch_set_role() and usb_role_switch_get_role(), and clear
sw->registered under sw->lock in usb_role_switch_unregister() so new
callbacks are rejected and in-flight callbacks finish before the
provider continues teardown.

Found and drafted with an AI coding assistant.

Fixes: b787a3e78175 ("usb: roles: don't get/set_role() when usb_role_switch is unregistered")
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
 drivers/usb/roles/class.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index edec139..3370294 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -79,10 +79,11 @@ int usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role role)
 	if (IS_ERR_OR_NULL(sw))
 		return 0;
 
-	if (!sw->registered)
-		return -EOPNOTSUPP;
-
 	mutex_lock(&sw->lock);
+	if (!sw->registered) {
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
 
 	ret = sw->set(sw, role);
 	if (!ret) {
@@ -90,6 +91,7 @@ int usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role role)
 		kobject_uevent(&sw->dev.kobj, KOBJ_CHANGE);
 	}
 
+out:
 	mutex_unlock(&sw->lock);
 
 	return ret;
@@ -105,18 +107,21 @@ EXPORT_SYMBOL_GPL(usb_role_switch_set_role);
  */
 enum usb_role usb_role_switch_get_role(struct usb_role_switch *sw)
 {
-	enum usb_role role;
+	enum usb_role role = USB_ROLE_NONE;
 
-	if (IS_ERR_OR_NULL(sw) || !sw->registered)
+	if (IS_ERR_OR_NULL(sw))
 		return USB_ROLE_NONE;
 
 	mutex_lock(&sw->lock);
+	if (!sw->registered)
+		goto out;
 
 	if (sw->get)
 		role = sw->get(sw);
 	else
 		role = sw->role;
 
+out:
 	mutex_unlock(&sw->lock);
 
 	return role;
@@ -423,7 +428,9 @@ void usb_role_switch_unregister(struct usb_role_switch *sw)
 {
 	if (IS_ERR_OR_NULL(sw))
 		return;
+	mutex_lock(&sw->lock);
 	sw->registered = false;
+	mutex_unlock(&sw->lock);
 	if (dev_fwnode(&sw->dev))
 		component_del(&sw->dev, &connector_ops);
 	device_unregister(&sw->dev);
-- 
2.54.0 (Apple Git-157)



