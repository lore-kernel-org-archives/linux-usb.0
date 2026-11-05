Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874218;
	b=3I+athyHKGDqa3SjsXs3wGfSOrwn5esP9aDBabKPGht/PDWJ6DMjW+sH+hZM6NEI3Ak+
	 lFVFcc5B1JDI+4SWgb0Q9ffglMAqarz9FNRqBoZMXlIizA5yEqV5kdlwXVJFJwbe06IXZ
	 N25KhG0KKXScmbMv4sWX6tp7xXYdsiawFKpSYY/C7OdqR/2MmX+eZCuuLZcv7PZPALwgu
	 pygrySJPbqmXb4IFd7lrARCAmMzb/2Nh8PS0xgD6ycEksn+CGjmlYDETIYnE9+9wAPE+O
	 K9kfUbE3QQh9aWXyI76bJQRbf10Q8E8+el8nKMmg2Dj7rgGUis5qbcr1+4mNP29xiTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874218;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=leX0ReHgK6PuZWGaSF37b7EwrV14gXKlbmMxu+sMS5c=;
	b=UltzDANPLq+nBBV20kouoKj4u6j9EaEj9aOdpEJlXkZ35RyR9KOHWXryapVm43CbgewQ
	 Tno10pC711YPw1ogsmNfjAOAHb2qOP0EG99alKOpTzkF2OkME4GvGDJc6mHIhh5620v5G
	 oikyBMHmGrcH0OgGgIOFB7FIJpeRlNDTJZfzYy/LEA2JGAbw4A8IECubrDZm6dCJyVZ7L
	 LvDHtlsA8NWFb+tFdx1nN4ZstFu9l8sXmigl+pd5KGk+HThQo4RSLpnEPCQaySzawejhm
	 ts8/DOJJ7Xc3ZWjFrlA0xPKs1b+pSqXY4BJ01nTdek3zcBNjA5PZPw5LiymHD8pzIIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B191606A31B
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 10:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B191606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f15ae9c8d90211f19a56ed5b684f684d-20261105
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:d28078d8-20e9-4974-aef1-ecfb57a20e99,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-30
X-CID-META: VersionHash:7db8b62,CLOUDID:e31da5585721bf525ba634d09b786df9,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|865|898,TC:nil,Content:0|15|50|99|100
	|102|151,EDM:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f15ae9c8d90211f19a56ed5b684f684d-20261105
X-User: lijiayi@kylinos.cn
Received: from thinksys.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijiayi@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 283026786; Thu, 05 Nov 2026 18:23:28 +0800
From: Jiayi Li <lijiayi@kylinos.cn>
To: Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [RFC]alpha implementation of eh_abort_handler for UAS
Date: Thu,  5 Nov 2026 18:23:03 +0800
Message-Id: <20261105102303.3891933-1-lijiayi@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <e3eb3c84-ea19-4502-976e-eeb83e80a92c@suse.com>
References: <e3eb3c84-ea19-4502-976e-eeb83e80a92c@suse.com>
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

Hi,

Thanks for sending the patch. I wanted to check whether these two
details were typos.

In uas_eh_abort_handler(), I changed the tag passed to
allocate_double_command() from cmdinfo->uas_tag - 1 to cmdinfo->uas_tag.
Subtracting one gives the index into devinfo->cmnd[], but the TUR needs
to carry the same tag as the original command to trigger the overlap.

In uas_abort_complete(), I changed devinfo->cmd_pipe to
devinfo->status_pipe for the second submission of the URB, since that
transfer is meant to receive the device's response.

Is that what you intended in both places? I'm testing a local version
with these changes and will follow up with the results.

Thanks,
Jiayi
