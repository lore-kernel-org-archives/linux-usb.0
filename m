Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792512810;
	b=hkrtkoZhluuxYEloecUxwR4pYb4qyD+uUTTgb7WiKAhUeEzT+Tv3CWf0PN+sugZ7F+Ch
	 LjHZUYhSr/jcjKMU1XZxM2E1exynZhc8EyuJMCMXbTajr3NfseQwIQkPwwlBcqXDpczQm
	 3KWuomMlPgXJSRb3J7JhwZSUCFKFV6ZMfxWtiMD2h92LmFKeVgNT6iYM3FpdzjjtIPPNA
	 U24vjOG0HGUkf0ocXzH2t2JEtha5msq8n1UvExiICvDD6ZNe0gZqhCk3loX/fCLGJPQL1
	 Z1tNqcxXxxTCsnwJcg3HSe1YtmZNGDohkzFEFs5VskEvL+xIYZSrkbS7xTOAsPtHgWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792512810;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:From:
	 X-Google-Original-From:To:Subject;
	bh=2kNao7l8qwbGvb/x++ZyFnXiZZmrXtU2EvUuB0/rTkY=;
	b=tiCyYVgJ1d5cl4lPq43bNUxuK6F42kVmRdnUxENmRRhyljNgmXxpzpOPLB6tbg8YvWQe
	 ptZcKRkRDIlKpAiLtP6ip2wLYYE5NV+SBo+oARQLzE2i81ItSaUJOPU1IqnYyM5Hxwaba
	 ZkN2YMGQBrHvUCTl91NfeUGaE8VNbnoAttShhp3I5vWkTa31sUpTezcjTVbHhIslV9ycm
	 y5yCMaIT7Q8Oiu9NTZGdcXRXpbmxK5AOO7f1ndJSeCycFCz0RZG5R8Pf0ZjNmTN44sEQp
	 90BLX4bjJ6INJlj1+3wHEAsIypLxSDM8Ug/P8RGwyNcmUpElsm8x1I2s12OOohmlHXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="bsvluR/i";
	arc=none smtp.remote-ip=74.125.227.1
Received: from mail-vs2-f1.google.com (mail-vs2-f1.google.com [74.125.227.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62559606A319
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 16:13:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62559606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bsvluR/i
Received: by mail-vs2-f1.google.com with SMTP id ada2fe7eead31-754acd5ebe8so4024262137.0
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 09:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792512809; x=1793117609; darn=vger.kernel.org;
        h=subject:to:from:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2kNao7l8qwbGvb/x++ZyFnXiZZmrXtU2EvUuB0/rTkY=;
        b=bsvluR/iTqZEzZnl7bWJrf4e/ccBWiuzrlZYf3jHl1fYu22S+K8cvY/yrpeJdvb9pM
         75uKu0H8d9wyUJTq/o8QY8WndZnaHcJF8A/gB8EoDUTdmDqUh3/Gybq6lMOT/2fBMLmU
         5wD1xzPPfIMMYJcdABbOPrVnBCALNlQQA7Szfuo9vni5EWoBcIUiv8V1fG4nniGnDikM
         QA7dU5BPVZ926wMVog5e8+10ufVNAjfZh8GI3sMPvaNDCgmlTkrKK6ym0BmYco+ZUbws
         NbZOhXAwbhRsxXtNxl2fdOZ2FiLwKk2ULtbMB5PFAU+7U/BCaXq+Nt0+YWjL4xssohiA
         rc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792512809; x=1793117609;
        h=subject:to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2kNao7l8qwbGvb/x++ZyFnXiZZmrXtU2EvUuB0/rTkY=;
        b=iIVf81Q9viSrymX4AjdUht7mjFJkBNZhr6qXsdciY2nTCm0fUK8q+zwx8Kg5ioCkbQ
         B+9BMVt7ejJ7YLvCkePSQR62A5eXgmN9NIgAYr51Y3XiDoccy036IIdlXtNicpu7XBP0
         ZSLJb0/iiscAejGs8PZ3ZeL278/vVNxxbMANYMk5o5X1sI6XfzuTjv8uI1MbU0tw2FxC
         Ko5s5aVwguuZqf556kTKtcx82wen/3MmHsF21prAOQowaAp+Qv5m/qxupOWS6kHAb3aS
         WvKVMxsU9mBmlJCfqAGTI/9Y9rMjmh3Q4UnQXEXNmaHKl331PJGszf/6DTou1qcgR5iH
         H1Jg==
X-Gm-Message-State: AFq9FYLH+HBC3aMhf+3ab8cAOcXr8az+/a8LHFRny7OHAHwfQPcXhnCy
	p/keo0K/ffWHD8O8N9fXxXNp/lOXvduc3h0a7fL6LcSvEb2VfM7e7IXjNCPB4dEgFz51HPnG
X-Gm-Gg: AYBFou08ylIbHGv5gG3J6e2Nn+W8i9R3xX1oLunG/gZRj40QjhzFT4DpyRglDQH8HM/
	GBr2l/obZ4bm6UjbNcUJikR2aCulbhwO7SJ8C5ubskFP6wo4WWVZdmEV8d3pSEOe3UqP6Y5tZly
	s16sNrvvEUAS7RqOd2iCLX/ekfTQOBed6gRHTLrL0I1fUgZkGsSjkX65NhmepQkdYmUz8ngkGpC
	tGNcaWVww4q6C4elhkjN+scQzWdXHBl0YR3R54W/JbaFphA1lHqIQ2+tzrmmn2aF0bdiJkwOHDn
	XsSs/kMM3CddMGWCIEaeM69A06lNpPvIQDCuW5uQIIKkz6OVMEKVMJYgqjKxW8OQvN+ZmNMsdX0
	wr14JcLq+6NCOPGgJd1ICjmyjFHHlzsyrvsbuCkJz8DFyBNUx2A9U8UiHDxqkddHQf3PXp7PjMA
	evbXe6P3xUm9hUygRS2K6xShJjGKKRnOgcQP/sxhAX0c/FW0YnRPNRsum5vAgYpqsVQngk/RTw8
	A4fbH70lU6DxtHKIkprRjLY
X-Received: by 2002:a05:6102:390c:b0:7b4:879c:bb76 with SMTP id ada2fe7eead31-7cc36a18028mr3520840137.21.1792512809074;
        Tue, 20 Oct 2026 09:13:29 -0700 (PDT)
Received: from localhost ([43.157.181.14])
        by smtp.gmail.com with UTF8SMTPSA id ada2fe7eead31-7cc76df1c68sm3210069137.0.2026.10.20.09.13.27
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 09:13:27 -0700 (PDT)
Message-ID: <6ad79327.3114c3a4.816dc.80e5@mx.google.com>
Date: Tue, 20 Oct 2026 09:13:27 -0700 (PDT)
From: Linux Usb <miguelcriley679@gmail.com>
X-Google-Original-From: Linux Usb
To: linux-usb@vger.kernel.org
Subject: Subscription Activated | $243.95 | Ref: I-9QY973596Q1XFD
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Hi Linux,

Thank you for your continued trust in PayPal! We've successfully processed your membership renewal (Order #55Z62062CA8993145R) and are excited to continue serving you.

Renewal Details:
📅 Renewal Date: Today
👤 Member: Linux Usb
📧 Email: linux-usb@vger.kernel.org
💳 Transaction: #UID431591
🛡 Service: Parental Controls
⏳ Term: 1 Year
💰 Amount: 243.95 USD

Your membership benefits are now active for another year. As always, our team is here to help at (843) 301 5520.

Warm regards,
The PayPal Team
(843) 301 5520
5729 Bethel Rd Dallas Tx Usa

© 2025 PayPal LLC. All rights reserved.
