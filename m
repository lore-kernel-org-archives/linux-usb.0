Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795126948;
	b=uM7b3udeJrFxSD0b6g7AV1RqbzVxOGHgiiWvTJyXTT8hM5j6RDuG9/hJW+YENW9DMI6K
	 vwyjSwjm7D4McEJtcvaKGaX5Rs/4Qi6ubvVeaaCHYXshXdprTeDDIb/uznO9oocdK5Ljo
	 7JVR06hUxMCG1HKGB004LW9+JhMXknQDmbyTpnPoJnrBEmi4xRROgYgiodeRNrH4omx3v
	 u6xe/MkXdcBtpkXohbfEUg0bp/T9ObCD5e54u7Z/5G2okARgW+T8E279YYsxnkpoM+0Vu
	 fjkf7k96CKV6gD+3A3NCeGFBuukWlzsePjxlKxojZUEpW3DcZQDbMiLbQLA6XyS3Now==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126948;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GkyNT3R4bDjb0DOY+S9waUx9v/roYMkToqfXQvhP+q0=;
	b=lS5fEkSRPy6HZ0/L8jobK1RhpQ/FZD3mWUfZ3eK+9Utt5Gfr6eVAJcTnHCW1vp0VGl5g
	 fLsiIHV4ds/ObjHup/qaY9r9PryUuq5TfOulbM7lpRNIaHrVZFGGrUyR8EElEpsX12Lnq
	 Iu45xXTRx9fPCq3EbY+9LPs4h5xWm4mGYABqyMwvQST7Ur2Vy5Q8RcYLb5F2jlKM5yRUG
	 Es0qzJJG93R4/3e0tZw/V5XBIfhnXnDeVutBpjxeDQ6tr0PLtXUwggQSgKzTZX8MC9lyG
	 sYB0vzZ4BXGiKtZmx2EUVLIz16PL/Q3qFO+CUY0vXfcr6AAV7uW1xgb/MZVLsyTisKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gvSgQJWm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E6A606A337;
	Thu, 19 Nov 2026 22:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gvSgQJWm
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795126948;
	b=zs5fMnkIGzNzHK7QFl9iMauYOqpgPFNEp4VYP/y+C8RYGPOUJZkN3RCIuLwBVfkeukRw
	 ODZtNKihOCm9vYeh+9sNxtK/oS+JQ1MO7yDD0EORrhCQmHZQXxxAccBJdHcoO18YErdIk
	 nPRlrOGHFigbINzgZ21MGDb9Aa/RoolEV3+R5Gz4vhFuiweM+3TwKbFgKRlmPHal55EhN
	 XlW5mQzqzGfI+/J71vqhSrTZfSXalKGEO514bjqvXHCMbtQAoX2UgaCUFypi6zn+/qG08
	 WGG625GWOuw/WiJ7qaEyznmtgj8fiFfXGsQpDnLhzIvgh7v8fxTWitVqbMDawzwoZtw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795126948;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GkyNT3R4bDjb0DOY+S9waUx9v/roYMkToqfXQvhP+q0=;
	b=yFW1O7IrYDerTG9BgnQYsxIq0Ezn3XwtiqyCb4J1HS+Nj4zqbo4l9qbrRBxPmshLY+FU
	 N2rZys+t2CpUiwCE1MpT+pyQPTSlG2DGYUspH+cQcXJDDMhqq43eiZcJ2hSmMhtE3abJR
	 PNdJv93dvOfdbwOMFJxS2tZWNcg6Q4pIyOm4jXo1n3bMqUMVdD4mep5CeSDl8KUKQPUXe
	 CYEr0gZ5n8ifdKzWLZfeaovFN+QdYKkXmu67N/pI1bl+tGI72IXuguFmcynaJvmHu0rG9
	 ln7RPG86PSGNxuA/3RL87rv+Jt/PsBjnpWsd2+FNkKbn255EDJyLNoPaXCe2HMGI5/w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0A2761F000C6;
	Thu, 19 Nov 2026 22:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795126948;
	bh=GkyNT3R4bDjb0DOY+S9waUx9v/roYMkToqfXQvhP+q0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=gvSgQJWmrPZWz0luWGHBUDr/i6BgPyGCSxCMG0u/mBsNsFnMRAJwawMXfFqKF0+WX
	 O/SwusmFcX9xVYfWSpEcqgltYWaNCvDUBcvZfa7XkEqG80rodyA6UrisBJPuGMUkWN
	 vKZf2OdqGjNqVXZxDDdUbb607B5n9kYkiCtoEh0EzYxwRqHdgHn90w+zZSKwa97qL9
	 ny8CxDBdjqurUP++SYOYe753LnMbHzytrFz1vXBEkjU910UkBZmL9cy7WiixeGcayG
	 LMzf8JD/F3TPR+MtszrxEtwd8A1m93tNXM7h74FMRCMgzPi6gvglI98qK1SxNUpXqM
	 P6PUWkHIY6frg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8919341B2B;
	Thu, 19 Nov 2026 22:22:27 +0000 (UTC)
From: Oleh Kurudz via B4 Relay <devnull+admin.or1k.net@kernel.org>
Date: Fri, 20 Nov 2026 00:22:25 +0200
Subject: [PATCH 1/2] USB: core: Add USB_QUIRK_DISCONNECT_PARENT_SUSPEND
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
Message-Id: <20261120-quadcast-s-suspend-v1-1-add8ccf12c8f@or1k.net>
References: <20261120-quadcast-s-suspend-v1-0-add8ccf12c8f@or1k.net>
In-Reply-To: <20261120-quadcast-s-suspend-v1-0-add8ccf12c8f@or1k.net>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Oleh Kurudz <admin@or1k.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795126946; l=5002;
 i=admin@or1k.net; s=20261120; h=from:subject:message-id;
 bh=KS7CYnsQniBo8AQ1uwycWYmb0KvcOWr+4Ntt5Gu/5Bo=;
 b=vUoxPDfWd6mCpilBiN9DmkA3IQgp2ZchSHiDTk99tOOJBcs769O54gcorFxnilLsMnq1BIFcM
 lRJrWaPS/crBN8Gsybs+FW06qczEQn/y7vbtjJmHHXC+LDFvi+IDDjn
X-Developer-Key: i=admin@or1k.net; a=ed25519;
 pk=99OKf9VLJkjldneE6gRk0c6oTl7G+EdqRiFo4h8sH6Q=
X-Endpoint-Received: by B4 Relay for admin@or1k.net/20261120 with
 auth_id=1577
X-Original-From: Oleh Kurudz <admin@or1k.net>
Reply-To: admin@or1k.net
Content-Transfer-Encoding: 7bit

From: Oleh Kurudz <admin@or1k.net>

Some USB products are several functions behind a small hub inside the
same enclosure. On the HyperX QuadCast S microphone one of these
functions drops off the bus while the system is suspending, and the
built-in hub then reports the connect change upstream and wakes the
system, even though remote wakeup is disabled for the hub and for
everything behind it. On s2idle systems the suspend bounces back within
about a second.

USB_QUIRK_DISCONNECT_SUSPEND does not help here. Set on the function
that drops off, it disables that function's port on the built-in hub,
but the hub itself still signals the wakeup. Set on the hub, it would
affect every product that uses the same generic hub chip (a Huasheng
214b:7250 in this case), including ones with a keyboard behind it that
is expected to wake the system.

Add USB_QUIRK_DISCONNECT_PARENT_SUSPEND. When a hub has a child with
this quirk, usb_suspend() disables the hub's upstream port after
suspending it, just as USB_QUIRK_DISCONNECT_SUSPEND would for the hub
itself. The children are checked at suspend time instead of copying the
flag to the hub at enumeration, because a reset-resume of the hub re-runs
usb_detect_quirks() and would drop a copied flag.

Like USB_QUIRK_DISCONNECT_SUSPEND, this only affects system sleep;
runtime suspend does not go through usb_suspend(). The quirk can also be
set with the usbcore.quirks parameter, using the letter 's'.

This patch and its changelog were written with the help of an AI
coding assistant (Claude, claude-opus-5-5). I reviewed the result and
tested it on my hardware, see the next patch.

Signed-off-by: Oleh Kurudz <admin@or1k.net>
---
 Documentation/admin-guide/kernel-parameters.txt |  5 +++++
 drivers/usb/core/driver.c                       | 20 +++++++++++++++++++-
 drivers/usb/core/quirks.c                       |  3 +++
 include/linux/usb/quirks.h                      |  7 +++++++
 4 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 176648941..7751c373a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8235,6 +8235,11 @@ Kernel parameters
 					9-bytes configuration descriptor request.
 					Ask for 255-bytes request instead to mirror
 					Windows' behavior);
+				s = USB_QUIRK_DISCONNECT_PARENT_SUSPEND
+					(Device sits behind a hub that signals
+					a spurious wakeup when the device drops
+					off the bus during suspend; disconnect
+					the hub before suspend);
 			Example: quirks=0781:5580:bk,0a5c:5834:gij
 
 	usbhid.mousepoll=
diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index d3a61ebc6..a40d9595b 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -1620,6 +1620,23 @@ static void choose_wakeup(struct usb_device *udev, pm_message_t msg)
 	udev->do_remote_wakeup = w;
 }
 
+/*
+ * Check whether a child of @hdev wants @hdev disconnected during system
+ * suspend. The caller must hold @hdev's device lock, which keeps the set of
+ * children stable.
+ */
+static bool usb_child_wants_parent_disconnect(struct usb_device *hdev)
+{
+	struct usb_device *child;
+	int port1;
+
+	usb_hub_for_each_child(hdev, port1, child) {
+		if (child->quirks & USB_QUIRK_DISCONNECT_PARENT_SUSPEND)
+			return true;
+	}
+	return false;
+}
+
 /* The device lock is held by the PM core */
 int usb_suspend(struct device *dev, pm_message_t msg)
 {
@@ -1637,7 +1654,8 @@ int usb_suspend(struct device *dev, pm_message_t msg)
 	if (r)
 		return r;
 
-	if (udev->quirks & USB_QUIRK_DISCONNECT_SUSPEND)
+	if ((udev->quirks & USB_QUIRK_DISCONNECT_SUSPEND) ||
+	    (udev->parent && usb_child_wants_parent_disconnect(udev)))
 		usb_port_disable(udev);
 
 	return 0;
diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index a4bcbe9c9..3933cf9c0 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -146,6 +146,9 @@ static int quirks_param_set(const char *value, const struct kernel_param *kp)
 			case 'r':
 				flags |= USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE;
 				break;
+			case 's':
+				flags |= USB_QUIRK_DISCONNECT_PARENT_SUSPEND;
+				break;
 			/* Ignore unrecognized flag characters */
 			}
 		}
diff --git a/include/linux/usb/quirks.h b/include/linux/usb/quirks.h
index a4043b33c..101dd1ca4 100644
--- a/include/linux/usb/quirks.h
+++ b/include/linux/usb/quirks.h
@@ -84,4 +84,11 @@
 /* Use a 255 bytes config descriptor request mirroring windows behavior */
 #define USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE	BIT(19)
 
+/*
+ * Device sits behind a hub that signals a spurious wakeup when the device
+ * drops off the bus during system suspend; the hub needs to be disconnected
+ * before suspend.
+ */
+#define USB_QUIRK_DISCONNECT_PARENT_SUSPEND	BIT(20)
+
 #endif /* __LINUX_USB_QUIRKS_H */

-- 
2.56.1


