Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0786D27A10F;
	Mon, 17 Aug 2026 06:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786946806; cv=none; b=TWYCrws/qK67r4GAr7lEupX52u3vTiTcbvVK1LGNwLyT5CJ4W5N5ezTEl4mWs+knPk0ZczUaTIJcYVdUaaUt7i9NW6cD+aXZyu8MUM0dkCt4DjIWtMysJuGEFiK04hTpunVEWWcoM7KhVnPiZ1Z40n2Yid/udzybiAIjIqba6IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786946806; c=relaxed/simple;
	bh=obRDffCks5MmiJ2lkchJMvh5czZPL53QdhuurQ3fArA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FXIN+ZvF6bmPiHrpKSq9F838gKeyJ5vkBzHVrEydTWr/CKD7JLbREfgdFKSt9vY5DPo+8rqmSpfEHxzgi+KHCfXlTCzhoG5p/acSwCIA3UEHd/qscK7B5KU06nbnBhoBJEChiWFKtYYP/+BwOjJpruQFZ7AulFlSgmxzBwpF1P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: cda993b69a0111f19a56ed5b684f684d-20260817
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:5d08bfae-d34a-44d4-ae6f-86b28067440d,IP:0,U
	RL:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:7db8b62,CLOUDID:d73b8163ffdaceeb0b9667bf5201cc00,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:1|-100,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cda993b69a0111f19a56ed5b684f684d-20260817
X-User: yanlonglong@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yanlonglong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 999974144; Mon, 17 Aug 2026 14:06:36 +0800
From: longlong yan <yanlonglong@kylinos.cn>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	longlong yan <yanlonglong@kylinos.cn>
Subject: [PATCH] usbip: add NULL check for calloc in usbip_exported_device_new
Date: Mon, 17 Aug 2026 14:06:17 +0800
Message-ID: <20260817060618.749-1-yanlonglong@kylinos.cn>
X-Mailer: git-send-email 2.47.1.windows.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a NULL check for the return value of calloc() in
usbip_exported_device_new(). If calloc() fails and returns NULL,
the subsequent dereference of edev->sudev would cause a NULL
pointer dereference.

Also fix the error path at the 'err' label to check edev before
dereferencing edev->sudev. Without this fix, if calloc() fails and
jumps to 'err', the code would dereference NULL when checking
edev->sudev.

Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
---
 tools/usb/usbip/libsrc/usbip_host_common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/usb/usbip/libsrc/usbip_host_common.c b/tools/usb/usbip/libsrc/usbip_host_common.c
index 01599cb2fa7b..94762bc282eb 100644
--- a/tools/usb/usbip/libsrc/usbip_host_common.c
+++ b/tools/usb/usbip/libsrc/usbip_host_common.c
@@ -71,6 +71,8 @@ struct usbip_exported_device *usbip_exported_device_new(
 	int i;
 
 	edev = calloc(1, sizeof(struct usbip_exported_device));
+	if (!edev)
+		goto err;
 
 	edev->sudev =
 		udev_device_new_from_syspath(udev_context, sdevpath);
@@ -107,7 +109,7 @@ struct usbip_exported_device *usbip_exported_device_new(
 
 	return edev;
 err:
-	if (edev->sudev)
+	if (edev && edev->sudev)
 		udev_device_unref(edev->sudev);
 	if (edev)
 		free(edev);
-- 
2.43.0

