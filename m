Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D2135C180
	for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 19:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785353897; cv=none; b=ezQ/SXroALwWTVnztsXhUr88NCL0rUlg38cpmIUIBAZEtLrMgMYP9HYLneL8aMOEKxAss5kwuKkf7T6XFA084SxqtyCp3Mb6AHOKyK7oWM6Kp326HbGbxauXr+KDzyYTJmUR+wEIj55cOrjYFTc+PlBIdLvsT8NVZce4TFpoY9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785353897; c=relaxed/simple;
	bh=XwNgm9ATHQcGjGNk+lydH01xqpvPa6t/7xgikX+lowA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=inHlgfcY+IMfzydmrCPb79LOyN4Bsw7VWi4Vh8YaBrgS6BUkjlonUFJgtosEVlV4tez2/Ucf3GM902G4z2i7QP+OhnuRAtdYWpTAj3VS9gNEadNDckq4QNBNuq1WF3SZEiBrc2KakByVGiUNrdfkq6ICO0phpMxTBXt2t+ptRyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ce+KNrPd; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ce+KNrPd"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so1371866a91.0
        for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 12:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785353895; x=1785958695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fGQJH3HgC5JOXAIct0TTf3DXud55D/ZhU/Mkkd98GCc=;
        b=ce+KNrPdEf/PjsNGndTJTBbc6MejYsxI89RZB4tjuchBrVwLAzCIg8y5O7gOZ/j8n5
         isd0JudEcgwpdbDMPcxb9kVGXUtGt0waDhS2VMYd5t+J45MEU74wfFzT/PeitsW1d6xg
         gOYzxhaMr/HgPluSo6senSVNlVl+AIPzYeLeDu0fUV1xHgi0sa37Mp+CCTPIoXi6QWFr
         /NVQiUAVhz/XfzapYk78YweFV/7KQp8gFiKcJKSfBye1qycFYb9wNmfm/MfIn4597bug
         vfIJL14iqIFpJo4lL92We67iQzoiUN13MhRWxaHrYvZyxq+UjRzrCgaHpjBlAyX1cD5a
         CJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785353895; x=1785958695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fGQJH3HgC5JOXAIct0TTf3DXud55D/ZhU/Mkkd98GCc=;
        b=cVUXdTCBb7d4oPWpIY+VJkFwTDlZo0Q8fuAMgp+zbTWs7UM5tZAy6v8NvsghMyjz+u
         yXSYkuF2zQ23xvD6JT/JGh08PaGQpiVW5izF5UI1kx3n34nMeq0Dj/D5GL+rlEPzRqR+
         1lT91EJWYJdvpSo6x71fwkZWL5b/r0fCd/RAq8+7pYHky1mbeRiSJS67G3/11ThnBhlZ
         1E35bJZDbDzjtUoPWMKB5f9vXqAfVPjV0WzjFMtGj1Hf9aeuzidcRqxOXZWxC7UV0wkk
         0Q0p4GTDNifrbxY9uDWQlF7jxagJ9AuGbvAL187vri/zLhLaxq89vsjJohrAm9gvZb4S
         NIew==
X-Forwarded-Encrypted: i=1; AHgh+RpwJz6Hcd4Al/w6HpHy/IUwj6d7CttPfoop13BDmwHid9qo/OmGyBrvNFxreRwTEE6+HZ+5dMxUhCo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3eOWdQXhHC6hTsHQjytMDZliih6CGoYKms2JEVTZSiKxo61sm
	gODVoH3S2Ujwyuq9mqbdckLQcvWL6JuAB+3gNPpsHV+t5Z8ThHF1stO9
X-Gm-Gg: AR+sD13CJEquUtc1MnI3Eht46HWtfD1JoufSZ9/eKuzc5BcARtfk6F/p2pPp4vHX1em
	zruwZ9ZYU+5tVMn5TCmy89Gud7UGsm4I5CcAZNwjJF9HNmTEHjTIeqLKte+5cy2bO89ryLAttu3
	yRmbmZj2ov1b41Dbec2StxXNAxZ87ZXmGm4gzQLl54gStxbZB7f8DrRM19PohcjAfwTnLCCxBJU
	g0kYc4ovC8qkaFCrWyoYMqTVGSJYmK6TbOKc8G9goQd69r9gcLqDWqzs+XqiRbNJw1gq3edSdon
	slWvcNh1haDgJyw/vL5wDCytMFfHu4b7wYVPxWwYG0SXIFNjDmof5+U74gHPsCLIG/2ZBjeCS4E
	5LXR+ZDMrzBDBJys2MdHQAgAvqqKD7tjKPOyY+I3Gbvpx/8Xe5ZPNY/K4dNHnGhlhjbfmIJiNQ6
	JZLqXnG156WCemqKCpnZ5911JsIlO44audSQ4OXB4RwZC2wJMui4NfxFmCwB5Gka/+
X-Received: by 2002:a17:90b:498f:b0:37f:9ce3:ca95 with SMTP id 98e67ed59e1d1-38f993843fdmr155523a91.30.1785353894717;
        Wed, 29 Jul 2026 12:38:14 -0700 (PDT)
Received: from Default ([2409:40f4:100c:ca91:db1d:88f3:514:9ded])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504927a7bsm14207721eec.0.2026.07.29.12.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 12:38:14 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: syzbot@kernel.org
Cc: christophe.jaillet@wanadoo.fr,
	gregkh@linuxfoundation.org,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	nogikh@google.com,
	syzbot@lists.linux.dev,
	syzkaller-bugs@googlegroups.com,
	tiwai@suse.de,
	Jeffin Philip <jeffinphilip14@gmail.com>
Subject: Re: [PATCH] usb: gadget: midi2: Fix null-pointer dereference in f_midi2_free_ep_reqs
Date: Thu, 30 Jul 2026 01:07:45 +0530
Message-ID: <20260729193746.313378-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cafe65f4-e1bb-46a3-901d-732814b861b2@mail.kernel.org>
References: <cafe65f4-e1bb-46a3-901d-732814b861b2@mail.kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 29 Jul 2026 11:04:54 +0200,
syzbot wrote:
> 
> From: Aleksandr Nogikh <nogikh@google.com>
> 
> A null-pointer dereference occurs in f_midi2_free_ep_reqs() when attempting
> to clean up an endpoint that was never initialized.
> 
> When configuring the MIDI 2.0 gadget via configfs and setting the block
> direction to SNDRV_UMP_DIR_INPUT, the initialization of the midi1_ep_out
> endpoint is explicitly skipped during the gadget bind phase
> (f_midi2_bind()). As a result, the usb_ep->card field remains NULL.
> 
> Later, when the host sets the alternate setting, f_midi2_set_alt()
> unconditionally stops both the IN and OUT endpoints by calling
> f_midi2_stop_eps(), which in turn calls f_midi2_free_ep_reqs() for both
> endpoints. When f_midi2_free_ep_reqs() is called for the uninitialized
> midi1_ep_out, it attempts to dereference usb_ep->card to determine the
> number of requests to free, leading to a crash.
> 
> Fix this by using usb_ep->num_reqs instead of usb_ep->card->info.num_reqs
> in f_midi2_free_ep_reqs(). usb_ep->num_reqs is correctly set during
> f_midi2_init_ep() and remains 0 if the endpoint was never initialized,
> safely avoiding the loop. For consistency, apply the same change to
> f_midi2_alloc_ep_reqs().
> 
> Oops: general protection fault, probably for non-canonical address
> 0xdffffc00000000ee: 0000 [#1] SMP KASAN NOPTI
> KASAN: null-ptr-deref in range [0x0000000000000770-0x0000000000000777]
> ...
> RIP: 0010:f_midi2_free_ep_reqs drivers/usb/gadget/function/f_midi2.c:1166
> [inline]
> RIP: 0010:f_midi2_stop_eps+0x28e/0x4d0
> drivers/usb/gadget/function/f_midi2.c:1246
> ...
> Call Trace:
>  <TASK>
>  f_midi2_set_alt+0x11c/0xf00 drivers/usb/gadget/function/f_midi2.c:1296
>  composite_setup+0x1ffd/0x3480 drivers/usb/gadget/composite.c:1933
>  configfs_composite_setup+0xbd/0x100 drivers/usb/gadget/configfs.c:1877
> 
> Fixes: 8b645922b223 ("usb: gadget: Add support for USB MIDI 2.0 function driver")
> Assisted-by: Gemini:gemini-3.5-flash Gemini:gemini-3.1-pro-preview syzbot
> Reported-by: syzbot+bbb6dad313f4aaa8da6b@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=bbb6dad313f4aaa8da6b
> Link: https://syzkaller.appspot.com/ai_job?id=8ce30b1a-8cf7-4e38-bcf7-1f69e6f6313f
> Signed-off-by: Aleksandr Nogikh <nogikh@google.com>

Closes: https://syzkaller.appspot.com/bug?extid=01a17afb30637396955e

Thanks,
Jeffin.
