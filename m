Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584B548987C
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 22:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785538503; cv=none; b=dMrGbOOcWj+SRTqNnuvU25teGZDmzt52hq8X9oq0U7+J8HiK0cahI3mI2Y3C66CSgamlidqdElXvcKJL/4/krM9RYaIfu+YakXo75QpqfQIRC3++yhea7hEYSRlmlYNOnMlwevuhdoci6SR2/4a/NB/Cv4FdygTorl2G4yCK42A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785538503; c=relaxed/simple;
	bh=ZTWzleNbU+eMf8pkztFJQNufhHVWxxGuHYzd7BHc9Tw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=SVb14RvtqfZMCCii0qnjbTBFzmHDVLzT+0bVEueBrBWFAZy4aq05BiWBKsZv0MS8e6jH4TuH8o/M+7fsdXh+1+uHm+x6f+QjvvQwoexlVMq6x5GS6uPF4cNO7J9T39YrUCkwtVH1N5xjU3eI1boJgaObePH9stMbBqJW1pKgqP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-485ebc5706cso3317353b6e.0
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 15:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785538501; x=1786143301;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Kw6kFQFlc/mBUiWqPG38FC4x4pB3KfPEF52eHfGcoBU=;
        b=r+k9mJ/9vj5xGcx/RllsMu+DehUpubPEwEPe34uKkEndzGH8LHsx7yuwQiMoOd6zXZ
         DNVAAF3fxiQVO7VDFDo9LqxzCY8np5dtXulfoNovpNHhucg4TdzzVCM1BdnqzK/Ejdvh
         xEua+zO1OhCMB4lz7wuySejyfML9KsuaKdPgec+rfRXxjwJ705FvhkVlTtWuZPvoHYeB
         CQEBr6TeoxpPI2rjf5EaDhlq2q/3BZgg/66EM8LiVW4jayZFw+zETu1ddTEQp1inU4dK
         V6ir1mqi8DWHtkzq0W7l/VRqC1Ydd32ZE2E/oexO2sVdXPhV5L/eYQ7Aexanb8dS8wGh
         drIA==
X-Forwarded-Encrypted: i=1; AHgh+RrdBN8dEFSEPeweiFChvXxkfrT87RqASZA2ycL4FMCKPpphm2aV5Dc7GI+QuB3TCZMj6pf/8WOgpW4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh/x1qnLM1Xz2RxhPUhALdnJ9RrxUG8qYcHtuPMj+Jx5u1BQFW
	5FrxFaqPgyqb9/tvo5NSZv9Ucbjkr7qg3kCX0MUBQaiwaJ7MrIPy+bDi6eDAWE89C3aKTGx8e9L
	PX3G1WwBy26Ckn8Q7xNLmVuU2EIuqpZKDUun/D8Gh6svtedcJEU183JKvQ5I=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:10d4:b0:492:7abc:422e with SMTP id
 5614622812f47-4ae31908dc8mr5280873b6e.13.1785538501339; Fri, 31 Jul 2026
 15:55:01 -0700 (PDT)
Date: Fri, 31 Jul 2026 15:55:01 -0700
In-Reply-To: <6a6cd7bd.1aa927e4.17d4bf.0004.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6d27c5.f794c993.27aeb.0005.GAE@google.com>
Subject: Re: [syzbot] [usb?] WARNING in usb_ep_enable
From: syzbot <syzbot+7b70c4a6021fd49c4151@syzkaller.appspotmail.com>
To: crwulff@gmail.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 973a57891608a98e894db2887f278777f564de18
Author: Chris Wulff <crwulff@gmail.com>
Date:   Thu Jul 25 01:04:20 2024 +0000

    usb: gadget: core: Check for unset descriptor

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=136cf5b9580000
start commit:   11028ab62899 Merge tag 'probes-fixes-v7.2-rc5' of git://gi..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=10ecf5b9580000
console output: https://syzkaller.appspot.com/x/log.txt?x=176cf5b9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb17729fb04b1e3a
dashboard link: https://syzkaller.appspot.com/bug?extid=7b70c4a6021fd49c4151
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13074aea580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=161271b9580000

Reported-by: syzbot+7b70c4a6021fd49c4151@syzkaller.appspotmail.com
Fixes: 973a57891608 ("usb: gadget: core: Check for unset descriptor")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
