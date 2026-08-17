Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BBD2D0C8F
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 15:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786979053; cv=none; b=EBpH2W3evprPprpBWk6qppdb0hHZNktCW9ZVNUbcdUKQhnutKVgDzwKohXH/j8VhZp1vBCsUVUDvsyixsGJWoyGc1+Zk4DgX6caVeCjXkUweVFYJWib3cBUYz8idWOBqtv2SuAv0Zj1RgxyqPZbm+OT40nZbP/qFHpNW13LzYW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786979053; c=relaxed/simple;
	bh=Ur+cKiVbAh3ZsrGizOKH+9+i3VfuiVrSQMhUYBEr/Ao=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RfDeKNigH64RqT/9XVjA04pKdofCNem3Y90kilxPK842jfUzMy9wh4j3SfmlaNUYlCXqARSEH24NC6/JC4YFGgvIOlLPQsOFx8n3MG5I3ookyzHdDni8VRoxLZ1tYnycAiENxtPuWVtP7G5cHtNlfkxbIoQBrZHrR6CKfOnVFYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=C4geTbvj; arc=none smtp.client-ip=74.125.231.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="C4geTbvj"
Received: by mail-oi2-f11.google.com with SMTP id 5614622812f47-4b25c60f07cso893123b6e.1
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 08:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1786979049; x=1787583849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hzh00wSs4akcYyh6M7Ta6jCsY96mvygh9fJXvzCpDIs=;
        b=C4geTbvjmQxH2B2kAfKmRe8Z0qFErpeI/SbkffYWpwIiJPX/UxwqUZgQOGh2wSu9cq
         z0YisZnJEZanj1Lvs8r7k1PRcJ2jj84p4lSwHw3nTm8fRWu5MyaC1cGePxw/0awlkIKt
         fSlRTMdhcUt3C9PwrnlqH3zddCtUH+qt1vwsVZK+HeCAED8zDhf6hMm7cpnGLxRHa6MO
         EsR3Syic1aNMahrnNYj9WqQMiSiHbTf/bvCsyxL648gJLB9JUqKVsORWze3ExIUVwp+a
         ttXMP2AL6qiAIBxZmibSYoUoUafwn+ts77+p8kynYNRwVOcxCr3wJk7rTWtwxVY0ll3n
         cjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786979049; x=1787583849;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hzh00wSs4akcYyh6M7Ta6jCsY96mvygh9fJXvzCpDIs=;
        b=USqjsBx7eICQYhWncRkyx7ZV81SazXGplTWzh9I+PNIqAMI82lXMzTE9tTYVDJUCn3
         /ntTMq3omGzvgj4uED6/f7froCxqM84j0yMsH/q2gSjji29CvJU+xdPaZ9ZKfYeI+MMF
         ee6Il4vpuZsdPNpmrbjmRgc5S7+uT/SA3IKfHgQvRN06AyxBRfdbdnLxATF2VZkcVdoh
         o3tqFD3TM3v0ZldwM7nZwZ4hte0UBcy1axnUU2FEF/5qXC2QdqDJEtbf0FDs1FMMISnO
         x89Uy/YY8gGKiYoGouthzclTPDQcg9tRfJRhdqBJ+5NztWxW59l7mV7/gFmnTvhrad5i
         gXog==
X-Forwarded-Encrypted: i=1; AHgh+RqXQ2Rq2G5lqdnyUk2/31Sd5jWpZkP/e/J0hq2XB/LILLYwYDePZbAVWG8umINOUmzsF38SUqHEOjg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMDvZqGrn7Hbb+sk9fhYUSbBgeB72oxuJo8HWDLp4sJtGgp/5h
	M6Ic8Yw0kudLD1gerLMTf/4fOPfXYLT89Xybla/V9nO8yM08dG7MwpyAKlDnJ/om3Wc=
X-Gm-Gg: AR+sD10Ztn71XOv7yFVMXUzR2R4NjFJDzxyPPavT8infIZFOxi7O2aJcnW5isH+QuWR
	BVZQzBXInK9rOXy6qUfRm5k+ZGgBz+P9vofHATpvFGA3kwMeX3v/Q2tKDsI0+8Bb6gXp8FF+Jgf
	WaQTGO7LJyCmj72LZ+O+FHoEO5xIo3ZLdF6cheJExAaT0z/c1ksVKUxwoZus2PGrbVODwC9Wibg
	XojyGv4h1v0rMjaZ41EzAWtb1pGlH2BZV5F3RGzXfP1hJ9YTvCvBtVZPe3hpzUqSgb7GNmaC15J
	di4pa611hC2Dj1NKIXdp7lO+WVyIaltKOTxylRyvitrjGOIGK4vEXEuiDbXVNEX7z0ppH36ignk
	aVbCf65OsHrQ1WmV1rYoiHrU1cQ6KKxsUL0Mv8HkH11fFV3xJx6Wenn6c2MuBaV2acu8Rwr3CO8
	u9+LbIEfvEi1VNtaBb2z5wQAAfAoiZL1M2YvTkENECgM110BHPRKZ7+Rc3JZ6/cR/iXujBbrwg/
	3u4vkjUEUtEby7dH9k5gzC2x2Nvu6C7BBpADcrdTlbYG2A=
X-Received: by 2002:a05:6808:238b:b0:48b:1e49:24a8 with SMTP id 5614622812f47-4b241cbe2e6mr24394079b6e.11.1786979049030;
        Mon, 17 Aug 2026 08:04:09 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b290a3d048sm1165264b6e.1.2026.08.17.08.04.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 08:04:08 -0700 (PDT)
Message-ID: <7c6ce54c-ec12-4754-a36e-d5550f8337b0@kernel.dk>
Date: Mon, 17 Aug 2026 09:04:06 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in ep_open
To: syzbot <syzbot+df9e891bf8ea586f846b@syzkaller.appspotmail.com>,
 asml.silence@gmail.com, brauner@kernel.org, gregkh@linuxfoundation.org,
 io-uring@vger.kernel.org, jack@suse.cz, kartikey406@gmail.com,
 kees@kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 mjguzik@gmail.com, nogikh@google.com, stern@rowland.harvard.edu,
 syzbot@kernel.org, syzbot@lists.linux.dev, syzkaller-bugs@googlegroups.com,
 syzkaller-upstream-moderation@googlegroups.com, torvalds@ppc970.osdl.org,
 viro@zeniv.linux.org.uk
References: <6a830fab.dbb3a75c.20434b.005d.GAE@google.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <6a830fab.dbb3a75c.20434b.005d.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/17/26 7:42 AM, syzbot wrote:
> syzbot has bisected this issue to:
> 
> commit aa00f67adc2c0d6439f81b5a81ff181377c47a7e
> Author: Jens Axboe <axboe@kernel.dk>
> Date:   Tue Oct 22 19:47:00 2024 +0000
> 
>     io_uring: add support for fixed wait regions
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10e60679580000
> start commit:   9a143525f62b Merge tag 'ata-7.2-rc7' of git://git.kernel.o..
> git tree:       upstream
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=12e60679580000
> console output: https://syzkaller.appspot.com/x/log.txt?x=14e60679580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=c44651ea7dd2f307
> dashboard link: https://syzkaller.appspot.com/bug?extid=df9e891bf8ea586f846b
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=120defb9580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16323fb9580000
> 
> Reported-by: syzbot+df9e891bf8ea586f846b@syzkaller.appspotmail.com
> Fixes: aa00f67adc2c ("io_uring: add support for fixed wait regions")

That looks like nonsense, I strongly suspect it's a race and hence your
bisection ends up being mostly useless as it sends you in random directions.

-- 
Jens Axboe

