Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943CED531;
	Tue, 18 Aug 2026 01:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787016091; cv=none; b=PiLuz3VyomjFnnUQVl9e1PxVRqXISrmFAE1EHvXaDujw/oyZ9Joq2iiwEvKCqxdpP4roC6JicBXUfW4xlYmb2FTqiqh2VyFQPdOgDvhrXe09xt867QiS24zeeH5Y8m7XUcSw4/bRs/uCD7gsuBMGYPWDmbYhsKQvpA8Y+Wv95pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787016091; c=relaxed/simple;
	bh=z+tgaaPRjdxKaiyMgMjVrJr+37O8khGcOSzDuFZ+uoM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ihbUo8eiC63ScZXtrcSDBbWWZZRoG0p18Xwr856+FIVQPckL5ny7xl91zVt8jtWdw+qusHy2c81jg7al8qAoACFLNlyKMRRSHIE3krjm5McBxIPohwUhypc7IrBdAHB6GWRfjrPo27QqmvLijOBqDyUOJNr0Xc0r0k55VGsxUqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 2029dd5c9aa311f19a56ed5b684f684d-20260818
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:8e623dcd-44d5-4b0b-98e4-c68b098b14d7,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:5191ae05f817caf5f6a745c063e56d06,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|136|850|865|898,TC:nil,Content:0|15|50,E
	DM:5|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2029dd5c9aa311f19a56ed5b684f684d-20260818
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1603896786; Tue, 18 Aug 2026 09:21:23 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Laight <david.laight.linux@gmail.com>,
	Michael Zimmermann <sigmaepsilon92@gmail.com>,
	Peter Korsgaard <peter@korsgaard.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	John Keeping <jkeeping@inmusicbrands.com>,
	William Wu <william.wu@rock-chips.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Chris Wulff <Chris.Wulff@biamp.com>,
	David Sands <david.sands@biamp.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linkai Gong <gonglinkai@kylinos.cn>
Subject: [PATCH] usb: gadget: f_hid: drop ERROR() on copy_from_user() failure
Date: Tue, 18 Aug 2026 09:21:18 +0800
Message-Id: <20260818012118.3903388-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260817154604.70427ed1@pumpkin>
References: <20260817154604.70427ed1@pumpkin>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A failed copy_from_user() is a userspace error and should not spam the
kernel log. Just free the temporary entry and return.

Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
---
 drivers/usb/gadget/function/f_hid.c | 1 -
 1 file changed, 1 deletion(-)
diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 3c6b43d06a6d..5c39da1ac7a6 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -656,7 +656,6 @@ static int f_hidg_get_report(struct file *file, struct usb_hidg_report __user *b
 
 	if (copy_from_user(&entry->report_data, buffer,
 				sizeof(struct usb_hidg_report))) {
-		ERROR(cdev, "copy_from_user error\n");
 		kfree(entry);
 		return -EINVAL;
 	}
-- 
2.25.1
