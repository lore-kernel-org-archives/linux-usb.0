Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0813DCDB2;
	Thu,  4 Jun 2026 07:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780557137; cv=none; b=Fjzt9m+HnNOTeB3pNkJtc5qWoCebK3V2QyhDwsbLRq4MYXk5yFoKUBWOkhrNdGWntKNrZmoVYGn0jOjcqt6d0Dn8rAq2Q2hZi5xlI9dTL84E8pmi9nKdUNGvysjvxLH4yHZ+JNhflEVsMqDjlS2t11H859okQo1y8anDNQLyXd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780557137; c=relaxed/simple;
	bh=XumYkAbL/HkCH3r2BB/bJQhiYOPQhN0qlERLqDTvaBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GB8OobTyWpRQsh8U8TnCM30MRhFeJYeiTjQ3wRdcG4GUZXkEjxByRTyXdC3L3ZHKfUJFYFTabhgMD0WePbgHbExNAoc3kGZk+iGe6nYTyGbud7rYqEgZFwShb11MlShMfPl5TkmdDs8qpgbaQWUJXkMTJPQF/1FwumuTRsXFVNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=eoJ4B7ZC; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="eoJ4B7ZC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1780557103;
	bh=XumYkAbL/HkCH3r2BB/bJQhiYOPQhN0qlERLqDTvaBc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=eoJ4B7ZCWd4hrYCUw8mjF2kVXdfMst4lGZhbVaqRX43K4lQ5E58lWe6Mg8xG7dGBW
	 qU7047y2+0Yf1PzCJuA4gzVj32uzs5smH8pEUjZwMxT/c0YJZs9kcQSCxezOT5Oh+l
	 8NKdSE/sIwbLA0jnt+GeTRa1m1Kceb6bBH0k/c8k=
X-QQ-mid: zesmtpgz4t1780557087t1e474f14
X-QQ-Originating-IP: udZXbyz/ZZ3oUgsNX6nI1fc0T6N1EUEw8L1fi7RR5FI=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 04 Jun 2026 15:11:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 3716192700217113641
EX-QQ-RecipientCnt: 8
From: raoxu <raoxu@uniontech.com>
To: michal.pecio@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mathias.nyman@intel.com,
	niklas.neronin@linux.intel.com,
	raoxu@uniontech.com,
	rollkingzzc@gmail.com
Subject: Re: [PATCH] usb: xhci: limit ports on the correct root hub
Date: Thu,  4 Jun 2026 15:11:25 +0800
Message-ID: <DA04497D70D9E223+20260604071125.3646289-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260604085136.6b20d2e8.michal.pecio@gmail.com>
References: <20260604085136.6b20d2e8.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M8rFsoyvISAewcCEBoKXB2TdKg9t0BFdF/efg4/qPc/XZhmNJU8CMXIL
	Qdooi2dCZFqd/iDVZJnJePYHvHk9NOiWWdKr4ID9Of7Lzet7WG6ph+382zSAbZp+ex/Y4BO
	WL2tRwfDMvGI7BO0bsziaq+NTN8qrI/DzJlvL5JrNv0z90muQlVSbZzPkJWYm3E97IF1D0t
	AUspmnKUmpbmwk+JjTibtX8ztq38+eVwogZzFAb+g33htST4RANLCOVKJNL89qOzXzToUG4
	rgb0NWSoKHtJIRyAqK0X9v5oGMgvtflxgnHsXPHuvQUrxyX8dQvF2uukTTzhCqIEwQnDmlp
	oZmYkHOszilOQKkNUNvih4KKSLgOHIvZNtv3MZsiSeEcRVFUgl4uybGImsqkr+HcgV4otrk
	g7m0Cj2b/HO0tLCm7ZNAOFlQGqPCOH8633YCgJnBcVtX9s0HweNzcQ/jaXPGyTeG/c/uWlX
	Qq07dy+IhCDTieD48VhE/G5RQT6q+3JmYHqVQU5DLGgjKPjpNd4X1Q4V2TpaFwGB3Mv76ze
	ujJH/zjFBa4nELwm6GPWLP0mZ4InzRHdl7wdizoiX6umVv2XclTf9cRlHTusg9mBtIdTW/6
	ggbyHU0ZS+CreJVVlJ9bAYWsJFlVEgw6LvNkmhr8Gg9g33xI31Tx/WM0ps15DUdJclrZLuF
	vDlMHnqcSSAl4wpEfA8zKxc+6HSaPNV45V66cISQgoQM/qzUljYXmSHgN5JIRuvqI7XTPPt
	9F62PrxryBrmrK8t0yKz0Qd1WlCSSGxahSUWHg73QR+VfSbEs9u9YU+3xfuUxUIXIAZY+tZ
	QX738KoM/WqIPaj9FztGpuBcMWcs385h6n7kMkWrdV0EuCrJBd4e/L1m8oUlA/96Ztfa/r6
	qNrdHI5dXIrGuPCgouQ8qyds3F/GZtBbbu+JFEa4u9oPRq4VYWnl1lWhdZokBPQKwnjERfV
	DZ29xbVP9c/wLsB3xJVTyN98+9odP0MNkqBSxn8jMZwU/kJr8Aa7CY5YBjkdycuGDgDMeH2
	WhBwAdMSYrvwyxnCBkBfkjgpcWVkGl8TKyuZA/n0tvLckFkjj859N2OvvK2l3KImuhmslMA
	OA01P2kHKFnB5ceLE4G2vY=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

On Thu, Jun 04, 2026 at 08:51:36AM +0200, Michal Pecio wrote:

> Previous patch for the same bug, Cc its author and bad commit author.
> https://lore.kernel.org/linux-usb/20260516033443.3646966-1-rollkingzzc@gmail.com/
>
> I'm not sure how people keep discovering this issue - only by review
> or are there really xHCI controllers with more than 31 USB 2.0 ports?
> Should things be patched to support them properly?

Thanks for pointing this out.

I missed Zhang's earlier patch. My patch was based on reviewing commit
9a7ad750a8fb ("usb: xhci: move roothub port limit validation").

Before that refactoring, the USB2 and USB3 root hub port limits were
applied to the corresponding root hub directly. After the validation was
moved into xhci_create_rhub_port_array(), the helper receives the root
hub being initialized, but the limit path still updates
xhci->usb3_rhub.num_ports unconditionally. That changes the original
logic when the helper is called for the USB2 root hub.

So this was found by code review of that refactoring, not from a real
controller with more than 31 USB 2.0 root hub ports.

Thanks,
Xu Rao

