Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=144.6.180.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793568206;
	b=nnCRuu0JXm9BUQrqkf77mgGC8uCGvn++MjPFl+4Jw25tuUF5sypWQg6UX5YOUJ2WXE1P
	 hqkgoGKQTdfy9e8yFyP5+0ymZ4mx73511C6tM4UUV+krnLUnomYm8IufkgIsxppqXK2gu
	 OoBast9ai48WWRPRy/aKyz8W7tcN3tQOBCUHg1OKc5GFiXi56MoChINXrxGIekTp570U4
	 8clErlUhpli1T5RzKSxWT56t+YNJdRo8WXIvCE4Gb9hiEtpXFerGc7NUmjXiDtHr3NsnZ
	 TdC+Rf/bdH26x3jGnouLl8V0BWoDX6/8/crxkc+wd2WPLpkglJamG3xRPKHgQbBJaZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793568206;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-Spam-Status:
	 X-Spam-Checker-Version;
	bh=7R5l8aqNCSpYa5irhiVl5c4c5Lydz7WveCOd2MtAt4Y=;
	b=kQppIq2I1G6bOO7WNO0CsBNbIQfl83/6Ji05h3WCMuyUf6FYWt5avVGRXGf9jPUXmZqd
	 t8eA+3geapTv3G374Q9ReW8Fi3OZGS0j3GYvavIZ8ernCBZZbJUD3fVhB8/glDkHd01W+
	 HMljDjO/bfJTASwVOJCu6lJe5HVO1p9r0G00skxCfdN50szjS9W9+JqFFvCXlWBGfkjiF
	 tpQQXIcNXEHnXO8MQzmd6n/c0CwnTvZmoo7ByE3ygY/lwI+xp/wK81SOjVUCoMRbLmsS/
	 xHUcYs1hEB8x7UIZ+t0haAZ5rBd+9gBD/diVI100mfhv6o6tjeYS08uOMxVKq2+fdMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmorph.com;
	spf=pass smtp.mailfrom=gmorph.com;
	arc=none smtp.remote-ip=144.6.180.193
Received: from mail.gmorph.com (mail.gmorph.com [144.6.180.193])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9613B606A325
	for <linux-usb@vger.kernel.org>; Sun,  1 Nov 2026 21:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9613B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmorph.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmorph.com
Received: from koala.local (_gateway [10.1.1.1])
	by mail.gmorph.com (Postfix) with ESMTPS id 5B5011C022D;
	Mon,  2 Nov 2026 08:23:17 +1100 (AEDT)
From: Grant Morphett <grant@gmorph.com>
To: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Grant Morphett <grant@gmorph.com>
Subject: [PATCH] thunderbolt: Enable hidden DP OUT adapter on Dell TB16 dock
Date: Mon,  2 Nov 2026 08:23:11 +1100
Message-ID: <20261101212311.10946-1-grant@gmorph.com>
X-Mailer: git-send-email 2.53.0
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

The Dell TB16 Thunderbolt 3 dock consists of two Alpine Ridge 4C routers
in a chain: one in the captive cable module (DROM 00d4:b051 "Dell
Thunderbolt Cable") and one in the dock itself (DROM 00d4:b054 "Dell
Thunderbolt Dock"). The dock has four video connectors: mini DisplayPort,
HDMI, full size DisplayPort and VGA.

Mini DisplayPort and HDMI sit behind an MST hub on DP OUT adapter 8 of
the dock router and work fine. Full size DisplayPort and VGA are wired
to DP OUT adapter 8 of the cable router, but the cable router's DROM
marks that adapter as disabled. The software connection manager
therefore never initializes it, never tunnels DisplayPort to it, and a
monitor on the full size DisplayPort or VGA connector stays dark. Only
two external displays can be used with the dock, while all of them work
with the firmware connection manager (and under Windows).

The adapter is real: its adapter config space reports type DP/HDMI OUT
(0xe0102), it raises hot plug events when a monitor is attached to the
DisplayPort or VGA connector, and once it is enabled the DP tunnel to it
is established and the display comes up. The same DROM also fails its
CRC32 check (expected 0xaf438340, got 0xaf4383c0), so the port
disabled bit is likely just wrong rather than intentional:

  1: DROM data CRC32 mismatch (expected: 0xaf438340, got: 0xaf4383c0), continuing
  1:8: disabled by eeprom
  acking hot plug event on 1:8

Add a quirk for the cable router that re-enables adapter 8 if its
config space confirms it is a DP OUT adapter, and initializes it the
same way tb_switch_add() does for the other ports. tb_init_port() is
made non-static for this.

With the quirk applied, both DP tunnels come up at boot and all three
external monitors work:

  1:8: enabling DP OUT adapter disabled in DROM
  1:8: DP OUT available
  0:5 <-> 1:8 (DP): activating
  301:8: DP OUT available
  0:6 <-> 301:8 (DP): activating

Tested on a Lenovo ThinkPad X1 Yoga Gen 8 (Raptor Lake, USB4 host
8087:a76d) with a TB16 at dock NVM 27.0 / cable NVM 16.0, driving three
1920x1080 monitors on mini DisplayPort, HDMI and full size DisplayPort.

Assisted-by: LLM
Signed-off-by: Grant Morphett <grant@gmorph.com>
---
 drivers/thunderbolt/quirks.c | 35 +++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/switch.c |  7 ++++---
 drivers/thunderbolt/tb.h     |  1 +
 3 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c
index 2722918..4529fa4 100644
--- a/drivers/thunderbolt/quirks.c
+++ b/drivers/thunderbolt/quirks.c
@@ -65,6 +65,38 @@ static void quirk_stuck_pending(struct tb_switch *sw)
 	}
 }
 
+/*
+ * The DROM of the Dell TB16 cable module marks adapter 8 as disabled
+ * even though it is the DP OUT adapter wired to the dock's full size
+ * DisplayPort and VGA connectors. Enable it so that the software
+ * connection manager can tunnel DisplayPort to it.
+ */
+static void quirk_dell_tb16_dp_out(struct tb_switch *sw)
+{
+	struct tb_port *port;
+	u32 type;
+
+	if (sw->config.max_port_number < 8)
+		return;
+
+	port = &sw->ports[8];
+	if (!port->disabled)
+		return;
+
+	if (tb_port_read(port, &type, TB_CFG_PORT, 2, 1))
+		return;
+	if ((type & 0xffffff) != TB_TYPE_DP_HDMI_OUT)
+		return;
+
+	port->disabled = false;
+	if (tb_init_port(port)) {
+		port->disabled = true;
+		return;
+	}
+
+	tb_port_info(port, "enabling DP OUT adapter disabled in DROM\n");
+}
+
 struct tb_quirk {
 	u16 hw_vendor_id;
 	u16 hw_device_id;
@@ -77,6 +109,9 @@ static const struct tb_quirk tb_quirks[] = {
 	/* Dell WD19TB supports self-authentication on unplug */
 	{ 0x0000, 0x0000, 0x00d4, 0xb070, quirk_force_power_link },
 	{ 0x0000, 0x0000, 0x00d4, 0xb071, quirk_force_power_link },
+	/* Dell TB16 cable module DROM hides the second DP OUT adapter */
+	{ 0x8086, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_4C_BRIDGE, 0x00d4, 0xb051,
+		  quirk_dell_tb16_dp_out },
 
 	/* Intel Titan Ridge CLx is unstable on early firmware versions */
 	{ 0x8086, PCI_DEVICE_ID_INTEL_TITAN_RIDGE_DD_BRIDGE, 0x0000, 0x0000,
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index d22d8db..e4629ed 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -701,15 +701,16 @@ int tb_port_reset(struct tb_port *port)
 	return tb_lc_reset_port(port);
 }
 
-/*
+/**
  * tb_init_port() - initialize a port
+ * @port: Port to initialize
  *
- * This is a helper method for tb_switch_alloc. Does not check or initialize
+ * This is a helper method for tb_switch_add(). Does not check or initialize
  * any downstream switches.
  *
  * Return: %0 on success, negative errno otherwise.
  */
-static int tb_init_port(struct tb_port *port)
+int tb_init_port(struct tb_port *port)
 {
 	int res;
 	int cap;
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index e868457..cb84182 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1099,6 +1099,7 @@ int tb_switch_pcie_l1_enable(struct tb_switch *sw);
 int tb_switch_xhci_connect(struct tb_switch *sw);
 void tb_switch_xhci_disconnect(struct tb_switch *sw);
 
+int tb_init_port(struct tb_port *port);
 int tb_port_state(struct tb_port *port);
 int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged);
 int tb_port_add_nfc_credits(struct tb_port *port, int credits);
-- 
2.53.0

