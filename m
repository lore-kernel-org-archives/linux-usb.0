Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794811435;
	b=OC+1FwKSJNXuA1bLj+pITB+tM2bHBUHusDcRMJKZfJAJ0tmQGfmX+B81nel2wuZr5LAt
	 l4UxeAQwbmVGWnQmblAOBT8vo+MUFU6Sqg+2PyBfFE/biI9mP8jf+Nb2T2oC7tEJzc0rk
	 nMFAViAARZhpKe0YO88WYI0RLfkOYRTJ1aCDSZ0e7zE64WQNc3RvmNSasFDEDqhEL+MUV
	 nZtXx/lxve/zl32mDja48h9D7K+DpnfUavudyHxVMZ3FBCHT1bhbKHE3f4l++s15w8b5e
	 waiJJ8mtjQKvPC0RSmaZ8feRoqe/rShjNI8YitGGZLOKyZ9xrhV8tiBYQAcN4lGyCWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794811435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g2W4hNeP0M6NWf4FvGzvDbkgId7WUHaeI44/sLdESzs=;
	b=4rBboIUWYFUVaDZR1bdVSdiWURWp3KibWgTv5goM3qZBkFaH6VWKaYQmtAhgKjXgwLiH
	 DTnBIWxDup8NEmbO71xFFxMO/onrMW0/sqOXEtH4R1i4o8APl2YiINL5Yof5hWNz1RTio
	 bXP4QbHWXGkGNpLpcR0lSCh8f5tEVVRHqHe9Vo1cXCcMiHFnfgXhNVj9Mninmp0IpuaVf
	 ihkEMRWbweLvJqjE0S0A3WwDsp5pWCK9gVe79vTs/yz6nzQJecnzXrQr86bk66u5pn1cZ
	 xrilwGstIUyZqcWip6uiOj7Dm0si5jTJbT78uppWeMYx7dV89aYV+/hggjHpOGXxZqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=wkennington.com;
	spf=none smtp.mailfrom=wkennington.com;
	dkim=pass header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DrGvFavz;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B14A606A329
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 06:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B14A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DrGvFavz
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so2514884a91.0
        for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 22:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1794811434; x=1795416234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2W4hNeP0M6NWf4FvGzvDbkgId7WUHaeI44/sLdESzs=;
        b=DrGvFavzN1FUDDGPxlZW0KLW4q4iucbgYTmif21v6YEMc7Hdkc5aLuwQLK1goOwbYC
         D5Fr9RrM/3QuBJL0djVaATxONXk3C+PT1A15P6dalLmqfWs9y3YdJsWZHMSzIJ7y8SOa
         r3JpIGJI8OOnvVEixf0nSeBVXbpiOZs9ejwWe3sO9bhv1wuZJ9ctztPgQIXiDDuHTOYa
         qL0fasGENXR9sC5/j/IkZyrfLz+RUGojXAkxtNzpTITxDFpApEcuuBZB7YLJFHSkltdv
         Tj7t1v18weRzfTYttWvg2URENaOflGDtbBzroFfT4infgZtJR7CVxe5WeNyQ8EXs8yKn
         epLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794811434; x=1795416234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g2W4hNeP0M6NWf4FvGzvDbkgId7WUHaeI44/sLdESzs=;
        b=vwa3wIsSpNvN4Z7cyaIj/tkBS8N/w19zvBIQ4ceMfZpk5O25+W71WF9jvFlKHa9xg1
         eyVjcMRSlC/16mvmIBNX3qge1mFkFLxV9WfMMZnr2cW2/bNjggdzZhG+8GZUJzrKJS18
         JU9/AitC6Y1jQ4sWkQYC/r7fSkwvM/ktHGNikco70aLRNIrU3NL4HtIsl3s3cEVovxwH
         ss8N9rlwn3fPR7/3AjFH2pXlY1vmQ02i9E+sxB0mwZUu5zkDI77mOt5uNBCg3UkcrERI
         tDXpWuzTZxV36pFOpw7hopmUO3VQ6Ep4zvVagrZNKCmpGTuMi9veQh5ah3XG0GtKOFqI
         5yag==
X-Forwarded-Encrypted: i=1; AL+hErFTAF1mFyDMn+mcb9Mt3p4nYcdy7gPLJ6cW2Y+u5AjoLDprvn3TcJoRM9up69TRWHRmI+X84od6DZY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jwxDuVtdxjSLj7TS+vZrSY0vEWXPztMa0R/SPZx7ifeUOLBZa
	8PmP28w9MxQKDCUhQCxA9sDCvljMDgSLba0upMLaITyuPQs0KYfcfH6QNmqEfEDz+wQ=
X-Gm-Gg: AZFdTZeHFydjV0xbNFYQRYb+FuI9QPTCi9WhDhf3cknnN8w1bimzOE575SMBnaNyW5j
	p2Nc9ARouWi1jBZKgvxumyJHJSYgWqleW15zTQxf9qUy4upwt8Mi1uZa/yJ4v5YzkVOcew4ppQZ
	CSJXxdcstnvRfHPCmt/7nHTfPzB9NvKHomvuKZ7GFIPd2AyH14ZeTYNsFl7+3OW7ghPduHujbSv
	mPV5/fsuP5SH33j+7jm+nwP2sv8qtV7FOo8ezfVmbHTUXuliA//euliDaWSlhI43L2fZ6swUynq
	kyYKkscjorTJLukbSrgu19AFeHLE2CYN9DR+O5F1KX7CSrE7g37w9cfQqcn9HylphAR5+Ed/Z3G
	sFuUaY7FOxTJIqHX0+i7/WFTRd4tSjYqz5vUcrqyYG5xJGU6YlBTmJrYefBrzjmw/IR6aMseEiV
	EnC0DS5uodc/93GhaxdFcSMG4Bt2h2vjz9TXhd7h5D60irb/8q+qAcnR+cCwKuwPW9sRHMEZ+G/
	AmIFwXafCxKCkPBHbKlelbtbi1zCacSpgOwPHcu8Y59q70FAPzyDw2Y5l182Io/oolREg7lhMAZ
	Pa6E+YALSZ26ogQ9U3T1avNLE+ruXMIAuNAQOIi2LwYEkMLzystrxw9OhP0H9elbzt5QI0BgCUN
	g6D4nsVNyEbcpqw==
X-Received: by 2002:a17:90b:528c:b0:3ad:8a14:bc73 with SMTP id 98e67ed59e1d1-3b1b0a4de36mr8224955a91.50.1794811433792;
        Sun, 15 Nov 2026 22:43:53 -0800 (PST)
Received: from wak.c.googlers.com.com (246.21.127.34.bc.googleusercontent.com. [34.127.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm20841677a91.7.2026.11.15.22.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:43:53 -0800 (PST)
From: "William A. Kennington III" <william@wkennington.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: "William A. Kennington III" <william@wkennington.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: ehci: skip companion handoff when no companion exists
Date: Mon, 16 Nov 2026 06:43:51 +0000
Message-ID: <20261116064351.1038057-1-william@wkennington.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261115075359.39ec8f71.michal.pecio@gmail.com>
References: <20261114051653.1353346-1-william@wkennington.com> <20261115075359.39ec8f71.michal.pecio@gmail.com>
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

On Sun, Nov 15, 2026 at 07:53:59AM +0100, Michal Pecio wrote:
> That's for Alan to decide, but it seems that whenever you use
> ehci->no_companion, you always add "|| ehci_is_TD(ehci)", and this
> is unlikely to change since HCs with TT don't need companions.
>
> So ehci_is_TDI() together with its associated comment could be
> moved to ehci_has_companion(). Then you no longer need those funny
> comments like "without companion there is no companion" and the
> code becomes somewhat simpler too.

Seems reasonable, let me just send out a v2.
