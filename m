Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433866;
	b=yAB3JZn8ifNfK55XBiNhvwK5NKSumF7zLKlrompyq76/pGysCAsQJucHguLj86fAXnXa
	 xxwtBbOAOMaAFeZX6AVrJVya70Rbgrx9lDwB3dZ8mbcI2COxjtGVKjoFuS8rdltVywRCa
	 W+CFSXSL2/cdRit7n9i8WebN8OwEqwuAIsmSnpre9F8CC0U882+U5mivpPx84I+jtXDXl
	 bz4K6A6hFdXsjvYn2ubXDpHNrD+oidOn+/4Q51ap4kCCGuloLgszR8dF5Dqxtw5NEfRFT
	 TEZUYD5tCt1h3kKwVV6mTG58jYlil6egw8ELS/mqj1tTBVz06f+a6Oo64XLpIT82iaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433866;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=/LMRasrUDrIyQRML2g9DMrJg4enHdU4K8A0548fGU5M=;
	b=v4yJOYkVBU9JHk07AV01E6IZFQ9N+69DqexyxrADoGGZUA54iv9Qu6BQCnailu/ZUI3n
	 StnQkMkdpS98SunPpXatVfdPjpzS6Xdbldh6nugXm013zZF+lBpJB+Bb3zrVobWtu1ISJ
	 VyYhhfGBzaPhL8WIRgcRz5RCtw/84MwLrR99FN7q3lqLhwTyHMcDvKeCIV+mbopPdqZek
	 k5rS9MDRzh237gpps4RuvmO1+/vUzNThAoX1oXHy+lAM+XoozWx00ttq5ytgeBUDcIJ4v
	 a2XTH0rTe/GVbHvUgXxTkY9UothSthioYJvwyo3eyXMQE5fX4pzT8yTs/dcBecQVunw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=CxZ3bvhh;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B87460A5BC7;
	Mon, 23 Nov 2026 11:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B87460A5BC7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=CxZ3bvhh
X-UUID: 49dad288e73211f1b1788b6acf885367-20261123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/LMRasrUDrIyQRML2g9DMrJg4enHdU4K8A0548fGU5M=;
	b=CxZ3bvhhXtuwQcTDds1WrRay9qvpUHhDPYvzsvpt6waCgEyawiGTKnHnNcMDJicIE+XY5Q+z0WWVnpFlgd3g773F4kxE6X6uAGbGFTOpCqqy655nkCqYC/Rpn263DP47r918c0iG/YK/ahIj1pv+cmJfjCZYeQf0YdExC61Te0g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:a14f3ea6-5b88-47f0-a1bb-3202171885e2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:9df7f319-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 49dad288e73211f1b1788b6acf885367-20261123
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1016702683; Mon, 23 Nov 2026 19:37:39 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 19:37:38 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.53 via Frontend Transport; Mon, 23 Nov 2026 19:37:37 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mika Westerberg <westeri@kernel.org>
CC: Andreas Noever <andreas.noever@gmail.com>, Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>, Sven Peter <sven@kernel.org>, Yehezkel
 Bernat <YehezkelShB@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>
Subject: [PATCH v3 6/8] thunderbolt: Increase the lane adapter link-up timeout value
Date: Mon, 23 Nov 2026 19:36:53 +0800
Message-ID: <20261123113705.2297329-7-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
References: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
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
X-MTK: N

when plug into a USB3 device into USB4 hub's downstream facing port
to trigger USB4 driver wakeup, encounter the lane link up timeout
issue, then cause USB3 hub disconnect:

thunderbolt NVDA8100:00: 0:1: failed to reach state TB_PORT_UP. Ignoring port...
thunderbolt NVDA8100:00: 0:1: lost during suspend, disconnecting
thunderbolt NVDA8100:00: 0:4 <-> 1:16 (USB3): deactivating
thunderbolt NVDA8100:00: deactivating USB3 Down path from 0:4 to 1:16
thunderbolt NVDA8100:00: deactivating USB3 Up path from 1:16 to 0:4
thunderbolt NVDA8100:00: 0: TMU: mode change off -> bi-directional, HiFi requested
thunderbolt NVDA8100:00: 0: TMU: mode set to: bi-directional, HiFi
thunderbolt NVDA8100:00: 0:5: DP IN resource available after hotplug
thunderbolt NVDA8100:00: looking for DP IN <-> DP OUT pairs:
...
thunderbolt 0-0:1.1: retimer disconnected
thunderbolt 0-1:1.1: retimer disconnected
thunderbolt 0-1: device disconnected
usb 2-1: USB disconnect, device number 5

Completes link training at ~1.48s (with two retimer) and transitions
to TB_PORT_UP after change the timeout to 2s;

In the USB4 spec, Phase 5 (Link Equalization) alone is allowed up to
1000 ms. When add tPhase2~4 (200 ms), and retimer transaction delays
(tCmdResponse = 50 ms), the physical link is allowed by spec to take
1200 ms to 1500 ms+ to complete initialization.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: update commit message and kernel-doc
v2: change timeout from 2.5s to 2s
---
 drivers/thunderbolt/switch.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 7ff3da79da76..97e3fd8cdc0c 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -486,7 +486,7 @@ int tb_port_state(struct tb_port *port)
  * @port: Port to wait
  * @wait_if_unplugged: Wait also when port is unplugged
  *
- * Wait up to 1 second for a port to reach state TB_PORT_UP. If
+ * Wait up to 2 seconds for a port to reach state TB_PORT_UP. If
  * wait_if_unplugged is set then we also wait if the port is in state
  * TB_PORT_UNPLUGGED (it takes a while for the device to be registered after
  * switch resume). Otherwise we only wait if a device is registered but the link
@@ -494,13 +494,13 @@ int tb_port_state(struct tb_port *port)
  *
  * Return:
  * * %0 - If the port is not connected or failed to reach
- *   state %TB_PORT_UP within one second.
+ *   state %TB_PORT_UP within two seconds.
  * * %1 - If the port is connected and in state %TB_PORT_UP.
  * * Negative errno - An error occurred.
  */
 int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
 {
-	int retries = 10;
+	int retries = 20;
 	int state;
 	if (!port->cap_phy) {
 		tb_port_WARN(port, "does not have PHY\n");
-- 
2.45.2

