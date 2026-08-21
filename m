Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21EE3749FE
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 15:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787325086; cv=none; b=Ta8o11LDUDXH8zRrJpbdTw7fOlEWMSH61D3oFk+tsttfvlgVa2UlQ3Z+TxxTiiJXoZiqAgkQJ0oUmL0Je4rbig08QakQwEb2lj7eDAA6m9eJf+f95imQtSw3NyKe6kOprCmXEOPylllZBDlNw4de4wm76nLR4bHPDzD2t8PXito=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787325086; c=relaxed/simple;
	bh=uLmj3KkSrxFi6oZNFdb76IGaznhYQT7Sz8Hem0vXFeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ClWZzRwzIx3aEZBWH1ys6J3wbHHpJBqoTnKOY1ScFJ1Gf1oqA9+hTxyol9UnW060AQkT3hoHMmA2+YDswzDU07OA6i9nOTyZo4cAaeTJaP/dY9fkFiwB+gqaXPEoIToey6qBj3kL2y8T93ab1UUdeDAg+TWj/3aY5Lq8f5kDAq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Om0n+XBv; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Om0n+XBv"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso12404275ad.1
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 08:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787325085; x=1787929885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8HVOP/ZZ67PrjnRM0sx3QubuBlJCUlFS75mhhYnPKM=;
        b=Om0n+XBvPkns2XUklLo1aokQzsdRHGLgEiY8IsWZ/kK82I1Mk8RyiBoXSneYYHasRf
         0EoymffsvaK3E1aLEdWXt9JJ4NcdEgFck4M1tVH6+fuGa3qd2qZfdPc3YmSiBNCG/MlF
         ZWmxifBXQiVWoByQDoZuR2wHXTa9dgQanu3ieir4kICS0z50omnsPbM2fbx6AnPvcJC0
         AuvYzE1ypQwNiZHtG2Ck9b9+OwGVbEvEHEFSAQchCKbRgSQs1V4eR7WkTLK9vpxW2zGf
         lr44VLgKCgq0Dvh4wG5TNgpoWridkPdQfG6xV9jIPC4z5tW4kksF/LtVwUGfO1TYznjV
         VKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787325085; x=1787929885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r8HVOP/ZZ67PrjnRM0sx3QubuBlJCUlFS75mhhYnPKM=;
        b=eAB0b/5qdfKJu6UPHkCuMhZCXyOZh9BJkH6XLhRgChZmy1SbgXQP/m+7ki5S3dtsdH
         oIUPuvSLpL7Pbn6TkAhSqayLePUskt8OYJ4+pOoVJw9wZAncDyr/kBILmc9jtYHrxDZm
         qUKylK/PxHCW7cf1mc7XcTyStMKHmVJboaNaoAS+EmczV/ZqsU82ZaHBWYtjOoyK3Lhs
         cDdfJFSyuiZ3gViUjR2NGE/1ZSj0DGVqKvVrwQ9rhb6SwHRN2wy2DJB+B3ELZcP3n4+Z
         UZ1hRafIM9vh0EKdy6TgTKF+kO83GAX9X8jEzbLROXd+wtH0d1PY4/6NKgUf0ikum60L
         jkMQ==
X-Forwarded-Encrypted: i=1; AHgh+RqnHuM1uJhsgIzD2nKpGHlq7K6rYGiKSXmEyy/6AfdVT+18PWV+dU2USx74GK6/CUN7fqDROCoNuBE=@vger.kernel.org
X-Gm-Message-State: AFuF++kQnM8me+gLqhOq5mGzDx6sn5VzC4O7PNZhCUGumylqglJzn76A
	uZvzCsyll8V9yUoMlYMWXm0TPWcKcV0+r0ZhY9QLSHDx1VYxcPFl4+f+
X-Gm-Gg: AR+sD10C7YLP1IDgfPvkd1RNWnsmiP+4qJZPFAKXNYogQL2Ncfda0uJ0CfFktOANajB
	krKDV4JMvglnPLWJMAqRwgL6J4OQ0pGPVVz1ev7VxhAt1/Kwt/ZjHDth6KDMmS6rZxcLpbs+RRJ
	Sh17XbeETnhFauYCs1B1U6Pi70CAtwcTsBDx4aFcQQ8cGQMDJAhNMt9anGpxmTx2NFDfIQkeDGu
	SVooyh9UPavx+kHFZT1AnoSH9EyAo3iqZ+OYAVH7okUyqyl92YrCUcuJnVa+n5cX94urpRKNeJq
	GIp6x/qltz/WL6TjiiRqveMmFQz5RE9vjE49oY+knsEcHsrTAYEC48n1jm2CNywZAM3VZGfPRyZ
	6q6ELBKpuT4UNPq288/jCeniNqybXruUlLDCQsK9jiY4jk3RMyxJvr6YRPHmIm8eqPuQ5/kt0zl
	lRjRfqnfabVZWHRtce0x3aG0hvd6EPeiCOmWZOnSBtRacLGWTPBAZwVb+ZMDP4GtVzgA==
X-Received: by 2002:a17:902:e785:b0:2ca:6eca:492f with SMTP id d9443c01a7336-2d64b0e2c7fmr151543345ad.14.1787325084889;
        Fri, 21 Aug 2026 08:11:24 -0700 (PDT)
Received: from Default ([2409:40f4:1002:57cc:6b4b:100d:637b:da22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf10ca5csm27897760eec.17.2026.08.21.08.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:11:24 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: heikki.krogerus@linux.intel.com,
	jeffinphilip14@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mika.westerberg@linux.intel.com,
	stable@vger.kernel.org,
	syzbot+1a01783ea233350598b5@syzkaller.appspotmail.com,
	syzbot+520d7648a0d934061fb0@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: typec: fix null-pointer-dereference in wcove_typec_probe()
Date: Fri, 21 Aug 2026 20:41:07 +0530
Message-ID: <20260821151107.19945-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026082125-getting-upstroke-a146@gregkh>
References: <2026082125-getting-upstroke-a146@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 21 Aug 2026 17:00:12 +0200, Greg KH wrote:
>How can a platform device NOT have a parent device?  WHat system is this
>broken in?  Why not fix the platform definition properly instead as
>something is really wrong here if this is a "root" platform device as
>that should never happen.

As seen in the Closes: tag, this is a syzbot issue. It used driver_override()
to bind it in an unnatural way. So, I don't think it is possible in a real system.
We could atleast validate pmic like other functions using dev_get_drvdata() or it
could be left alone as is.

Thanks,
Jeffin. 
