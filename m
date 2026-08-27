Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FFD47DD5C
	for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 16:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787849465; cv=none; b=jM1rd429E26Xipv+A2B0V2BSt6ioWPKB7gLySJQVf6Z0MUfG3xYG/PbvmruQy2EDXDZllPTsUhEbD+lAJctWj6zps4SHD1Wp5GQEwlF+w5HYcBSQ+QEY29WrRzPiJI03g6C5G0dwMJOyFIA00S+SKIDyB5YuFkyZbe4QuJ9CuOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787849465; c=relaxed/simple;
	bh=tFLQ3JuBry+GrFMTvnvNPPyuCdQR6pSnPsQLTnAgbCc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=exrwFLFkCctACYoyegg6Lnbt924iqTvjVn1x9j/GQBA2zihr9veZE7cJKM7xbURlRJAX6MIe/weEFnxz7g7NwVcoi6OaEPJQL86md+2yE0hqJyyYDMkpQFGTjfFG5+2q6eKzao8PvmCnQ2j2zVeFeenkqIAu8xftrXuS9AOet/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b2fb8f0df0so312077b6e.0
        for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 09:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849462; x=1788454262;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zFqjgAYe8iCKJQKyaWMIcLe0u+fWcArjSHpg11702jA=;
        b=spmrxNxAHlZxwyvbLN7w3VsQfsrx36hVYwFiAbMpz1v6J0boLAROGFpINIU5bYqFCn
         GFCFbx5KdXQ6zBZUs5hl3mMpEQazX6/ibjnRWa2nzsPcRj4HkMH4DOfSLnhj9ELurE8q
         huwfwfZShHiUHoiUwuoKPBnqCCary2J48ALZ3tmkMroJp2A4LmkBVKQBahoPNRiGBWw5
         Zt01vqwfZ3JJny+KJLusHsGrAgoinUaf14SJJqCjkYqqeDrxWbDN/R7c8OKfP0N4YibT
         VkZwzNY6PVrnumvmInJSGODzYsqbTVt6yxFPPVNK4mPeMkIdFrRCRYB3demUDKZiw3fE
         1CEg==
X-Forwarded-Encrypted: i=1; AHgh+RrJIFqaKlQEZ+vNlieQwjOCBhaLQhSF3oXv2fFHXMp90c+Ys9fF5KPDBrgFSsxaqlAO4G8Ys6lTtP8=@vger.kernel.org
X-Gm-Message-State: AFuF++kUnwjwsdZY1tVWKqAfQdf0KI6LrH9v1pLGs3JqdmikSSjfT8OX
	V2HuDx27jLn4GoDh1Nlr6h+jzRPYMKC7h6Iod2T8Te5V45rVp3/O5MUi2EbpGBIKq91qZJFrWcL
	OQwxsqOhxqRVHeFRabfT14dyuI4twykI+WiIwQ4NzlnK0/FfFo7C9ZDs7CoU=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1627:b0:6b1:a22c:1f12 with SMTP id
 006d021491bc7-6b1a22c22f3mr13088461eaf.9.1787849462373; Thu, 27 Aug 2026
 09:51:02 -0700 (PDT)
Date: Thu, 27 Aug 2026 09:51:02 -0700
In-Reply-To: <20260827092301.19883-1-jeffinphilip14@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a906af6.4d659fcc.734b4.0011.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] KASAN: slab-use-after-free Read in roccat_open
From: syzbot <syzbot+d632e93ffcd1452bc61e@syzkaller.appspotmail.com>
To: jeffinphilip14@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 12



Tested on:

commit:         903c1cf6 Add linux-next specific files for 20260821
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=61cbaf6d30cb97db
dashboard link: https://syzkaller.appspot.com/bug?extid=d632e93ffcd1452bc61e
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1513b415580000

