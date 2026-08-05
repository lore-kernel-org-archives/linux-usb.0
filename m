Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975A5220687
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 04:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785902899; cv=none; b=E0PnycsfeIJ7+IGTTfT6885KrAzO00LCQA94T+BcyiwjLEbSaWqW6IK1ZECKRS0Cwh9T0X3E7ZT+BKssetd5U8iIPbxQVHGmRlf9h+zN569Y5zHFdHl+wz/cEzA5FZsF0NZhIXnR0LptPR87sNpLRjkw/Ky2rSPe5TFAhDv6lqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785902899; c=relaxed/simple;
	bh=VWx9Hz6Cm7XN6ZEGdqdA5JMz4cqsVkZs+qj24ksqO2w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q5FoM990jqBKB7CZ1xKcMrqnDAKqNwUjHQMsjBATGL4vGmBMIhWLmOvbewaEsUbLI6C1j4fuZcj1D0LGGdd4JAaqRjKzEAUFyI5sm0HK4ghM1ZFy8+RBgUfP+K56+MweSH7G5bnmC/739RtcQV+ByN4VXmuNZYD0GhGSo+xPUUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STe6G8U8; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STe6G8U8"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca80d708489so453577a12.1
        for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2026 21:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785902898; x=1786507698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VWx9Hz6Cm7XN6ZEGdqdA5JMz4cqsVkZs+qj24ksqO2w=;
        b=STe6G8U8b5FxDn/8BLk8EZtXVmnLkJd+1ASnqRjOzFzjNe+iELUnN9w2XDw5SOx78x
         xR3NwkAu04liibjBEWATveCrpj2rQiqdquVOl4zvyKml2yFpL7zvINcurqE3l2Q6wf3O
         tOwPXbP12NvKLBxJwbeRixaChW6LBMo1oOuHSLtwAZHsw8luwNO5krOE0j9HU6ATw0CZ
         odfsgmRzYndUBjAXFTklbIjhspjt9JXXfcMvAQDlKc3cGuwNosV1rN8QTSln97DKQQxe
         R8XzEYloVU9FFfTCPxdL4LRcpAyfz9aMNVUAwrcyYKgNh9TTxtqH/RnuyebR49WmOlDc
         PkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785902898; x=1786507698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VWx9Hz6Cm7XN6ZEGdqdA5JMz4cqsVkZs+qj24ksqO2w=;
        b=VDmjApgE/XFq4NCkHvBbA+UT3Yx417DGxtmlN/YPWMLwqahggJ7/BD31d3/fSr7wPK
         baTFdllLUEJiGdf0D7l2Zruw4XJsXoFR1h/EwPfr1TYD3gHHTqVNbTUNEnBOrEtzRcSP
         XsCJ2qCMfmMz3MScoWdhQzdW/g+xhsHjIDbbKqRkFXMImOO5TOHviVywDV1OpSZ7frK1
         iESkHki+rj9ezy9j8Pzsh49JQKLoYQ0tyc60DsCa2X/QhQYb7GEfrO3cuSomwzHpJDx3
         Xazmf757EQyoxnIMRx4I8Gv7WRx47HvQzud158W9dXuvnybhp+ps3duj2ZeOiFjv/6LC
         ES3Q==
X-Gm-Message-State: AOJu0YwsWRIRnAV7wHlcbMwtNb5//roAbfmQ613EyUvZOef4kRNJoGHS
	UqzwAG2lpP8VuHiJfKN/CoxpXnuIlg72sY+/ArbEezHDg6nN+fWJc3pg
X-Gm-Gg: AR+sD12qRvWHOBorfKfY22Goi7GGgdaCrIkveBgoiDx4snSOxxoUF2x2Hzw0ASoxAHJ
	Fmc5yg2LqMHFCgqEDhwpjqVzfedWUMdiDUEmJ+tm8auw9JVLJHoWn/AF5JmvSVwZuWOqVQrZNLg
	rn5RO6q48HTj/9uNsSFmvjGaF61pkskIEzLZ5vgnRW7Vd4cXfsiXde179zFlaPmf+HP84LGASFf
	ou0lgErXupE254rVCp1NgszvXSzbqx5AdrOG4iKRW6NBEozS8XqPF3ZApIBeMeC6GRhMe8Jtha+
	no2JfslKLdoDE5INYJrfstDO7wgSpiDQ2kz0rb+bU+AU7Oy6PsL6KjQtOj9bQH7UDtPsSPkG89V
	sKM7UqbEr9H8RUeb2GcpWjcq+4gnuLUnJjn8r2MsYXi2Inbu1y9vjX0Bp7sFUrXRjXj4ZEwQaQq
	uBhl4hvcFh7wppQHcWOQWCOz9TQZIQFZwU13PRK13qLvlMB57pZbPARvQRMcgPOvFUjldZ8/WWo
	QpycF9iuvgt4A==
X-Received: by 2002:a05:6a21:468a:b0:3b2:8674:9830 with SMTP id adf61e73a8af0-3cb6c7f4982mr9706818637.14.1785902897943;
        Tue, 04 Aug 2026 21:08:17 -0700 (PDT)
Received: from ML-GYSUBT565.ECARX.COM.CN ([101.47.164.95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158678ec37sm10417178eec.23.2026.08.04.21.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 21:08:17 -0700 (PDT)
From: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
Subject: Re: [PATCH v2] usb: gadget: f_phonet: fix use-after-free in pn_bind
Date: Wed,  5 Aug 2026 12:08:13 +0800
Message-Id: <20260805040813.3194227-1-khiemtranzo532001@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2026080445-dyslexia-shell-2db3@gregkh>
References: <2026080445-dyslexia-shell-2db3@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Aug 04, 2026 at 08:21:00AM +0200, Greg KH wrote:
> Please always do that before asking a human to review it.

syzbot actually already replied to my test request in this thread:
"This crash does not have a reproducer. I cannot test it." So there
is nothing to wait for - it simply can't test this one.

v3 (redundant include removed) coming up.

Thanks,
Nguyen Quang Le Kien
