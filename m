Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8642F3ACA4C
	for <linux-usb@vger.kernel.org>; Fri, 22 May 2026 14:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779460964; cv=pass; b=FV0x0EEkQQnWYyC/jCOTAEmJ168Zf4D14NvlVKXeVI6sr2AFILQB43VUksiOZzBt+cIQfoUq2ib1pKx335HwrrW38xGcMLXWw5VK1Vv3qltaaYyJz+dipUN+tgOrjA034i2M9EgmhmJDav3gmctTFnAmuIGz/SigpslvTqUYkTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779460964; c=relaxed/simple;
	bh=4WQ0zojNlovj8actFOIa+b2y7t+Kdrs79Zv4ubTvYmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MwnqMHwV+IN/lAR9N4++gyIyJgsuq8gqeoZvimf5shpiU6oTnakHqT/7VCj5bCMUxZI9Ux4shO8iN5QDWHi+PBzLuucXTqN1kmNRUDwLXKIzSJBOGEiw08oo5IPbOo9iJPN9wGjXmWPgA3kEHuVnTmne61Y81/XGUx2Yjoy58fA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KwfIscAF; arc=pass smtp.client-ip=209.85.167.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KwfIscAF"
Received: by mail-lf1-f68.google.com with SMTP id 2adb3069b0e04-5a8891febd2so10133814e87.1
        for <linux-usb@vger.kernel.org>; Fri, 22 May 2026 07:42:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779460962; cv=none;
        d=google.com; s=arc-20240605;
        b=daFkEGT9/BMjwhiktwT10NZ6gksE2KewFazCC+AE+4m5ArEYUNJWDxBOtMIFhjAyX1
         ucwE3da43KLuYmWVE5ydZTKZZL7m3QKvf3m00gdTN7wYWb8WvzeACUoj3NfSHc+0rqgE
         MK5ZIfb2wcE2zdDmxBy/l983/WndOzI0Mn+/Apbmq/l/9+s0QhKeEyZuskMQ7mLTjcko
         j0KKN03acCYVx4YULTekiHYOjLsuhxlLSUNEkYTztAvX4bFi0qd7Owh/htC2b88ckYh5
         NMfm3iKj/8rjtxyr5TGqjzsbnnPtw2m0Q+M3F1ydga28HMTCQc3ZRz8g0xZm+bTwhNg1
         eDvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4WQ0zojNlovj8actFOIa+b2y7t+Kdrs79Zv4ubTvYmg=;
        fh=Nda8iNE3JTJDhi8LI2ezkM9jbUYmgw0tqyGuIL0x57c=;
        b=Z/AFmZc6N/IvkprugeSw/Ik8iyoBOU4QghPkIguWLFZuyBBBaKeIDLdx7++6AKfOPc
         An2V4RF+Jfdh0Kz7NEYlU0zd7rMGeWzyU3Nl6WP/ZiVLcMMTeZVGBhBpHK8pGIWooGU6
         G6lwhfZv1UUvSOkivZHWhA1P3xXz46M7PXNDNWH9eEyh8f0pSQxsipoeYfUBH2N9aajK
         XwqrIv2EhgwwBasR1usvqhA96ddVwjS0JajWYzyLu8hdapDNiQbV/w+LKFsO1F7PCduf
         u3Vno1dNwqwFipxuRXUcoghXCAZigTBJiRM64iFpPd5foCc+5as+n3T/2V11zRbzooiY
         s2cA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779460962; x=1780065762; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WQ0zojNlovj8actFOIa+b2y7t+Kdrs79Zv4ubTvYmg=;
        b=KwfIscAF0SBVVcFSZ31UUXfYpqur49PAluOKqtQyuKQM2+tIX5JnfOM5sFRd9fV9gU
         VV00Ut1waIMK3AQfUOsjBfHmR4YtA6KMiQ1o5Xbr+7bN2ksMg2XOMhiIIQFF3gNk/D69
         /eAa6NZCZWra9sxFksYL5b2wXr6N0Ig3KBoy4JDe3w1tATpn0IsnhazWwNPC0d5YJGj6
         seU2gM4Epug1tBlohpaRbdbOB74tvRASJ2zkxKd+1Y+E3PVnk3LG0HFKTtz1NmRIci5Y
         Zx0T7FTO7y9HEwKoNfZnIweSqjlzSVzWzOCTNYl6Q2JFVf3Ug2iPl0p7hD9Y1uG8O9jZ
         jTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779460962; x=1780065762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4WQ0zojNlovj8actFOIa+b2y7t+Kdrs79Zv4ubTvYmg=;
        b=ZHdn7BKqocZgD91Wzj290/HP2x9ZT+Q2bjWgWxZONEQmWDFYaCUkgmdtbMJXpz0OPo
         R72wxx1GfAYKqsJJ9RyuPImAWAKFOlekVB3B7pmmKpfs1X9Uwgp9rKbLC33G7Fa/xWBR
         nT7vEDLDoJfxMzz3wPnhel7dsAiDKGSzBmfveOhqfmed1xbZcKTvgswJZTUs2p0zsLIT
         noeSQefDholTJQHqjlProeUitncKWLDc8z5FwFCKMbWysAgfxMXXH2BiyAAj0WoxqFHW
         6QPRh89LYPrHhEjWTc9rVYXgKGzmOz1h1mnXGxRWOJLDlim+tV6cxR9fBqzv9jsG9MiU
         ToSw==
X-Forwarded-Encrypted: i=1; AFNElJ/SRD/spo8/wXa4EGGqoQEk9kEYg+8bcYOsRtW3cIOKJ7Yi6n9UiV7FMs3+wmWECIPIR9cUmeUu/CA=@vger.kernel.org
X-Gm-Message-State: AOJu0YycNEtpvlDeOyr/UH3r4KWvn0mvRjFtNYTadFHSUwJayI6AiR5h
	Vv7oc2ZTDAjUjUkJYH0VU9eT+s1wk2tSRQmc2CO633ZJyIAHahQG9s5E9WBGR2r0fqVDAYBHVZS
	ntXDU6m0XRgs+cU5CqXkBAfsQkMupDVQ=
X-Gm-Gg: Acq92OG2r/m4sZN72rtYVUWtrWhvdgNp7hsJgbt+XTdsKADgkklagJwZ1XnGB0M/Kck
	Rs7zK685UVGDrTXNMEBpi6eOjAp9tZetNgBgAiOsiwG/hb97Iwdn6U0HwUK9kyABhrC9uvEcANT
	bH3X7iRA86KbmXHYvUHYbxgWhu4U+FrjSbF/iTYeoEuniD5VDZMIUp9SK6eo6SVsmAjNXQk+ZXg
	M/gMdOQhjBWcB4HmK4BVnEPXz2yTQek3/vhjXE8XhO4tSFhxGo/DdD2oi+BD5PTcyNr78G5Km1J
	qHR2LWVrCA4MVntq35ZB
X-Received: by 2002:a05:6512:2349:b0:5aa:106b:45e5 with SMTP id
 2adb3069b0e04-5aa3230f6f4mr1707893e87.0.1779460961419; Fri, 22 May 2026
 07:42:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522101621.927034-1-johan@kernel.org> <CAB7XQsFYZcNssaxjYYoBm4ROgFAAYHYOKXWzFs2YK4cLiYF0Qg@mail.gmail.com>
 <ahBoIngkuYZ-__QA@hovoldconsulting.com>
In-Reply-To: <ahBoIngkuYZ-__QA@hovoldconsulting.com>
From: Cen Zhang <rollkingzzc@gmail.com>
Date: Fri, 22 May 2026 22:42:28 +0800
X-Gm-Features: AVHnY4J4ZNzDXAIPG3CnV51Uy8t2SP_8h8xVFK7JMWLA9NVGioxlJnoJglCqk5M
Message-ID: <CAB7XQsH+VsFF9zxNKGRDJ=-_n3_JaJWhp9Mho5P1xzUQVB2KqA@mail.gmail.com>
Subject: Re: [PATCH] USB: serial: cypress_m8: fix memory corruption with small endpoint
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Johan,

> Sorry if it wasn't clear but my patch isn't meant to replace yours as it
> fixes a separate issue (introduced by the same commit).

Sorry for the misunderstanding regarding the intent of your patch.

> I'm hoping you can send me a v2 of your fix.
>
> Johan

I=E2=80=99ll work on a v2 of my fix and send it as soon as possible.

Thanks a lot for your guidance.

Best regards,
Zhang Cen
