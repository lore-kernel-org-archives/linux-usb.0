Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94493DD856
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 08:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785918249; cv=none; b=SVtGSqJgy1fOgeSTgOFj8M8sEHgPU+pbdG026Cse7nNg5NvxvlgsTLV5XITSiU3wVzCHX1WnDbSwYlWwjAF6T58m/2lvDzmgaNIbb3h8EHF6Y/YEHbB4GC9kyU548dJNFvZukhO3jMhydc/JR48HTeIkdoPgjtmOpd/nCtvek9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785918249; c=relaxed/simple;
	bh=mugQa0d47uC01Ip/YAQyvLH3ITM8CrNK7GDA5kvqGNA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LBmYklHLxt4Hv/4FCyKF5eLQhtAgT1tgs2bGyBINFlJUYbDnA5S/UQJEFlkNGQKqaYMbwiCWjwp11EcoFfLAa1g0ST9sf3hxeo1BLiF9RsmzZ8I5RKMyzlnTVCYZB4it+6d7fbbqHLCZTr37goUNF5zMkV65DtIxfUqCQiqOq+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aRvo3dit; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aRvo3dit"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so684945b3a.1
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 01:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785918247; x=1786523047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mugQa0d47uC01Ip/YAQyvLH3ITM8CrNK7GDA5kvqGNA=;
        b=aRvo3ditvnpm6yheeckppziu+4I01ZqAQuBLXdBGOnf9CDeHBACoB5wwBrO6eIL/Rr
         SJrd/Myb8oyaBKflKg4UwG/QROavgcLtpfAqLxfCrWN5a7LPo9coLWr2CkgiqIv0mcR4
         hvgJRT3jmKtu6Iwy6XFQybTge0XOI6JOmS4g+b8dCJwzhrHfgOYdYMOCVxJ9wwsPkdhh
         HU85hQOoxKyrjNRBL4ti8OUCUcI1IW8x0Cxqv3HoqsKNJ6R2SAIJTmLZz9/BlW+nppsp
         zSpTaQsLYzRyoy2nGWTUuOad1fSHKMxk8bSN1s/MboeEjgKYknOFie7aWAqLlUNXtvgK
         ESvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785918247; x=1786523047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mugQa0d47uC01Ip/YAQyvLH3ITM8CrNK7GDA5kvqGNA=;
        b=VLb4iGqttUm2tRthVbtSA5lcoOI6kOC6H0gHmxHAtvx//qY1mWEDGgsqiTeu1YpNz7
         VlPYMZ8+bPTPx12yuv00pDvEacAzFx/8jX6+kmfhLFuKkYuM2v2fMIg3yEtvQaGCa1xU
         SHQLRttV+3KKa3BuHwq+V01HZYb8mo1+vDrAsRcLY3vXrkwQYj1g6EXjbYhpg+M2MxWC
         PnBGhWv9Mm9g2owxBggcbYVeCemhSuzLDimn1MetQRzeQPIBJNSQ17Y4YVXXVYE8IeQv
         +VA4iVZ4J0FEh7EeXIGSlZtoUO3s+jl5Dj8Ho7DhYovzeWod78MptLE4xRtAkWdcIU8l
         abcw==
X-Gm-Message-State: AOJu0YyDKfOnNZEFE8f1lpM3OebUb1paxLTiokor7FibBIf2Mvw/abcL
	Vnzl3WeCptlnhxDuzJWnRSr4bf5XT7n8BrDCXZoFW8ShXcWl8Pe+pXnDzEjGh4Nx
X-Gm-Gg: AR+sD11+gXhjsPrI7MeqVWQtqyVNMwIAaXt+IeowdYOi59NQTI3qmCAgAMj7mKePgDN
	ZysyduN0mhU2crmuSxfduxVTV5otDr5Abj1YGyP9pd5Q93XK9HbJIZs4OLzvE1ZxKEzGjEhEn/P
	FxpK9+vQd1buZ6OQTFO7hPjP+lTj5AHx8yIUDTvweqGlapE+fIXHn07OvgXn1fAnyRwgU4ijjxq
	d8pKRPoZtJR6GPklPsA+yEHWsolAmxY+TP2jGYkxOKCujBooANFrDF/+noqUPCmFntyYRoAQEoy
	yK7y4/jS9QT9jZYHAOr0AkhB6Ki+8q6yFgOzubbTJWSr1baEmwi4nCjohXpwWw2GvR4OiYJSnBY
	V368U6f3HbcBrETN9Kng6Q0qKQwBkgBncwnR7rXYotdxI79Ib7/8NxKP6vWLWV5FnfQtOXzAp0H
	StC+ZaTKJd5/oTx/laGUbzPvHDH5jn+BcArgd5NLvmgqyxVDAFzQx5+97GUgQgig1IM+l4G5ZrK
	ESR+IqIu+FA5w==
X-Received: by 2002:a05:6a00:4c12:b0:84e:b7ed:7d50 with SMTP id d2e1a72fcca58-84f2dfe8da7mr5766863b3a.16.1785918247231;
        Wed, 05 Aug 2026 01:24:07 -0700 (PDT)
Received: from ML-GYSUBT565.ECARX.COM.CN ([101.47.164.95])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe707cd959sm1042825a12.2.2026.08.05.01.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 01:24:06 -0700 (PDT)
From: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
Subject: Re: [PATCH v3] usb: gadget: f_phonet: fix use-after-free in pn_bind
Date: Wed,  5 Aug 2026 16:24:02 +0800
Message-Id: <20260805082402.3265730-1-khiemtranzo532001@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2026080509-scouts-nimbly-66a6@gregkh>
References: <2026080509-scouts-nimbly-66a6@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Aug 05, 2026 at XX:XX, Greg KH wrote:
> I do not know, but step back, why are you trying to fix this issue at
> all if you can not reproduce it and you do not have the hardware to test
> it for?

The race is clear from reading the code - the old comment was just
wrong. syzbot hit it 13 times so I figured the fix was worth sending
even without a local reproducer.

But if you'd rather not merge it without one, that's fine too.

Thanks,
Nguyen Quang Le Kien
