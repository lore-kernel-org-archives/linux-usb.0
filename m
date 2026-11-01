Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793517513;
	b=TBlvLTnMTURg0IX9Kkierp6Inxc9DF/SXU0A8GeQevDu3Ze3J0zJ+LAGPEKmzvHnhXPc
	 qpaJIVogF+ek50zrYuq1OT4JQsdjupbAy1ICUQxJohKXuH2W+4Jyo+W0WBeNdwpHDFLB6
	 dUUB/nJFhV5Gi5ljSy/SkYohSs9i+2KK3ytgQK2tiZDjGNkAOjTwVauIzuJ3JgL6eY1wv
	 M5V2omL4ih124JK6Vt0Y14S6wmzToff5tXbKAwQ0LDCxMPPOx66QbISakuDy3m+IU54Pr
	 fXtvDdKxivvCj9NPBNIg5kzj3BuTGJVm6f+owlPVoZAqf3QXheL+2zooV8+6CfumcLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793517513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7aEtz3yPZFFK5CUa1sp1kmd3yDny2QSI5036yx3I0zg=;
	b=Jicpqx1/hSyhQXC3cP+hfXSi5IeIpQMNDC4Tln+Sgq8Tkp7+2CHe7QbgoeE3nX4T4uQK
	 xGPE3veuAnE1g3/c8OrBX/WlLbC5sH64sZM/ToFfWd33FlD8LkKz/XwIUuhOhFlyCsD1a
	 RYJ7B+ZeBlyq8hNCgU7DtnjMunZgGiOHl5w80BYY18tIfzGEaW10libC32vh+hufaJpXR
	 2/t9w4us+23zgaplnLjJxVsbzmYxVnykBs9Yy2AMc5m163vE/6XJmNiu0aIwj/u0DuvYu
	 JJj0YzQj3iM2eT7XsEAes4JD3OCj3rXjsLdPrdDSiAfqgvPHEDa4KOuqKuaksVA+byw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RGLUMjwf;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AE6606A325
	for <linux-usb@vger.kernel.org>; Sun,  1 Nov 2026 07:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97AE6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RGLUMjwf
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3514b90bb89so4006206eec.1
        for <linux-usb@vger.kernel.org>; Sun, 01 Nov 2026 00:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793517513; x=1794122313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7aEtz3yPZFFK5CUa1sp1kmd3yDny2QSI5036yx3I0zg=;
        b=RGLUMjwfmVImD6xESxV3/Lx5yCa71t5xS9xAaZJoAHY6xOl1/+JMpuKzgvXtY5r08f
         rbuKcrygBX9qmVWh8t79Qhe8kGjhCxvs9SNmCx6G7OBQU0BhWNOw2UE0AiKYdct/UkB0
         tPRiDblNX3Ja5//vNMy/qWdKay7eAUIWQSsJafsMd9JNEt12Smvm1YYY6AgaqpaAm7PH
         q4PMAGSoKOjy9uknRTMAEv0SlpExnWtxnyliSCM9YpsHtEp6ydd4FHW6An5IRJ00rimA
         5XejT0iLQfBcGBM6zK6KtZHJWLbWlQ1W08yVoXzNoPjPA3kPg5S8BWonMqNTkqgJJjWA
         GfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793517513; x=1794122313;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7aEtz3yPZFFK5CUa1sp1kmd3yDny2QSI5036yx3I0zg=;
        b=rviFbbNGrHgjHk6ngb+MRQ/BIlunJOPWxhjZotSxgEQpoQh/1jMWCcWswiciZF4NW4
         HjHTU04J/SYwksCcJ1/en8JqJ28uyT6QsLZHrnYPg+esP/WXeA6Gm4VroqqULO0I4dwX
         mphxSWkCyDnPP/n3YVt3bCcoYJuOPZXXdaOAWuGbe/grxLaaLHc8kRyfvaxl/jdF/4+q
         fuhh6ODSfbKlq2pTN4WArpwKBV3+rZqhs5kHytDYL+UUruIXfvC8ktCH2L5COMlPqZre
         k+JLop1wTEJVujFL0muMdyK4d/PRn89jwHSnmrxaavChGsZWH9Q2bHkATub+TgAxukmh
         DVJA==
X-Forwarded-Encrypted: i=1; AKwUvBydNC7AhIBMmQ39GG6JXI3N6/9E7u6f6LLmvS6BgrPu5lT4fIzds3q98SsIkM8NxqIi1pW/LUtVMB8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lWaoH8F95wG7AQkmBpIDK9hTsbRcKglEk/txTZCMZV5Eoriqe
	ti82b1lbUwSb4l4L44b28+Dr1+yQNc52oGKm6jnz+u00WSSz96bSbbN+
X-Gm-Gg: AYBFou0d9oofA2gmpfmIzfSq5Mzn0kOqWMIxr8TZTiWsHi91uwOslPKEEPOqmhr9VFM
	S28jwN0WoOjhh/XBE+ygw2mACwl/zIIwXUiXF164pV8BWdtpptcrgUS9QSPIZbd0w1Ac5Nj2YtZ
	svarHquI7kKcxHWn20ZdpE7wM50IJ0VGOXffHwxlr3AD+xPNUVrS0fa/NXvSiZyVGZ1fqQr2F3t
	c++H6p827ZaukSNmvOf8f8vNQ86iP2clCz3NRt0C42cVaEUyLmtmQxrhH2BjIoiOa098RBcrrJ5
	bhD5LXTolng2WP7PlWlUEVrCxr6SsfebMdA1Je4vKc3DIz/Esk6c+yzH3le50sBmjX26lJDHUjd
	VhgbJQfIasht2rXwLNe9CyhP5/wvQ6AzpQecYdgTgwTm1w51e5yRcL1hTrmGmkQHLBAw2INzUAj
	txugGUHSiUhJcY53KWOh51mVnMQ3HyxTITMyfCYOFCHaTlbSBWHKlsL28a+VQ5QNv9TezjhB9q9
	BVZelB3JAlGt6TWuUxoFk+of9Mzi6h7aNeYZpVDJXrlSrJrt6B2YbEROc5V7tkzVGSS8wewEqXk
	0InppBsOw/HZqFMF1bRgzYKh1hoXRoeFJHi/cHiBcNZOqffkfTlEhJz0Z0j2nTwLsx+/
X-Received: by 2002:a05:7301:144b:b0:36a:1c46:2765 with SMTP id 5a478bee46e88-36a42218429mr10065294eec.4.1793517512533;
        Sun, 01 Nov 2026 00:18:32 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a426681aesm29979988eec.1.2026.11.01.00.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 00:18:31 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>,
	Sung Byeongchan <tjdqudcks0424@naver.com>
Cc: Cheng Yongkang <teel4res@gmail.com>,
	Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Hongren Zheng <i@zenithal.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] usbip: clear actual_length after a failed receive
Date: Sun,  1 Nov 2026 00:18:25 -0700
Message-Id: <20261101071825.1856826-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179333358668.2111112.12827497703998022783@gmail.com>
References: <179328314073.648427.8311262845412746237@gmail.com> <179328314074.648427.388274461758949120@gmail.com> <a0772d9b-83e8-4502-9e02-f61345e406bb@linuxfoundation.org> <179333358668.2111112.12827497703998022783@gmail.com>
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

Hi Shuah, Sung,

My patch 1/2 makes the same change as Sung's earlier submission:

https://lore.kernel.org/linux-usb/20261009122636.642575-1-tjdqudcks0424@naver.com/

Please drop mine; sorry for the duplicate. My explanation above of why
-EPROTO alone does not stop the usbfs copy applies to Sung's patch as
well.

That change does not cover the high-bit length case raised in the
review of Sung's patch:

https://lore.kernel.org/linux-usb/sashiko-outbox-165560@kernel.org/

I have only checked this in the source: usbip_recv_xbuff() stores the
length in an int, so a value with the top bit set takes the size <= 0
early return, and the URB is given back with that length.

I have sent the usbfs side separately. It bounds actual_length in
usbfs regardless of what the HCD reports:

https://lore.kernel.org/linux-usb/20261101070651.1846947-1-teel4res@gmail.com/

Thanks,
Cheng Yongkang
