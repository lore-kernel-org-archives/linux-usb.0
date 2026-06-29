Received: from r3-25.sinamail.sina.com.cn (r3-25.sinamail.sina.com.cn [202.108.3.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D449817BA6
	for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 22:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782771081; cv=none; b=GY21oaOeXYu5ln9Y69UENOM8SXXUFX7/p49cO7nkp0h2H3nMKBGa19JyyjGSRi8+J7PuorUBxsM/TXH4hkgE0yfWrMzIFPk9KpN8Lsf7iaygU2XiuF60hqV+O3/CtIwmdSTV2bmxPvsGTcUDCZ+vq8HJmZInFuXuI3boverWu1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782771081; c=relaxed/simple;
	bh=UJTYCiIEHHapbK5ihydoCGf4EEp8acqEmhEL8leIBkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZPCRAlk3J5EtLrQ5HcyVjlDlTervxQzyLJAARuN10NoFJY57zd3yQ7k0M7uPEWDy+78KDW+JFEPB2t5T3Z/mtLpk9lizsCADa8s0PFqk4NxScX/DVh8/ISHPoxlrB/oHV+pKouuZ9/mnPddIow19y9Ak73v3J66/PKoz3uu/3cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=wS3Rk6Yl; arc=none smtp.client-ip=202.108.3.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="wS3Rk6Yl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1782771078;
	bh=D68vK+18Cry5zlz7WtRzUzSBrrRS6Z/uLx2fPSwPISU=;
	h=From:Subject:Date:Message-ID;
	b=wS3Rk6Yl6SmY7puTR7eAcIpijgBzzTMfYaO8uOfyVpFhunjXUahy1U4QYG8Xxh35Z
	 yBDZY3rkZhbzFKCXEvg8do/6NbVJSEz+2CvBGHUtmVWt6bbhmde/Po0Y4yq2XRHJy7
	 9Xk5rpmfKjBtphKSbiUSClqyCZhGiBPChjh94F7I=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.144])
	by sina.com (10.54.253.31) with ESMTP
	id 6A42ED5500002615; Mon, 30 Jun 2026 06:10:32 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 3370076816751
X-SMAIL-UIID: CCD146A9DF604767A44B02AA06DDB160-20260630-061032-1
From: Hillf Danton <hdanton@sina.com>
To: Yousef Alhouseen <alhouseenyousef@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+563191a4939ddbfe73d4@syzkaller.appspotmail.com
Subject: Re: [PATCH] HID: hiddev: keep state alive through disconnect unlock
Date: Tue, 30 Jun 2026 06:10:18 +0800
Message-ID: <20260629221019.294-1-hdanton@sina.com>
In-Reply-To: <CAMuQ4bUuSP=J6Fv=TuzPL6Y34NC3v-rC-O8kGqh86gbUcF8H+g@mail.gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[ feel free not to send top reply ]
On Mon, 29 Jun 2026 08:57:02 -0500 Yousef Alhouseen wrote:
> The missing interleaving is that mutex_unlock() clears the owner
> before taking wait_lock. A contender already spinning on existancelock
> can acquire it after that owner clear, reach the final-release path,
> and free hiddev before the disconnecting task reaches
> raw_spin_lock_irqsave(&lock->wait_lock, ...). It does not need to be
> woken by the disconnecting task.
> 
In __mutex_unlock_slowpath() the wait_lock is taken because of MUTEX_FLAG_WAITERS
after clearing the lock owner, so it is bug in the mutex backyard instead if
mutex is freed without pending waiters handled.
