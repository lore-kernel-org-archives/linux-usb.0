Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794161763;
	b=FSyrudMFLk/J3s14YKDNbMJDt/vrpFKhebq00sVzWdgDORlQ375gyl3kHDz8lVNJgmNn
	 qzjbJlnZhQPjWfRmfmewynHFsr/s8f9TJkCrJcALac/UtBTKq1PvjiDElRjQOiv2Cg+gK
	 Im+o1lw40j9/rwEVj0QCJPgcw3+vhXNOz3qvfgDk4wvoVWQWvb2DmPJ668hYo2aVrlrTj
	 LKUjfcOkidyYjQ4gln9cwnCRX8hqjyD8+UhdTtQUQih73WKJIN1/nLaSsitHYDl5hp6r9
	 7PHTe2OepuDNf9YLE5bst8xMrrm2sEwQ+/POSzISVHxkaP1QXEB4bfVRcU+h12I3nSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794161763;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=GUFk98TMKKPDdEafxwRQ9vChNe9Wtu9NCqjC9pH+E74=;
	b=HO2s2S7NgXBaU76Bafae8EQk7KYK2J1V3Shhpx3PgSEC9IlsN8q8fRyqF7+oh6ut2+Ie
	 tIWHglihUdPxkw4GnLiQ+tzMrbcsAbNRz/vc7R7eKhu6MzG2Ckomp1JickuSMWlRPx2fI
	 7ckz6DO6FU9hvtWky3SC1s6RwCLXHtDw6VPycZ1spe7mZn/u84dKyK7vAc4fSDFtq0wRu
	 Kq17rrCJaRNKrm++7cpIUKllb1c1uTSw8rMlcuX6YsMo4ViICID9tggy0REysTfAvrAjL
	 UIUfGg484hKFcdbONeyBlRW02svH+M/sYEtZyle+8xJ1UWzkwGIagBlrdPDLPsxMAsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DF5606A321
	for <linux-usb@vger.kernel.org>; Sun,  8 Nov 2026 18:16:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8DF5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4e937c5bd4fso148285b6e.2
        for <linux-usb@vger.kernel.org>; Sun, 08 Nov 2026 10:16:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794161761; x=1794766561;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GUFk98TMKKPDdEafxwRQ9vChNe9Wtu9NCqjC9pH+E74=;
        b=X+fBqwqtdTJHXEwv5Dak19PCzao9Jl89JOuTBGRNyTQse4G9ebfe6jSGMR6Poj4Q3W
         Olt1JIf05/KUQ7xuRjhFra3Jph2+kxfo7sza35zhXD/jnlS3XJD0iEq9DJ6uGGKd8gNl
         oRWBrc0ssDs/nCoivYNHsAtZ8NV/YMPXeE7duV+hEb1xZ5GrbmRVAdlAX4h2siCyYcvt
         I4Y0YNPkyZD9MWDApdxEde5jq3ikTKkIO9lHtuKXl7i2soi365ZDpR5fJVAF2ZHF+J1+
         CJUceQCXbQN8JQTH74+kYi60NjoFf00EMM2/pD20xwfUEEI/sVL8BkUuEEsmKLc69j5c
         nBJA==
X-Forwarded-Encrypted: i=1; AL+hErEtxWAm3ygMbDrK1mwZPuHz2zawSb6aJfoE2UrRKR6BIcEmEikUDeHYZp8tyZMfjgFrn+K7jmLtvH8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SRHwiVJG3rumorUzCWdvN0IsjWiWWGFyGp9tmCU9MDJc1GAjB
	ttaJibKVACnVgbI8FxDBEZFq+/YQoy/s2Ama6p2ypV9o9GlHu3kmJU8Lqd7121O5+aYsbLM7pIE
	2YFfbVGRTVXgVKqnmUWsKX0s1qMm2LZLsoW1wXf7MIpewOONzM0+aK+LQw80=
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:23c7:b0:4e4:86b1:f7a0 with SMTP id
 5614622812f47-568147212e5mr1152091b6e.53.1794161761733; Sun, 08 Nov 2026
 10:16:01 -0800 (PST)
Date: Sun, 08 Nov 2026 10:16:01 -0800
In-Reply-To: <6a56fb92.c90005c7.37d349.003c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af0bc61.5a668245.1aceb6.0010.GAE@google.com>
Subject: Re: [syzbot] [usb?] [media?] INFO: trying to register non-static key
 in __vb2_queue_cancel
From: syzbot <syzbot+2302c5dc59995fbb8089@syzkaller.appspotmail.com>
To: gautambhadori9@gmail.com, hokage.newbie@gmail.com, 
	hverkuil+cisco@kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org, 
	m.szyprowski@samsung.com, mchehab+huawei@kernel.org, mchehab@kernel.org, 
	michail.tatas@gmail.com, pimyn@google.com, syzkaller-bugs@googlegroups.com, 
	tfiga@chromium.org
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 288254383674be25b26cf137bc12bfe38fefbad6
Author: Hans Verkuil <hverkuil+cisco@kernel.org>
Date:   Tue May 19 10:07:59 2026 +0000

    media: em28xx: use v4l2_device release callback

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11227f8d580000
start commit:   f909e534f5e3 Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=13227f8d580000
console output: https://syzkaller.appspot.com/x/log.txt?x=15227f8d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b38d39c45202f4fa
dashboard link: https://syzkaller.appspot.com/bug?extid=2302c5dc59995fbb8089
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=170e74e1580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15c43da9580000

Reported-by: syzbot+2302c5dc59995fbb8089@syzkaller.appspotmail.com
Fixes: 288254383674 ("media: em28xx: use v4l2_device release callback")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
