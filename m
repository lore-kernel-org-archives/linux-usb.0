Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795663996;
	b=0Tl8YJHTdc+qn9aGk0GkYpFRgJRkKX9/pMZ2EieJ6NaStRiWQG509fGEpNdIt5vtPp/z
	 OOYRfdwwSLBaeOZgLzchD7aLfAa0YCkbdmZ7l2+d37NZNf/ztD43aCzuLAIbzyVJgsTxy
	 3DUt9l6ROntACCk1SHm5a0pix5j/pz5XUyIQEsjPMhyzYMQ46wbwPlZJ9bP9VXbiCKcCg
	 EQXseOQIcbaJjz8XrmpPBvFvEyjBkK4ZniqF4JR20bVSJHYq8Tf6pDwPzsJNDXKK46kz0
	 8m1czW6G1l8YhBSTkZElBgPP+KOAl2MIqEoWlFd3V1ByovPayMvwysVL23vUj5Gia0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795663996;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=i51zRUFHWobMGmTAkKMZiuLClqTt0tNH+Upt356GYDA=;
	b=cxsnLZolUfer7eWh/weUQXbuVNgfsaoKvQLd8VrhFHAdvEXHVKRHqVOfSIWNusYk+cyW
	 OtSmO2EmoZFoig40ZOsUsQaVlBU0YwMlyGXchUCWc2Xxs9pYLWI7HZ1c1a4kRHfg0Te/E
	 iBpLDR5cs7x5ZV8Uo6qj8uQB1ejWU5km2h7xlVQ4lrxy3/8+6ywe49iQ3FN4thxYwkZuj
	 4XPcN6EtLzEeidgkNi4xJ0v/vX6we+8JbX1UoMKuevKZnReWFSXe4EcU+KC/DaFAOaBMf
	 SBQiMtZgnpdWM4hwHmxi1pgkG+lFX2lRHpPbW9fbnMTLoGkp80t1qBwbW0NMkYtpz0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Ri+ppkOG;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD439606A33D;
	Thu, 26 Nov 2026 03:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD439606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Ri+ppkOG
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AQ3WHMX03951822, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795663937; bh=i51zRUFHWobMGmTAkKMZiuLClqTt0tNH+Upt356GYDA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=Ri+ppkOGpvxG0MuDXbPnzGimiQzrOXMwRXFKuAItH+0a7RwubntNDmVVkRyUAFrlC
	 M2Jrl7IuKGoyG6uKgKCuWBQLWM5KfzqZVnbzgrpIGV8OZrQqZV6JdSV2TZG3+jQCc4
	 K9eoafkgv8B5XSJtTwRlZdMyvq+lxhaGrS1WB2ApW4wP/RAo40d5C0fUtxtTlt6at2
	 tl3Uh8KeKFVJfkhI0NUVtRBnYgz0aRDqqlHjCPg9hUMxKPDx9FGq0R2dEMaz7CYOul
	 frqCre+olQyttbNrkTdS8tNwv5r5DyyKXEBLUkuXas17LUnO/h+TcvzU6ZjmS9zOB2
	 MZLfnDn7wB5Uw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AQ3WHMX03951822
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Nov 2026 11:32:17 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 26 Nov 2026 11:32:17 +0800
Received: from fc44.realtek.com.tw (172.22.241.7) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Thu, 26 Nov 2026 11:32:17 +0800
From: Chih Kai Hsu <hsu.chih.kai@realtek.com>
To: <davem@davemloft.net>, <kuba@kernel.org>
CC: <netdev@vger.kernel.org>, <nic_swsd@realtek.com>,
	<linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<edumazet@google.com>, <bjorn@mork.no>, <pabeni@redhat.com>,
	<hsu.chih.kai@realtek.com>, <andrew+netdev@lunn.ch>, <mail@birger-koblitz.de>
Subject: [PATCH net-next v9 11/12] r8152: add TGPHY register access for RTL8157 and RTL8159
Date: Thu, 26 Nov 2026 11:32:10 +0800
Message-ID: <20261126033211.51850-12-nic_swsd@realtek.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261126033211.51850-1-nic_swsd@realtek.com>
References: <20261126033211.51850-1-nic_swsd@realtek.com>
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
Content-Type: text/plain

RTL8157 and RTL8159 have a TGPHY command channel
(USB_TGPHY_ADDR/DATA/CMD) for PHY registers that needs no OCP base
switching.  Use it for these chips; older chips keep the OCP path.

Route ocp_reg_read()/ocp_reg_write() through new rtl_ops.phy_read and
phy_write hooks, set per chip.

Unlike the OCP path, a TGPHY access can fail: the busy bit can time
out, or the device can be gone.  The access is then abandoned and
returns an errno (-ENODEV if the device is inaccessible).  A timeout is
logged ratelimited, so a stuck busy bit does not flood the log, and
does not mark the device inaccessible, as for the ADV command channel.

The PHY accessors and the helpers built on them therefore return int,
and the callers where a failure would be taken for register content or
for success now act on it:

- rtl8152_set_pauseparam(), rtl8152_set_speed(), SIOCGMIIREG/
  SIOCSMIIREG, r8153_get_eee() and r8152_mdio_read() propagate the
  error, as does rtl8152_get_link_ksettings() for the 10GBT registers.
  rtl8152_get_pauseparam() reports no flow control when a read fails.
- read_mii_word() reports a failed read as 0, because the MII library
  takes the return value for register content.  A TGPHY timeout
  returned as an errno would look like a BMCR with autonegotiation
  enabled, and mii_nway_restart() would write it back; with 0 it
  returns without writing.  -ENODEV for an inaccessible device is
  still returned, as the writes that follow are blocked then.
- rtl8152_set_speed() updates the cached speed/duplex state only once
  the final BMCR write succeeds, and keeps a pending PHY reset if that
  write fails.  PHY registers already written before a failure are not
  rolled back, as that would need further accesses that can fail too,
  so the PHY may keep a partly updated advertisement until the next
  successful set_speed().  A failed read while waiting for the PHY
  reset to finish is not reported, as the new settings are already
  applied.
- set_carrier() keeps the current link state when the BMSR read fails.
  An errno would otherwise be masked with BMSR_LSTATUS: -ENODEV would
  look like link up and -ETIMEDOUT like link down.
- The PHY firmware version checks skip the patch when the version
  cannot be read.
- rtl_phy_patch_request() returns the errno of a failed write, and
  releases PATCH_REQUEST when a later step fails, so a failed access
  does not leave it asserted.
- r8153_phy_status() treats a failed read as "not ready" and keeps
  polling, so one failure does not end the wait early.
- rtl8153_in_nway() reports the PHY as negotiating when the read fails,
  so runtime suspend is delayed rather than risking a missed link-up
  wake event.
- r8156_mdio_force_mode(), r8156_eee_en() and rtl8152_fw_phy_fixup()
  stop on a failed read instead of using stale data.

The hw_phy_cfg and init sequences, the ocp_reg_*_bits() and sram_*()
callers that write PHY configuration and r8152_mmd_read() still ignore
the status, as does recovery from a TGPHY timeout.  These are left to a
follow-up series.

Older chips are unaffected, as r8152_phy_read() always succeeds.

Signed-off-by: Chih Kai Hsu <hsu.chih.kai@realtek.com>
---
 drivers/net/usb/r8152.c | 602 ++++++++++++++++++++++++++++++----------
 1 file changed, 452 insertions(+), 150 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 2f3d97e2400c3..e6a5d35403a28 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -163,6 +163,9 @@
 #define USB_ADV_ADDR		0xd5d6
 #define USB_ADV_DATA		0xd5d8
 #define USB_ADV_CMD		0xd5dc
+#define USB_TGPHY_ADDR		0xd630
+#define USB_TGPHY_DATA		0xd632
+#define USB_TGPHY_CMD		0xd634
 #define USB_UPS_CTRL		0xd800
 #define USB_POWER_CUT		0xd80a
 #define USB_MISC_0		0xd81a
@@ -516,6 +519,10 @@
 #define ADV_CMD_WR		BIT(1)
 #define ADV_CMD_IP		BIT(2)
 
+/* USB_TGPHY_CMD */
+#define TGPHY_CMD_BUSY		BIT(0)
+#define TGPHY_CMD_WR		BIT(1)
+
 /* USB_UPS_CTRL */
 #define POWER_CUT		0x0100
 
@@ -964,6 +971,8 @@ struct r8152 {
 		void (*hw_phy_cfg)(struct r8152 *tp);
 		void (*autosuspend_en)(struct r8152 *tp, bool enable);
 		void (*change_mtu)(struct r8152 *tp);
+		int (*phy_read)(struct r8152 *tp, u16 addr, u16 *data);
+		int (*phy_write)(struct r8152 *tp, u16 addr, u16 data);
 	} rtl_ops;
 
 	struct ups_info {
@@ -1643,7 +1652,7 @@ static void ocp_write_byte(struct r8152 *tp, u16 type, u16 index, u32 data)
 	generic_ocp_write(tp, index, byen, sizeof(tmp), &tmp, type);
 }
 
-static u16 ocp_reg_read(struct r8152 *tp, u16 addr)
+static int r8152_phy_read(struct r8152 *tp, u16 addr, u16 *data)
 {
 	u16 ocp_base, ocp_index;
 
@@ -1654,10 +1663,12 @@ static u16 ocp_reg_read(struct r8152 *tp, u16 addr)
 	}
 
 	ocp_index = (addr & 0x0fff) | 0xb000;
-	return ocp_read_word(tp, MCU_TYPE_PLA, ocp_index);
+	*data = ocp_read_word(tp, MCU_TYPE_PLA, ocp_index);
+
+	return 0;
 }
 
-static void ocp_reg_write(struct r8152 *tp, u16 addr, u16 data)
+static int r8152_phy_write(struct r8152 *tp, u16 addr, u16 data)
 {
 	u16 ocp_base, ocp_index;
 
@@ -1669,16 +1680,33 @@ static void ocp_reg_write(struct r8152 *tp, u16 addr, u16 data)
 
 	ocp_index = (addr & 0x0fff) | 0xb000;
 	ocp_write_word(tp, MCU_TYPE_PLA, ocp_index, data);
+
+	return 0;
+}
+
+static int ocp_reg_read(struct r8152 *tp, u16 addr, u16 *data)
+{
+	return tp->rtl_ops.phy_read(tp, addr, data);
 }
 
-static inline void r8152_mdio_write(struct r8152 *tp, u32 reg_addr, u32 value)
+static int ocp_reg_write(struct r8152 *tp, u16 addr, u16 data)
 {
-	ocp_reg_write(tp, OCP_BASE_MII + reg_addr * 2, value);
+	return tp->rtl_ops.phy_write(tp, addr, data);
 }
 
-static inline int r8152_mdio_read(struct r8152 *tp, u32 reg_addr)
+static inline int r8152_mdio_write(struct r8152 *tp, u32 reg_addr, u32 value)
 {
-	return ocp_reg_read(tp, OCP_BASE_MII + reg_addr * 2);
+	return ocp_reg_write(tp, OCP_BASE_MII + reg_addr * 2, value);
+}
+
+static int r8152_mdio_read(struct r8152 *tp, u32 reg_addr)
+{
+	u16 data;
+	int ret;
+
+	ret = ocp_reg_read(tp, OCP_BASE_MII + reg_addr * 2, &data);
+
+	return ret < 0 ? ret : data;
 }
 
 static int wait_cmd_ready(struct r8152 *tp, u16 cmd)
@@ -1797,16 +1825,32 @@ static int rtl_ip_set_bits(struct r8152 *tp, u16 addr, u32 set)
 	return rtl_ip_w0w1(tp, addr, 0, set);
 }
 
-static void sram_write(struct r8152 *tp, u16 addr, u16 data)
+static int sram_write(struct r8152 *tp, u16 addr, u16 data)
 {
-	ocp_reg_write(tp, OCP_SRAM_ADDR, addr);
-	ocp_reg_write(tp, OCP_SRAM_DATA, data);
+	int ret;
+
+	ret = ocp_reg_write(tp, OCP_SRAM_ADDR, addr);
+	if (ret < 0)
+		goto out;
+
+	ret = ocp_reg_write(tp, OCP_SRAM_DATA, data);
+
+out:
+	return ret;
 }
 
-static u16 sram_read(struct r8152 *tp, u16 addr)
+static int sram_read(struct r8152 *tp, u16 addr, u16 *data)
 {
-	ocp_reg_write(tp, OCP_SRAM_ADDR, addr);
-	return ocp_reg_read(tp, OCP_SRAM_DATA);
+	int ret;
+
+	ret = ocp_reg_write(tp, OCP_SRAM_ADDR, addr);
+	if (ret < 0)
+		goto out;
+
+	ret = ocp_reg_read(tp, OCP_SRAM_DATA, data);
+
+out:
+	return ret;
 }
 
 static int read_mii_word(struct net_device *netdev, int phy_id, int reg)
@@ -1822,7 +1866,10 @@ static int read_mii_word(struct net_device *netdev, int phy_id, int reg)
 
 	ret = r8152_mdio_read(tp, reg);
 
-	return ret;
+	/* The MII library takes the return value for register content,
+	 * so a failed read must not be passed on as an errno.
+	 */
+	return ret < 0 ? 0 : ret;
 }
 
 static
@@ -1911,100 +1958,221 @@ static void ocp_byte_set_bits(struct r8152 *tp, u16 type, u16 index, u8 set)
 	ocp_byte_w0w1(tp, type, index, 0, set);
 }
 
-static void ocp_reg_w0w1(struct r8152 *tp, u16 addr, u16 clear, u16 set)
+static int ocp_reg_w0w1(struct r8152 *tp, u16 addr, u16 clear, u16 set)
 {
 	u16 data;
+	int ret;
+
+	ret = ocp_reg_read(tp, addr, &data);
+	if (ret < 0)
+		goto out;
 
-	data = ocp_reg_read(tp, addr);
 	data = (data & ~clear) | set;
-	ocp_reg_write(tp, addr, data);
+	ret = ocp_reg_write(tp, addr, data);
+
+out:
+	return ret;
 }
 
-static void ocp_reg_clr_bits(struct r8152 *tp, u16 addr, u16 clear)
+static int ocp_reg_clr_bits(struct r8152 *tp, u16 addr, u16 clear)
 {
-	ocp_reg_w0w1(tp, addr, clear, 0);
+	return ocp_reg_w0w1(tp, addr, clear, 0);
 }
 
-static void ocp_reg_set_bits(struct r8152 *tp, u16 addr, u16 set)
+static int ocp_reg_set_bits(struct r8152 *tp, u16 addr, u16 set)
 {
-	ocp_reg_w0w1(tp, addr, 0, set);
+	return ocp_reg_w0w1(tp, addr, 0, set);
 }
 
-static void sram_write_w0w1(struct r8152 *tp, u16 addr, u16 clear, u16 set)
+static int sram_write_w0w1(struct r8152 *tp, u16 addr, u16 clear, u16 set)
 {
 	u16 data;
+	int ret;
+
+	ret = sram_read(tp, addr, &data);
+	if (ret < 0)
+		goto out;
 
-	data = sram_read(tp, addr);
 	data = (data & ~clear) | set;
-	ocp_reg_write(tp, OCP_SRAM_DATA, data);
+	ret = ocp_reg_write(tp, OCP_SRAM_DATA, data);
+
+out:
+	return ret;
 }
 
-static void sram_clr_bits(struct r8152 *tp, u16 addr, u16 clear)
+static int sram_clr_bits(struct r8152 *tp, u16 addr, u16 clear)
 {
-	sram_write_w0w1(tp, addr, clear, 0);
+	return sram_write_w0w1(tp, addr, clear, 0);
 }
 
-static void sram_set_bits(struct r8152 *tp, u16 addr, u16 set)
+static int sram_set_bits(struct r8152 *tp, u16 addr, u16 set)
 {
-	sram_write_w0w1(tp, addr, 0, set);
+	return sram_write_w0w1(tp, addr, 0, set);
 }
 
-static void sram2_write(struct r8152 *tp, u16 addr, u16 data)
+static int sram2_write(struct r8152 *tp, u16 addr, u16 data)
 {
-	ocp_reg_write(tp, OCP_SRAM2_ADDR, addr);
-	ocp_reg_write(tp, OCP_SRAM2_DATA, data);
+	int ret;
+
+	ret = ocp_reg_write(tp, OCP_SRAM2_ADDR, addr);
+	if (ret < 0)
+		goto out;
+
+	ret = ocp_reg_write(tp, OCP_SRAM2_DATA, data);
+
+out:
+	return ret;
 }
 
-static u16 sram2_read(struct r8152 *tp, u16 addr)
+static int sram2_read(struct r8152 *tp, u16 addr, u16 *data)
 {
-	ocp_reg_write(tp, OCP_SRAM2_ADDR, addr);
-	return ocp_reg_read(tp, OCP_SRAM2_DATA);
+	int ret;
+
+	ret = ocp_reg_write(tp, OCP_SRAM2_ADDR, addr);
+	if (ret < 0)
+		goto out;
+
+	ret = ocp_reg_read(tp, OCP_SRAM2_DATA, data);
+
+out:
+	return ret;
 }
 
-static void sram2_write_w0w1(struct r8152 *tp, u16 addr, u16 clear, u16 set)
+static int sram2_write_w0w1(struct r8152 *tp, u16 addr, u16 clear, u16 set)
 {
 	u16 data;
+	int ret;
+
+	ret = sram2_read(tp, addr, &data);
+	if (ret < 0)
+		goto out;
 
-	data = sram2_read(tp, addr);
 	data = (data & ~clear) | set;
-	ocp_reg_write(tp, OCP_SRAM2_DATA, data);
+	ret = ocp_reg_write(tp, OCP_SRAM2_DATA, data);
+
+out:
+	return ret;
 }
 
-static void sram2_set_bits(struct r8152 *tp, u16 addr, u16 set)
+static int sram2_set_bits(struct r8152 *tp, u16 addr, u16 set)
 {
-	sram2_write_w0w1(tp, addr, 0, set);
+	return sram2_write_w0w1(tp, addr, 0, set);
 }
 
-static void sram2_clr_bits(struct r8152 *tp, u16 addr, u16 clear)
+static int sram2_clr_bits(struct r8152 *tp, u16 addr, u16 clear)
 {
-	sram2_write_w0w1(tp, addr, clear, 0);
+	return sram2_write_w0w1(tp, addr, clear, 0);
 }
 
-static void r8152_mdio_clr_bit(struct r8152 *tp, u16 addr, u16 clear)
+static int r8152_mdio_clr_bit(struct r8152 *tp, u16 addr, u16 clear)
 {
 	int data;
 
 	data = r8152_mdio_read(tp, addr);
-	r8152_mdio_write(tp, addr, data & ~clear);
+	if (data < 0)
+		goto out;
+
+	data = r8152_mdio_write(tp, addr, data & ~clear);
+
+out:
+	return data;
 }
 
-static void r8152_mdio_set_bit(struct r8152 *tp, u16 addr, u16 set)
+static int r8152_mdio_set_bit(struct r8152 *tp, u16 addr, u16 set)
 {
 	int data;
 
 	data = r8152_mdio_read(tp, addr);
-	r8152_mdio_write(tp, addr, data | set);
+	if (data < 0)
+		goto out;
+
+	data = r8152_mdio_write(tp, addr, data | set);
+
+out:
+	return data;
 }
 
 static int r8152_mdio_test_and_clr_bit(struct r8152 *tp, u16 addr, u16 clear)
 {
-	int data;
+	int data, ret;
 
-	data = r8152_mdio_read(tp, addr);
-	if (data & clear)
-		r8152_mdio_write(tp, addr, data & ~clear);
+	ret = r8152_mdio_read(tp, addr);
+	if (ret < 0)
+		goto out;
+
+	data = ret;
+	if (data & clear) {
+		ret = r8152_mdio_write(tp, addr, data & ~clear);
+		if (ret < 0)
+			goto out;
+	}
+
+	ret = !!(data & clear);
+
+out:
+	return ret;
+}
+
+static int wait_tgphy_cmd_ready(struct r8152 *tp)
+{
+	u16 ocp_data;
+	int ret;
+
+	ret = read_poll_timeout(ocp_read_word, ocp_data,
+				test_bit(RTL8152_INACCESSIBLE, &tp->flags) ||
+				!(ocp_data & TGPHY_CMD_BUSY),
+				2000, 20000, false, tp,
+				MCU_TYPE_USB, USB_TGPHY_CMD);
+
+	if (ret)
+		dev_err_ratelimited(&tp->intf->dev, "TGPHY cmd busy timeout\n");
+
+	return test_bit(RTL8152_INACCESSIBLE, &tp->flags) ? -ENODEV : ret;
+}
+
+static int rtl_tgphy_access(struct r8152 *tp, u16 addr, u16 *data, bool write)
+{
+	u16 cmd = 0;
+	int ret;
+
+	ret = wait_tgphy_cmd_ready(tp);
+	if (ret < 0)
+		goto out;
+
+	if (write) {
+		cmd |= TGPHY_CMD_WR;
+		ocp_write_word(tp, MCU_TYPE_USB, USB_TGPHY_DATA, *data);
+	}
 
-	return data & clear;
+	ocp_write_word(tp, MCU_TYPE_USB, USB_TGPHY_ADDR, addr);
+
+	cmd |= TGPHY_CMD_BUSY;
+	ocp_write_word(tp, MCU_TYPE_USB, USB_TGPHY_CMD, cmd);
+
+	if (!write) {
+		ret = wait_tgphy_cmd_ready(tp);
+		if (ret < 0)
+			goto out;
+
+		*data = ocp_read_word(tp, MCU_TYPE_USB, USB_TGPHY_DATA);
+	}
+
+out:
+	/* A failed control transfer latches RTL8152_INACCESSIBLE */
+	if (!ret && test_bit(RTL8152_INACCESSIBLE, &tp->flags))
+		ret = -ENODEV;
+
+	return ret;
+}
+
+static int r8157_phy_read(struct r8152 *tp, u16 addr, u16 *data)
+{
+	return rtl_tgphy_access(tp, addr, data, false);
+}
+
+static int r8157_phy_write(struct r8152 *tp, u16 addr, u16 data)
+{
+	return rtl_tgphy_access(tp, addr, &data, true);
 }
 
 static int
@@ -4187,18 +4355,20 @@ static void r8153b_green_en(struct r8152 *tp, bool enable)
 
 static u16 r8153_phy_status(struct r8152 *tp, u16 desired)
 {
-	u16 data;
+	u16 data = 0, val;
 	int i;
 
 	for (i = 0; i < 500; i++) {
-		data = ocp_reg_read(tp, OCP_PHY_STATUS);
-		data &= PHY_STAT_MASK;
-		if (desired) {
-			if (data == desired)
+		if (!ocp_reg_read(tp, OCP_PHY_STATUS, &val)) {
+			data = val & PHY_STAT_MASK;
+			if (desired) {
+				if (data == desired)
+					break;
+			} else if (data == PHY_STAT_LAN_ON ||
+				   data == PHY_STAT_PWRDN ||
+				   data == PHY_STAT_EXT_INIT) {
 				break;
-		} else if (data == PHY_STAT_LAN_ON || data == PHY_STAT_PWRDN ||
-			   data == PHY_STAT_EXT_INIT) {
-			break;
+			}
 		}
 
 		msleep(20);
@@ -4597,36 +4767,52 @@ static inline void rtl_reset_ocp_base(struct r8152 *tp)
 static int rtl_phy_patch_request(struct r8152 *tp, bool request, bool wait)
 {
 	u16 check;
-	int i;
+	u16 ocp_data;
+	int i, ret;
 
 	if (request) {
-		ocp_reg_set_bits(tp, OCP_PHY_PATCH_CMD, PATCH_REQUEST);
+		ret = ocp_reg_set_bits(tp, OCP_PHY_PATCH_CMD, PATCH_REQUEST);
 		check = 0;
 	} else {
-		ocp_reg_clr_bits(tp, OCP_PHY_PATCH_CMD, PATCH_REQUEST);
+		ret = ocp_reg_clr_bits(tp, OCP_PHY_PATCH_CMD, PATCH_REQUEST);
 		check = PATCH_READY;
 	}
 
-	for (i = 0; wait && i < 5000; i++) {
-		u32 ocp_data;
+	if (ret < 0)
+		return ret;
 
-		if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
-			return -ENODEV;
+	for (i = 0; wait && i < 5000; i++) {
+		if (test_bit(RTL8152_INACCESSIBLE, &tp->flags)) {
+			ret = -ENODEV;
+			goto err;
+		}
 
 		usleep_range(1000, 2000);
-		ocp_data = ocp_reg_read(tp, OCP_PHY_PATCH_STAT);
-		if ((ocp_data & PATCH_READY) ^ check)
+		ret = ocp_reg_read(tp, OCP_PHY_PATCH_STAT, &ocp_data);
+		if (ret < 0)
+			goto err;
+		else if ((ocp_data & PATCH_READY) ^ check)
 			break;
 	}
 
-	if (request && wait &&
-	    !(ocp_reg_read(tp, OCP_PHY_PATCH_STAT) & PATCH_READY)) {
-		dev_err(&tp->intf->dev, "PHY patch request fail\n");
-		rtl_phy_patch_request(tp, false, false);
-		return -ETIME;
-	} else {
-		return 0;
+	if (request && wait) {
+		ret = ocp_reg_read(tp, OCP_PHY_PATCH_STAT, &ocp_data);
+		if (ret < 0) {
+			goto err;
+		} else if (!(ocp_data & PATCH_READY)) {
+			dev_err(&tp->intf->dev, "PHY patch request fail\n");
+			ret = -ETIME;
+			goto err;
+		}
 	}
+
+	return 0;
+
+err:
+	if (request)
+		rtl_phy_patch_request(tp, false, false);
+
+	return ret;
 }
 
 static void rtl_patch_key_set(struct r8152 *tp, u16 key_addr, u16 patch_key)
@@ -4646,8 +4832,11 @@ static void rtl_patch_key_set(struct r8152 *tp, u16 key_addr, u16 patch_key)
 static int
 rtl_pre_ram_code(struct r8152 *tp, u16 key_addr, u16 patch_key, bool wait)
 {
-	if (rtl_phy_patch_request(tp, true, wait))
-		return -ETIME;
+	int ret;
+
+	ret = rtl_phy_patch_request(tp, true, wait);
+	if (ret)
+		return ret;
 
 	rtl_patch_key_set(tp, key_addr, patch_key);
 
@@ -5347,10 +5536,14 @@ static void rtl_ram_code_speed_up(struct r8152 *tp, struct fw_phy_speed_up *phy,
 {
 	u32 len;
 	u8 *data;
+	u16 ver;
 
 	rtl_reset_ocp_base(tp);
 
-	if (sram_read(tp, SRAM_GPHY_FW_VER) >= __le16_to_cpu(phy->version)) {
+	if (sram_read(tp, SRAM_GPHY_FW_VER, &ver) < 0)
+		return;
+
+	if (ver >= __le16_to_cpu(phy->version)) {
 		dev_dbg(&tp->intf->dev, "PHY firmware has been the newest\n");
 		return;
 	}
@@ -5397,7 +5590,8 @@ static void rtl_ram_code_speed_up(struct r8152 *tp, struct fw_phy_speed_up *phy,
 
 	rtl_phy_patch_request(tp, false, wait);
 
-	if (sram_read(tp, SRAM_GPHY_FW_VER) == __le16_to_cpu(phy->version))
+	if (sram_read(tp, SRAM_GPHY_FW_VER, &ver) >= 0 &&
+	    ver == __le16_to_cpu(phy->version))
 		dev_dbg(&tp->intf->dev, "successfully applied %s\n", phy->info);
 	else
 		dev_err(&tp->intf->dev, "ram code speedup mode fail\n");
@@ -5405,14 +5599,17 @@ static void rtl_ram_code_speed_up(struct r8152 *tp, struct fw_phy_speed_up *phy,
 
 static int rtl8152_fw_phy_ver(struct r8152 *tp, struct fw_phy_ver *phy_ver)
 {
-	u16 ver_addr, ver;
+	u16 ver_addr, ver, cur_ver;
 
 	ver_addr = __le16_to_cpu(phy_ver->ver.addr);
 	ver = __le16_to_cpu(phy_ver->ver.data);
 
 	rtl_reset_ocp_base(tp);
 
-	if (sram_read(tp, ver_addr) >= ver) {
+	if (sram_read(tp, ver_addr, &cur_ver) < 0)
+		return 0;
+
+	if (cur_ver >= ver) {
 		dev_dbg(&tp->intf->dev, "PHY firmware has been the newest\n");
 		return 0;
 	}
@@ -5431,7 +5628,8 @@ static void rtl8152_fw_phy_fixup(struct r8152 *tp, struct fw_phy_fixup *fix)
 	rtl_reset_ocp_base(tp);
 
 	addr = __le16_to_cpu(fix->setting.addr);
-	data = ocp_reg_read(tp, addr);
+	if (ocp_reg_read(tp, addr, &data) < 0)
+		return;
 
 	switch (__le16_to_cpu(fix->bit_cmd)) {
 	case FW_FIXUP_AND:
@@ -5735,10 +5933,10 @@ static inline void r8152_mmd_indirect(struct r8152 *tp, u16 dev, u16 reg)
 
 static u16 r8152_mmd_read(struct r8152 *tp, u16 dev, u16 reg)
 {
-	u16 data;
+	u16 data = 0;
 
 	r8152_mmd_indirect(tp, dev, reg);
-	data = ocp_reg_read(tp, OCP_EEE_DATA);
+	ocp_reg_read(tp, OCP_EEE_DATA, &data);
 	ocp_reg_write(tp, OCP_EEE_AR, 0x0000);
 
 	return data;
@@ -5803,7 +6001,8 @@ static void r8156_eee_en(struct r8152 *tp, bool enable)
 
 	r8153_eee_en(tp, enable);
 
-	config = ocp_reg_read(tp, OCP_EEE_ADV2);
+	if (ocp_reg_read(tp, OCP_EEE_ADV2, &config) < 0)
+		return;
 
 	if (enable && (tp->eee_adv2 & MDIO_EEE_2_5GT))
 		config |= MDIO_EEE_2_5GT;
@@ -6359,8 +6558,8 @@ static void r8153b_hw_phy_cfg(struct r8152 *tp)
 	 * rg_saw_cnt = OCP reg 0xC426 Bit[13:0]
 	 * swr_cnt_1ms_ini = 16000000 / rg_saw_cnt
 	 */
-	ocp_data = ocp_reg_read(tp, 0xc426);
-	ocp_data &= 0x3fff;
+	ocp_reg_read(tp, 0xc426, &data);
+	ocp_data = data & 0x3fff;
 	if (ocp_data) {
 		u32 swr_cnt_1ms_ini;
 
@@ -6645,6 +6844,9 @@ static int rtl8152_set_speed(struct r8152 *tp, u8 autoneg, u32 speed, u8 duplex,
 			     u32 advertising)
 {
 	u16 bmcr;
+	u32 speed_duplex = tp->ups_info.speed_duplex;
+	bool full_duplex = tp->mii.full_duplex;
+	bool force_media;
 	int ret = 0;
 
 	if (autoneg == AUTONEG_DISABLE) {
@@ -6656,24 +6858,24 @@ static int rtl8152_set_speed(struct r8152 *tp, u8 autoneg, u32 speed, u8 duplex,
 			bmcr = BMCR_SPEED10;
 			if (duplex == DUPLEX_FULL) {
 				bmcr |= BMCR_FULLDPLX;
-				tp->ups_info.speed_duplex = FORCE_10M_FULL;
+				speed_duplex = FORCE_10M_FULL;
 			} else {
-				tp->ups_info.speed_duplex = FORCE_10M_HALF;
+				speed_duplex = FORCE_10M_HALF;
 			}
 			break;
 		case SPEED_100:
 			bmcr = BMCR_SPEED100;
 			if (duplex == DUPLEX_FULL) {
 				bmcr |= BMCR_FULLDPLX;
-				tp->ups_info.speed_duplex = FORCE_100M_FULL;
+				speed_duplex = FORCE_100M_FULL;
 			} else {
-				tp->ups_info.speed_duplex = FORCE_100M_HALF;
+				speed_duplex = FORCE_100M_HALF;
 			}
 			break;
 		case SPEED_1000:
 			if (tp->mii.supports_gmii) {
 				bmcr = BMCR_SPEED1000 | BMCR_FULLDPLX;
-				tp->ups_info.speed_duplex = NWAY_1000M_FULL;
+				speed_duplex = NWAY_1000M_FULL;
 				break;
 			}
 			fallthrough;
@@ -6682,12 +6884,8 @@ static int rtl8152_set_speed(struct r8152 *tp, u8 autoneg, u32 speed, u8 duplex,
 			goto out;
 		}
 
-		if (duplex == DUPLEX_FULL)
-			tp->mii.full_duplex = 1;
-		else
-			tp->mii.full_duplex = 0;
-
-		tp->mii.force_media = 1;
+		full_duplex = duplex == DUPLEX_FULL;
+		force_media = true;
 	} else {
 		u16 orig, new1;
 		u32 support;
@@ -6712,92 +6910,127 @@ static int rtl8152_set_speed(struct r8152 *tp, u8 autoneg, u32 speed, u8 duplex,
 		if (!advertising)
 			return -EINVAL;
 
-		orig = r8152_mdio_read(tp, MII_ADVERTISE);
+		ret = r8152_mdio_read(tp, MII_ADVERTISE);
+		if (ret < 0)
+			goto out;
+
+		orig = ret;
 		new1 = orig & ~(ADVERTISE_10HALF | ADVERTISE_10FULL |
 				ADVERTISE_100HALF | ADVERTISE_100FULL);
 		if (advertising & RTL_ADVERTISED_10_HALF) {
 			new1 |= ADVERTISE_10HALF;
-			tp->ups_info.speed_duplex = NWAY_10M_HALF;
+			speed_duplex = NWAY_10M_HALF;
 		}
 		if (advertising & RTL_ADVERTISED_10_FULL) {
 			new1 |= ADVERTISE_10FULL;
-			tp->ups_info.speed_duplex = NWAY_10M_FULL;
+			speed_duplex = NWAY_10M_FULL;
 		}
 
 		if (advertising & RTL_ADVERTISED_100_HALF) {
 			new1 |= ADVERTISE_100HALF;
-			tp->ups_info.speed_duplex = NWAY_100M_HALF;
+			speed_duplex = NWAY_100M_HALF;
 		}
 		if (advertising & RTL_ADVERTISED_100_FULL) {
 			new1 |= ADVERTISE_100FULL;
-			tp->ups_info.speed_duplex = NWAY_100M_FULL;
+			speed_duplex = NWAY_100M_FULL;
 		}
 
 		if (orig != new1) {
-			r8152_mdio_write(tp, MII_ADVERTISE, new1);
+			ret = r8152_mdio_write(tp, MII_ADVERTISE, new1);
+			if (ret < 0)
+				goto out;
+
 			tp->mii.advertising = new1;
 		}
 
 		if (tp->mii.supports_gmii) {
-			orig = r8152_mdio_read(tp, MII_CTRL1000);
+			ret = r8152_mdio_read(tp, MII_CTRL1000);
+			if (ret < 0)
+				goto out;
+
+			orig = ret;
 			new1 = orig & ~(ADVERTISE_1000FULL |
 					ADVERTISE_1000HALF);
 
 			if (advertising & RTL_ADVERTISED_1000_FULL) {
 				new1 |= ADVERTISE_1000FULL;
-				tp->ups_info.speed_duplex = NWAY_1000M_FULL;
+				speed_duplex = NWAY_1000M_FULL;
 			}
 
-			if (orig != new1)
-				r8152_mdio_write(tp, MII_CTRL1000, new1);
+			if (orig != new1) {
+				ret = r8152_mdio_write(tp, MII_CTRL1000, new1);
+				if (ret < 0)
+					goto out;
+			}
 		}
 
-		if (tp->support_2500full || tp->support_5000full || tp->support_10000full) {
-			orig = ocp_reg_read(tp, OCP_10GBT_CTRL);
-			new1 = orig & ~(MDIO_AN_10GBT_CTRL_ADV2_5G | MDIO_AN_10GBT_CTRL_ADV5G
-					| MDIO_AN_10GBT_CTRL_ADV10G);
+		if (tp->support_2500full || tp->support_5000full ||
+		    tp->support_10000full) {
+			ret = ocp_reg_read(tp, OCP_10GBT_CTRL, &orig);
+			if (ret < 0)
+				goto out;
+
+			new1 = orig & ~(MDIO_AN_10GBT_CTRL_ADV2_5G |
+					MDIO_AN_10GBT_CTRL_ADV5G |
+					MDIO_AN_10GBT_CTRL_ADV10G);
 
 			if (advertising & RTL_ADVERTISED_2500_FULL) {
 				new1 |= MDIO_AN_10GBT_CTRL_ADV2_5G;
-				tp->ups_info.speed_duplex = NWAY_2500M_FULL;
+				speed_duplex = NWAY_2500M_FULL;
 			}
 
 			if (advertising & RTL_ADVERTISED_5000_FULL) {
 				new1 |= MDIO_AN_10GBT_CTRL_ADV5G;
-				tp->ups_info.speed_duplex = NWAY_5000M_FULL;
+				speed_duplex = NWAY_5000M_FULL;
 			}
 
 			if (advertising & RTL_ADVERTISED_10000_FULL) {
 				new1 |= MDIO_AN_10GBT_CTRL_ADV10G;
-				tp->ups_info.speed_duplex = NWAY_10000M_FULL;
+				speed_duplex = NWAY_10000M_FULL;
 			}
 
-			if (orig != new1)
-				ocp_reg_write(tp, OCP_10GBT_CTRL, new1);
+			if (orig != new1) {
+				ret = ocp_reg_write(tp, OCP_10GBT_CTRL, new1);
+				if (ret < 0)
+					goto out;
+			}
 		}
 
 		bmcr = BMCR_ANENABLE | BMCR_ANRESTART;
 
-		tp->mii.force_media = 0;
+		force_media = false;
 	}
 
 	if (test_and_clear_bit(PHY_RESET, &tp->flags))
 		bmcr |= BMCR_RESET;
 
-	r8152_mdio_write(tp, MII_BMCR, bmcr);
+	ret = r8152_mdio_write(tp, MII_BMCR, bmcr);
+	if (ret < 0) {
+		if (bmcr & BMCR_RESET)
+			set_bit(PHY_RESET, &tp->flags);
+		goto out;
+	}
+
+	tp->ups_info.speed_duplex = speed_duplex;
+	tp->mii.full_duplex = full_duplex;
+	tp->mii.force_media = force_media;
 
 	if (bmcr & BMCR_RESET) {
 		int i;
 
 		for (i = 0; i < 50; i++) {
 			msleep(20);
-			if ((r8152_mdio_read(tp, MII_BMCR) & BMCR_RESET) == 0)
+			ret = r8152_mdio_read(tp, MII_BMCR);
+			if (ret < 0 || !(ret & BMCR_RESET))
 				break;
 		}
+
+		/* The new settings are already applied and cached. */
+		ret = 0;
 	}
 
 out:
-	return ret;
+	return ret < 0 ? ret : 0;
 }
 
 static void rtl8152_up(struct r8152 *tp)
@@ -7213,7 +7446,12 @@ static bool rtl8152_in_nway(struct r8152 *tp)
 
 static bool rtl8153_in_nway(struct r8152 *tp)
 {
-	u16 phy_state = ocp_reg_read(tp, OCP_PHY_STATE) & 0xff;
+	u16 phy_state;
+
+	if (ocp_reg_read(tp, OCP_PHY_STATE, &phy_state) < 0)
+		return true;
+
+	phy_state &= 0xff;
 
 	if (phy_state == TXDIS_STATE || phy_state == ABD_STATE)
 		return false;
@@ -7229,7 +7467,9 @@ static void r8156_mdio_force_mode(struct r8152 *tp)
 	 * 0: MDIO force mode
 	 * 1: MMD force mode
 	 */
-	data = ocp_reg_read(tp, 0xa5b4);
+	if (ocp_reg_read(tp, 0xa5b4, &data) < 0)
+		return;
+
 	if (data & BIT(15)) {
 		data &= ~BIT(15);
 		ocp_reg_write(tp, 0xa5b4, data);
@@ -7240,8 +7480,13 @@ static void set_carrier(struct r8152 *tp)
 {
 	struct net_device *netdev = tp->netdev;
 	struct napi_struct *napi = &tp->napi;
+	int bmsr;
 
-	if (r8152_mdio_read(tp, MII_BMSR) & BMSR_LSTATUS) {
+	bmsr = r8152_mdio_read(tp, MII_BMSR);
+	if (bmsr < 0)
+		return;
+
+	if (bmsr & BMSR_LSTATUS) {
 		if (!netif_carrier_ok(netdev)) {
 			tp->rtl_ops.enable(tp);
 			netif_stop_queue(netdev);
@@ -7869,19 +8114,20 @@ static void r8156_hw_phy_cfg(struct r8152 *tp)
 		ocp_reg_clr_bits(tp, 0xa86a, BIT(0));
 
 		/* MDI SWAP */
+		ocp_reg_read(tp, 0xd068, &data);
 		if ((ocp_read_word(tp, MCU_TYPE_USB, USB_UPS_CFG) & MID_REVERSE) &&
-		    (ocp_reg_read(tp, 0xd068) & BIT(1))) {
+		    (data & BIT(1))) {
 			u16 swap_a, swap_b;
 
-			data = ocp_reg_read(tp, 0xd068);
+			ocp_reg_read(tp, 0xd068, &data);
 			data &= ~0x1f;
 			data |= 0x1; /* p0 */
 			ocp_reg_write(tp, 0xd068, data);
-			swap_a = ocp_reg_read(tp, 0xd06a);
+			ocp_reg_read(tp, 0xd06a, &swap_a);
 			data &= ~0x18;
 			data |= 0x18; /* p3 */
 			ocp_reg_write(tp, 0xd068, data);
-			swap_b = ocp_reg_read(tp, 0xd06a);
+			ocp_reg_read(tp, 0xd06a, &swap_b);
 			data &= ~0x18; /* p0 */
 			ocp_reg_write(tp, 0xd068, data);
 			ocp_reg_write(tp, 0xd06a,
@@ -7893,11 +8139,11 @@ static void r8156_hw_phy_cfg(struct r8152 *tp)
 			data &= ~0x18;
 			data |= 0x08; /* p1 */
 			ocp_reg_write(tp, 0xd068, data);
-			swap_a = ocp_reg_read(tp, 0xd06a);
+			ocp_reg_read(tp, 0xd06a, &swap_a);
 			data &= ~0x18;
 			data |= 0x10; /* p2 */
 			ocp_reg_write(tp, 0xd068, data);
-			swap_b = ocp_reg_read(tp, 0xd06a);
+			ocp_reg_read(tp, 0xd06a, &swap_b);
 			data &= ~0x18;
 			data |= 0x08; /* p1 */
 			ocp_reg_write(tp, 0xd068, data);
@@ -7908,16 +8154,16 @@ static void r8156_hw_phy_cfg(struct r8152 *tp)
 			ocp_reg_write(tp, 0xd068, data);
 			ocp_reg_write(tp, 0xd06a,
 				      (swap_b & ~0x7ff) | (swap_a & 0x7ff));
-			swap_a = ocp_reg_read(tp, 0xbd5a);
-			swap_b = ocp_reg_read(tp, 0xbd5c);
+			ocp_reg_read(tp, 0xbd5a, &swap_a);
+			ocp_reg_read(tp, 0xbd5c, &swap_b);
 			ocp_reg_write(tp, 0xbd5a, (swap_a & ~0x1f1f) |
 				      ((swap_b & 0x1f) << 8) |
 				      ((swap_b >> 8) & 0x1f));
 			ocp_reg_write(tp, 0xbd5c, (swap_b & ~0x1f1f) |
 				      ((swap_a & 0x1f) << 8) |
 				      ((swap_a >> 8) & 0x1f));
-			swap_a = ocp_reg_read(tp, 0xbc18);
-			swap_b = ocp_reg_read(tp, 0xbc1a);
+			ocp_reg_read(tp, 0xbc18, &swap_a);
+			ocp_reg_read(tp, 0xbc1a, &swap_b);
 			ocp_reg_write(tp, 0xbc18, (swap_a & ~0x1f1f) |
 				      ((swap_b & 0x1f) << 8) |
 				      ((swap_b >> 8) & 0x1f));
@@ -9396,8 +9642,15 @@ int rtl8152_get_link_ksettings(struct net_device *netdev,
 			 cmd->link_modes.supported, tp->support_10000full);
 
 	if (tp->support_2500full || tp->support_5000full || tp->support_10000full) {
-		u16 ocp_10gbt_ctrl = ocp_reg_read(tp, OCP_10GBT_CTRL);
-		u16 ocp_10gbt_stat = ocp_reg_read(tp, OCP_10GBT_STAT);
+		u16 ocp_10gbt_ctrl, ocp_10gbt_stat;
+
+		ret = ocp_reg_read(tp, OCP_10GBT_CTRL, &ocp_10gbt_ctrl);
+		if (ret < 0)
+			goto out_unlock;
+
+		ret = ocp_reg_read(tp, OCP_10GBT_STAT, &ocp_10gbt_stat);
+		if (ret < 0)
+			goto out_unlock;
 
 		if (tp->support_2500full) {
 			linkmode_mod_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT,
@@ -9439,6 +9692,7 @@ int rtl8152_get_link_ksettings(struct net_device *netdev,
 		}
 	}
 
+out_unlock:
 	mutex_unlock(&tp->control);
 
 	usb_autopm_put_interface(tp->intf);
@@ -9625,21 +9879,37 @@ static int r8153_get_eee(struct r8152 *tp, struct ethtool_keee *eee)
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(common) = {};
 	u16 speed = rtl8152_get_speed(tp);
 	u16 val;
+	int ret;
+
+	ret = ocp_reg_read(tp, OCP_EEE_ABLE, &val);
+	if (ret < 0)
+		goto out;
 
-	val = ocp_reg_read(tp, OCP_EEE_ABLE);
 	mii_eee_cap1_mod_linkmode_t(eee->supported, val);
 
-	val = ocp_reg_read(tp, OCP_EEE_ADV);
+	ret = ocp_reg_read(tp, OCP_EEE_ADV, &val);
+	if (ret < 0)
+		goto out;
+
 	mii_eee_cap1_mod_linkmode_t(eee->advertised, val);
 
-	val = ocp_reg_read(tp, OCP_EEE_LPABLE);
+	ret = ocp_reg_read(tp, OCP_EEE_LPABLE, &val);
+	if (ret < 0)
+		goto out;
+
 	mii_eee_cap1_mod_linkmode_t(eee->lp_advertised, val);
 
 	if (tp->support_2500full || tp->support_5000full) {
-		val = ocp_reg_read(tp, OCP_EEE_ADV2);
+		ret = ocp_reg_read(tp, OCP_EEE_ADV2, &val);
+		if (ret < 0)
+			goto out;
+
 		mii_eee_cap2_mod_linkmode_adv_t(eee->advertised, val);
 
-		val = ocp_reg_read(tp, OCP_EEE_LPABLE2);
+		ret = ocp_reg_read(tp, OCP_EEE_LPABLE2, &val);
+		if (ret < 0)
+			goto out;
+
 		mii_eee_cap2_mod_linkmode_adv_t(eee->lp_advertised, val);
 	}
 
@@ -9675,7 +9945,8 @@ static int r8153_get_eee(struct r8152 *tp, struct ethtool_keee *eee)
 	linkmode_and(common, common, eee->lp_advertised);
 	eee->eee_active = !linkmode_empty(common);
 
-	return 0;
+out:
+	return ret < 0 ? ret : 0;
 }
 
 static int
@@ -9915,7 +10186,7 @@ static int rtl8152_set_ringparam(struct net_device *netdev,
 static void rtl8152_get_pauseparam(struct net_device *netdev, struct ethtool_pauseparam *pause)
 {
 	struct r8152 *tp = netdev_priv(netdev);
-	u16 bmcr, lcladv, rmtadv;
+	int bmcr, lcladv, rmtadv;
 	u8 cap;
 
 	if (usb_autopm_get_interface(tp->intf) < 0)
@@ -9931,7 +10202,10 @@ static void rtl8152_get_pauseparam(struct net_device *netdev, struct ethtool_pau
 
 	usb_autopm_put_interface(tp->intf);
 
-	if (!(bmcr & BMCR_ANENABLE)) {
+	/* Without a readable PHY, or with autoneg off, there is no flow
+	 * control to report.
+	 */
+	if (bmcr < 0 || lcladv < 0 || rmtadv < 0 || !(bmcr & BMCR_ANENABLE)) {
 		pause->autoneg = 0;
 		pause->rx_pause = 0;
 		pause->tx_pause = 0;
@@ -9962,7 +10236,11 @@ static int rtl8152_set_pauseparam(struct net_device *netdev, struct ethtool_paus
 
 	mutex_lock(&tp->control);
 
-	if (pause->autoneg && !(r8152_mdio_read(tp, MII_BMCR) & BMCR_ANENABLE)) {
+	ret = r8152_mdio_read(tp, MII_BMCR);
+	if (ret < 0)
+		goto out;
+
+	if (pause->autoneg && !(ret & BMCR_ANENABLE)) {
 		ret = -EINVAL;
 		goto out;
 	}
@@ -9973,16 +10251,20 @@ static int rtl8152_set_pauseparam(struct net_device *netdev, struct ethtool_paus
 	if (pause->tx_pause)
 		cap |= FLOW_CTRL_TX;
 
-	old = r8152_mdio_read(tp, MII_ADVERTISE);
+	ret = r8152_mdio_read(tp, MII_ADVERTISE);
+	if (ret < 0)
+		goto out;
+
+	old = ret;
 	new1 = (old & ~(ADVERTISE_PAUSE_CAP | ADVERTISE_PAUSE_ASYM)) | mii_advertise_flowctrl(cap);
 	if (old != new1)
-		r8152_mdio_write(tp, MII_ADVERTISE, new1);
+		ret = r8152_mdio_write(tp, MII_ADVERTISE, new1);
 
 out:
 	mutex_unlock(&tp->control);
 	usb_autopm_put_interface(tp->intf);
 
-	return ret;
+	return ret < 0 ? ret : 0;
 }
 
 static const struct ethtool_ops ops = {
@@ -10016,7 +10298,7 @@ static int rtl8152_ioctl(struct net_device *netdev, struct ifreq *rq, int cmd)
 {
 	struct r8152 *tp = netdev_priv(netdev);
 	struct mii_ioctl_data *data = if_mii(rq);
-	int res;
+	int res, val;
 
 	if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
 		return -ENODEV;
@@ -10032,7 +10314,11 @@ static int rtl8152_ioctl(struct net_device *netdev, struct ifreq *rq, int cmd)
 
 	case SIOCGMIIREG:
 		mutex_lock(&tp->control);
-		data->val_out = r8152_mdio_read(tp, data->reg_num);
+		val = r8152_mdio_read(tp, data->reg_num);
+		if (val < 0)
+			res = val;
+		else
+			data->val_out = val;
 		mutex_unlock(&tp->control);
 		break;
 
@@ -10042,7 +10328,7 @@ static int rtl8152_ioctl(struct net_device *netdev, struct ifreq *rq, int cmd)
 			break;
 		}
 		mutex_lock(&tp->control);
-		r8152_mdio_write(tp, data->reg_num, data->val_in);
+		res = r8152_mdio_write(tp, data->reg_num, data->val_in);
 		mutex_unlock(&tp->control);
 		break;
 
@@ -10205,6 +10491,8 @@ static int rtl_ops_init(struct r8152 *tp)
 		ops->in_nway		= rtl8152_in_nway;
 		ops->hw_phy_cfg		= r8152b_hw_phy_cfg;
 		ops->autosuspend_en	= rtl_runtime_suspend_enable;
+		ops->phy_read		= r8152_phy_read;
+		ops->phy_write		= r8152_phy_write;
 		tp->rx_buf_sz		= 16 * 1024;
 		tp->eee_en		= true;
 		tp->eee_adv		= MDIO_EEE_100TX;
@@ -10227,6 +10515,8 @@ static int rtl_ops_init(struct r8152 *tp)
 		ops->hw_phy_cfg		= r8153_hw_phy_cfg;
 		ops->autosuspend_en	= rtl8153_runtime_enable;
 		ops->change_mtu		= rtl8153_change_mtu;
+		ops->phy_read		= r8152_phy_read;
+		ops->phy_write		= r8152_phy_write;
 		if (tp->udev->speed < USB_SPEED_SUPER)
 			tp->rx_buf_sz	= 16 * 1024;
 		else
@@ -10250,6 +10540,8 @@ static int rtl_ops_init(struct r8152 *tp)
 		ops->hw_phy_cfg		= r8153b_hw_phy_cfg;
 		ops->autosuspend_en	= rtl8153b_runtime_enable;
 		ops->change_mtu		= rtl8153_change_mtu;
+		ops->phy_read		= r8152_phy_read;
+		ops->phy_write		= r8152_phy_write;
 		tp->rx_buf_sz		= 32 * 1024;
 		tp->eee_en		= true;
 		tp->eee_adv		= MDIO_EEE_1000T | MDIO_EEE_100TX;
@@ -10274,6 +10566,8 @@ static int rtl_ops_init(struct r8152 *tp)
 		ops->hw_phy_cfg		= r8156_hw_phy_cfg;
 		ops->autosuspend_en	= rtl8156_runtime_enable;
 		ops->change_mtu		= rtl8156_change_mtu;
+		ops->phy_read		= r8152_phy_read;
+		ops->phy_write		= r8152_phy_write;
 		tp->rx_buf_sz		= 48 * 1024;
 		tp->support_2500full	= 1;
 		r8152_desc_init(tp);
@@ -10299,6 +10593,8 @@ static int rtl_ops_init(struct r8152 *tp)
 		ops->hw_phy_cfg		= r8156b_hw_phy_cfg;
 		ops->autosuspend_en	= rtl8156_runtime_enable;
 		ops->change_mtu		= rtl8156_change_mtu;
+		ops->phy_read		= r8152_phy_read;
+		ops->phy_write		= r8152_phy_write;
 		tp->rx_buf_sz		= 48 * 1024;
 		r8152_desc_init(tp);
 		break;
@@ -10316,6 +10612,8 @@ static int rtl_ops_init(struct r8152 *tp)
 		ops->hw_phy_cfg		= r8153c_hw_phy_cfg;
 		ops->autosuspend_en	= rtl8153c_runtime_enable;
 		ops->change_mtu		= rtl8153c_change_mtu;
+		ops->phy_read		= r8152_phy_read;
+		ops->phy_write		= r8152_phy_write;
 		tp->rx_buf_sz		= 32 * 1024;
 		tp->eee_en		= true;
 		tp->eee_adv		= MDIO_EEE_1000T | MDIO_EEE_100TX;
@@ -10338,6 +10636,8 @@ static int rtl_ops_init(struct r8152 *tp)
 		ops->hw_phy_cfg		= r8157_hw_phy_cfg;
 		ops->autosuspend_en	= rtl8157_runtime_enable;
 		ops->change_mtu		= rtl8157_change_mtu;
+		ops->phy_read		= r8157_phy_read;
+		ops->phy_write		= r8157_phy_write;
 		tp->rx_buf_sz		= 32 * 1024;
 		tp->support_2500full	= 1;
 		tp->support_5000full	= 1;
@@ -10361,6 +10661,8 @@ static int rtl_ops_init(struct r8152 *tp)
 		ops->hw_phy_cfg		= r8159_hw_phy_cfg;
 		ops->autosuspend_en	= rtl8157_runtime_enable;
 		ops->change_mtu		= rtl8157_change_mtu;
+		ops->phy_read		= r8157_phy_read;
+		ops->phy_write		= r8157_phy_write;
 		tp->rx_buf_sz		= 48 * 1024;
 		tp->support_2500full	= 1;
 		tp->support_5000full	= 1;
-- 
2.34.1

