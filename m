Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=144.6.180.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946475;
	b=X+KiNNroQp4Mxd5aaYeZ4LBb9Oa50PXAAanv1NZV+dcBqYvx31mKbOfdE45768Zv/ZDy
	 QS8AY1RIMPW8uC1W/te2chKTukUIVcehK8v/06beAie4v74Qvb5Bajpw8uXWG1nA7QKI2
	 ftidXAigP8GTh5goVAEhaHf+AV0YJzYVK10P+MrWoKVWikiIyzXh7960Tp1sW5UdRWp0o
	 iYCLlx/CLnQpxl0BBVvoy0vDdJKZgxkQe1eniqt1bXfk30PyA98mrHccU0K0xHpK3Fy8K
	 srcLZmg8BCJwS/iy6Fx0VIKqVPMeHB+m3u8eGOFxfVEdBM99O/T8t0pf+CN82BSqBkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946475;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-Spam-Status:X-Spam-Checker-Version;
	bh=LE/gxKMpNDh50OluiHdp7ibTQLP2A0LPqhdb5wBlcN8=;
	b=WCbPQofF50ODcsvIQGu0xyLYMLJVf2hhsYzYddrgqF3VIRSkXGaoPgC96OrixAeUiNqM
	 8gefnAZyouNRiUplsEG64iwmuQcdj9ZImWIqb+0tyA3Peh2hvYREjsPyuk7o3zDRyuw+M
	 fy1snCTpC+lsFUZs0ST8uRnAPZLalffqd+rXd2kD3CbdbkYZ2OKrMi0tgJTKGz1uMIckv
	 Dlt1DdTdHCp1sCNrhYJr/Grg3zskqmZsr+gFjsbDxQpK6s4F59Qp6X413CqM5PuEhTApb
	 uyR5BWY4TdxC2eNOZMkBpELsXA6XcOwWrz9KwnZNgVff3CRJOKE1At76YWnDy9aLpDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmorph.com;
	spf=pass smtp.mailfrom=gmorph.com;
	arc=none smtp.remote-ip=144.6.180.193
Received: from mail.gmorph.com (mail.gmorph.com [144.6.180.193])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F79606A328
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 06:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9F79606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmorph.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmorph.com
Received: from koala.local (_gateway [10.1.1.1])
	by mail.gmorph.com (Postfix) with ESMTPS id 215B81C042B;
	Fri,  6 Nov 2026 17:27:47 +1100 (AEDT)
From: Grant Morphett <grant@gmorph.com>
To: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Grant Morphett <grant@gmorph.com>
Subject: [PATCH v2] thunderbolt: Enable hidden DP OUT adapter on Dell TB16 dock
Date: Fri,  6 Nov 2026 17:26:14 +1100
Message-ID: <20261106062614.27709-1-grant@gmorph.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101212311.10946-1-grant@gmorph.com>
References: <20261101212311.10946-1-grant@gmorph.com>
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
config space confirms it is a DP OUT adapter. It runs in a new
tb_check_drom_quirks() call right after the DROM has been parsed, so
the regular port initialisation in tb_switch_add() picks the adapter up
like any other enabled port.

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

v2:
- Add a new tb_check_drom_quirks() call right after DROM parsing, so
  the quirk corrects the wrong DROM entry before the ports are
  initialized, instead of making tb_init_port() non-static and calling
  it from the quirk (Mika Westerberg).

Assisted-by: LLM
Signed-off-by: Grant Morphett <grant@gmorph.com>
---
---
 drivers/thunderbolt/quirks.c | 62 ++++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/switch.c |  1 +
 drivers/thunderbolt/tb.h     |  1 +
 3 files changed, 64 insertions(+)

diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c
index 2722918..bba10df 100644
--- a/drivers/thunderbolt/quirks.c
+++ b/drivers/thunderbolt/quirks.c
@@ -65,6 +65,34 @@ static void quirk_stuck_pending(struct tb_switch *sw)
 	}
 }
 
+/*
+ * The DROM of the Dell TB16 cable module marks adapter 8 as disabled
+ * even though it is the DP OUT adapter wired to the dock's full size
+ * DisplayPort and VGA connectors. Correct the DROM entry so that the
+ * software connection manager initializes the adapter and can tunnel
+ * DisplayPort to it.
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
+	tb_port_info(port, "enabling DP OUT adapter disabled in DROM\n");
+}
+
 struct tb_quirk {
 	u16 hw_vendor_id;
 	u16 hw_device_id;
@@ -163,3 +191,37 @@ void tb_check_quirks(struct tb_switch *sw)
 		q->hook(sw);
 	}
 }
+
+static const struct tb_quirk tb_drom_quirks[] = {
+	/* Dell TB16 cable module DROM hides the second DP OUT adapter */
+	{ 0x8086, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_4C_BRIDGE, 0x00d4, 0xb051,
+		  quirk_dell_tb16_dp_out },
+};
+
+/**
+ * tb_check_drom_quirks() - Check for quirks to apply after DROM read
+ * @sw: Thunderbolt switch
+ *
+ * Apply any quirks that correct wrong DROM entries before the ports are
+ * initialized.
+ */
+void tb_check_drom_quirks(struct tb_switch *sw)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(tb_drom_quirks); i++) {
+		const struct tb_quirk *q = &tb_drom_quirks[i];
+
+		if (q->hw_vendor_id && q->hw_vendor_id != sw->config.vendor_id)
+			continue;
+		if (q->hw_device_id && q->hw_device_id != sw->config.device_id)
+			continue;
+		if (q->vendor && q->vendor != sw->vendor)
+			continue;
+		if (q->device && q->device != sw->device)
+			continue;
+
+		tb_sw_dbg(sw, "running %ps\n", q->hook);
+		q->hook(sw);
+	}
+}
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index d22d8db..6268ed6 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -3343,6 +3343,7 @@ int tb_switch_add(struct tb_switch *sw)
 		ret = tb_drom_read(sw);
 		if (ret)
 			dev_warn(&sw->dev, "reading DROM failed: %d\n", ret);
+		tb_check_drom_quirks(sw);
 		tb_sw_dbg(sw, "uid: %#llx\n", sw->uid);
 
 		ret = tb_switch_set_uuid(sw);
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index e868457..7d04376 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1510,6 +1510,7 @@ static inline bool usb4_port_device_is_offline(const struct usb4_port *usb4)
 }
 
 void tb_check_quirks(struct tb_switch *sw);
+void tb_check_drom_quirks(struct tb_switch *sw);
 
 #ifdef CONFIG_ACPI
 bool tb_acpi_add_links(struct tb_nhi *nhi);
-- 
2.53.0

