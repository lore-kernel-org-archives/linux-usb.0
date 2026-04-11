Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0092DA749
	for <linux-usb@vger.kernel.org>; Sat, 11 Apr 2026 14:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775918527; cv=none; b=md1CWc38EDrxy6gNXlYV5zx6qedEwMhfTZNOp/W0DgMu/1IftqPsycrH+68BJ5mTCCmFdcjqbTEkT30//4SOpVDINRxpprrwMFratXXeeIJrBQcrDgXg6AUga/1ZuKp02vIWLZ+md8sQia4keSVZihZ+Pw27IBIECWft5bUihKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775918527; c=relaxed/simple;
	bh=jDNje2qE5wnUiO5W68NMfsRUbTDbBEc+Q4erprxn58I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YEPwCJvz+0UhZ6S9BLmGXxMtLhHyn0Jy/B8b7d53S7rXrWKFEe3Rsstx5UCSKglvdtR+mFXmNVx6UnSN5FQppiAU3x49CmqvduXTGFFkf9p8bZnHLIdZ8bDPU+aoKKJSW4gdPKwvX+A/evbTcfjtTyT0ejscHChZoLQ7WSy8iK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=XIsvNkza; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="XIsvNkza"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1775918500;
	bh=RGI/m8KjnHFpnLWDkqIY3XoL8mJQCn1B5U6YOZXtvRQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=XIsvNkzaKiSoMf3kZDsclYCsVCZL20BB+TNtUl/72tYFzHXL5Kxyp6PkTI2EwU9mY
	 RcMV5RFLbAhwp19U3psusm7o9FSCUYnxmydI8IGqkK/rVxO6I3iGAs3rqr/9Amx+vJ
	 3AHOOxVQsB/7Zgp75Nc1ZO9+PInVxV9HACcWJZ9k=
X-QQ-mid: zesmtpip2t1775918494te3d24484
X-QQ-Originating-IP: WzSvb7kXZNNMN/wnXlGzfhNQOzNCWMW8/NmTxVxoOCw=
Received: from uos-PC ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 11 Apr 2026 22:41:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8893480091701257266
From: raoxu <raoxu@uniontech.com>
To: mathias.nyman@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Subject: Question on follow-up work for secondary interrupters
Date: Sat, 11 Apr 2026 22:41:33 +0800
Message-ID: <47A8A9A0842FA2D5+20260411144133.1207478-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260402131342.2628648-1-mathias.nyman@linux.intel.com>
References: <20260402131342.2628648-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N82HcWlqWvaKSW7l/LmFkhJjH6x/Z5w23zlIB7cHp6gw4Ce7Mcw3zMA3
	BRtG/ABiIC3eJfnJsUcXlC0l+vySV5JmspSK3S3aSB8i9NGnVcsDabUNsLH8E7NTJiKDPBF
	Zg574IYBKGnjkakBR1j7EG6KvvBXhLZEQtWMHXr7oPpppaHqa/Lh1dcxiRRM0S/JxoWLIDz
	Sgcc9nxnfWTlDj9GLv1+EuVmVsHaJ9l1++sP+28KGeK9Yc/xW1Bc0d3T+0xlPRa1gMuF3CT
	LQHLeZi/Rr+9X6rluaExIp/VVaCJifJ/Klit0F8MIItHPSzsLFt64rCOPdjmPxk2w3LVyKb
	KTvPLgGtYyHS9HkgT6BU/Vp90Dx0UfPqiBf4Aj7l2mOROAKz5D5DB3ONLBt6gu48+paOupq
	wE3qMFB1iEOCpoJBKeuQwdGQBtPfh86pNY8vAj62uWFTo1XFbH6aIuix5s7DkB5wDLpj8IC
	wromVHu5k41wKrhjAIpr0FEqEIHB74cD7a6VibXhBOxERGpKAXyTq/gmUMZc5qjMlmnua0n
	LVFC5zvVyzGe6azjneh2UJ+nZ+eFl4yNekM5SgA0vFGXTbskisrnulQAhi2+2Y/xlbSMe9/
	+l8j4a3SBXiyYpU8nrQi8d9WUr4r4MPaP/tv3D3zOHjnEBU7CyBlS9nbtQNy1xMI+9dk8rj
	QQQPxcZJ7x+Y7Z5JsZbOSJbVE7zXOwXulrjkfkrwzJEY3mf/akB11DahK65mqjtGEjInGkl
	lZ8E2cB74Xb7J57YWAt8RF0P+1kU26q7zq+dfknPhsLSWVhbeaCZaLyct2OJO6fU+7L+YWb
	2OZNvC9qSTPCLKwYTTzm6dG342qdWMff5GFUwmyZxiNH2TNheA/KUu+PF61orUNWPAQfsgN
	lS2vVa+wCkcAFB9GhqPtmN3U5auRs1x96mA6nU7sL0gdFtMDMtfeFCbHqqzKhA4Eo1W+iii
	6G2i6TSmEwYiIwhtdWae3fZtrG1DDEx0XyMz4/1fDadt6rYWIHGxCAp/zZNHMd9rs3t+QSJ
	r+d4li+CGT+iS93sncwVAiKc4DSSMgAJVF8N1N4bW9fwe8YKRP9VBJD6gRA51SXvo+ZJ3CB
	Q==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

> A couple small fixes and a lot of xhci refactoring, decoupling and cleanups
> for usb-next.
> 
> Thanks
> Mathias
> 
> Michal Pecio (3):
>   usb: xhci: Simplify clearing the Event Interrupt bit
>   usb: xhci: Fix debugfs bandwidth reporting
>   usb: xhci: Make usb_host_endpoint.hcpriv survive endpoint_disable()

Hi Mathias,

I saw your recent xHCI refactoring series for usb-next.

In your earlier reply to my patch, you mentioned that after this
refactoring it should be possible to use the secondary interrupter
itself as the request_irq() data, instead of adding a separate
array/context.

Would you say the code is now in a good state for me to continue the
secondary interrupter work on top of it?

If that is the case, I would be happy to continue from this new base
and rework my earlier patch in the direction you suggested.

Thanks,
Xu Rao
