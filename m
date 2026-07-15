Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8553D1712;
	Wed, 15 Jul 2026 08:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105153; cv=none; b=EiTCPRrUS9StnbP/3yOpZvBAJvKkjrPWgL/UqBJMjNhIjtOkyOcWN7MIFgZZwHnKsQNWLg0MXFxZXoHWfokjArmozjvPriKK739Y3sEM7YbrAtKFmV0u02pifs1vFsmuUfjlvLCIrlYW4bxBY4St+jiajt98IT9DqAHUWLywj0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105153; c=relaxed/simple;
	bh=AzgJjCdwPtmtK3JqkU6sICbmg5GFTI9SZ0sXKIfsMAA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K6t7GEBR/KlC8nDFktUVnmjWS90f/Jhuqz+FoIfzh7rfX5vFbAYt5gK/8ZFoIMmbRhLXA50udkj4bm0MuhI2BM+FHeK0Ue2aefRIwQUCI2fLek9oxBv6ox2scGc94mje3COn/LfQnqMm5hKpyXgLM9P25tyVKzKXWNtY21vTVZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8bed4c52802911f1aa26b74ffac11d73-20260715
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_UNTRUSTED
	SA_UNFAMILIAR, SN_UNTRUSTED, SN_UNFAMILIAR, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO
	GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:6a8b289b-761f-4faa-8b12-b80c95188a85,IP:10,
	URL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:35
X-CID-INFO: VERSION:1.3.12,REQID:6a8b289b-761f-4faa-8b12-b80c95188a85,IP:10,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:35
X-CID-META: VersionHash:e7bac3a,CLOUDID:b99e614d123fd84417243fa1a6ee8614,BulkI
	D:260715162956I7MWH7Z7,BulkQuantity:1,Recheck:0,SF:10|38|66|78|102|127|850
	|865|898,TC:nil,Content:0|15|50,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:40,
	QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
	,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8bed4c52802911f1aa26b74ffac11d73-20260715
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(112.64.161.44)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1354600505; Wed, 15 Jul 2026 16:45:35 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	Huang Wei <huangwei@kylinos.cn>,
	Ai Chao <aichao@kylinos.cn>
Subject: [PATCH] USB: storage: add NO_ATA_1X quirk for Longmai USB Key
Date: Wed, 15 Jul 2026 16:45:30 +0800
Message-Id: <20260715084530.2375253-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Longmai Technologies USB Key (0x04b4:0xb708) advertises itself as a
SCSI/Bulk-only mass storage device but does not correctly handle ATA
pass-through commands. When such a command (ATA_12 or ATA_16) is sent to
the device it fails to respond and the transfer eventually times out,
leaving the device unusable.

Add an unusual_devs entry for this device that sets the US_FL_NO_ATA_1X
flag, so usb-storage short-circuits ATA pass-through commands and returns
INVALID COMMAND OPERATION CODE (0x20 0x05 0x24 0x00) instead of forwarding
them to the device.

Information about the device in /sys/kernel/debug/usb/devices:

T:  Bus=02 Lev=01 Prnt=01 Port=01 Cnt=01 Dev#= 12 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=06 Prot=50 MxPS=64 #Cfgs=  1
P:  Vendor=04b4 ProdID=b708 Rev= 1.00
S:  Manufacturer=Longmai Technologies
S:  Product=USB Key
C:* #Ifs= 1 Cfg#= 1 Atr=80 MxPwr=100mA
I:* If#= 0 Alt= 0 #EPs= 2 Cls=08(stor.) Sub=06 Prot=50 Driver=usb-storage
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms

Reported-by: Ai Chao <aichao@kylinos.cn>
Signed-off-by: Huang Wei <huangwei@kylinos.cn>
---
 drivers/usb/storage/unusual_devs.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/storage/unusual_devs.h b/drivers/usb/storage/unusual_devs.h
index cb03d3615614..ef77ab6fd42f 100644
--- a/drivers/usb/storage/unusual_devs.h
+++ b/drivers/usb/storage/unusual_devs.h
@@ -2379,6 +2379,13 @@ UNUSUAL_DEV( 0xed10, 0x7636, 0x0001, 0x0001,
 		"Digital MP3 Audio Player",
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL, US_FL_NOT_LOCKABLE ),
 
+/* Reported by Ai Chao <aichao@kylinos.cn> */
+UNUSUAL_DEV(  0x04b4, 0xb708, 0x0000, 0xffff,
+		"Longmai Technologies",
+		"USB Key",
+		USB_SC_SCSI, USB_PR_BULK, NULL,
+		US_FL_NO_ATA_1X),
+
 /* Unusual uas devices */
 #if IS_ENABLED(CONFIG_USB_UAS)
 #include "unusual_uas.h"
-- 
2.25.1
