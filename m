Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA4840DB39
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 10:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429665; cv=none; b=uvi0RF3z6M8Sp1YijdD7beue4QUZ7xMptdvFB7qRMF5Lua8hE0Q8/Wv7ufAvulWl4sWcfiavvuFdn0BCoH7oEzDeQIqrTzN+MnHJFHASGQkVzL8KmcklLtu9t4EgwNoiP44mdBt1EAH6adwBsKZbN5EEyXU4f5UPM1d4aBMA4m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429665; c=relaxed/simple;
	bh=ryInLUjJI32PSk+T2NMhpSbpKFvxq0wpSaolLnU3XEs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=cfIV1WBHtyuDwsrPPoiok6I0eNE/ave7kMftMhQPPoyRhnzzAou6lUBb0XFV7zai8giTPdSY8O+Zvwy4xuDeXPSsGawCLrr7TYP0agsgOKKELlPaGhxPubDRXL15nHX72JOScW1uLJ0T5bR3sFZiDyNoNirX3fmjAtDaYUwpxio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f4e4b52404so2034237a34.0
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 03:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429663; x=1789034463;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5+izbsP1CRuSYp7hZOU5ThuvWBJhaTYyEvZXcdhmlzg=;
        b=oQZNwhrEW8+pctMxDgx5bGWgiQl2y/azHVvP87T/Y1sXTFHN51KwENSIF9PRIqRreQ
         Ls7Vo1FIkWaolfsjFyT1aPBB39cwkAEigqxUOHc4IQf7jxh52GKbfhs7ydh3N7puHdvx
         VRK4dgsSSvn63bweFmTZSmV2XaNg8ySM60uZJnio9ryr7G+IOAW1009ELIFOf/IueRFY
         RaIcmRh4QJFEqeGxEmOZKKr720qM3c5CWgnZWHtCSFCA4MelM01SLF95yTkiFuDUl80A
         uq1j3UF0Baoo9RfqrBlTPVORdi7JVU9+N94C7WXD4PwqyjFk9NMJoNnBPJzu4xIVMQIX
         JqFw==
X-Forwarded-Encrypted: i=1; AKwUvBzlDkb4KBHAoOcCpMAzXz/PXU3PQq7cvVdrTNFKMYpImS3ocPwH8t4ZfzGpManWeVwFK74n9eadccQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nJ5aGmX6DQbCrNmWGNUBGlc4XXPHvfiJOP0hFbSijwoAMsn0Lw
	ET8Hq5xgBQsBS9geowmjKaBrVwGQs2qZNrOAGlFswKXjZeqdqS5GQ+bd6/R4xoc8nGHZu49By33
	BfsxoVNhw3lhPIrlk0acCe9QyOkvZoYB/f2JAaF2rx8JOMpVkgZurCNjlN7I=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f004:b0:6a3:1dc5:3570 with SMTP id
 006d021491bc7-6b47eed58c0mr8176756eaf.31.1788429663005; Thu, 03 Sep 2026
 03:01:03 -0700 (PDT)
Date: Thu, 03 Sep 2026 03:01:02 -0700
In-Reply-To: <20260903112417.21b76017.michal.pecio@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a99455e.9266084e.bf0d7.01fa.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Write in usb_free_urb
From: syzbot <syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com>
To: bolewara@gmail.com, devnull@kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, mchehab@kernel.org, 
	michal.pecio@gmail.com, syzkaller-bugs@googlegroups.com, tiwai@suse.com, 
	zonque@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com
Tested-by: syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com

Tested on:

commit:         940de590 Merge tag 'hardening-v7.3-rc2' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13da7c15580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
dashboard link: https://syzkaller.appspot.com/bug?extid=832ce9fa3face1b7d44d
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15527c15580000

Note: testing is done by a robot and is best-effort only.
