Received: from va-2-111.ptr.blmpb.com (va-2-111.ptr.blmpb.com [209.127.231.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843A32AEE4
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 05:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785388558; cv=none; b=Xl8xYn28TNlqX8NbtQsN+KUeFo4xSpsmHtNXR15V+N9c/5FpK9ZI4kPVi67eEEzxeokxhymT6L9bLFsi9cLMWNlR+qt5FnMfFy5mGJenVcYPVClgzSA4N0IrySK0pZB+ouf1k44fTBKwSZZ537y94HD2Fjc5idwlY2ULD5AR3PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785388558; c=relaxed/simple;
	bh=L4Fr/IPBaswcp0Tdqp78Oxfob8Q+aYAGLFBQxTEoO2g=;
	h=From:Subject:Date:Mime-Version:Content-Type:Cc:Message-Id:To; b=Vlt0oKCV55p82g3L8u3o0aGs90EB/yiGOfeRsxDq91x8fclQGGpSUQBshPOuTmus2R10UXetpsMq1xEAiGc6cSddyJGPj6WZjy8Dn5KNmZ3tRE7M4ZB75CEHBo+EbvW3gQIez9gS+pV+AuZbvX/BCLdtuq44RZzJsy+tH0LQgb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Q0kcxUPs; arc=none smtp.client-ip=209.127.231.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Q0kcxUPs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1785388544; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=eicauRYls+vtChdKBvYJvUOMEv7Id/rxHhxy0VE2Rq4=;
 b=Q0kcxUPsvEu6IH7BXaacP51/gm+IEjIYuXi+pitis5ZaeMeWQvr2Sq7TgJTJbQ5wyeGmqv
 wjfBtCKXyEt3FctakEe8OzlWWMidtdhQDrDganRPUkVyjZGL0ykp2WgfkgxONNPezJxibs
 cfGW0B/KQeZdlBrRsEX/qd0Z+ikxnHEgj8W/xlj632MbQ0kD8yE1MgvAVk/WFCdZ9BZpMC
 /TUBB/kgDUeraf+9kwpukWGOnvR7aFlrT9d1+oncGC7O3TemyZkQxnrr0na6RxD+Bn36lA
 V5kJZFQVijS4I+YewwFP9zk1OSmIJ4x4bZ4rEHg9FNVNY1ohE60ihlQuQQnZkQ==
From: "Jinhui Guo" <guojinhui.liam@bytedance.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] net: usb: cdc_ether: add quirk for AMI BMC stale link events
Date: Thu, 30 Jul 2026 13:13:41 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Jinhui Guo <guojinhui.liam@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Cc: <linux-usb@vger.kernel.org>, <netdev@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Jinhui Guo" <guojinhui.liam@bytedance.com>
Message-Id: <20260730051341.24930-1-guojinhui.liam@bytedance.com>
Content-Transfer-Encoding: quoted-printable
To: "Oliver Neukum" <oliver@neukum.org>, 
	"Andrew Lunn" <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, 
	"Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, 
	"Paolo Abeni" <pabeni@redhat.com>
X-Lms-Return-Path: <lba+26a6addfe+7bba8e+vger.kernel.org+guojinhui.liam@bytedance.com>

On AMD Genoa/Turin platforms the BMC-provided USB-Ethernet gadget
(American Megatrends, VID 0x046b PID 0xffb0) intermittently fails to
respond to ARP after AC cold boot.  usbmon captures a stale
NETWORK_CONNECTION(off) immediately followed by
NETWORK_CONNECTION(on) on the interrupt endpoint (~130us apart)
after enumeration.  Because alloc_netdev() leaves
__LINK_STATE_NOCARRIER cleared, netif_carrier_ok() returns true
when the spurious OFF arrives, so usbnet_cdc_status() cannot
recognise it as redundant and schedules EVENT_LINK_CHANGE.
__handle_link_change() then calls unlink_urbs(), killing ~60 rx
URBs whose payload has already been DMA'd into memory =E2=80=94 xHCI trace
confirms them completing as -ECONNRESET with non-zero residual
length.  rx_complete() drops these unconditionally.  The following
ON restores the carrier and re-submits URBs, but the ARP reply is
already lost; the interface looks "up but silent" until ifdown/ifup.

Fix this by adding a device-specific quirk with FLAG_LINK_INTR set,
which makes usbnet_probe() call netif_carrier_off() after bind.
With initial carrier =3D=3D OFF, usbnet_cdc_status() recognises the
spurious OFF as matching the current state and drops it; the
subsequent ON is the first real event and brings the link up
cleanly without ever tearing down the rx queue.  The scheduled
link-change kevent is harmless because EVENT_DEV_OPEN is not yet
set at probe time.

This is applied as a device-specific quirk rather than a change to
the shared cdc_info driver_info because some CDC devices never
send NETWORK_CONNECTION notifications; forcing carrier off for
them would leave the link permanently DOWN.  Restricting the change
to this VID/PID keeps that class of device untouched.

Tested on Genoa and Turin across 100+ AC cold boot cycles; ping
first-packet success rate went from intermittent to 100%.

Signed-off-by: Jinhui Guo <guojinhui.liam@bytedance.com>
---
 drivers/net/usb/cdc_ether.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/usb/cdc_ether.c b/drivers/net/usb/cdc_ether.c
index a0a5740590b9..b5e4b195b69a 100644
--- a/drivers/net/usb/cdc_ether.c
+++ b/drivers/net/usb/cdc_ether.c
@@ -538,6 +538,16 @@ static const struct driver_info	cdc_info =3D {
 	.manage_power =3D	usbnet_manage_power,
 };
=20
+static const struct driver_info ami_bmc_info =3D {
+	.description =3D	"AMI BMC USB Ethernet",
+	.flags =3D	FLAG_ETHER | FLAG_POINTTOPOINT | FLAG_LINK_INTR,
+	.bind =3D		usbnet_cdc_bind,
+	.unbind =3D	usbnet_cdc_unbind,
+	.status =3D	usbnet_cdc_status,
+	.set_rx_mode =3D	usbnet_cdc_update_filter,
+	.manage_power =3D	usbnet_manage_power,
+};
+
 static const struct driver_info	zte_cdc_info =3D {
 	.description =3D	"ZTE CDC Ethernet Device",
 	.flags =3D	FLAG_ETHER | FLAG_POINTTOPOINT,
@@ -946,6 +956,12 @@ static const struct usb_device_id	products[] =3D {
 				      USB_CDC_SUBCLASS_ETHERNET,
 				      USB_CDC_PROTO_NONE),
 	.driver_info =3D (unsigned long)&wwan_info,
+}, {
+	/* AMI BMC gadget */
+	USB_DEVICE_AND_INTERFACE_INFO(0x046b, 0xffb0, USB_CLASS_COMM,
+				      USB_CDC_SUBCLASS_ETHERNET,
+				      USB_CDC_PROTO_NONE),
+	.driver_info =3D (unsigned long)&ami_bmc_info,
 }, {
 	USB_INTERFACE_INFO(USB_CLASS_COMM, USB_CDC_SUBCLASS_ETHERNET,
 			USB_CDC_PROTO_NONE),
--=20
2.20.1
