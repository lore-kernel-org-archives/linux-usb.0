Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09112BFC60
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 16:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786984686; cv=none; b=G0cjiSlFJREpxHmng6B/YK7MH8bSyJLxj9wU7ZxW13Pa7hSsmeqo58hUEvrOtcJt/meWbtRBiqTTSJgHwlORCCx8/to4BVL20RdgP7qOdUvscPvSBOLUAzrhi0EJumUm5UPkocRwii/O+3ZflfYZEz3DX4id4rWk8NcrMZZgkIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786984686; c=relaxed/simple;
	bh=O5tWgxmwgMrUnydp1q9GOvUzClrE/Mq92ksXIVL8dHY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=r/DFb+ymOw1OhrXcTNJFmBI9tqsAmYHGMrVW5eQTpkK44qscROWnlUVo17eFDAo2XpcxsisFfwhVr5H7tI3IiVGoWPk67Se973FatUL1Vrq6TkEznodzZGg5JGFO++Txljwdkzod6S6mxN71U9/8NFrXxubih/xcsaj6sGjqUgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6acbcb92d31so3229948eaf.1
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 09:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786984683; x=1787589483;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6ry6iaEim5a44990Oh54c+d4+LN5Mgz5CQaOqSlmlJI=;
        b=gj1EcDdSs04uc038gaznUW+WQdvab6O8lq1wmAwSKZ8qmxvK7JmD3wMBiR2vhPbpdo
         4ql2E5Bt8/j9n2G5t9q76hne1KeqehpKM+IFRujONq48fBNsCtDe2VPDdFFTZQoXLzUi
         TbSYHH9jlz8fYmYU1dSVwCXuk9bo+cUNxndD0jeHaQOoJt6C1xUwWrnjjxIA9JGk6/dp
         z4fXkLvPCUq8+XJ2RM81qZj7PkeqhrhdDDJ/0KFglS328EFC8WuViQP57DarIiKX1/Vk
         8EcRIMQAAHUcNKKJvLCxhBObFp/lE0fB6WBq/a6spyQNlRUE3lG+Zt0f8VnEmxDRw22p
         kMFA==
X-Forwarded-Encrypted: i=1; AHgh+RpknR7J8vq2B/LDQfQekUrLOMitWG/O9K5oV5Nzm2XbVFT8xWLmsLdK44NhrmYtu+uzi/I6NcKirJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxelb/T3ms81hvDaSDwe2RsAJMwtgBgxqXAFeMYrla+v9O9SYKY
	KeEcPDSYOfw1vR2S/GRvkrH44FshkhIf7kZMOfpTYbA8IC9vApNVD1Lv6E84Ar+g9BEtCL/O++O
	YBm4V+ISZNoKHLbjmCc+JQIOLNFK49oqP3OrKjWg7TSDTj62dT9Q3Jh54WRE=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1990:b0:6ae:aa38:a0bb with SMTP id
 006d021491bc7-6b0d692d722mr21841468eaf.33.1786984682847; Mon, 17 Aug 2026
 09:38:02 -0700 (PDT)
Date: Mon, 17 Aug 2026 09:38:02 -0700
In-Reply-To: <34e65096-8827-470c-9a88-8c643cccef22@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8338ea.dbb3a75c.20434b.006a.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in ep_open
From: syzbot <syzbot+df9e891bf8ea586f846b@syzkaller.appspotmail.com>
To: asml.silence@gmail.com, axboe@kernel.dk, brauner@kernel.org, 
	gregkh@linuxfoundation.org, io-uring@vger.kernel.org, jack@suse.cz, 
	kartikey406@gmail.com, kees@kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, mjguzik@gmail.com, nogikh@google.com, 
	stern@rowland.harvard.edu, syzbot@kernel.org, syzbot@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, 
	syzkaller-upstream-moderation@googlegroups.com, torvalds@ppc970.osdl.org, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+df9e891bf8ea586f846b@syzkaller.appspotmail.com
Tested-by: syzbot+df9e891bf8ea586f846b@syzkaller.appspotmail.com

Tested on:

commit:         8d3ae592 Linux 7.2
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ v7.2
console output: https://syzkaller.appspot.com/x/log.txt?x=16a91a25580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c44651ea7dd2f307
dashboard link: https://syzkaller.appspot.com/bug?extid=df9e891bf8ea586f846b
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15790679580000

Note: testing is done by a robot and is best-effort only.
