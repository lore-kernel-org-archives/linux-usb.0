Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5DB30D40B
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 15:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785856804; cv=none; b=KNCTIJ8wBdlZvND2tPiPaFjhiZdWNM96F6kcuRbX90QCAqz4HxQ49zv0sZJ0RhGHdD4QNxOjjtX3Xmv50/7achvX1/3dDOvUssSJKIYecWcKQF+EEPfiafUgptQXrFxZBTx9SRJQIt20ENT9Gy6jA6hPExBSJjwHfMdUl0a1eik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785856804; c=relaxed/simple;
	bh=eN32eP1uBHWh/BWbbb0ImwAJS3mQ8iV/MM7QQ9N1THE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Oqa+pBzFs8oN2jUxHG2Ui2gW0P2asjBoxsLnDbi8yD9cTilh1uAsXh5wU0OupEgW/wBy6lExh7sbGW97LlhZqAClkVSvQuoOHsRt+9xXB4HSpmU8M01ejS31x6+tTq38/CtdbFOHTGxi4xAN7MuiHbfQqn/NznKtli9qMeqeO2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e6b73b3920so21905a34.0
        for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2026 08:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785856802; x=1786461602;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eLXnvvNTX/4uIyiRrAJ2jKywDGhge3hvW8HNnLnjv0M=;
        b=sqSJC5we0w2QoYAPir7uN1mdvQ9GtHZlfzsd7IzPXmz448I/2ipjXNldNXj89C+bHN
         5Gu87WSa6+wfGomdLvyMJoX4Pm3TGYmpvr3Gd1CWYzlha8tA7YFh+BIssdAQ7n9tSfZi
         wxK4GapEPDL9AnFnjE1AE5mfLarizHYx8UixWmnbvFZvjgxAhiBbBs2KN3iLdegzaFqL
         /sWfpq3IlHztmRY+V3sdHzTmg2S6gWZkd1YIm2oow0GoTqrLXihT6qQ+GXtAfwhcp+1X
         gIQvXa87ObF+kGm8YfSSTX+jmJ2sum7+oFfCGI8NRa54RiWRJGPIABRXeJCS6XVFEKo9
         gi7g==
X-Forwarded-Encrypted: i=1; AHgh+Rr/xR0E7yxMcDWFPGqvRz7pUE6yf7PWkrFUEjA20OOxxqOwZyrcItcPV2ItJ4nfl9A2qLMwrr01I0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzquRQTvBeuggY/94xmm5BKtHI6tkdUZtYDKMIuoWwyYd56Zsx8
	iS0dzoLQUS+8ThwL+QiWKlL4cRgvoS5gdiabKNRcNI45zo8l/pL5qUonnbLnFxCHsPhbp4KUtdQ
	ykTwKK0E8ERRoiR9HMrJeQgbyNAOy5N7YAhaVieuH36qsiwzIF/C3w6diQdg=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1208:b0:496:2b3:ae71 with SMTP id
 5614622812f47-4af5e3536b2mr20513588b6e.18.1785856802399; Tue, 04 Aug 2026
 08:20:02 -0700 (PDT)
Date: Tue, 04 Aug 2026 08:20:02 -0700
In-Reply-To: <badd4d94-2e84-400f-bddc-c9ac8fd6e7c8@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a720322.9511d2ce.1fc5b9.033e.GAE@google.com>
Subject: Re: [syzbot] [usb?] possible deadlock in digi_set_modem_signals
From: syzbot <syzbot+2051460e19471eeb42c3@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, johan@kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, oneukum@suse.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo git://repo/address.git on commit 11028ab62899: failed to run ["git" "-c" "core.hooksPath=/dev/null" "fetch" "--force" "--tags" "b7cf8f2fbfc36c709a08e0b9c77990e491473738"]: exit status 128


Tested on:

commit:         [unknown 
git tree:       git://repo/address.git 11028ab62899
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb17729fb04b1e3a
dashboard link: https://syzkaller.appspot.com/bug?extid=2051460e19471eeb42c3
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15fd8bb9580000

