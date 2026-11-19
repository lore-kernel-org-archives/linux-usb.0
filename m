Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082522;
	b=noNY8UqSrbknL34PsGMLw5cjfTO+0zDTurL6BXvMFB7jBKm8eNdul+zCjRu7Qk+TNunB
	 3xxVfOrGCthYvSy9DqjVtSzQPsKkaX8uex9fsr05Pp5q3zlaS2w+13pQ4af9ttEthaliU
	 pGMrgt52EjCXCE9i25JTuCTl7uUobiaU+JAQCd+yPTCUt56TgVGxWxQRrgvhuEi5FYE0+
	 dYPJzGOHWLY3ZdARNgexbrkzOfMuP/pJIOC+cYz61jjd89+m/yVPV2n6rCSORjvVpxgJG
	 9mVNIH8VyFROTwcvEzFNM/fYvYlI03u1Gzn+ItHoLotRG5tQ/QosrBvwMvsKLksYHkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082522;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=BouZjsYOkGr2M8SflT7EXKbiktWSsg1pSaGKgnCUdX8=;
	b=lSN0tGmfl0owdKFiJ1Hy2I0eYWRjcYn82wp/b6lfJ2fE9vshUPJiPtWmbSYV2Ye5sM84
	 8EX9CUePQRU/iPoWiF8Xs1S4KxEjokp8yLkq77+kvRCOmNLseEhiVIhEhnzJimuwN812p
	 /lxMmia9O1u5qRiug1BqQFVUZYpoQsRY1xWx/z5hdbH0bN3j2/GaD6A6S798pFlHd6LE8
	 RaVb1ioUTJ/KdNK2lk3Hbbs00AhvvXua45nbMIp2amTkVC1ohiHL+eLeAcoACDYOFyFA+
	 2m3Ygd9jMrYtkqI2Llkh37igQ8zOwg3mEqx/IyAk9x5O/e6OXJwTixP0btEFJZUDryg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZtYfViLX;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dOFFqZ1w;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B0A606A324
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 10:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7B0A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZtYfViLX;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dOFFqZ1w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795082519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BouZjsYOkGr2M8SflT7EXKbiktWSsg1pSaGKgnCUdX8=;
	b=ZtYfViLXyLmq4AQ0a7f3XhC8uNqgkreIZZqq/4CG4udLLK8Ul8qrLQi1oFXKx+E3dDMT4B
	9XajVV/bXlkbJqtm5+7ePpWeV0sIs3xFngketvwaP+d9MXdiRKg3GK0ZDFoNEfHLQnCL4J
	h+ezUhbiYsQeDHLw9IU/x1SBX3U/enc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-5-3HrC4vMGKo_5UexM-vDQ-1; Thu, 19 Nov 2026 05:01:58 -0500
X-MC-Unique: 5-3HrC4vMGKo_5UexM-vDQ-1
X-Mimecast-MFC-AGG-ID: 5-3HrC4vMGKo_5UexM-vDQ_1795082517
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4bb69d84053so16722665e9.0
        for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 02:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795082517; x=1795687317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BouZjsYOkGr2M8SflT7EXKbiktWSsg1pSaGKgnCUdX8=;
        b=dOFFqZ1w13i9zITU1kTIDe0O8h+wWvgJ+Xvhcr20xVLgH104yol+zZhXyl2MYd1Q/K
         ljmRTlwISQLlsXYJeB+mcBYnMSaWYm1XThhyL0AxF5UT66S4e9aQVCeoV53Z0MfYZoS6
         MAtl30Rvw37C90Ub3u5A9mUkxDIwWibXAR1CcZqqsRZqdJkfMlpKN8VQoZAppwWSYtUT
         ffRyDK3vYf/XODspcxhZRnXpnvuuX9rW5ALCGO0GeYlmHdZyW/IUSMpif+fW6fLaQFEP
         n/Ko4XejIznYDGS3VPBtXJR9pB1YUCeVBkrxm2RqH8z6dmcdrFu7Hm1NE0p9vckUHvLJ
         rQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795082517; x=1795687317;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BouZjsYOkGr2M8SflT7EXKbiktWSsg1pSaGKgnCUdX8=;
        b=AaFsSTOhHlMRORbmpQU/AoTq+KABcMymujbmNOu42+ZS4Sj8F2Dv/aGfmz2LHdniYf
         itJQqhPG687Q7k8Pu/4IfDDlZm8jWVxZQPTfmLymnGHd5q7kcv3V712wny9ImSmgFLsH
         TyyTNFY3ARAmhEYJkKExGNxlWz+lmuIRcDkq71o9PuuA+TS0gXc8x5bWWUOIZxodFOjD
         oLY2hL/YMjHd6ZvCP610ztdOroNiAj8Ai8dJmZXaDIh50RGrYjPPBM3swKEFzQuKEJKG
         PKrurySt5Jvy2OqbWEHdneuXK7lpE8I1bN4VcICPdYdn8NDFJu1lb2QE76Uo0HdBXDon
         qDqw==
X-Forwarded-Encrypted: i=1; AL+hErFetUdBNnXfU4ajVOF3CuE67u75Z9KEbVjH6fm3krZh09ozIxWE/QahBuAoSTk9f/nvJRekr4tEDBI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OXHny1rLWQJ1+T6q0HYAI4xvDUQnQIPILmjf2Bu0++JLAcswz
	6mTowQD4tESZcnjQvibSpdKf9crJod0XvTS7YUywOx/3L4djw0n/QSv8PTeH2Bdoep2lyM/6T59
	zLAN0Zvi2DSlIFzkXYrF0dUGd0MUzsHIgCQDrarP8HiAwj59Jipd2LZrADbnJrw==
X-Gm-Gg: AYBFou0H+Mpo1FFuEmHya/E69vjAWLVwpphzFeKaINjf1aw3CwjZRtqfdp2NuM6Oc0v
	NYDKgqm44DhULh6Jx9e4HmXyf2wsRb+eHHkPoLIkRIWxgUEO50xzjP8HBiR1I6DBurlX70lAU3f
	+3GX+AJMXOP7dlAQuUTY2VcNAaAyQzkvq6P0Lxgh6IRA8VMd9Bdq5CrJWI46y7/0ksGOg/0R9fe
	tw8gNINNWhKc4VUeHLe49ibiK5h5wjzB8Gazzi7UL/QGJYYuJ3BNOCIq9hRDO2odubfmopgNfZr
	MionxyViGGzWA+M86yKcunUZl+hk6RoXzDHe88PQPGgYpR11E/kC1LvvUwqyWzrLdVzQmLV4Q+l
	D3/jykP8YgfP7DRSyYiyvD2dWH+6RWnYYzg/V+faAuaO2TMYSOKKx9sQl5lHPaT77nMV84RqWI/
	omw6nU3K8k6sQjwgcKvMG5OdY6gt6/XUWbjnBJHoPnKMsN
X-Received: by 2002:a05:600c:3b91:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4bb7da4647dmr123452285e9.32.1795082516721;
        Thu, 19 Nov 2026 02:01:56 -0800 (PST)
X-Received: by 2002:a05:600c:3b91:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4bb7da4647dmr123451735e9.32.1795082516256;
        Thu, 19 Nov 2026 02:01:56 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm25507345e9.14.2026.11.19.02.01.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 02:01:55 -0800 (PST)
Message-ID: <0e0ce63f-58d5-47f8-ac4a-eba0420e6383@redhat.com>
Date: Thu, 19 Nov 2026 11:01:53 +0100
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/1] net: usb: rtl8150: break cycle between tasklet
 and URB
To: Oliver Neukum <oneukum@suse.com>, petkan@nucleusys.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261112104548.693456-1-oneukum@suse.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261112104548.693456-1-oneukum@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/26 11:45, Oliver Neukum wrote:
> The tasklet can resubmit the URB, which in turn can
> resubmit the tasklet. The cycle needs to be broken.
> The simplest way to do so is to prevent the resubmission
> of the URBs by poisoning them.
> 
> Fixes: eff674a514bd3 ("USB: rtl8150_disconnect() needs tasklet_kill()")
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
Sashiko feedback looks relevant. Also please include the
info about issue provenience and the impact into the next
revision changelog.

Thanks,

Paolo

