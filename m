Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B212F2910
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 08:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788598399; cv=none; b=lcrWTMdWKdSGfabnkyFNSUxAWi5WNpEhPLioK8sm/mFs1tTCGC3OoNnJUcnpdptm3qs64sSBMbyRbRbdSWeUua2gUrskYR9MdyYHvb6MMFtbLrK2W0QOgJwMoWOnnCaAaQtcJ81wRMNC+cOWupuJnonbKTKbxfulO1dglXC4dIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788598399; c=relaxed/simple;
	bh=nJ/Jzm/pLywrqXaRF1jReqVrMyMWidF2B+SXrUTd/jQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JpzVzUm7mbCA7IQgz2AMYWCw0TzbA7d2it07MECEG38IFQFS0RR7DekYZ//Mjq9Q4d39XwemWTpWG9cyINlTmE6qef1QY98SAZuJ77Y8VaRhQZrQL3xobHMqx8bW10l/X2GpidRf/HMrG5+hSrHTqd6MbaA/BaYET1ffmjPbM6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q6aT9gwt; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q6aT9gwt"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-39b2ad862bdso1759602a91.2
        for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 01:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788598398; x=1789203198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Oflo3Ik3xMRYIr0nUxXMW+sR1gdqaunhaM2vyLgzQM=;
        b=Q6aT9gwtq2ZUBDL3WxI7hPe/sykX8mvQM0bA95KjKIQj6DgWamVT66tJp4rZdSDW/Y
         23xuUefg3kk845w9a89Ub4emJ7qLF8xLy9Vavn8y7SPtA0wT7JjtiJ/Bo2Gc7OKEwLZs
         7uLhNGnoH7dvAvWRXvsusY4pwqnPBzIfqFE8rGb6bNfxRQC8Vhfu54C4I8YXvK+meg77
         iD6tfrPPSSU6sSM3+DS5Czv0/iZzZDpe6ecPhAcfnllQWpVqzVopbWjGOZHRPVk+5KuS
         Q5xv6einPgzl0TxsEsxRPCpmxOneJAX/KSNs9UrzFFerBwKKQFncHetxG4pt8k4e8xlj
         eYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788598398; x=1789203198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Oflo3Ik3xMRYIr0nUxXMW+sR1gdqaunhaM2vyLgzQM=;
        b=a571+rCZFd/TtX9EsRuYSuNX6DkpmzGhqJIzCcR55cktCQqN3j1aMRHDGEke/XoKDz
         woMlOY3Mb4z/+YEx3scL6KNDNKWeRaqOxX82g4SM3G6KvaaWiWLx3B/gf3/jVkbhdzkJ
         6dJuSgw0ifcIoXcnqZWMXJDQSyypDXY9yNzIE+80HWRh3BcEFAobjOvGiFTGO7mY7HRY
         LU0BcQ72fC1dR0JBncQrYEHy/Uz+dlnophxihfgTHuxYHeiu1RR3xlt3bdSpx436HVs5
         ZcK1g7LVpaFbrsy9RZ4RDzCKaR54fUl2K/w6Kz5s4tepLeelNQya2vQSsgsL9DEETS3D
         yfXQ==
X-Forwarded-Encrypted: i=1; AKwUvBybBInv1m8qje6gfDmRqDLFIqXM2GFDCeekhIsSQZKcJaj9/s1fLEQ8RXOrdMS6N6mlrUvxnnefRR4=@vger.kernel.org
X-Gm-Message-State: AFuF++lVwgZ9+EUSsgCGacYXyRqC/lkWuJHIsGRRr89uUOFUh4FamK9t
	QeY3s+EtRtZsiUFJVGEYbx7i21p4a6x6maNoH8zDzaD7Z41MoGF0lVkm6GNZGg==
X-Gm-Gg: AYBFou2n8zHqpbSkhVw28i6w2LeoY1o8ROIsomS3YTItm1nuAzdMWfGscun67j2GQGZ
	/IvnZOsUxT9a53oiUvvOuDrBFFY0akpl3BhCX8Jg1UPlDpTdtPajJpI7FnFFOiZkfj9EHTWxN3O
	ZqWlNcn9ydIRZXv2XYCIecSfZ5bkp7ONVkt0n6AgkidpT7zNNfLOjtOsYj9UnFECZ694xioPvM4
	RkIxSwmRDrcdwnhwSCBTgWdehNsyc6FLbP9usN7bistEDKzxYMlCjjzQ/E7t6VGo5RBm2tQrdWg
	QSQ8afEJdy3KPrnCwpsSHGyvNnRWKCxP/ltTrj4eywdV3XMSN4cS5GTas7YB6MnIZ28TtvJEhUo
	BQW2zDkFeIw0hF+luW2kTZe+g8voXfvgEoUJ/QkEIQckccFwTUJWmcDVNNIMlEFXABh+uJGYBC+
	mh7JB7ERikyEGim9W/e/H3K93BhwvZTa/WBhg+dcfleAtKPXuozmafNyD2iQPHfssXx8LNyGXd0
	Rs2
X-Received: by 2002:a17:90b:4c41:b0:398:9bd5:490e with SMTP id 98e67ed59e1d1-39b2623ac0fmr15992379a91.21.1788598397524;
        Sat, 05 Sep 2026 01:53:17 -0700 (PDT)
Received: from Default ([2409:40f4:101a:e710:d0dc:4c0c:d338:73ae])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm11404796c88.14.2026.09.05.01.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 01:53:17 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: oneukum@suse.com
Cc: jeffinphilip14@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzbot+0b8bff5929865345b29e@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] [input?] KASAN: slab-use-after-free Read in k90_record_led_work
Date: Sat,  5 Sep 2026 14:22:46 +0530
Message-ID: <20260905085246.11121-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <c79e754b-2ef4-49f2-8bb4-60b36ab9a36d@suse.com>
References: <c79e754b-2ef4-49f2-8bb4-60b36ab9a36d@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 2 Sep 2026 14:09:35 +0200, Oliver Neukum wrote:
>On 31.08.26 07:46, Jeffin Philip wrote:
>
>> I believe there is a patch for this already[1], but it has not been merged
>> yet. Was written just as the merge window for v7.3 opened, so might have
>> been the reason for not being merged.
>> 
>> [1]: https://lore.kernel.org/all/20260817072831.139954-1-ccc194101@163.com/
>
>Looking at this patch the following sequence seems possible:
>
>CPU A				CPU B
>
>enter k90_brightness_set()
>
>if (led->removed) [FALSE]
>				Enter k90_cleanup_backlight()
>				drvdata->backlight->removed = true; [TOO LATE]
>				cancel_work_sync(&drvdata->backlight->work); [NOP]
>schedule_work(&led->work); [THIS IS BAD]
>
>Just cancelling the work is not enough.

Hmm, we are in cleanup path, so wouldn't it be more sensible to use disable_work_sync
rather than cancel_work_sync to prevent this kind of issue?

Thanks,
Jeffin.
