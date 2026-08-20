Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4D24570C4
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 13:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787232604; cv=none; b=m1GW+eQd3VlikKewhrJ+LKQDYBHr9JQODPXCfYkqVx0rrAj+JTEJwY02gVpr49Uof7i60dd4DLQSlxcs8Edla90yfi3BIB+gxTgiXn4w9QnnWMEFI1piYq6P5TQS4D8apLFOanQFqKFKFLuLsMVY27vYc8xRnQqdqkM5SJX+VNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787232604; c=relaxed/simple;
	bh=SKVgvqvuhm9IBWVinOe8HBmNSlYLuOSG+xFVlNe0444=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=dfOiUJ6JR6f1O85p9yrKipWb4tvJsuDDGOsZKJReFpl53VDye2Pt9bvvzemjONrN+4ukEKIs0H88zEov63UDWPZln6Dz3+4EnAL1bnbLOYQEDOMfr3/j7JDJNbkcdxvsm9SiuapKIyotem3Q1LkQAHMnI5DC3FbWLOaiFJhL6UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7eb641eaf5eso2676840a34.1
        for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 06:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787232602; x=1787837402;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Zuse5bKsrwNJaMXcn2vwRNpL06e4Ab7iDiF20cDAlPk=;
        b=mmYEeq08IYbe1bP5NXZzGN1eNGsdCJQD7L9bsWcMKc+Mvt/XGOWObOElpL8x+3j+oq
         Vw4Iy365LwddcGBFqpRGJYOmaNvtKS/k3ZAWT97QURXzi7DZbMbS30mCKJfpXFKfgZ1s
         BGItFJzT7SpQeyfddjwfntQOzCxbKH7BOcu5ad/Eg7BEMGugO24lWIonwpfswZx63pBo
         JOzNtnNakFZ/u59xqSYia1jes1CXvkfZV/qqpYnhkEQQdxjICZ8bDEWfuO75xW3BosHU
         p7ZQGVGhEN4wjUjMRLzwPCH6ZZzIiNgMegrHafev4vDuac85MkjVL5yxnbOgoOOJv1lU
         Hz9w==
X-Forwarded-Encrypted: i=1; AHgh+Rp53FVUwVG4HbTRNt5U0RO/KsE8Qth83rmkmYU6UJXFvta8L9Hw9wlFE0Ud4SiKyci8xtujfEVSJzo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXVaFif2a57hm52ovHMGwIk1fw5uqUsw0l1spDxLemxJhHuQFh
	32Znyzvs04y/OL3k3MbHZ2PwuvFQ7xEzRAtXb4TClZtsFhEOKi4xXC+LG6YQQfWibWw3fZj2Lm2
	rPesELkNsg5OlvX+qtIdQO3gKmjs9cb2dkJAVPbYocSonLdq3yuzkyZyDQQI=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1c9c:b0:6ac:b6c0:2c09 with SMTP id
 006d021491bc7-6b13c2fd483mr11301174eaf.1.1787232602265; Thu, 20 Aug 2026
 06:30:02 -0700 (PDT)
Date: Thu, 20 Aug 2026 06:30:02 -0700
In-Reply-To: <DKTSRH54U1QQ.994L7IJ2TT3I@nvidia.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a87015a.4d75e56a.c9a88.003f.GAE@google.com>
Subject: Re: [syzbot] [mm?] WARNING in ep_write_iter
From: syzbot <syzbot+805630f1453e490427fa@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, apopple@nvidia.com, byungchul@sk.com, 
	david@kernel.org, gourry@gourry.net, gregkh@linuxfoundation.org, 
	joshua.hahnjy@gmail.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-usb@vger.kernel.org, matthew.brost@intel.com, rakie.kim@sk.com, 
	stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com, 
	ying.huang@linux.alibaba.com, ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+805630f1453e490427fa@syzkaller.appspotmail.com
Tested-by: syzbot+805630f1453e490427fa@syzkaller.appspotmail.com

Tested on:

commit:         a4ff2be3 Merge tag 'v7.3-p1' of git://git.kernel.org/p..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=176bd679580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=29686c02180e4e86
dashboard link: https://syzkaller.appspot.com/bug?extid=805630f1453e490427fa
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1455f815580000

Note: testing is done by a robot and is best-effort only.
