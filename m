Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793033131;
	b=PjcimAp4Sb9Eu06wasG8/LC1ODqNbb1upxY/U/TMXDqxLE6WWwD1WnVjx1jm9tnEx8mS
	 6qdQj4FhTs3A5UR5VwPbq/OZ/SYqIr5d2d/5oaenrgnywEAzCF85vWa41mwqQFKRoNrMI
	 vbQyv203OWhbyHWGe9AMo3LrTYd49QYpnLA1rFg92QRRifepb1+fs9iJirA/sdsXNVHy9
	 EN601O8EzClVDgicGxHjRH/0fmdT1GEWYTq/3eFwIPaJF1IIMTkj9Q3sqAFZeB5SVryph
	 ribG2B1eKs/8BXqpqWpl+hYbKqEt7dB5/2zgktnfOu8rSF6kPVJTzxZMoc+Q2b/2ZWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793033131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iSfwRAOyFGTwTZB2XgAXVYKS7LWy0ZRk9pXzKQmllSI=;
	b=mBe3DvFSP1kYtwZuHY62X5wfigMha3ZR2EvjnEh/ONnWJjtpLadbVwh2neA23WByjXnc
	 xJbrOMiwbDCgukGjl7pl4i+7FZBm651jzJJ6WE9yJUMCyVbstu6Zxd+8zCQiAfm+XUY5o
	 Xh5mBIuS5hVJyyp1r4KY43W9WwD0FKfmhoPNCNPn48Y6e24Y6n+h6eOZdTQsTCZ5On9SG
	 KXCwkAvObeUBX7ueIYJ0U+vSIa565sKEdO9VLen99sEvjYvlPizgF+8R3XaXRQRxq12ve
	 ZygXWDA4njzsJ3ih/H1kpdIKNsk4Ev4tFBuOA8Inu2Xebkd8M5imJytW1+RUDxoJX3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a1FNF3ek;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC727606A321
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 16:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC727606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a1FNF3ek
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6acb57c2b88so3753363a12.2
        for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 09:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793033129; x=1793637929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iSfwRAOyFGTwTZB2XgAXVYKS7LWy0ZRk9pXzKQmllSI=;
        b=a1FNF3ekg6HdqRi0KYX2mUwmdgwGj1M9QwJhgyu0MG2Kkw9rLj4PiQ7qnWNDrmlux0
         OvJT/1AT0+UWiiX6iZ0WW36Xo+/+WVKDGAEgqai8Foq1/1Ib9CMZRi5cMlhqWxLUfETG
         V30Sm6X2gavfVMXyog5Fos9URtttVeLf+ADPQFtjJP2CWBd0guEq9pZmPXNpbAv3w99i
         iXLRKFQ4pijRdu4JOd0sohte3vf2GgpSbQ3036xtodHzqfYBK0z3i1rmYdqeEoJ/PU1j
         Bu3R5nUfDu9a+biUwpsGqCxQBRrYTT3iVaGrS/5UClcjmtfwV0UEuvDqZfwYOVD5oBXI
         JVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793033129; x=1793637929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iSfwRAOyFGTwTZB2XgAXVYKS7LWy0ZRk9pXzKQmllSI=;
        b=R/g4NqlWmoWSXR4Ovwm0byHxFh/DjaT+QaG8wGutcUJ9+80FFJFsVMt0VQv9s9EGBr
         elaT9w5bF5AqIiaEhADh0bHUszteB0Cf4o5z36riDqAaLgDWCi0AU0hQUtw0jK5IFr82
         2qKH5PG23eDidnhS6BnJlvxU1lgVeNXOGmlCtyDgzrJeSjD4NKaCCivsV4NKWZp2vJI8
         n7lem1QfFNaOwQ32lUWoamFWMkmVenjowtwyTKj5Io3LyLysllL6Fa9wSurYsTKb9zNR
         17v0dHBgfHUR6ohcvKDzb5F2tjDfDbVdv5vi46R61ZimUsv07OWzFpipilR2LIsRM0Fa
         +Y+A==
X-Forwarded-Encrypted: i=1; AKwUvBxlqLqUOTHIKJF5bOhLHq6Tjo5hL6yqmJMQ2Qy0e9P8SiuodyNEPEDY5Ds+clyq7DrXyS2Gvq2lUV0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJmXCtIsoyNrIQgzixbPtJxAp/Akqpj+E3wlKdCcCL+iSNJsmV
	Y73OGYNQcwp+9MjhtZ14cDxwpYnOOdbvAXuUc8JXIjcVFylJvjKGsf/C
X-Gm-Gg: AYBFou2IO/rNDge4j4vWUwZ7K6NIRbFyP6EcIU/NQ/BFvRIpzKQ0UAc/yLsN4AdMb+r
	90zItmWAXPfnb6pboMvFaHz8LGz6VUkLMMf8vLAYShc3HmBldlFXgl+a0O0YVlfKyQxNUAJgD4c
	5lud+6FAptIRv1x2Yg7+BGIfYC9YaO8YqfpNdxus90HW8ZtesL2ta3lccrDbpRfpsli21oq+siv
	Rvbkl1oD109TOJppiKC/Bo56OF/rtdzj7qAcgIi3hvyfAWZB91n8STPhAHNY5S+dItul9qu06Ez
	iyrQuXUmhJT0pURO2LU1d4z/Mei8I9d4f07Bra5ifgEfEtWZLLOFoe3i/QgVHpKZPdMH3Qi3bZH
	525r3CjJ08j0UH55sQwcycH2I03O8/x9jYbdj7QVN0oYigrxAVPSkwVcirgabUukkM7AKbRkfig
	la1FDYszcdFVg4TNuv6vgnCyNgERpoYdsjpYvmZWjmXoGi+fbRDFEeQGpdRK3M/CB+ykXDjm64q
	G8aY7XUteOcyIobnwFmCEnzYzE2+dhKzFnd8fBLggDEIYJGKfKEgpJe76myhNszZgez0w==
X-Received: by 2002:a05:6402:51d2:b0:6b1:da03:d010 with SMTP id 4fb4d7f45d1cf-6b442fff12emr8703602a12.23.1793033128875;
        Mon, 26 Oct 2026 09:45:28 -0700 (PDT)
Received: from beelink ([187.13.23.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44595d7c8sm3876411a12.8.2026.10.26.09.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:45:27 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Yu Zhang <yuz08559@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Massimo Toscanelli <massimo.toscanelli@leica-geosystems.com>,
	Neill Kapron <nkapron@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: Re: [PATCH] usb: gadget: f_ecm: serialize notification state with a spinlock
Date: Mon, 26 Oct 2026 13:44:51 -0300
Message-ID: <20261026164451.548670-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026060031.60582-1-yuz08559@gmail.com>
References: <20261026060031.60582-1-yuz08559@gmail.com>
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

The locking itself looks right -- matches what f_ncm already does,
and dropping the lock around usb_ep_queue() avoids the re-entrant
completion deadlock.

Note this conflicts with [1] which removes the ecm_notify() call
from ecm_set_alt(). If [1] lands first, drop the lock/unlock pair
around that call from this patch.

[1] https://lore.kernel.org/linux-usb/20261023-ncm-ecm-lpm-v1-2-d01e81fbf460@leica-geosystems.com/

Reviewed-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
