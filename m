Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793948980;
	b=3JJnNPmii49ykGaoTaA4tzifoBuAUHjkHtUckeqNJOmBjk1QWzpmo4FtaQieaXHCs7EN
	 q8nZGWtjeWYXLhK/S/so9Jx/BtWh600eHAPQ30O+uwd+Z08YQI9JVLMijikNe4xuMRT9N
	 zoogxR2qhxPnBBnTZaWsPSxNVUCav1HD/r5LRW9Gn+Gk39OZa7ko/KzD9eRDwE56mD6Ow
	 NGCFxwBUL9UUo9EYJKlxlNBRjscwra1WTUOGFcW82sKyaD0EPxJ9HZnlRMGUBax+9kKNm
	 vhWc1i6A25ZX6ufQBPXV0pvHBrtxIgADK+WSl+ylbehUPpWS/+D75Zx4B9g5enFoF6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=lN1N4KZ8AZXe4NT1Y3Gc7RwuWfpfondMmc4ML4yUGYQ=;
	b=XLo+B5j38/ZfjJ71STXmjBOFCvs5tujPHR3Z3T4DZYJFkOvzI0L9Jt96cAR8JHt00y7W
	 oSpKIbEqDPfNovtCnJlKPGElPp8xVoWgJ+qYb+bRyxOGHyz/3ijEFPrewdzF8y1tPsvLS
	 cNukqAOYY15hMsbjrn7FMRYyoqTxhA+V3QSItEW/BVAPGwTzDxQ1WcKUVZza+SknBIJ9l
	 7O3sKHCzNlJMFw+0A1UXlwxuDQO/bvvsvLgyF7iLLWfUHaDM1nKOb7SHCTPmDxvaAiSGV
	 4mp49w6FkwclSFbzrzJ6BhlkSzXkPCtxYDpXcsg+wbFsV2JL1JyAFUqEXBx9rglGvqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PY7BJYbu;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF23C606A328
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 07:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF23C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PY7BJYbu
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3ac96ba6a4eso56475a91.0
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 23:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793948979; x=1794553779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lN1N4KZ8AZXe4NT1Y3Gc7RwuWfpfondMmc4ML4yUGYQ=;
        b=PY7BJYbutqfiy6LaW+IaPa+QKyMjcDIbiBI7igHuQaYSt5aLy1r0kmj6EhNdzU4W5i
         rEUAfmzzk7Wi1mNInOSlW1oS/c64YaPmZQ2hheG0HZFy2Y0jCtDHKf6KfLW3pkFE9hwk
         6dAoEdHSbdwJK9matLz7Q+YUr5yoA9nHnmNAFeXeYQapTEBX+nS+ba5nmL5FOclQXfdF
         g3HT8esOrpl0nIN3fXNr6geOY++OcQgtUKoyMnRd7wtsOP8/A2XgwCu5z9ADqthZfRov
         618cotgQJliOx8Co/zV6igSmVDEfKE56+BXBaRXHG2NpAU9dQ41vlrEiAwax1WRTF2p7
         rfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793948979; x=1794553779;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lN1N4KZ8AZXe4NT1Y3Gc7RwuWfpfondMmc4ML4yUGYQ=;
        b=qTi9pzyrsRzIeS1sbmpgpR4+v9Hb8kKwgSa0QHAJCt31IOxitPEuuwBbnhagxYXiJb
         CnzyI53x522g/rLYSOTkK12NMFKWcHLAI3rvmONiZUDUowBlCgOhFHQ5KVnCL4mPWTJf
         AR/Blu4N3kczAkOPQTuBAxAk+5eUqdmkybbOzbCgpDCKkA6kcIb7xCDT4eUoFhYhjshA
         y9x84IMDtGbxHbxaCwPX7IiE2SIl9whi17ywYcCR25VWb3J37yHYJPabvLfQD3BFJSyy
         dIvaItbsGEMEbvHKE5ebrxUvIpExJ54QQ0vjFo8cpPdkup+0l/LB37i4L4WI3+0FLiQq
         GGrg==
X-Gm-Message-State: APuU4Z/Kq2lsviH1B1kA7UTf+Uv7tARBrFKP1lfmwZU+7DUuSxh49mVY
	c89EYKWb6sFuBZq/RlG3oTc0LvFcXAiY2qRnp86PQRO2KMxYd+hPQZd+
X-Gm-Gg: AYBFou1HpeQDOMiDHUQYfY4G2AvpcitYECNKTHyPzBT9Qr3k2GYuAaC+hfnJtLU4gIW
	uRVihyNre+ikeLLCPZyXA8YUGVOTZe67tRAgfVVagzQfCUftmse+kzny6YzQij+N5u1pA1AD0DF
	pGWYBuQe5F0+LlDOtfCJPrHhG5TSOiPAbQuNqYgQuVNJWtxM14AIJ2OLObpkxo54xmSMze3/Gqj
	51IrSf++xs7ZHX4ya3I1cqsg44LsRJZIDfxADvmqNPauXFfc5gztgwGwFMbNHxNAPe1hWQeLR+4
	356P993RYawYvtUDTa3Lqkw08Dflbx6b7F383ng1qW0nl43wkqs23UlXvVtECl+83cIbtG55yHc
	dOs5dXhfKT25KaLoKubMllN/IlkOMBWKHKjwsX+oOmJwTaiMZ/gFrcjv6h4yDAE9AHir3k8XNna
	o0bVZd2+KEd/d1Tj/PC+RjukXsUaXedekSKWZr7XDuphBjlQ9wTZg82zZqNJ3Ly2Q++aO7XNzRE
	/dil3qOnwCF3N2eSkOZxQTvsWIMt1nOXRO1YGGmDvUP5iTpUjndenFAIVJnIgRSwCxJ+vDBCKY1
	XLrABM6KzYLHwdlnMyDboNATDqzUZKA2ERaMwdsLJmHMxnesr7A=
X-Received: by 2002:a17:90a:fc46:b0:3b0:9bfa:72ac with SMTP id 98e67ed59e1d1-3b0db6d61b8mr1079443a91.21.1793948978988;
        Thu, 05 Nov 2026 23:09:38 -0800 (PST)
Received: from LAPTOP-QJLDGQ2L.localdomain ([112.224.143.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7cb26f5sm2064903a91.16.2026.11.05.23.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:09:38 -0800 (PST)
From: Boyan Liu <yymhvert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	co+02480a85e1a0d4f5@bugs.sh
Subject: Re: [PATCH] usb: gadget: f_ncm: Fix use-after-free in ncm_wrap_ntb()
Date: Fri,  6 Nov 2026 15:09:14 +0800
Message-ID: <20261106070914.3637-1-yymhvert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015024508.3179-1-yymhvert@gmail.com>
References: <20261015024508.3179-1-yymhvert@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg,

I wanted to follow up on this fix. The use-after-free addressed by v1
is independent of the two pre-existing issues raised by Sashiko.

For the skb2 leak in the same err: path, would you prefer that I fold

	if (skb2)
		dev_kfree_skb_any(skb2);

into a v2 of this patch, or keep it as a separate follow-up? My plan
for the independent ncm->netdev NULL-dereference race is to handle it
separately.

Is the use-after-free fix otherwise acceptable, or are any other
changes needed?

Thanks,
Boyan
