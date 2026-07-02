Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB46D42A796;
	Thu,  2 Jul 2026 09:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984406; cv=none; b=eFLAtHJmQzvyacfYC7oWJQk2r4dZgOZqkxNGyHh3Ai8qwq18lFePgXU9Oq951GUZ7u8n6LnLmALh/Heb24t55oaPT1Qou+LewlFc1WVOBCKqQBOTOxo6nNSo/Lir4OljHchcHQIReN+tOM+iqJ1Hu2fUmFFDlxalHTobOKdA2v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984406; c=relaxed/simple;
	bh=SH0mqJ9vH1f8Pl2ccuvrNyDSZLmcdOIF+XBGWxL6UYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KPaTItc15Na1Ypz6k5JCfe37ZDjpDukfpa505oRh1aP3XBBAfbRALANAa8a0LKPUTS0PfkCoDCIlIDVjEM+merxTuXwbmeTTYIZ592bOFR9Eky46r1jzym1eQOU/qDV8ulrNSOB0oBrcWVzgF/PwQMm5Ted/JxorFnEak7DR7HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=WdfZwyTY; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="WdfZwyTY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1782984342;
	bh=SH0mqJ9vH1f8Pl2ccuvrNyDSZLmcdOIF+XBGWxL6UYE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=WdfZwyTY5DBtc05PJddVbMdDhFwQ681uH0XzBN9xhdAVwWXxvyRW62lz0HZgLuSwe
	 uvRqwMbZZ1esQHOGByf4akyFiwbVGH7hm43f4n67l1sojoRJOGwCJf0iSpNbj7UbDL
	 YDqdVQZztopEUKb89oGTKqEYiOIBoDeRoFCKYJqA=
X-QQ-mid: zesmtpsz6t1782984325t625558ea
X-QQ-Originating-IP: 1qBLAIMWBijlnzf4u0pB/kG8l/6lYt/MtNorGCYQk3M=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 02 Jul 2026 17:25:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12114830115753114258
EX-QQ-RecipientCnt: 10
From: raoxu <raoxu@uniontech.com>
To: gregkh@linuxfoundation.org
Cc: dengjie03@kylinos.cn,
	johannes.bruederl@gmail.com,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com,
	michal.pecio@gmail.com,
	raoxu@uniontech.com,
	sakari.ailus@linux.intel.com
Subject: Re: [RESEND PATCH] USB: core: report interrupt endpoint correctly in companion descriptor diagnostic
Date: Thu,  2 Jul 2026 17:25:22 +0800
Message-ID: <4081671DBB747A4D+20260702092522.2565194-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <2026070248-fleshy-activity-1a33@gregkh>
References: <2026070248-fleshy-activity-1a33@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NFQMG86uACrUn6XkGZGlC4ouP721Qo4kBT3Wy51zMhWrFlWpSZp2WQKT
	XLFA+Xw2CVQakkR1YZHK9v72mxlSwSloQeCeZcNmNe1wh7Y1NUX3EzJe/l0ebPWeuMEqPER
	0I96iQcB6srLtxjnXp9FEFiYhi0ITdagyFxYicDgQ2NXK/ggEj9J+BJgtupdz2nzBMoUPUR
	X/bjRnPCOQ4XU9/4Mn/9CKJm6SAaDj3ggdZzTv59g0W7x8iJwoSiIabi+Ub3oefYlNOELfj
	57QDLE8Vggg2qimPDr+Mq6kFttYDq0qiw1mIG2fV3JG9I3MtIrambHGRkLgycbad2QyjNS9
	QkusDIsNnQGdGhsW1UFB1AWBICq+ezCU2LTedugCfAlJ2QveyTCKU4ix3YwaQzgSO7+9lIH
	5QaJJjIcK+guzuvepiOwFpaNoY0PW/xN579zv67jrloaecNsg1TN6XiKCKtYoyHmLWoIqv5
	xdUkQ1rOECT/9Ua2X7N4ULxeQNpqra97aEeh9JQsZqX8FF7AJ9Zj2v5u9sq6tGJbbvWHUxk
	EOKYwyzCefQrxT0czl6uysB9hUFtDeOlX6TRW8TAOIntbyJIqKFYVq6y4X6qD4DRNtyRh/K
	YuDDJUymU82GgNn96n9dLfRuxw12IuInefkA2q0GHFNudlSyVG3vlPhdXWUwpwnSbpFwVlc
	5Ky7IMh7y6kJzULwmD9iUwWYspnluoBR289XqgcnIic66OEeQLaVjkUOuo9G2e5yyGPNLke
	DmlHaJhLwzox8sUpj+eGq/eNgm9WqIYKWvS7Rv//KSFz44C2hxgcA0t7uuSGV+HVv74umTq
	qYDjXoB+XA2Ob8gz13jsDPVMQTszhW4UWQSy5RWE1ab9mbSGAIil36a7971o976LS4RTKap
	xVmqiUETMZpbigOD/G8HLYCEpnLPNfpt9498g+OXMWFd8oDJiTNUOG1OdSlvQQb25P3qn8D
	6tsRhuKqe3Tqyzb2/0Q27cb9f8NnE8QjSjEEZnFWZCaOFJiluznPLjmbmjzGe+gCFjp3Yu8
	/olnTTiQHAtRPDT2s+LTanPSB8uUpyqEthy0M+TmcC5qH6pF67Qmad8vooXR96uuzoMLC5L
	w==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

Hi Greg,

The original submission received an Acked-by, but it was not picked up.
I resent the unchanged patch to bring it back to attention.

Sorry, I should have stated the reason below the --- line.

Ack reply:
https://lore.kernel.org/linux-usb/077ba20b-9677-4812-a083-b5216281611e@linux.intel.com/

Thanks,
Xu Rao
