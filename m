Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433870;
	b=NkyzZ5X87dzRcSy9IdsziOzNKVMHGxSpkPr38UFVJAD+y26SfqkmYkodYXpXTYNBj1dX
	 HXf38dq400JWRo+SnLpbCRbN+K7ftX04bxltg1EgphlOEdKoIY/LDtT03y48Qz50Pq73K
	 NtG5F8ZrMkUo1rsRyotxcg9+FZDzCBqM1qG5M3IsCzJkmgnuAwdN6uCmwZPY+GxjbIwOg
	 XOubCpcrhmkU3VgSDmhwmZwH/3y/5/CJNVBl4wNfWgvxgU+wo6tC0rJU2qfBcDheWNpBP
	 dmzizjW5tQcwgnr6RHZ8g+tQpmPPO00OwEsbFfMISKljVPdVOPr4A1tXH0AxpNFgosw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433870;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=shbvfSBDzRVaT/N6z1PMlGhIE7QCCC86jNh7wNzWVx4=;
	b=C9o8ZOw4DPalrzbeWUKt2UZY3MxX8zcd9FgrjNq0Cl2KCAM94BmRXNknEjxzK02wA/kG
	 kbOKOhN6mUqyyl1FchSzLWfyCuoCzCV0uw0i1bafmz68ZhhfBd9wf0lwbc1f9v0jTaiA7
	 +fjEohAACCuClF/FP+SuDy35ZEbhCMt3KkktmIMT2r6ThHPMdbkYWrOsY2XOxRNu7NhHG
	 QDcehIOBh29erCmSFQ+3WgjUxdJvAnafvbTPdCw7cf85fK2HzRZIBYPYeTHzDZU8PaCJu
	 jhSrw3HNofug9dGVD2XegPD5i9j5+lsPgGsHY5WCOA5u62xoCSXX5JckJxq0lzDezfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=G4dXRLVE;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DA260A2605;
	Mon, 23 Nov 2026 11:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61DA260A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=G4dXRLVE
X-UUID: 4adfa9b0e73211f18dc8c9802ae25ab1-20261123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=shbvfSBDzRVaT/N6z1PMlGhIE7QCCC86jNh7wNzWVx4=;
	b=G4dXRLVEf/SZfEpUORl1XztMz1pBSC/QRQHr2EQ/BcEFESaYDV6LDmJkRBdiVZZeT4B/M9/KRP8gU2Hahvg6C29ASbuYSNTpmYK78wMihAdLD0ero2Xw4N8B26y7F4InRACUZ6QrHYmOEdAA54Gi12b14QGrVi7FufrehFyb1qo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:52b804d4-00d9-400c-bf15-60141ae1f681,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:325b3c31-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4adfa9b0e73211f18dc8c9802ae25ab1-20261123
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1231366353; Mon, 23 Nov 2026 19:37:41 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 19:37:40 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.53 via Frontend Transport; Mon, 23 Nov 2026 19:37:39 +0800
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
Subject: [PATCH v3 8/8] thunderbolt: Drop WARN_ON() in tb_disconnect_pci()
Date: Mon, 23 Nov 2026 19:36:55 +0800
Message-ID: <20261123113705.2297329-9-chunfeng.yun@mediatek.com>
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

tb_disconnect_pci() uses WARN_ON() if the upstream PCIe adapter port
or the associated PCIe tunnel cannot be found. This triggers a full
kernel stack trace in dmesg.

However, tb_disconnect_pci() is invoked when userspace deauthorizes
a router via sysfs (writing 0 to 'authorized'). Under dynamic runtime
conditions, an upstream port or active tunnel may not exist.
For example:
- If a USB4 router fails to resume or is unplugged during system/link
  sleep, the disconnect flow may tear down and free the PCIe tunnel
  before userspace deauthorization runs.
- If PCIe tunnel activation previously failed (e.g., due to link
  training or Type-C handshake hiccups), the tunnel was never
  established in the first place.

it seems unnecessary due to it does not indicate a kernel bug.
Furthermore, it causes unnecessary kernel panics on systems
booted with panic_on_warn.

Since -ENODEV is already returned to notify callers, simply drop the
WARN_ON() checks while keeping the -ENODEV return.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3:
* modify commit message.
* Reworked sw->is_unplugged checks to directly drop the WARN_ON(!up)
  and WARN_ON(!tunnel) checks in tb_disconnect_pci()

v2: no changes
---
 drivers/thunderbolt/tb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 57c11ba13459..5f674c305d43 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2267,11 +2267,11 @@ static int tb_disconnect_pci(struct tb *tb, struct tb_switch *sw)
 	struct tb_port *up;
 
 	up = tb_switch_find_port(sw, TB_TYPE_PCIE_UP);
-	if (WARN_ON(!up))
+	if (!up)
 		return -ENODEV;
 
 	tunnel = tb_find_tunnel(tb, TB_TUNNEL_PCI, NULL, up);
-	if (WARN_ON(!tunnel))
+	if (!tunnel)
 		return -ENODEV;
 
 	tb_switch_xhci_disconnect(sw);
-- 
2.45.2

