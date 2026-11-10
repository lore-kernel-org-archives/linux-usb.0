Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.154.241.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794330758;
	b=mJsICzU3DN38E5Wqqu3alXOYYWIPyfniH/BdLsnqyrLzLS5VabnZ8QEcKd/JwEeFm3AD
	 l1geh3/I0OeBQSDHP+XRDri2+EssQk79J+PAneBYvnEkAKxaYG73YPzvhPEYgzQhSegdZ
	 pDXo7K+mDtw6gNBuv9eniLq0rLJERwBsBivmSUfX/4ZDLl5e1/arMdA+/N0EUwrQTj5dx
	 ebCmVf5F4zzvYIf8P1M+6fOMqpfk+K411XBUKBB/wYockkPnRo/bA9G+pl3AHuldGq44I
	 bikc8DOR4oFCtS89umy5dWQ9Ob6Hk9Gd/9NssZuITWoo1dZhiP835/wjTkenOPdC7VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794330758;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-Bm-Milter-Handled:
	 X-Bm-Transport-Timestamp;
	bh=MunfCuC/qDCpeKYR/v2y7PotOYDCmG4AwtWnGJPc3FQ=;
	b=BYuaUnTuzhFF18xy7NUymo2GP+UaKnEnA0DecdipZ/ZnNT6KYFYttPb6b9N2ZrU/a0G1
	 4vpoYjITEXeXJPE8xzR9+qeWNq3cyYwakqNlOo9LFg21vm6UyxUe3lbJJDcFilWETtYTU
	 wTmi5soormCF7bFY1NgX8NMT9+BJtF0DLICWxjQ7saCLv9kroq9R1um/1HgLy8OPwbnyD
	 cl7UKcxtMV5owZOqS4mruj3oMsm1RvreHSm+0dEStovt2pPnMAb4q5Z7vXjEVrbs/dcqm
	 LIl49ud7m4iCRbUfL73jFYheNJlZgJPVvItmqI2Ns/2CgHr6ihqcV0YwvUnbAEjvSLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=lauterbach.com;
	spf=pass smtp.mailfrom=lauterbach.com;
	arc=none smtp.remote-ip=62.154.241.218
Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9062D606A321
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 17:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9062D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id 4FF87259263;
	Tue, 10 Nov 2026 18:12:34 +0100 (CET)
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: gregkh@linuxfoundation.org
Cc: viro@zeniv.linux.org.uk,
	nkapron@google.com,
	me@samcday.com,
	michael.bommarito@gmail.com,
	linux-usb@vger.kernel.org,
	Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH v2 0/2] usb: gadget: f_fs: cancellation fix
Date: Tue, 10 Nov 2026 18:12:20 +0100
Message-ID: <20261110171222.22633-1-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 166a2dfb-2e12-4590-8fa5-72e30323519f
X-Bm-Transport-Timestamp: 1794330754336

This 2 part patch series does some mini refactoring and
fixes a previous commits.

Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
---
Changes in v2:
- First patch "Fix mmgrab()/mmdrop() balance." now posted separately.
- Fix comment style and whitespace as requested by
  Neill Kapron <nkapron@google.com>
- Make sure io_data->kiocb->ki_complete() == aio_complete_rw()
  can't be called before kiocb_set_cancel_fn() has been called.
  That should it make safe to call kiocb_set_cancel_fn() after
  usb_ep_queue().

Link to v1: https://lore.kernel.org/r/20260901120908.14386-1-ingo.rohloff@lauterbach.com

---
Ingo Rohloff (2):
  usb: gadget: f_fs: simplify error handling using goto
  usb: gadget: f_fs: register cancellation handler only after request
    queueing

 drivers/usb/gadget/function/f_fs.c | 140 ++++++++++++++++-------------
 1 file changed, 76 insertions(+), 64 deletions(-)

--
2.55.0

