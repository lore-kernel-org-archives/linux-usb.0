Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B993603C3
	for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2026 06:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788330971; cv=none; b=XKnW7KO0Ym9xqVOy1NKV6PgfivldFdSGXzICclkVCQwe9vgHYCkI+xKOMieJe7lvIQzcbiAvB8v4qyqGZfPa6gi/mIsZ43JRKrJJXYBqNGDQQpbuKbvqAIgvKN0sRD+If692prnQ2uLufEioheNQ2uVY+j0fiwKbHnXd12p6YdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788330971; c=relaxed/simple;
	bh=SJjF5p/ZDyMHTVt9OKuLlmGpY3+l1iTzxv1hT0WwQdo=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=qISyQYeLWgucNTCF8h+ZS9LTGsoSMekqZpNTaAYM7JAH34y0Voelu5wT/XJAoqHzhaQHfnTszOj2iHSbxGzw6MkpjrV4vTZJpvgF+PEGfrCkQ7D/YU88zoGuj/lZZbnfdA2R+i3UWJnojnlK/dMtglMG3eC91dO4Xz7KsSPihHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6Ho0EJZ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6Ho0EJZ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so6275105e9.1
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 23:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788330968; x=1788935768; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dndd7gYsW7vJgSBytdiT+H9xhB6mbAnJCpsEkGAE7Ac=;
        b=B6Ho0EJZbDT8CjVZqNRunnY8sIf9JMFammrgO5zCLZxdVoG7UZ0u9huRZvoKJx9MWn
         lXTrmIXUv8ubydUeHqCmtqCcjjxEYR3T1DDJZt9yxsi0NBEvYNmSy9pj7VGzlMoqUZBJ
         cwwiyvVRQN1R5KQj82JgFqchOeQ8ZBk4Vg5XFoCKGv1gGHfENxQR+EjfKUQwE61IXm1N
         dEZeM7Uk/nS4PhWY/I16ut3fVFfUwOP+W4x5MjlS27F2jJ9wGcQpa0zwE11afFxpwpJu
         PIKApMEcmBNmiUFk7LrsH7KWqEA/T/4gDGLe0UIAxX4goIwuajKIlxtYMSuSakuwd0eW
         KM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788330968; x=1788935768;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dndd7gYsW7vJgSBytdiT+H9xhB6mbAnJCpsEkGAE7Ac=;
        b=rfjsudQYPkPnayGiOzd4O/apLO2a2VZhUo4lP394DEopZtNAWlJZ9Rcj6P2qMpcABS
         +cwSh1Pg+7JWGkKCzpNihBR30KTmnTsjXAsfXnwI2eUBQtYcDLtxJQ7mIyFxy0ebJRcH
         u4fFR3yCHh1LU8ylxiU/7dHctE3Z2uBh4Ztt00K0zin2NGGQB3cBL1HWoCkfccmWq1Tt
         SuwtkdDeMy3a38Iy+7g995TR83KTtMpjHeSWiUrVypSg8lqLHVISYSNIdPsIxyzmJ8XH
         CjmjqD0MbU4eTnzQ9D3K5phB49cISoPIgO35fCZFRvzaf9w3/2MbKcA+TANcNrSiUUQr
         tIiQ==
X-Forwarded-Encrypted: i=1; AHgh+RrRRiIk7P9M19T8hD4svD0BYV2ZL5sGzmqbsX6T0EZL/6DekM9sMG9hQaFdqiChXUTQAlDb+/mqFTY=@vger.kernel.org
X-Gm-Message-State: AFuF++k8UjTDxsCuwRZ4V77VYYFTM6cihhqiGGMCwS10U+CmBbMJtHpH
	JFy7DDYJ7jUXu5CJDVgB9T2O9kLntTcG2tQtzYThDrKfR3BW9WJ8SES5
X-Gm-Gg: AR+sD12tGj0EMX3WftB+urEn9RAYGENgqFyfe/9WCENe8JKTxIj+BotK3welGcipGZ0
	ZzulUGLHMBrQuXNjjDAKH72D+VSiuxVX4ayjRTuYWli+InbyzvSThPZkQshJ8ZlACYOVKuqiiK3
	fky/Xusg0AGXxycolQrcRvjRB4bGX3n6uKQ3ltYvnIyvbjkDjDWhZpZvfD9B11nVHyBTyIj7se1
	4DoihDxiSnzJTShhDkWUjV+PEazSbQ/B2BbW8ndaw7yT4+tpy1nrx9f10fqVP5h807KLfJ2T+1b
	n6N1Zt2u/D32ItigylebiNcSd7L/Pxdmz8gekaUEcdZgN8M/bA3olMzk65F1p9NHreEuwEL7OEj
	NRFzp/+etLf1dKqMjGznOe5JyjDNRlsDcjvjBUc+MkSQgw+BPXbg+bTqQ/1BDL2JMzjPRf6FEqZ
	UREWO9qxApruofTxUKMwqB3bRAMT4WBtjSbj6rQqQQZXuK529t0Gyc1gJPEm9R039gZQtyColUd
	zgYQvmz3XrNQoN/LHjViPt/twm3YLaz4A==
X-Received: by 2002:a05:600c:c170:b0:49b:d45:703e with SMTP id 5b1f17b1804b1-49ce57f072fmr49595015e9.8.1788330967618;
        Tue, 01 Sep 2026 23:36:07 -0700 (PDT)
Received: from valmpani.valmpani ([2a02:587:f24:b00:967a:9200:4108:5b68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce478daf6sm76906625e9.15.2026.09.01.23.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 23:36:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] usb: gadget: f_uac1_legacy: fix double close of the
 ALSA devices
From: Vasileios Almpanis <vasilisalmpanis@gmail.com>
To: Vasileios Almpanis <vasilisalmpanis@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Felipe Balbi <balbi@ti.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzbot+df868600fe111c5ff79f@syzkaller.appspotmail.com
In-Reply-To: <20260731-alsa-v1-1-95eb93ba32ec@gmail.com>
References: <20260731-alsa-v1-1-95eb93ba32ec@gmail.com>
Date: Wed, 02 Sep 2026 08:35:27 +0200
Message-Id: <178833092702.758419.14598038877762182896.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788330965; l=1847;
 i=vasilisalmpanis@gmail.com; s=20260731; h=from:subject:message-id;
 bh=SJjF5p/ZDyMHTVt9OKuLlmGpY3+l1iTzxv1hT0WwQdo=;
 b=MTtgXtWG8L9XwK5/xDY0y+RWuias+3K9RWG+imEAtPb7nP1entgsByJkhISnM7HQxjs/Ky3gm
 nXDVL/3ww0VDt6s8fE0aHUgoiLxLUoqf6IvvDLoAB4o0t+CmEgTJWVI
X-Developer-Key: i=vasilisalmpanis@gmail.com; a=ed25519;
 pk=gn5Uo6yL8Tlpq5uATxA3nqoq+U8eWLRbjD+bOk0qSpU=

> f_audio_bind() records that the ALSA files are open in the function
> instance flag opts->bound, but keeps the file pointers in the
> per-function gaudio card. Its error path calls gaudio_cleanup(), which
> closes the files without clearing the filp pointers or opts->bound.
> A failed bind does not destroy the usb_function, configfs_composite_bind()
> puts it back on cfg->func_list, so the next write to UDC binds the same
> f_audio, skips gaudio_setup() because opts->bound is still set, and on
> failure closes the files a second time. Dropping the config symlink after
> a failed bind closes them again via f_audio_free().
> 
> BUG: KASAN: slab-use-after-free in filp_flush+0x31/0x190 fs/open.c:1464
> Read of size 8 at addr ffff888045f01990 by task syz-executor659/5617
> Call Trace:
>  filp_close+0x1d/0x40 fs/open.c:1484
>  gaudio_close_snd_dev drivers/usb/gadget/function/u_uac1_legacy.c:263 [inline]
>  gaudio_cleanup+0x54/0xf0 drivers/usb/gadget/function/u_uac1_legacy.c:305
>  f_audio_bind+0x4a0/0x630 drivers/usb/gadget/function/f_uac1_legacy.c:792
>  usb_add_function+0x290/0x930 drivers/usb/gadget/composite.c:333
>  configfs_composite_bind+0xde0/0x1410 drivers/usb/gadget/configfs.c:1802
>  gadget_bind_driver+0x2ca/0x9e0 drivers/usb/gadget/udc/core.c:1662
>  gadget_dev_desc_UDC_store+0x1c9/0x2f0 drivers/usb/gadget/configfs.c:300
> 
> Clear filp, substream and card in gaudio_close_snd_dev() so cleanup is
> idempotent, and close the devices on the bind error path only if that
> bind opened them, resetting opts->bound as well.
> 
Hi everyone,

Just following up on this patch. It has been already been tested with
syzbot and the issue appears as fixed with this patch. Could you please
take a look when you get a chance?

Kind regards,

-- 
Vasileios Almpanis <vasilisalmpanis@gmail.com>
