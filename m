Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795396676;
	b=3jeLthypveLSAqIK0i5y1BbSpeAfm46XZOfL0BFYsScp1HZaSz7aRfPEMIAaRMccrM9U
	 HnwBGuEPGr2kF19glxM6IWeVR1kOVreIEHvsTM0644C4w+UWsnKVZZrpR0Zq91MMkknD8
	 Lgn0pq0UqMuTX16Mp9T1eWRMZ/5p9v06vF7+8YiCOrljEwGUBTv9eTzj5xmD+UipyswoE
	 HdmQLS6xIt+4M2fJz7h+88+dk1sLqKi2jxBWD1NWBnquq6AtuVZ/NlO1dPH8kBgT1Lmx8
	 lS7I7LSG1hudtUeXhjvPfVQa6i9WPCba9oEIWuPOM8yJTRkrpV1xlUSCL6BDVs408PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xtW2k1ILTZk6SZgInS9ZTOwHcWM7IUrJ3JhIcEADImc=;
	b=OcIwW8L7hF/418oWFL5zx6JN2BZG+uywCtaVGuX/X22IxqsP98Fo3VW2LCw8X54h+jv2
	 w2MmvNriICdIXzTH0NdDSCu9JI0CrqYsHIli5wAupNJdKLZ97s5KhD6M3RdEKVfbDTGqv
	 YRpOSxrlhS9odaLWy1+Bt7TGJzwrxWb79chEfZK2Lt5HPJARjMpBGx9QYr1VK/jediw+B
	 hAhAe6wFry2amfpTR/sg7KOMbAWTPi6gLm/8kNnHuc6rQiS2q4G6r6BzfLXPHizodFJPi
	 BGtgx4fYDkQPMkAAV2O1dHX4v0kri37CAXR+aLoAfurx26iYr12qLDvHXIDY8mJMOPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hi7vStgI;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F58606A320
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 01:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3F58606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hi7vStgI
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f0414c1062so13935915ad.2
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 17:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795396675; x=1796001475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtW2k1ILTZk6SZgInS9ZTOwHcWM7IUrJ3JhIcEADImc=;
        b=hi7vStgIIe4B+gfGYSP8SoSNKdEE4d4Np25Nrok5C2RfOboJ1WaLpY8IbrcIwIqLtt
         qb+JqEz5yxJbJZr7Ie/G2PWO0DxigjDBInpcPwt28Ktz1HApEwYPEbaxxIEl0SW6lM3C
         P2bxTepK8oJlptjbCcGa7x7M7tqQiivhhHsUq+6pR3wi8bBEeB9Z5S0Yf1Rny+ny8Cb8
         +pbHDjrFtd4aWoPYLDnYmdO2r4GvnTqnWu8nCO7tY+5lkhU+PyAd6IPfNYpPLNHfMNZZ
         /qdFt/EOktxgGfAiLwefW8aiAhPKoNDM2Vb7wR3eeRwH3HHTCvblB1orXvPn0pduJxY0
         DamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795396675; x=1796001475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtW2k1ILTZk6SZgInS9ZTOwHcWM7IUrJ3JhIcEADImc=;
        b=bMDGop3xoIWFj1YN4E5Ivw7igl5UmN/l6b0okc0OE6bZ4mnrU5HHWJlKys8XvcGX47
         tzC6aPUpukhmQJMsNLYQVfRJ6bALaQCZM+fw5boekzZti/Zd7H+HVAv3ZbH+/2ww9r3Q
         rPYsryl/mMo3VeoxKby1oVP6vSE5LLtcpu6QrsQGir8rUsauxVzddC8KKCSi6Znb5aka
         Yyt1XqgT83QnC3fqG9NnA8oPJdnW+QzYwlFfyopF0YPMy3RQvnH2DW0hqmIDiylXLBFQ
         V2t3QUztvtaOjUSpVWVtgj9rmpVsKMV2hkUbJHbRd84lR/np5fxnFGog1YMXkFIj+RMQ
         I0cQ==
X-Forwarded-Encrypted: i=1; AL+hErGcAvzlOuBpzbB4xn5b/WneFFSQs3KgjTd1C1/uYAzlEitEus313kr36CDKINfjHf7/fJM84k4k7tY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zxP9d9Td0thn4YZZZQhNHo1241VU5jWKwtAc2ez8B1POMu+G2
	Pi+9piYBRrYVcXYmxxoy81lNyvJueZ5L6W8NAxXXH90KS4ehCw4RpOIi
X-Gm-Gg: AZFdTZdzCsMytmAVnD9q/rtipCw+nuMQwxPxKJrkeQ7U+/t4tst5yZPRnX3P4A0OlbP
	f9EYMadwZQNoQNqj9kcFFa1QTBQv9JQd6t4a2/AyHlMewis926h5vyWmJlEdl3dHN1iHFRJ9kdO
	dzET7MiVRw4GquptkZw8mpO5UfpIo0ytc2Vju9laQgz+Gq9W4GK4dl3/mMsslw1PQxBNarbaVFG
	yXP4OCFsn6w4rFjaFygZ7ZuhyQvxj+bO8o+e74FN+D2OhP2Smz63FpMrikxG1GSDyru/Yy/JbdU
	vTflL5OUyslgjR5ellN8k0TG4vunl+qe5iLeIknMhZgVx9xfHv7I7FqBb6ip3+dDL1/fJ2Oh2V6
	GPWBnGD7r7yp/sTkh0JAzbnCeRlZ3llPyencC0G+CQgJATFjnekfZZ9BmD8ufOxq+mJxZw3V+jQ
	A1WB3v2vBDZXFljNALtoRoBV63GKBW39grL7XIulN8t0A+fNXl5nhYcTJC1pXH2xHbFiB/PltVo
	jPXB9l9EgcS36koe2Wvj7WAltY1Ry7ADxon8V7ghkHN+CKQdLbvn4cWstfxy5Zzv/JzS7GjC/h4
	y5LpiZyQGfyGYPg19fRgOCzjIoyg/oGqBc8y
X-Received: by 2002:a17:902:f546:b0:2f0:3123:8990 with SMTP id d9443c01a7336-2f03f17dfe3mr86458225ad.50.1795396674893;
        Sun, 22 Nov 2026 17:17:54 -0800 (PST)
Received: from hanzj-mi.. ([157.185.136.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f102fc4sm43393895ad.43.2026.11.22.17.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 17:17:54 -0800 (PST)
From: Zhijian Han <hanzhijian1991@gmail.com>
To: gregkh@linuxfoundation.org
Cc: andreyknvl@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com,
	Zhijian Han <hanzhijian1991@gmail.com>
Subject: Re: [PATCH 2/2] usb: gadget: raw_gadget: fix memory leak on connect event failure
Date: Mon, 23 Nov 2026 09:17:50 +0800
Message-ID: <20261123011750.1032874-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <1729447050-0-patch-2-2-raw-gadget@kvack.org>
References: <1729447050-0-patch-2-2-raw-gadget@kvack.org>
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

On Fri, Nov 20, 2026 at 09:17:32PM +0800, Greg Kroah-Hartman wrote:
> On Sat, Aug 22, 2026 at 10:48:50AM +0800, hanzhijian wrote:
> > gadget_bind() allocates an ep0 request and stores it in dev->req. If
> > raw_queue_event() fails to queue the connect event, the function
> > returns without releasing the request, leaking it.
> >
> > Release the request before returning in that case.
> >
> > Reported-by: syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com
> > Link: https://syzkaller.appspot.com/bug?extid=d83b3c49738aea97c0e5
> > Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>
>
> Full name please.

Apologies. Please use:

Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>

Best regards,
Zhijian Han
