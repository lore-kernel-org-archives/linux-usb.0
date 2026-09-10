Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779F147F76A
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 12:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789044929; cv=none; b=TpEKn0BG295uho6esooNbEgXfDHPR0NSMPAHau6k/1lejGUBW0yPSQVOU6kCCsRnT/aSf/x96do1mf4YqNDdhU+VIQqkCj2BRZj6QH2rmuSVL2AMp0fSs9F0W4cgbLBZaw/bsGD5+OrRKHaUw8z97kx2r1eagO8g2MQYpUrr144=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789044929; c=relaxed/simple;
	bh=6H27RuGRCd51q3l3DeMJQ4HmmM8diZXr1Ijh3D4WFuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t1C5Iw0cnZfokPnDcWqI1jhniMfg3oDDuetBasKsBOmeuczwKthzZWcY+M8nXb+NUynYkEjoZ9pPpYpoH2R4vkO8axeme33BuIVUX1/jAEfXXiG/iq7nAuGSXdlcCFdGtptgVWj7jCKTTDNSff0EWQEiEIzS5tQrsvLD0Xzo+mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XRwu5Sis; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XRwu5Sis"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8558c0b26a8so4776588b3a.3
        for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 05:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789044928; x=1789649728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6H27RuGRCd51q3l3DeMJQ4HmmM8diZXr1Ijh3D4WFuA=;
        b=XRwu5Sisd8g7uVrMvGG1g3kR46viUOOpzm9OjKult0/W1Eof1we+qfwYTx0Ms+Zj2x
         OoWBuyqUpEd86aDxDEH2mccHmTs5PQeX4a/ZYXayZbQkjmUn6oEwP701s3myjylJDOGL
         8EVGLZzxadZfk3R8CqZZsT0f8dwkF3iZN7Owo8hsl+dABzLHOMBeLAI2pQw/nKTE+MIj
         I7RyGOqRKMlO2QGQ9uxY/Q1u1phUXIt0PuzRkhjQwiQfeVGv33CmsQbEXA6YDPpVCurJ
         VdE51NLTIs2L+Es5SeDZRmkX8iTWl1o58gzM0N1klGAkYWlUvH+JN6B29Coxmjzp0W8P
         3jKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789044928; x=1789649728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6H27RuGRCd51q3l3DeMJQ4HmmM8diZXr1Ijh3D4WFuA=;
        b=Pkzq5Azt37VH1KkbI15EwTW9u4DRLlC6r3kJkowhS22yYv9b7DTULrX7qYOpyuBia9
         w2oxEyFn2W2ehZM3R6qYh1IySeMF+b7Naz5Ad4S792xRcECbkAjoSm25ZJAnFnBey72B
         Qt5DQAc2xYhZZgE0B1mzDIvIyK8Fq86VIBuseiTt/pkY8T8hHaC5bxAqYSeD2+N4nD4m
         WMkvgerZtE4/Qy8uFgoLOn2AZ4eHZveeMtNCzX+2EYtlUd8kN0Mk8QAGULRNz4I9bEBO
         UDmtQ/NQLXzSuz1b4+g6uIFfcjo0G2hEJ17R2ZcL7xrCwXm47rNey6cdt/bgHWFnnH5X
         xGRg==
X-Forwarded-Encrypted: i=1; AKwUvBwauYXWmnXrydxr329ZhQHSSfst0Yu2jBxASSIf+Y4GvBMsB+gw22ydFp/gEkzwY9IS7TghrLQUabY=@vger.kernel.org
X-Gm-Message-State: AFuF++khaNB2NUphc1kP6Ai3VhEbgfN1j8TRSP1As1AexcqvPw6KGLdA
	ykkiylqvIHLXm9pUh48qdhsMnTugt2bmrGbfKZHxg9lS50AoesvrXnhc
X-Gm-Gg: AYBFou0X2JnmggPF8W+tVNUs4KP46DJjxC+WBdNqs+8AMWyc4ci7u0/1RPQngAzffye
	oV7PUMoc8sDaMKBXl4fJfTrNWDgR+qSqAgjgj0RXYfxeESyjIed94+RrJezrCkcUgwMsU3q6zcZ
	KnSXuh0DRm3GdO3f4OLZImq3dfEPZP0gIQQhbdzA3RX9n0T0IZLfx/13embr/xt0GYafrTNWmWZ
	1WbPxLjRLJ+uGauCcV2UeaWnbdY/kaGJNfhy9VO5JQcg9LXPBoFeStGpmKuXcURAse1B0zOV5Wy
	TYIbpY/NocISmnCfBLJ+BXbX/FALl+IlpplwnoYRVQGK6bWfV9XRwvYBGkIdxYo9zwWtEcTff2v
	SCIED1rfEX1EyqfCiO0qEJsVWFhI5idL6YVeu2oBhNl+ZYjHIfA39QnJUv7fU1o6jp1i8zli5P+
	Dz6H5NGkrP98KuvHwqIlIXNMvZv0xaYr5ArZLWRbvNTDF6qHOsuy8MEEr4iLgWhZBV1cQVJD985
	1HVWqKZQKvrpIJMtNPlhEu+7997qr6652B50MjmXtAy4LJ6zUfHhhxb0uR9bpEhv/aX9SkxOtnz
	DtieRZPh7fFb3Ue2eWiuFYqiRE7Nry/DhCo=
X-Received: by 2002:a05:6a00:4206:b0:847:9267:2104 with SMTP id d2e1a72fcca58-86168593e70mr57210262b3a.12.1789044927579;
        Thu, 10 Sep 2026 05:55:27 -0700 (PDT)
Received: from rikka.tailabced6.ts.net ([240b:10:ff82:b100:8ce2:c181:4224:d11d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8615371e5f9sm8211492b3a.47.2026.09.10.05.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:55:26 -0700 (PDT)
From: wakasio <scarabeeta@gmail.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: xhci_hcd / ASMedia ASM4242: Bulk-OUT -EPROTO with Logitec 0789:0308 during DVD+RW recording
Date: Thu, 10 Sep 2026 21:55:21 +0900
Message-ID: <20260910125521.1587286-1-scarabeeta@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910141633.00892cf8.michal.pecio@gmail.com>
References: <20260910141633.00892cf8.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Michal,

Thanks for digging into the TRB content, and for all the patches and
time you put into this over the past few days.

That makes sense to me. Let's leave it here for now. I will stop
using this drive on this controller and keep an eye out for firmware
updates on both sides. If you come across anything else on your end
that might be related, please keep me posted too.

Thanks again for your help.

wakasio
