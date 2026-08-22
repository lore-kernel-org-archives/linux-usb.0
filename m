Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81E31DF980;
	Sat, 22 Aug 2026 20:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787430391; cv=none; b=bORgmOB0VKNZjmUUYxF+m3sC3NxsV36/F4iqW4/gHULatMcqq46uF5QAMS5UtYOo82KZgTFrm6LXBGVRjJb0vmVwqnEc33xSu7XBQpLh2kb7/SQQwbop/f5RcH4F6elR6ir48nBJGXCfJ30yPnWJE7HJ9FIxpazcu3MW1SO+ybQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787430391; c=relaxed/simple;
	bh=iUWrgc1kMO7o7G6ULC220jwDwsTdeRgvSaIChHwSMP0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UMCemcy/ERoUkO7xk/m+RD2FUOT4VksQ+4fUkUDmFcPuEv39MLjAAQnsm39tXnvqfMcS6kLFg/EmqRh/E2+MQEOkumtI62BCfBOwOeOFjeUjTICPX8nGm0jF2xkNQZRiisuICArhEehCMM/upHIAm233vEkRj6b4rAE6lEBcr8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: be46db9e9e6711f19a56ed5b684f684d-20260823
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:1e88d526-f253-44d2-8f72-382702712328,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:3,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:3
X-CID-META: VersionHash:7db8b62,CLOUDID:156bf8cca1b2d7aac4b27e6f15a6cf62,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|850|865|898,TC:nil,Content:0|15|50
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: be46db9e9e6711f19a56ed5b684f684d-20260823
X-User: lihaofeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lihaofeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 628797969; Sun, 23 Aug 2026 04:26:23 +0800
From: Haofeng Li <lihaofeng@kylinos.cn>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: gregkh@linuxfoundation.org,
	xu.yang_2@nxp.com,
	hhhuuu@google.com,
	kees@kernel.org,
	kai.aizen.dev@gmail.com,
	andriy.shevchenko@intel.com,
	christophe.jaillet@wanadoo.fr,
	dan.scally@ideasonboard.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	13266079573@163.com,
	Haofeng Li <lihaofeng@kylinos.cn>
Subject: Re: [PATCH] usb: gadget: f_uvc: fix Extension Unit descriptor heap overflow
Date: Sun, 23 Aug 2026 04:26:13 +0800
Message-Id: <20260823000000.1.lihaofeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <bccf64d8-d7f2-46e9-b3e2-5605decad9d6@infradead.org>
References: <20260822194705.4151650-1-lihaofeng@kylinos.cn> <bccf64d8-d7f2-46e9-b3e2-5605decad9d6@infradead.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 8/22/26 13:01, Randy Dunlap wrote:
>> +/* The descriptor must fit into the one-byte bLength field */
>
>          descriptor length must fit
> ?

Good point, thanks. Fixed in v2:

	-/* The descriptor must fit into the one-byte bLength field */
	+/* The descriptor length must fit into the one-byte bLength field */

v2 sent as a reply to the original patch.

Regards,
Haofeng
