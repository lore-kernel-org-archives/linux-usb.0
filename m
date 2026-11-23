Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433865;
	b=ol/mH1yZD4maOne1Eo/WJIFQMBl5bTbNXBn2KYByR6HC+Mlt6k919D3z0n+1gtkWbbRb
	 ENh3/1plVumQycdcPX7MiroPDS6+ebzn2c9ZLqux57DaQe5D0PynRlflogst3WkiCeSzC
	 16LV3eHfhO/Y2QbfmXl8q+QJl3CO0pLi4M8kTQ2mM76LHDPr4dKHBRSv5gsCIbCFGzLAm
	 VV1C3eXQI2hzE8R4indtfzq1CN7IR8MWoedQvEp6jwrzyyOTJxWMWlzO1gRt9PvdPv5iH
	 FpWOH8j0XdSNix6cC3qOL0osCapeifRIpfljQK1HfBzSGfPzKRwgJnvTJdirewnF0hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433865;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-CACHE:X-CID-P-RULE:
	 X-CID-O-INFO:X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:
	 X-UUID:Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=PRXvGXWiLhUZfSPTLsYZVP3/cuMLTt0j/3uv3gxjm5I=;
	b=hOAtGvZT5/cmuilXsDy/zXkZ4tPJXEAkKwO76BhJr+QKnrJi0P/VPyB0zjI9YxuFeOiy
	 N8IVQYhRaBA6I1BM1q4Q5wdBt3RKFbho2hZCc06Fd4r4yw3qmO7rnd0ee4c7QLSMx70k+
	 Ax6DydJig+12n3BtqAYdMVIytQKM2Mv6VcQjPSYqK1aSlJOJz02YkNiG8kVnWZ69BAT3h
	 jzEHUvr9pIA9L2X7hup/3Yqn6XwoQmJDfpkYDhWjcl9Cj6a6R6vlG0/5t0tbBInqKlq/R
	 DMm6VNRnfih++Bb41Ily/2WZRo/UsYnJMBomQF8MrrdpOGol4zUX4mcIdkmJP3bHKig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=I4aNr1yC;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC97D60A3827;
	Mon, 23 Nov 2026 11:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC97D60A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=I4aNr1yC
X-UUID: 4a66a70ee73211f18dc8c9802ae25ab1-20261123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=PRXvGXWiLhUZfSPTLsYZVP3/cuMLTt0j/3uv3gxjm5I=;
	b=I4aNr1yCX8n2yzkvnTC2WVDMur+VTmQ+9pqizbn8iNIATfBYDgxvwRgjfkuildE5Vb4PxesxU8bztSsaLFKQM7KPEk9MYbboMgvJgnKvx6uirP3aOARqoNlb4RvlLcd5szoZ2+HahZ4DqPUox4kT2sw7s4GoHFAhflBz4fkskG4=;
X-CID-CACHE: Type:Local,Time:202611231937+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:d8926046-49d1-4a3c-b335-9b3866415dcf,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:1e75ad66-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4a66a70ee73211f18dc8c9802ae25ab1-20261123
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 833396524; Mon, 23 Nov 2026 19:37:40 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 19:37:39 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.53 via Frontend Transport; Mon, 23 Nov 2026 19:37:38 +0800
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
Subject: [PATCH v3 7/8] thunderbolt: Decouple the waiting time of TB_PORT_UNPLUGGED and TB_PORT_UP
Date: Mon, 23 Nov 2026 19:36:54 +0800
Message-ID: <20261123113705.2297329-8-chunfeng.yun@mediatek.com>
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

When USB4 is woke up by device disconnect, no need wait for 2s,
usually the phase2~4 takes at most about 200ms, and enters to
TB_PORT_CONNECTING, if it is still in TB_PORT_UNPLUGGED after 400ms,
treat it as disconnected.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: fix code style
---
 drivers/thunderbolt/switch.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 97e3fd8cdc0c..0da5b7ee4c29 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -489,8 +489,9 @@ int tb_port_state(struct tb_port *port)
  * Wait up to 2 seconds for a port to reach state TB_PORT_UP. If
  * wait_if_unplugged is set then we also wait if the port is in state
  * TB_PORT_UNPLUGGED (it takes a while for the device to be registered after
- * switch resume). Otherwise we only wait if a device is registered but the link
- * has not yet been established.
+ * router resume, Wait at most 400 ms for link to start connecting,
+ * if timeout, means the device is disconnected). Otherwise we only wait
+ * if a device is registered but the link has not yet been established.
  *
  * Return:
  * * %0 - If the port is not connected or failed to reach
@@ -500,6 +501,7 @@ int tb_port_state(struct tb_port *port)
  */
 int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
 {
+	int unplugged_retries = 4;
 	int retries = 20;
 	int state;
 	if (!port->cap_phy) {
@@ -519,7 +521,7 @@ int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
 			return 0;
 
 		case TB_PORT_UNPLUGGED:
-			if (wait_if_unplugged) {
+			if (wait_if_unplugged && unplugged_retries--) {
 				/* used during resume */
 				tb_port_dbg(port,
 					    "is unplugged (state: 7), retrying...\n");
-- 
2.45.2

