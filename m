Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C5C320CD3;
	Fri, 20 Mar 2026 06:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773988609; cv=none; b=DFbPKLQhYYJ5U3ztNKiGnWhAk+QAVlDQp318t4ekCWoWTSbMFjh7elhA+ks02bfD3UpyvWQnXfJgf8dZ7hYn72nJ+0LVePAiNMkVQe0rvf/28LeurLA+SxXhGGgYKr36/1/BcgPmU7LOw2pwcu69SzYV61X7/1SxYSSQW5auMzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773988609; c=relaxed/simple;
	bh=Jc1QtTfa8iT0jKZ7g5wJWxtQE4APAeljpO9wKuqamO4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L07eApEDlgIuhf7LfsokHWgxAz463lDIhbmSn3Op5rwRf1gUwZEPLYCHt3kBirDImsKW83tds7jF3u2N04/la/j9axP5OVUzFWD0K1N6Ob1HKFb5SYflxCgriLqDUgcx5jXWL/m2PSI674gNraeZvF2RO12eRzTInRM2CD6I+Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.95.187])
	by smtp.qiye.163.com (Hmail) with ESMTP id 37ab6ebd9;
	Fri, 20 Mar 2026 14:36:37 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: thinh.nguyen@synopsys.com
Cc: amadeus@jmu.edu.cn,
	dlan@kernel.org,
	gregkh@linuxfoundation.org,
	huang.ze@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-usb@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] usb: dwc3: dwc3-generic-plat: Add optional VBUS regulator support
Date: Fri, 20 Mar 2026 14:36:21 +0800
Message-Id: <20260320063621.1204038-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260319214633.cyzr7silffbzisot@synopsys.com>
References: <20260319214633.cyzr7silffbzisot@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d09f5d00503a2kunmb2a75f031e8640
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSBkdVk9MHh5NTE1NTkMdS1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSkNMWVdZFhoPEhUdFFlBWU9LSFVKS0lCTUtKVUpLS1VLWQ
	Y+

Hi,

> In my previous response, I noted to pass the name/id that best match
> your platform in the dwc3_generic_config. This structure is passed as
> private data corresponding to your k1 platform compatible string. That
> should solve the naming issue (i.e. you can keep the name "vbus").

Thank you for your suggestion, I will change it to match compatible.

> > Do I need to check if it's in host mode?
>
> Is your k1 a DRD controller, and that it can operate in device mode?
> If so, does it save power to disable the regulator while operating in
> device mode?

It is a DRD controller that supports switching between Host and Device
modes. I will change it to enable regulator only in Host mode.

> > > Also do we want to disable the regulator on system suspend? If so,
> > > we may need a regulator handle.
> > 
> > I'll add it if you think it's necessary.
> >
> Same comment as above, but this will be more involved. E.g. you may only
> want to disable the vbus when remote wakeup is disabled and power saving
> is more essential (disabling vbus will disconnect the device).

I will consider implementing it in the future.

Thanks,
Chukun
