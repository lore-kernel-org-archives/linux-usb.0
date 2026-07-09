Received: from r3-21.sinamail.sina.com.cn (r3-21.sinamail.sina.com.cn [202.108.3.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE3234B1A6
	for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2026 05:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783574256; cv=none; b=HEf4Q8eUROjDTjZiaItMjYbBgjXRjR0w7h+g8YuTk0N8AaQWTAAYkfW86gKoNdhZTjdfzGkbgczg1Bm4pDOo6enDYGMouqRrEAU+zAybJzrgebkhGzKA7CsnLg0Ch4jS5KldMJXnM38lc8/YmjNY8774bNUL/XuPHzhbhrqWJR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783574256; c=relaxed/simple;
	bh=eS3idi611SgQP5Hod9Z3zf530ja+9XO7YGLhQ9UQF7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=khQ2+KgOLZP2afwG7BzG1/02Q2GiPZ5CiZZA0HAV2DyYqoJEGXOamY8mktMogvuB9zcNfXK5OkuG2OIOBYeDYMeNJ23tjiYvUHAe+u2wSPIs/70SqvB2emwdxzxoUDZzrR397j3QmPjVbYjPD06dn6DqUJ3MUwn4+lGGKfYt488=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=EmLeApdq; arc=none smtp.client-ip=202.108.3.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="EmLeApdq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1783574253;
	bh=TVLIbDuxk/VCZHVZp2u7z72Tt3QAFwVzm6e/6F0JYRg=;
	h=From:Subject:Date:Message-ID;
	b=EmLeApdqHia1bmay09tBFnX7lxlKlL3Y58ZJmMOaF2EN1/RFbBidP/VOB9mEnRBit
	 fseg7s3P+aG6UVd2bgzSjgIdgHTBXlDHjxYr55ra3Qif1NGs+zTkWZVwklXZiHnZ/H
	 hAEc48b/LUr/UqHBavP1+iKOwgMIM6OLdlqct5AY=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.144])
	by sina.com (10.54.253.33) with ESMTP
	id 6A4F2EC100003BD1; Thu, 9 Jul 2026 13:16:52 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 3088496685266
X-SMAIL-UIID: 48BDDD00E08A474AA1613DF0BF2CCAF5-20260709-131652-1
From: Hillf Danton <hdanton@sina.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: syzbot <syzbot+e69c25cf38a53d0cf64c@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] BUG: corrupted list in usb_hcd_link_urb_to_ep (5)
Date: Thu,  9 Jul 2026 13:16:38 +0800
Message-ID: <20260709051640.477-1-hdanton@sina.com>
In-Reply-To: <b46728e0-f6ef-40e4-932b-70b9e55905ea@rowland.harvard.edu>
References: 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 7 Jul 2026 15:28:24 -0400 Alan Stern wrote:
>On Tue, Jul 07, 2026 at 12:17:01PM -0700, syzbot wrote:
>> Hello,
>> 
>> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
>> lost connection to test machine
>> 
>> 
>> 
>> Tested on:
>> 
>> commit:         2b763db0 Add linux-next specific files for 20260703
>> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>> console output: https://syzkaller.appspot.com/x/log.txt?x=15586b39580000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=bc069df559a09463
>> dashboard link: https://syzkaller.appspot.com/bug?extid=e69c25cf38a53d0cf64c
>> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
>> patch:          https://syzkaller.appspot.com/x/patch.diff?x=13aef31e580000
>> 
>
>The console output says, in its entirety:
><...>
>Warning: Permanently added '10.128.0.74' (ED25519) to the list of known hosts.
>FATAL: kernel too old
>[  132.897272][ T1336] ieee802154 phy0 wpan0: encryption failed: -22
>[  132.897384][ T1336] ieee802154 phy1 wpan1: encryption failed: -22
>
>-----------------------------------------------------------------------------
>
> What can I do about this?
>
Try the usb tree [1] if necessary?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git   usb-testing
