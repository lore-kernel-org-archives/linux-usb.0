Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCF33E49DA
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 08:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785831923; cv=none; b=TEgpfLN97cStMrxSidYkd6fEREESsJt+t9+zjbxRNne+PkYI8ZPd5TwwRRMkuxhSTFSPmLeFAMrkCYa5nW8kattL6GuJCtL2mtRBKHmhzNZZyAi6wOMamZZkh5+npQh49r9YHvCd/NOpyw3BwD3jObh6Rt5rzfhR04BzjxCvwLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785831923; c=relaxed/simple;
	bh=0s6UafrGhWy7D1FhDD2yeMYRDfPkIFLBhDNVmNMbzs4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=lXHhkj4N7dAu4XlMxRcihksmC6LaKL/6JYIRbR8GPauc/3vwMDUcfZsbrvk1AYrQqa3gffsc3ReFqTFV1AYFmjvibW1p/m47ZDZnJuGcpa8Ny7LEMvx65zwOHI7e3NcNbYoMV4sJQISA4UcU01FwkFy6HDEIsAf815ggCGVX18U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-495f637105eso6658812b6e.2
        for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2026 01:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785831921; x=1786436721;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0s6UafrGhWy7D1FhDD2yeMYRDfPkIFLBhDNVmNMbzs4=;
        b=fYl7AaIDynJwX0WflHqBkU8rQ+V39a42x4uPZC7mtQIN7tKC3F6UoEaYdisz8F7hGC
         b4rpiqbmUWwZHTIJem8WwIdHuw0dna3/34OUSpRUM4IZAKob9nQ2Izi3aTVOaos0tGq9
         DQYVpS63qqamHNN6y2VwBOSChlTSoUXImVKsfVul5NwUSlEw59U9DHO6YluZQv6Rvvbt
         33piDUB0Hlpm/yOQvLgARSa8Qapsf3GTWU3YTL5Km6pDmMAMZPSl1v+19avZQW4dyHsx
         7G9e/5DPjDIj3p2fgxYcrMiTr3AkrKkIjF1qyrUGGkPCLfrZTBxn3u4S0/BUMEzcpCCx
         l+JA==
X-Forwarded-Encrypted: i=1; AHgh+RqMJO+BqzggJcHxdRTi//hFx/9cmY/m/xxPz+LABog6AvTT4sxxzN3WnPswT1mzfd5L2Y1t2YweO7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO8NqfhyrlyQfQHCw6BfrgsFM9l+A/IU50tyZcpC1BhKXvIS7e
	8EJnOrC2j4tpeRH6BwsSnlovZuJt821KFVhSgPPBI4lOHvwXLqbJ8Gs/ZPXscI4+VONxbpnAyG+
	jnCS1f9eNeAHCtqu9RU0H9As8gJKNNlIPJ/wSK1FXyqoOTEQIb1dYsRj04TU=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:50a7:b0:4ab:26bc:3028 with SMTP id
 5614622812f47-4af5dfcc23cmr20359088b6e.3.1785831921072; Tue, 04 Aug 2026
 01:25:21 -0700 (PDT)
Date: Tue, 04 Aug 2026 01:25:21 -0700
In-Reply-To: <20260804082516.2924708-1-khiemtranzo532001@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a71a1f1.9511d2ce.1fc5b9.0339.GAE@google.com>
Subject: Re: [PATCH v2] usb: gadget: f_phonet: fix use-after-free in pn_bind
From: syzbot <syzbot+098999e05b6b877c01b3@syzkaller.appspotmail.com>
To: khiemtranzo532001@gmail.com
Cc: gregkh@linuxfoundation.org, khiemtranzo532001@gmail.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

This crash does not have a reproducer. I cannot test it.

