Received: from unicom145.biz-email.net (unicom145.biz-email.net [210.51.26.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2F839B4BF
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 07:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.26.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787297645; cv=none; b=BBq3gChsgIqpz7lrp/n2/iHMejcUM+j8RhMTJ4pynG5dm89l0kI43yDABL8lfnDy4GSFfuTLrPL3eXTSH8WTxpbmWS7vA5zsaW+hQ0CNLb5Zqe9hi9w0iaOj2R4RZqLB06EE72IE2NUDjbQuk+pcNx1zrY1TJSJK39l+m1coQbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787297645; c=relaxed/simple;
	bh=E0Q6iPYaJAvIUT19l5uJCjO9OpRNFXrVUoSChwg3qH0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HxaoL4EcmthqOvoEnCexwKiGM370GkRnSDM4r2t9No7M9RCSfUrI/lXQPHX0Ny+naCWIcXIDm3dLHinSoYnqQTjP/8zGHwqMvryr+3kFajt4ecEtNdWIcHirNj+VFxKPKvwcMbZDyaTtTCC4Mznfup4ZNSHlpf0WYA05HJHVd6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=longcheer.com; spf=pass smtp.mailfrom=longcheer.com; arc=none smtp.client-ip=210.51.26.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=longcheer.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=longcheer.com
Received: from mailsrv01.LongCheer.net
        by unicom145.biz-email.net ((D)) with ESMTP (SSL) id 202608211533369801;
        Fri, 21 Aug 2026 15:33:36 +0800
Received: from longcheer.com (172.16.9.238) by mailsrv01.LongCheer.net
 (172.16.8.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.33; Fri, 21 Aug
 2026 15:33:36 +0800
From: liuqi <liuqi@longcheer.com>
To: <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>,
	<syzbot+22ea20ef3afb6785b122@syzkaller.appspotmail.com>, Liu Qi
	<liuqi@longcheer.com>
Subject: Re: [PATCH] usb-storage: ene_ub6250: serialize card type probe with scan work
Date: Fri, 21 Aug 2026 15:33:35 +0800
Message-ID: <20260821073335.1165184-1-liuqi@longcheer.com>
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
tUid: 202682115333695093f6cbf1cfede7babb3da382dad97
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

From: Liu Qi <liuqi@longcheer.com>

Hi Greg,

Yes, I missed the Assisted-by tag. I have added it in v2.
I also updated the author and Signed-off-by lines to use my real name,
Liu Qi.
For testing, I asked syzbot to test the patch, but syzbot replied that
this crash does not have a reproducer and cannot be tested. So I did not
add a syzbot Tested-by tag.
I have sent v2 with these updates.
Thanks,
Liu Qi
