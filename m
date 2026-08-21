Received: from unicom145.biz-email.net (unicom145.biz-email.net [210.51.26.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB02D3AA1B8
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 07:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.26.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787298494; cv=none; b=ZnHYg2to8Ll/gsHTkjkrsFGxm+U58GfVZfqRcGtWJY0hczwkY7K2Yugov8fqBzN6sHj85Sz20MTNH36wL0QOz3Rsj4seFjE505A/810BTFyy+AwIupIjSIKkXsBHRAAJti8r6iwyk9KD/DcC348vj2rED8sB3vhX4Uz4DVEPtug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787298494; c=relaxed/simple;
	bh=QlOj7933mP0RDpsf7AxZGxRXB2RsFbEqKiUNXEYoy/E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Iw+wYabqnnA9XUXnGmJtsdu4XR724SNaDqw3veRqe9oIKGLpZnrM4rqkngQ7dSQpLLmKLBIW3QJ9s1658fzT5zapTcxggtpi1KBBhc8jD/wIiumpzWSySX7895U3RUl/Po6r6mWeDPpm3kv7YO3Hez0lMuPhpYoQVFyz1204odY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=longcheer.com; spf=pass smtp.mailfrom=longcheer.com; arc=none smtp.client-ip=210.51.26.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=longcheer.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=longcheer.com
Received: from mailsrv01.LongCheer.net
        by unicom145.biz-email.net ((D)) with SMTP (SSL) id 202608211548038750;
        Fri, 21 Aug 2026 15:48:03 +0800
Received: from longcheer.com (172.16.9.238) by mailsrv01.LongCheer.net
 (172.16.8.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.33; Fri, 21 Aug
 2026 15:39:24 +0800
From: liuqi <liuqi@longcheer.com>
To: <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>,
	<syzbot+22ea20ef3afb6785b122@syzkaller.appspotmail.com>, Liu Qi
	<liuqi@longcheer.com>
Subject: Re: [PATCH] usb-storage: ene_ub6250: serialize card type probe with scan work
Date: Fri, 21 Aug 2026 15:39:24 +0800
Message-ID: <20260821073924.1173637-1-liuqi@longcheer.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: mailsrv04.LongCheer.net (172.16.8.234) To
 mailsrv01.LongCheer.net (172.16.8.231)
tUid: 2026821154803d46c7d00ac59fe7fcbc09508828e1426
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

From: Liu Qi <liuqi@longcheer.com>

Hi Greg,

I apologize for the incorrect patch in my previous reply. The v2
patch with the correct Subject, changelog, and tags was not attached.
Here is the corrected patch v2 with:

- Assisted-by: Qwen:Qwen3.6
- Signed-off-by: Liu Qi <liuqi@longcheer.com>
- Reported-by: syzbot+22ea20ef3afb6785b122@syzkaller.appspotmail.com
- Closes: https://syzkaller.appspot.com/bug?extid=22ea20ef3afb6785b122
- Testing note

Please find the corrected patch attached.
Thanks,
Liu Qi
