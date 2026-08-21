Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C6E470126;
	Fri, 21 Aug 2026 14:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787323433; cv=none; b=OAWo4Pv+lXfo35mLmSpKN6a61i2sxX+ETPp4Jta6CYOoR3OqJeiHIqrWtSLmt3ZbYlxDcyD5f6KzgQyhEZbSL/Nz7hP8UEjUPywK7RkccjDnXslHlbtKUJN5cfxTqXE4DFKVuO0oqlUlffR9UQ/yLIos5P+M5amrvnxCxt91/NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787323433; c=relaxed/simple;
	bh=WBNCDSACVZ5VPd1FfS+LoB6rLcMlJHNi/zBmYLWCtos=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZeHy439YezDwpv2yLp7ckccm3Sb+XFsDhnBfEFBuKbdkpXjN74MM+ba/YYShQrymp2LfsXAsdc70ASO8WdIfMaYT2tPW20+wLXxxzbBnJk6yd7N7gamCa7B/fgo+Uy2feCITkTlmaiDZqsoAfBJv+6JLciXR2JRYttxGOLANp/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b41080349d6e11f19a56ed5b684f684d-20260821
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:7e879f92-602f-47de-8b38-b0ab48267c12,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:4be9c0a9877669de32021cceb7f181ba,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|850|865|898,TC:nil,Content:0|15|50,ED
	M:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b41080349d6e11f19a56ed5b684f684d-20260821
X-User: lihaofeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lihaofeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 569339396; Fri, 21 Aug 2026 22:43:41 +0800
From: Haofeng Li <lihaofeng@kylinos.cn>
To: gregkh@linuxfoundation.org
Cc: kees@kernel.org,
	mlbnkm1@gmail.com,
	christophe.jaillet@wanadoo.fr,
	raoxu@uniontech.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	13266079573@163.com,
	Haofeng Li <lihaofeng@kylinos.cn>
Subject: Re: [PATCH] usb: gadget: f_printer: prevent OOB write in GET_DEVICE_ID
Date: Fri, 21 Aug 2026 22:41:25 +0800
Message-Id: <20260821144125.3402963-1-lihaofeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2026082154-estrogen-spoon-0a9e@gregkh>
References: <2026082154-estrogen-spoon-0a9e@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

You're right, thanks for the reminder.

The DeepSeek large language model assisted in finding this bug: it
helped locate the unbounded memcpy() in printer_func_setup() and
trace how pnp_string is stored via configfs.  I then reproduced
the overflow with KASAN in a virtual machine.

I'll send a v2 with the tool usage noted in the changelog and an
Assisted-by: tag, per Documentation/process/generated-content.rst.

Best regards,
Haofeng
