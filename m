Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794160916;
	b=hxlhHRpjlqHh5oSEyKDIJFL1PpdVI0SW3ewObzifRL8f16Kd1jDh+WbkbSbkI/u1DXAc
	 xrRAwME7L5khnUVLDCebiUWAixBLZQzuBBvrSPZxCKxKL7n+I0J2Dr5OU7ZO3ILtv4ZYP
	 04p0gHPUMYGBtiuQUeToPoi0ukWmQ+lhWVxJwQKuS4C6zDwMbry0l/pjhJaMXZ4fCaQbF
	 D/GVA0JozrRPpbmVvM5/byFbEUkGVO3LbkWPMVfJXMAaaYutZeYf4I9p/3Cmx5AlC2hcz
	 uKMwmE+hR9T0+mw+G6MQpZgMFRPWgeGfW8y2TNzl52QTJBffZ+aN4rYvwwxE26GMCag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794160916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wKthFVGy2/96NtNdiRDSbQRthuWj2Z8kR1kJlcmQltw=;
	b=qXJKOuvS3pd1GWH8ZPOKLm0I66Ko7ZLItkwojv5bpYpX/oo5oHrzKqo2bEOUHDUj1BmX
	 jTCLkLkBCvBiEP+bThoRJ9RBdw6VsYbfB2khuRyI2lqWAUUB6GIutmOstrG14SEh/vzYX
	 4iElD5SxV9NadIFGxjJhsvQ7mEEvRhwdmeuoCgaCB3SS23ru7qIhATXFbiG/bckwJNILO
	 S2Tc6sDa24xOg6kYjjR1JubyipWkSFtiKJPWNxpZD/gQNSCcxmanhzSvSGUrxF912yu6M
	 7gdvgJ8W5pzAaUHAO0NWeZHpoH76wZ5We/dOSlVas0wVl44HfDULqbIa8dDdvkxUGDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D8lNDhBP;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CA7606A320
	for <linux-usb@vger.kernel.org>; Sun,  8 Nov 2026 18:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8CA7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D8lNDhBP
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a06c60065fso59883b3a.1
        for <linux-usb@vger.kernel.org>; Sun, 08 Nov 2026 10:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794160915; x=1794765715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wKthFVGy2/96NtNdiRDSbQRthuWj2Z8kR1kJlcmQltw=;
        b=D8lNDhBPaKDXUxNDqNdYFhyv9rUjvhg9KcgnKggpcZtNjiHRp+ZR7w/iG0Wz7cNMRZ
         CZL9jV8rWbCW5dTguKoMs6uE4pXt3uEOnPaX+dH/mGcbEeLw8l29HtQwEqrFT6A4CDwV
         rKy1+6m9OPARfvt5lbsnQjYwq+5eXBNCAKOilbRtkrvTikqimes33rI1iq1Qg23vDFw3
         9kY/lsUCekQAHeEGY3TuIkHa/yZU3vZuCeGSz14aRgNLuOl3KvBEOrpmTKtvFtK5S+gE
         58INqtm0lcSCnJR93g0Ttsp+s122GIYNSHNmNLyAYcmFhoc2PB18fWP2jt0GChCgPwEX
         qpAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794160915; x=1794765715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wKthFVGy2/96NtNdiRDSbQRthuWj2Z8kR1kJlcmQltw=;
        b=OHKIuwFUiKh8pBAWO90hPG/N7zuiLNzjEgiuxSP0DKGp+KCY04Kp0e4gm6OtPPLEUu
         LttL8Xd8siX/22kjSNMjfIB/4x//yR0XQDVO5088eNs9lTBPH/00bTqIJ4Hw4dTejqZO
         XVFvo9hhglXUo5x0WJYKGcB2NWCgS54U+0uOxJoZR/Fuz4HFHLDM3mMqQGPdvf4MbZJI
         US+NSYs6CMZRn7K1kOlH6z4JDzlvPclf3UhoH1LFJcOHwNGwK4AZ3qKpEzRlsLbbmnyZ
         9FW91HvyR9Qo87rDL6trf2KpU3hXcIP6Gv9dfTRfK78WFqWtV4OheanJyTsZRNykdolG
         LdCw==
X-Forwarded-Encrypted: i=1; AL+hErFyYA96YJuqq00Nm6Hx+uXXUbqrVbUpkDSckfNoUkmLCevp7VlFvvWhqkDbQ/GO+OZFBgPC0zRPAMg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sw3q1AUOuYyB3GjnU6gcUi9I4U+VpbA1zOdyAnuz0zHCeeKH9
	mIcw428djn3V5yQuERU/AxYhavX8mPIIMKnQR36Dyut4RW4w9prlarSr
X-Gm-Gg: AYBFou1I5ls/1AYlBK8XPkv76jpuNFg3WpJI07wYUq6lUvWtYFyofe2NE4D6ddbPasn
	/3qBWF1UizhkhUdUwAI4ecdjyyuOqRsXAHQsyKYGpBuCpjelsTam1VDnkzSlTXvAQ3VoKwpBZzZ
	iaO5TZKNN13mG6mK9pT7Cx/IbSNvec6tz888xnEZfQb8/NICysUOZFtcUMN5UVdPjYHp3wwJuXX
	vW8jnXkGuhPSAgAhLaLV2+YkwvXYuhQQTyMAITUyxLARMf08ypnHAetgo/RKd6aYNZIatzeZ4Sb
	EFGptvGtOo1uWJcNG4ZhE0Khz8u6eMShL1LXp7lzOkZzUc6m07j44/zLHDFqagIMkLuBlGcZWzQ
	fQwEUu+VsjuI09ZS7AvqQYCykKP+cWSYUAq7QJCUp2GzUNqbEgq73OFq532rcOk6mWi93LaPDI+
	O7phUmQsRKzx5BvjHzcF+FHzjy3tO3pyZwSO4lQgp9LHzvPs+Gdr/u8MC1u+G1sdXnFX16tRNEi
	ZirL4i3BWnKjfSsdZ5pn3y5OMy5PG5AI1rIbqgpjuObq8um3L8Iqea1CgiL6o2YWC1+xbt5BRw0
	pQvczcxI/rJ8Rt6dec+9uXBqrxxXCYlMVxUAR6s6xrQ5nQYOPGu1DY9BwWhZjgHrQ1m3BHo=
X-Received: by 2002:a05:6a00:288b:b0:880:5fe5:a818 with SMTP id d2e1a72fcca58-8b6710e76b8mr1600334b3a.59.1794160915046;
        Sun, 08 Nov 2026 10:01:55 -0800 (PST)
Received: from arch.localdomain ([223.238.138.174])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b64a2dfd6asm642259b3a.56.2026.11.08.10.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:01:53 -0800 (PST)
From: Prashant Sengar <prashantsengar25031@gmail.com>
To: netdev@vger.kernel.org
Cc: Thangaraj.S@microchip.com,
	UNGLinuxDriver@microchip.com,
	andrew+netdev@lunn.ch,
	linux@armlinux.org.uk,
	linux-usb@vger.kernel.org
Subject: [PATCH net-next] net: usb: lan78xx: use phylink for Wake-on-LAN
Date: Sun,  8 Nov 2026 23:31:37 +0530
Message-ID: <20261108180137.3488023-1-prashantsengar25031@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use phylink's Wake-on-LAN helpers to handle PHY and MAC
wakeup capabilities, allowing MAC-based WoL configuration
when no PHY is attached.

Add a MAC WoL callback and advertise the supported MAC wakeup
modes through phylink. Synchronize the effective WoL settings
with the driver state used during suspend.

Preserve the default magic-packet wakeup configuration and
restore the previous USB wakeup state if WoL configuration
fails.

Tested with QEMU Raw Gadget emulating a PHY-less LAN7801.
Verified WoL configuration, unsupported mode rejection,
and USB wakeup state transitions.

Signed-off-by: Prashant Sengar <prashantsengar25031@gmail.com>
---
 drivers/net/usb/lan78xx.c | 84 +++++++++++++++++++++++++++++++--------
 1 file changed, 67 insertions(+), 17 deletions(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index d73002b2c21a..7d67dd150271 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -1765,13 +1765,6 @@ static void lan78xx_get_wol(struct net_device *netdev,
 	struct lan78xx_net *dev = netdev_priv(netdev);
 	int ret;
 	u32 buf;
-	struct lan78xx_priv *pdata = (struct lan78xx_priv *)(dev->data[0]);
-
-	if (!netdev->phydev) {
-		wol->supported = 0;
-		wol->wolopts = 0;
-		return;
-	}
 
 	if (usb_autopm_get_interface(dev->intf) < 0)
 		return;
@@ -1783,8 +1776,7 @@ static void lan78xx_get_wol(struct net_device *netdev,
 		wol->wolopts = 0;
 	} else {
 		if (buf & USB_CFG_RMT_WKP_) {
-			wol->supported = WAKE_ALL;
-			wol->wolopts = pdata->wol;
+			phylink_ethtool_get_wol(dev->phylink, wol);
 		} else {
 			wol->supported = 0;
 			wol->wolopts = 0;
@@ -1799,25 +1791,45 @@ static int lan78xx_set_wol(struct net_device *netdev,
 {
 	struct lan78xx_net *dev = netdev_priv(netdev);
 	struct lan78xx_priv *pdata = (struct lan78xx_priv *)(dev->data[0]);
+	struct ethtool_wolinfo actual = { .cmd = ETHTOOL_GWOL };
+	bool old_wakeup, enable;
+	int rollback_ret;
 	int ret;
 
 	if (wol->wolopts & ~WAKE_ALL)
 		return -EINVAL;
 
-	if (!netdev->phydev)
-		return -EOPNOTSUPP;
-
 	ret = usb_autopm_get_interface(dev->intf);
 	if (ret < 0)
 		return ret;
 
-	pdata->wol = wol->wolopts;
-
-	ret = device_set_wakeup_enable(&dev->udev->dev, (bool)wol->wolopts);
-	if (ret < 0)
+	phylink_ethtool_get_wol(dev->phylink, &actual);
+	if (wol->wolopts & ~actual.supported) {
+		ret = -EINVAL;
 		goto exit_pm_put;
+	}
+
+	old_wakeup = device_may_wakeup(&dev->udev->dev);
+	enable = !!wol->wolopts;
 
-	ret = phy_ethtool_set_wol(netdev->phydev, wol);
+	if (old_wakeup != enable) {
+		ret = device_set_wakeup_enable(&dev->udev->dev, enable);
+		if (ret < 0)
+			goto exit_pm_put;
+	}
+
+	ret = phylink_ethtool_set_wol(dev->phylink, wol);
+	if (ret < 0) {
+		if (old_wakeup != enable) {
+			rollback_ret = device_set_wakeup_enable(&dev->udev->dev, old_wakeup);
+			if (rollback_ret)
+				netdev_warn(dev->net, "USB wakeup rollback failed: %d\n",
+					    rollback_ret);
+		}
+		goto exit_pm_put;
+	}
+	phylink_ethtool_get_wol(dev->phylink, &actual);
+	pdata->wol = actual.wolopts;
 
 exit_pm_put:
 	usb_autopm_put_interface(dev->intf);
@@ -2617,12 +2629,24 @@ static int lan78xx_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 	return lan78xx_mac_eee_enable(dev, true);
 }
 
+static int lan78xx_mac_wol_set(struct phylink_config *config,
+			       u32 wolopts, const u8 *sopass)
+{
+	struct lan78xx_net *dev = netdev_priv(to_net_dev(config->dev));
+	struct lan78xx_priv *pdata = (struct lan78xx_priv *)dev->data[0];
+
+	pdata->wol = wolopts;
+
+	return 0;
+}
+
 static const struct phylink_mac_ops lan78xx_phylink_mac_ops = {
 	.mac_config = lan78xx_mac_config,
 	.mac_link_down = lan78xx_mac_link_down,
 	.mac_link_up = lan78xx_mac_link_up,
 	.mac_disable_tx_lpi = lan78xx_mac_disable_tx_lpi,
 	.mac_enable_tx_lpi = lan78xx_mac_enable_tx_lpi,
+	.mac_wol_set = lan78xx_mac_wol_set,
 };
 
 /**
@@ -2848,6 +2872,10 @@ static int lan78xx_phylink_setup(struct lan78xx_net *dev)
 	       dev->phylink_config.supported_interfaces,
 	       sizeof(dev->phylink_config.lpi_interfaces));
 
+	pc->wol_mac_support = WAKE_MAGIC | WAKE_UCAST | WAKE_BCAST |
+		      WAKE_MCAST | WAKE_ARP;
+	pc->wol_phy_legacy = true;
+
 	phylink = phylink_create(pc, dev->net->dev.fwnode,
 				 dev->interface, &lan78xx_phylink_mac_ops);
 	if (IS_ERR(phylink))
@@ -4671,6 +4699,10 @@ static void lan78xx_stat_monitor(struct timer_list *t)
 static int lan78xx_probe(struct usb_interface *intf,
 			 const struct usb_device_id *id)
 {
+	struct ethtool_wolinfo wol = {
+		.cmd = ETHTOOL_SWOL,
+		.wolopts = WAKE_MAGIC,
+	};
 	struct usb_host_endpoint *ep_blkin, *ep_blkout, *ep_intr;
 	struct lan78xx_net *dev;
 	struct net_device *netdev;
@@ -4803,6 +4835,24 @@ static int lan78xx_probe(struct usb_interface *intf,
 	if (ret < 0)
 		goto free_urbs;
 
+	/* Preserve the default magic-packet wakeup configuration. */
+	rtnl_lock();
+
+	ret = phylink_ethtool_set_wol(dev->phylink, &wol);
+	if (!ret) {
+		struct lan78xx_priv *pdata = (struct lan78xx_priv *)dev->data[0];
+
+		wol.cmd = ETHTOOL_GWOL;
+		phylink_ethtool_get_wol(dev->phylink, &wol);
+		pdata->wol = wol.wolopts;
+		netdev->ethtool->wol_enabled = !!wol.wolopts;
+	}
+
+	rtnl_unlock();
+
+	if (ret)
+		netdev_warn(netdev, "failed to initialize WoL: %d\n", ret);
+
 	ret = register_netdev(netdev);
 	if (ret != 0) {
 		netif_err(dev, probe, netdev, "couldn't register the device\n");
-- 
2.55.0

