Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D5D3A872D;
	Thu,  9 Jul 2026 05:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783576021; cv=none; b=UmUsVEKxQEKhLBTkFUvLL5Ucnawx0Y4D4H9Ifjq9hhZkAQYvOjEJe25PD1fOQ9wkbfUZqqikntbrjvsnbz9rIJVpemnRnrJZaahgOvJ3/3ZySoJ335SFYYSxcUOT9IT/qTMjYmMiMi6XfuMCDcirJz6dkn4l0Q2KI5xzMqpgZSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783576021; c=relaxed/simple;
	bh=HBt4EiPqnh57gF4I5ixAw0kqnHkVvqCFyv02XYkR8R0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IlLlL92G3YtPdD5mJmQeNm6+iMURKgWHVNf35c4gftKoe85i8FLAENNvdzooWcy6JE29rh13pYbG4+m4lfKDwpGDP23nlDegyZkNXKl9Qd7N4hSoxpSy5wvkyZhw7ulspjbPUpLyKnPAB4qLRZG6zhYlbBnBEehHur50RFzgErQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=OSETn9nI; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="OSETn9nI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1783575948;
	bh=zdq88DLKbkkM7Zu4gsvlMz9MScrVR6YkVuwLQI8n1Go=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=OSETn9nIniGF/XQ/FKX6bTRnREn/jl4E6jl1UmaaXCdmIi4PQrd+5OeeueLDYyxFk
	 qr9rRWPmhEF51vAqpB8cWqqBimC4fHOtZuB8u068cr7SEjU5cxh178kUfOOTapAx+M
	 E6/IvoZkVehoV8vLTq/iPz5A8rw+K3sUbLCoupyg=
X-QQ-mid: zesmtpsz4t1783575944t0544daf7
X-QQ-Originating-IP: V4ytA49OhtladdrQ+vUpsOh1pSSyRsuA5er5eLfhIvE=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 09 Jul 2026 13:45:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 10303780680186740140
EX-QQ-RecipientCnt: 10
From: raoxu <raoxu@uniontech.com>
To: gregkh@linuxfoundation.org
Cc: dengjie03@kylinos.cn,
	johannes.bruederl@gmail.com,
	katieeliu@tencent.com,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com,
	raoxu@uniontech.com,
	sakari.ailus@linux.intel.com
Subject: Re: [PATCH] usb: core: config: fix SS companion log for interrupt endpoints
Date: Thu,  9 Jul 2026 13:45:41 +0800
Message-ID: <F5E5FC51B3CC5EE0+20260709054541.345638-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <2026070808-bagpipe-clapped-a369@gregkh>
References: <2026070808-bagpipe-clapped-a369@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NZcrde3zhHkV7Bhuw0834RgiKa5PPqY00Nos3OgvDXzc9mZxDHlZ9mcK
	xvPf/wN+Kc8tGfT9JGSESo+F1dhFYdTgkQOkPhSCXlGjqklD47txtAO2sA8T+ZyD4bogj7S
	NdEy7PeUFwT8c2EQKsCb3rEIi5Gd1XWlDzmnn/kJqq8jK+d5XeVuDxprK5LDXR6zg7T+fWC
	gAu35YH/m7PT6iYpZB8k5XZnzI8OAoVdaZV+OU6VA+2mf37pvNtrRx1mTVXK/i0+qzLtdeU
	tQpRa7+YSFqmpaZ9g2xHSCFRbj9pH6ij8zJR7LYSQnC4SrLMttstCp13fkAkZfV69qRqfVe
	cAA6o6tYQfYf5b4F5e4Y7Cpv5/ipLCyE/cSewpoQo0uZO+cyvqpYc02lWwBdJCdz2tzv4/b
	pM0F7Ro7e+HgthNYDbyPKxEpkpFAiUNvW26db6xLb/oHHbMBSjzPyqGE9nN+B4i30bmqtRV
	SppRtd1bBkwViK/KF3aQLfoxFzV6BAGtuH5rygzSOtahLR0CkZRCiJ/PjwFvjPYYBpKCUMc
	IF5pvtc5X+NOF9NrS1xgTXxeJJTCTfPUmH1uFcD4FAvYk6FBfiwrst7aDNpSLwJ0reHlwc9
	lbjsJy3UDupDKWbkjFxiSKnfPuZbER/eTFt0d7BSXWWz4kBy1tY5diCfKqF2odNLHnpM8dT
	AQcG64oXL+m/+Xmq+v7xsXvPN28B9yB9yrRvYoGenEMtAsXyEtmsv4IxfDONJb2zKZS0qS1
	7cVSWrq50GiQ6Zp453F7LNNdVuXzNpT145VO3vIOTAQ5Y3nVlCgSU8NTHieSwItVxIQoI/E
	UGoo2XwF8Zf6QVRH6/4eDNs3dSi0mlAu7WhqU/HVlX21+kVnngjhilSkwP2lXmB/ukEOmc2
	dho73PDs8LE3vFICVc9mjRxDOOTUj1fUG9nFhQ1pqfXwDhHn4dM00U9zbV1612Tp2WiNf8/
	S/c3Yef3fNPfY4X5m1X7nW4uBkyoZAax0nMECNqwgay1Skreo4PfuceaNnMGLs+L/tQ97Ed
	+AbpMp373WHv0KNe2RD2iS5VVaE7K6JWIf+qG17+qT4TdOp7LD
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

On Wed, Jul 08, 2026 at 12:30:00PM +0000, Greg KH wrote:

> >  drivers/usb/core/config.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Does not apply to the usb-testing tree :(

Thanks for checking. The patch was based on older context; the endpoint
address diagnostic has since changed to use 0x%X.

I will send a v2 rebased on the current usb-testing tree.

Thanks,
Xu Rao
