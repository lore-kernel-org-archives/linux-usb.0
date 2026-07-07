Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B69388862
	for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2026 19:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452510; cv=none; b=hk3j5Za/ZRfUFIEnUZGuqYKSr2LbIsI0KlqzEmiVx/jmfDX6u+J1BlFJ4QeUsSfA/5d2H6HA0OxfWFrUky+PsQKFlLnbwnSy9abM/xeO8kICs2Scf6fFx5OvVLUX8/+1IXRxvE1upstDEK+jQK/V3wrjHql1A5k3MA39RhUUoe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452510; c=relaxed/simple;
	bh=C8SUS9rN/lC7p6FgPS2AFsAiCQ6ELesgArbmvrVC5a4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SuQbaGc7DBEhxdCxQl9wydnONoFJBXHUBTHkpPn2zM/41JtIGr3BWDc2fEBzdmWqI62t/ZQ317xduJRXRYw4y63X0yn+Rk9bbUxz/0Vc6W08x4p/tMMxl/UlSUB4BzZzAFBPUTK1ZcoYo67e1lvx/0tllM1IjU040uVOZ3JKOTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=U+YLijZU; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="U+YLijZU"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51c5382806fso34535011cf.2
        for <linux-usb@vger.kernel.org>; Tue, 07 Jul 2026 12:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1783452507; x=1784057307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aZeJiM8uPeoU8abopElz8F7bRV5qReALT830utommKE=;
        b=U+YLijZUPKZYDB0/nw/Ss9oNP44INaAMkbhAa0z492xxkZObNaec033Ct/WaQ0awR7
         t5jzR77l9EXQ5TVpsRgEFwvB/qYokFhFis5lQCq1kIBIB+enZwlHs4LCJ/5sU05yQuUu
         FArpHF6ZBOqh6VWylAhdx5zDWC8GajQdpUJUCshF//QAyv4X3CfzT17o3sZ1/K4HlZNt
         uAEcNh5jq0lYeZka3vh9/dB7u0hQ1Iaej44c2Fa+UDpWvvRa+n4h0rQSd/d0Zeq8Av30
         oKuoNzptjls4AeKoyjcxHsZMlSrSVwxT7dRX2ZEZ+D386Zw6vtOZ8Zkek1YqwXBIUDBc
         X6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452507; x=1784057307;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aZeJiM8uPeoU8abopElz8F7bRV5qReALT830utommKE=;
        b=orOS+gMLaZxv1RYWLIeOI+93MHihxb2ODr9iq0guT6fdRhdXPyA0aY/sURa0tjagaS
         GaZ2Fa8KNBW+yQsU0zEqMunMT9OV//irs7b1LK663XPnydCPJ80MsK+4B5+AjddeDWTu
         ZL1Mde3dFEqjqrOLtzELJsZtWgg5oIlpn861ZLwxvHu6EG0EVpT44aQNF9EMkinIeyRR
         f+jFGy0HeJSpRoWvLcNUgqPRJz+8X33keCVYulONYTwiMg8xaL3GGltnC21YYZJTelbS
         ibnjkDcQNraxz6rwFbNz798wWGh3bFEOVzcU7Dfh83cMkKpwgDgBgDzGZqYMZ7MLcX8V
         Q7wQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr5MQ6HjLdN+hPde3B7h7EPPYk7kVoNv2MG35gkt/9BmfIgqmqgQ8F+E/y8shg6TOa79/LsjwTTLDw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDS04mW7T+7gzDNSBsZezwZZhaO/6ZVzOoE/008PsMtxX3mdMS
	MwEs7oXmynr7fPRZKObfgHRZSG8drcoBcZT82+SV1lmE2ysCZ0g/D04bhcj2yjY+oA==
X-Gm-Gg: AfdE7clv0kJfWzl74cfPdzYEGH/NxzcNWR0JmXLtPnauSpxiLdLH/ANfeXCra5D+dYA
	8m0VdF5kDjDJSrMcvF19TPFsf2Yx/8GOWycI9FeQC4SzCVanzh/Z7zfkkA183P33+Ls3MWJQu6a
	jROPVaevnCiIzp5s/UlgPU4BSUQEiqXp49Er/i4jeFNgRiSOnRNAbua6Ypkpcb6t6pLTFByrmO7
	vgNs8emz7UhMJLNDf5PWYhan6VnPC9p6yZzChGnYEqUwwjTyEmYV/knDNAHrTiSGvGa3+AcsoSm
	UOB4I9HumgtKiZNsdCTuLA+xG7RcvOnzApqgkzdFZqASjcYAU2/1hqRkcNbFIbb2BrvhKhMiW/4
	9uUUI97ErlejqDxYag3RsZqzKtN0mm+M/51DJmXbcHPuoz2Nm9bbBESpiTi6u1VyLA5Mhm73bNP
	qXlZMz+Uygj1MaTcY6Z/RUiTted8sQXFYa42vaxkH5JZ+tp2juVuuZp6JW
X-Received: by 2002:a05:622a:4c:b0:51c:7b12:1211 with SMTP id d75a77b69052e-51c7b1217femr40594011cf.79.1783452506837;
        Tue, 07 Jul 2026 12:28:26 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41abe756sm130112661cf.6.2026.07.07.12.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:28:26 -0700 (PDT)
Date: Tue, 7 Jul 2026 15:28:24 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+e69c25cf38a53d0cf64c@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, hdanton@sina.com,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] BUG: corrupted list in usb_hcd_link_urb_to_ep (5)
Message-ID: <b46728e0-f6ef-40e4-932b-70b9e55905ea@rowland.harvard.edu>
References: <bc26a2a1-64ec-4ae1-a7ba-2caf94785e74@rowland.harvard.edu>
 <6a4d50ad.c76b52dc.34afef.000f.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a4d50ad.c76b52dc.34afef.000f.GAE@google.com>

On Tue, Jul 07, 2026 at 12:17:01PM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> lost connection to test machine
> 
> 
> 
> Tested on:
> 
> commit:         2b763db0 Add linux-next specific files for 20260703
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> console output: https://syzkaller.appspot.com/x/log.txt?x=15586b39580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=bc069df559a09463
> dashboard link: https://syzkaller.appspot.com/bug?extid=e69c25cf38a53d0cf64c
> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=13aef31e580000
> 

The console output says, in its entirety:

-----------------------------------------------------------------------------

ci-upstream-rust-kasan-gce-test-job/strace-static-x86_64 -e \!wait4,clock_nanosleep,nanosleep -s 100 -x -f ci-upstream-rust-kasan-gce-test-job/syz-execprog -executor=ci-upstream-rust-kasan-gce-test-job/syz-executor -arch=amd64 -sandbox=none -procs=4 -repeat=0 -threaded=true -collide=false -optional=slowdown=1:sandbox_arg=0:type=gce ci-upstream-rust-kasan-gce-test-job/syzkaller4044572343

<...>
Warning: Permanently added '10.128.0.74' (ED25519) to the list of known hosts.
FATAL: kernel too old
[  132.897272][ T1336] ieee802154 phy0 wpan0: encryption failed: -22
[  132.897384][ T1336] ieee802154 phy1 wpan1: encryption failed: -22

-----------------------------------------------------------------------------

What can I do about this?

Alan Stern
