Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA252F6920;
	Tue, 11 Aug 2026 13:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786454266; cv=none; b=GrxKio4Tf4hHlZXw02Zhf7Ht0JHqyWx4Bm5n+hxEbRGR5/IgbHpLhUZdArHxiwQm1d3jRWNyGSjvkdclGqXch5/5pLJDnKw8hjI7eUTaJQaCQQCr+f3vjGgAYw3JeNXBru+cp9MvOdBCgkRgxFVNRyElzzKHKu1VveiWG32vVWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786454266; c=relaxed/simple;
	bh=twkZ0g2SCbRmgprQ447NupPbQVbptShinGcDJMlUmug=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UjeQvWiyR7j2bVnNrfbfYdHdTaFsCTX+/MU0o2y3gZGSVywWCpsz6Hmv0ChzKdZOFVvREoH/PG2K8vELGehKxk3UdLCOerM2zi0GwXKJdE/iyxj4P3GmBF0D4uKpXUmopFI9lJg3nOF+08P7MZ9TlLqkpMG/A5W5xFREfOzT2/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 039f3ffe958711f1aa26b74ffac11d73-20260811
X-CID-CACHE: Type:Local,Time:202608112105+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:432ffea4-df74-4d5c-b58b-aa081efefcfa,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:3f38bd8ae9b84da239937bec4861cfb7,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|850|865|898,TC:nil,Content:
	0|15|50,EDM:5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 039f3ffe958711f1aa26b74ffac11d73-20260811
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 886383421; Tue, 11 Aug 2026 21:17:33 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: leStoppe <lestoppe@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Huang Wei <huangwei@kylinos.cn>
Subject: Re: [PATCH] USB: serial: simple: narrow OWON match to avoid breaking VDS1022
Date: Tue, 11 Aug 2026 21:17:29 +0800
Message-Id: <20260811131729.86563-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260811011008.0f7435c4@matra.magic>
References: <20260811011008.0f7435c4@matra.magic>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi leStoppe,

Thanks for testing! Could you provide a formal Tested-by tag so I
can add it to the patch? You can simply reply with:

  Tested-by: leStoppe <lestoppe@gmail.com>

Best regards,
Huang Wei
