Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EFE3CAA57
	for <linux-usb@vger.kernel.org>; Wed,  1 Jul 2026 08:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782893169; cv=none; b=eskwY0W8HToWPLNN/pkSSPQi5bYmTLXbnaMy7ugy2W0WFVa5H3NleaO4QA8Xhc8STsuGJlhQREKfpqvP4TA5RHE6peiWJT1EDcM8tYCsr/sf4GialYq5XtWOl9ReBxhzeix5UWDHqwKwwbewhxicyEYUbYJjB0O1uWEjLWYc3Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782893169; c=relaxed/simple;
	bh=Hti9BES57OV7hbcfSJ4/7NS0VkP//vH0edJpq6trHSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q5t1LB0Y8Sx1aRm+/AWqr0yTmBBf46NZD72Y3/WRT+D8X9CBV2RS8A4XW27O36sbd1fn+f+Tm5g+fHd4e7xcAM9RzrVImKuM1up6Hdd3rzCx4y3b+lot48MB+5dej/LispcmWXn5ziT2tipaXf5YMqlcSfnIxs9eM8DlqEeoiy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=B5kgMHNC; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="B5kgMHNC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1782893139;
	bh=WvQlKFwXDwOXCQWtzCsu8wDB8iY52q0n3X7Qe4D0lIs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=B5kgMHNCwwyRfJPqYIDCdy2s8ifP2txoiVQuGtVklYUuYK1KN9Qqq5zKg36R36+8E
	 6G2VqDq7LkxEDq0EDj580kpmqOlNTTOE8T+gWCI7/Y9SIPvTc4xqMi6Qq4IDylulH2
	 vpaPgRAO7tLdBL0/L4HSl2NseIQ4rgtRBhF6yzYs=
X-QQ-mid: esmtpsz21t1782893125t6e9df510
X-QQ-Originating-IP: b+axyweaVuN+m8sNCAQBarxLqPCgGq9okrjU4+r9NLo=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 01 Jul 2026 16:05:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2194680995676505665
EX-QQ-RecipientCnt: 4
From: raoxu <raoxu@uniontech.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	michal.pecio@gmail.com,
	raoxu@uniontech.com
Subject: Re: [RFT PATCH 0/3] xhci: avoid futile stop endpoint command and host teardown
Date: Wed,  1 Jul 2026 16:05:22 +0800
Message-ID: <1C15D4B528F341B2+20260701080522.782160-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <0a2db9bd-027a-4810-9750-8e2041fbe32f@linux.intel.com>
References: <0a2db9bd-027a-4810-9750-8e2041fbe32f@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Ndw/mc8X39ObSIYy+y4PknfsYa0BlgHG7VzPdCAZzKfA+rH+GPfgGnB/
	4Y2DnJID+NpSscRhEYFavyfGfKWYXnJADdfXsNrTFWCB3JIw0U3iY2jNVaVXiwIpPg73P5Y
	eszTtHN0lRKwaz66OFBQxr2tXSOg2DxeuwQ2FVfJ94HtPUs6v9hDMobgU3rAQJwxqt/4WuQ
	+PmMtFVzYtrBwgcrF7bk8jvu4embJ2KzwprURAghEMCTWOU0mF3Mhu0Zm80Yk8tu4FZRVeM
	m9m+zRIUbdHbZblPxERreAKg1NubBKA5bSrIfIZPxBMidGAbFpR3lcbf/51XZ5c031hA1kO
	P/Xqmm1H3CbM7OsrdkF3wZe2b4r+T6aZwUfWUqMnDzmrAwMJ0s6ztcH53rFZH1KaXsoHdDJ
	plERvirPTsrZEfb0L/Giv+mHktBI7hAdoSzHnH+UW/oID8GVHa0hgpOAjPlCynmxFtDqfol
	bM9jLaK13pFJUjSpCn6x/vpLcv2x0zyHjTWd/W1fGOdBDzZ4vUKxZCzI/wDqHv3Rro0rr5I
	gw+W5+7ZoW9OzQx5usRKJtOEo/Iey/cpNw8kgT1KZ8ZnlUOdPG27FvyOB8Jjm8I+AGUqdLt
	IRFfqKAQvk+xHXxoiSxOzBjc6oOdnxOt5XkOjJ/Pudo1kYrCzWQou4q2ygU8fyHhv9LDC3K
	voBNroPpwdlYu0XP4ZoCXf3AfWMkrFop5m02pZrrPjNErPFpn3nO+9O1muzj9pm9Nx7UxzW
	4Hy3wtdBCxMz2KtfL9PLmgzE+BAqFge9a1TgODPfpdq7IfqodhVR6VsS84Mft0PgZ74AffR
	7+nVt2RKL1lDxHvLj0XgPzCkgbPEnF98Uw9oKZJLZeJF0FDQVmjb1B3vuWmfi8D90NwbOdn
	o57zgEL6WWAQW3Darhz7Ua8EFR7qViNUU1/GTxisLPFOCJ5RejpMbMSUhezr2wMffY7ZPdT
	VJBBnjVbEcPQiF557JsfIoeYVxiJ5AQAlNJGdh9h5YtwjuRBmJDDc8WizKYL8IVdCc/0IUP
	ILJMDW3Rm/E3LBvAF5EA2pm7CAHew=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

Hi Mathias,

> >    xHCI host not responding to stop endpoint command
> >    xHCI host controller not responding, assume dead
> >
> > The log also shows the new EP_DROP_PENDING path is used during disconnect,
> > for example cancelled TDs are invalidated directly instead of queuing a
> > futile Stop Endpoint command.
> >
> >
> > Tested-by: Xu Rao <raoxu@uniontech.com>
>
> Thanks for testing.
>
> Do you think this series is enough for the Renesas uPD720201 controller issue
> and we can skip the 'Disable soft retry' patch?

Yes, I think this series is sufficient for the uPD720201 issue I
reported, and the "Disable soft retry" patch can be skipped.

I tested the series with soft retry still enabled, and the original
host teardown failure was no longer reproduced.

Thanks,
Xu Rao
